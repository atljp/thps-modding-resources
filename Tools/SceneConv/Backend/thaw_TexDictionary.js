// ----------------------------------------------
//
//  THAW texture dictionary
//      Tony Hawk's American Wasteland texture dictionary.
//
// ----------------------------------------------

const TexDictionary = require('./TexDictionary.js');
const Reader = require('./Reader.js');
const fs = require('fs');

const texLog = function(txt) { console.log(txt); }

class THAW_TexDictionary extends TexDictionary
{
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    //
    //  D E S E R I A L I Z E
    //      DESERIALIZES FROM A FILE.
    //
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    
    // -----------------------------
    // Deserialize from a file.
    // -----------------------------
    
    async ReadCore(inPath, inFormat)
    {
        var r = new Reader( fs.readFileSync(inPath ));
        r.LE = true;
        
        var magic = r.UInt32();
        texLog("Magic: 0x" + magic.toString(16).padStart(8, "0"));
        
        if (magic != 0xFACECAA2)
        {
            console.log("THAW PC deserialize not supported.");
            return;
        }
        
        r.UInt16();
        
        var image_count = r.UInt16();
        texLog("Image Count: " + image_count);
        
        var meta_start = r.UInt32();
        console.log("Meta Start: " + meta_start);
        
        r.Seek(meta_start);
        
        for (var i=0; i<image_count; i++)
        {
            texLog("Texture " + i + " @[" + r.Tell() + "]");
            
            var tex = {
                width: 0,
                height: 0,
                dxt: 0,
                checksum: "0x00000000",
                bpp: 32,
                mipmapCount: 0,
                texelDepth: 0,
                paletteDepth: 0,
                palette: [],
                mips: []
            };
            
            r.UInt16();
            r.UInt16();
            
            tex.checksum = r.UInt32();
            texLog("  Checksum: 0x" + tex.checksum.toString(16).padStart(8, "0"));
            
            tex.width = r.UInt16();
            tex.height = r.UInt16();
            texLog("  Dims: " + tex.width + ", " + tex.height);
            
            r.UInt16();             // Resized width
            r.UInt16();             // Resized height
            
            tex.mipmapCount = r.UInt8();
            texLog("  Levels: " + tex.mipmapCount);
            
            tex.texelDepth = r.UInt8();
            texLog("  Texel Depth: " + tex.texelDepth);
            
            tex.paletteDepth = r.UInt8();
            texLog("  Palette Depth: " + tex.paletteDepth);
            
            tex.dxt = r.UInt8();
            texLog("  DXT: " + tex.dxt);
            
            r.UInt32();
            
            var texOffset = r.UInt32();
            r.Chunk(8);
            var datOffset = r.UInt32();
            
            var old_off = r.Tell();
            r.Seek(datOffset);
            
            // Figure out the size of our mipmap data.
            // DXT1 is 4BPP, will be 0.5 bytes per pixel
            // DXT5 is 8BPP, will be 1 byte per pixel
            
            var divisor = (tex.dxt == 5) ? 1 : 2;
            
            var curWidth = tex.width;
            var curHeight = tex.height;
            
            for (var m=0; m<tex.mipmapCount; m++)
            {
                var mipSize = Math.floor((curWidth * curHeight) / divisor);
                
                texLog("    Mipmap " + m + " @[" + (r.Tell()) + "]: " + mipSize + " bytes");
                tex.mips.push(r.Chunk(mipSize));
                
                curWidth >>= 1;
                curHeight >>= 1;
            }

            r.Seek(old_off);
            
            this.textures.push(tex);
        }
    }
    
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    //
    //  S E R I A L I Z E
    //      SERIALIZES TO A FILE.
    //
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    
    // -----------------------------
    // Writes core data.
    // -----------------------------
    
    WriteCore(w)
    {
        w.LE = true;
        
        // Magic
        w.UInt32(0xABADD00D);
        
        w.UInt8(1);
        w.UInt8(4);
        w.UInt16(this.textures.length);
        
        for (const tex of this.textures)
        {
            w.UInt32(0xABADD00D);
            w.UInt16(2);
            w.UInt16(20);
            w.UInt32( tex.checksum );
            
            w.UInt16(tex.width);        // Base width
            w.UInt16(tex.height);       // Base height
            w.UInt16(tex.width);        // Actual width
            w.UInt16(tex.height);       // Actual height
            
            w.UInt8(tex.mips.length);
            w.UInt8(tex.texelDepth);
            w.UInt8(tex.dxt);
            w.UInt8(tex.paletteDepth);
            
            for (const mip of tex.mips)
            {
                w.UInt32(mip.length);
                w.Combine(mip);
            }
        }
    }
}

module.exports = THAW_TexDictionary;
