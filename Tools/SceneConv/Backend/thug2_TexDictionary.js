// ----------------------------------------------
//
//  THUG2 texture dictionary
//      Tony Hawk's Underground 2 texture dictionary.
//
// ----------------------------------------------

const fs = require('fs');
const TexDictionary = require('./TexDictionary.js');
const Reader = require('./Reader.js');

const texLog = function(txt) {}

class THUG2_TexDictionary extends TexDictionary
{
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    //
    //  D E S E R I A L I Z E
    //      DESERIALIZES FROM A FILE.
    //
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    
    // -----------------------------
    // Read core components.
    // -----------------------------
    
    async ReadCore(inPath, inFormat)
    {
        var r = new Reader( fs.readFileSync(inPath ));
        r.LE = true;
        
        texLog("Version: " + r.UInt32());
        
        var image_count = r.UInt32();
        texLog("Image Count: " + image_count);
        
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
            
            tex.checksum = r.UInt32();
            texLog("  Checksum: 0x" + tex.checksum.toString(16).padStart(8, "0"));
            
            tex.width = r.UInt32();
            tex.height = r.UInt32();
            texLog("  Dims: " + tex.width + ", " + tex.height);
            
            tex.mipmapCount = r.UInt32();
            texLog("  Levels: " + tex.mipmapCount);
            
            tex.texelDepth = r.UInt32();
            texLog("  Texel Depth: " + tex.texelDepth);
            
            tex.paletteDepth = r.UInt32();
            texLog("  Palette Depth: " + tex.paletteDEpth);
            
            tex.dxt = r.UInt32();
            texLog("  DXT: " + tex.dxt);
            
            tex.paletteSize = r.UInt32();
            texLog("  Palette Size: " + tex.paletteSize);
            
            // Now read our mipmaps.
            for (var m=0; m<tex.mipmapCount; m++)
            {
                var mipSize = r.UInt32();
                
                texLog("    Mipmap " + m + " @[" + (r.Tell() - 4) + "]: " + mipSize + " bytes");
                tex.mips.push(r.Chunk(mipSize));
            }
            
            this.textures.push(tex);
        }
    }
}

module.exports = THUG2_TexDictionary;
