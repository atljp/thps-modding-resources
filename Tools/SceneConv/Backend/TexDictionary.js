// ----------------------------------------------
//
//  TEXTURE DICTIONARY
//      Contains textures.
//
// ----------------------------------------------

const Reader = require('./Reader.js');
const Writer = require('./Writer.js');

const fs = require('fs');
const path = require('path');

const ITYPE_STANDARD = 0;
const ITYPE_NORMAL = 1;
const ITYPE_SPECULAR = 3;
const ITYPE_CUBEMAP = 4;
const ITYPE_NOISE = 5;

class TexDictionary
{
    constructor(sceneFile)
    {
        this.sceneFile = sceneFile;
        this.textures = [];
    }
    
    // -----------------------------
    // Clone texture dictionary.
    // -----------------------------
    
    From(dict)
    {
        this.textures = (dict && dict.textures) || [];
    }
    
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    //
    //  D E S E R I A L I Z E
    //      DESERIALIZES FROM A FILE.
    //
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    
    // -----------------------------
    // Deserialize from a file.
    // -----------------------------
    
    async Deserialize(inPath, inFormat)
    {
        this.format = inFormat;
        
        await this.ReadCore(inPath, inFormat);
    }
    
    // -----------------------------
    // Read core components.
    // -----------------------------
    
    async ReadCore(inPath, inFormat)
    {
        var th = SceneConverter.texHandler;
        this.textures = th.Parse(inPath);
        
        var donorTex = this.sceneFile.donorTex;
        
        var newTextures = [];
        
        for (const tex of this.textures)
        {
            if (!tex.xbox)
            {
                newTextures.push(tex);
                continue;
            }
            
            // Decode to DDS
            th.DecodeXBoxTexture(tex);
            
            tex.mipmapCount = 1;
            
            // Now it's a DDS!
            //
            // If it's a normal map, we'll need to
            // convert it to PNG then convert it back.
            // This is so we can set our blue channel values
            // properly. PC does not support ATI2 normals.
            
            if (tex.fourCC == 'ATI2')
            {
                var hadTexDonor = false;
                
                if (donorTex)
                {
                    console.log("- Found ATI2 image " + tex.checksum + ", trying .tex donor.");
                    
                    var donorIdx = donorTex.GetTextureIndex(tex.checksum);
                    
                    if (donorIdx >= 0)
                    {
                        console.log("    Using image #" + donorIdx);
                        hadTexDonor = true;
                        newTextures.push(donorTex.textures[donorIdx]);
                        continue;
                    }
                }
                
                if (!hadTexDonor)
                {
                    console.log("- Found ATI2 image " + tex.checksum + ", using donor.");
                    
                    tex.donor = true;
                    tex.fourCC = 'DXT1';
                    tex.width = 32;
                    tex.height = 32;
                    tex.bpp = 8;
                    tex.data = fs.readFileSync(path.join(__dirname, "donor.dds"));
                }
            }
            
            // Is it a cubemap? We don't know how to handle
            // X360 cubemaps yet, so let's use a donor yet again.
            
            if (tex.imageClass == ITYPE_CUBEMAP)
            {
                var hadTexDonor = false;
                
                if (donorTex)
                {
                    console.log("- Found cubemap image " + tex.checksum + ", trying .tex donor.");
                    
                    var donorIdx = donorTex.GetTextureIndex(tex.checksum);
                    
                    if (donorIdx >= 0)
                    {
                        console.log("    Using image #" + donorIdx);
                        hadTexDonor = true;
                        newTextures.push(donorTex.textures[donorIdx]);
                        continue;
                    }
                }
                
                if (!hadTexDonor)
                {
                    console.log("- Found cubemap image " + tex.checksum + ", using donor.");
                    
                    tex.donor = true;
                    tex.fourCC = 'DXT0';
                    tex.width = 64;
                    tex.height = 64;
                    tex.bpp = 32;
                    tex.data = fs.readFileSync(path.join(__dirname, "donor_cubemap.dds"));
                    tex.mipmapCount = 6;
                }
            }
            
            // Is it a volumetric noise texture? We don't know how to handle
            // X360 volumetrics yet, so let's use a donor yet again.
            
            if (tex.imageClass == ITYPE_NOISE)
            {
                var hadTexDonor = false;
                
                if (donorTex)
                {
                    console.log("- Found noise image " + tex.checksum + ", trying .tex donor.");
                    
                    var donorIdx = donorTex.GetTextureIndex(tex.checksum);
                    
                    if (donorIdx >= 0)
                    {
                        console.log("    Using image #" + donorIdx);
                        hadTexDonor = true;
                        newTextures.push(donorTex.textures[donorIdx]);
                        continue;
                    }
                }
                
                if (!hadTexDonor)
                {
                    console.log("- Found noise image " + tex.checksum + ", using donor.");
                    
                    tex.donor = true;
                    tex.fourCC = 'DXT0';
                    tex.width = 32;
                    tex.height = 32;
                    tex.bpp = 8;
                    tex.data = fs.readFileSync(path.join(__dirname, "donor_noise.dds"));
                    tex.mipmapCount = 1;
                }
            }
            
            newTextures.push(tex);
        }
        
        // Our textures should now be converted.
        this.textures = newTextures;
        
        this.ValidateTextures();
    }
    
    // -----------------------------
    // Change texture stuff.
    // -----------------------------
    
    ValidateTextures()
    {
        for (var t=0; t<this.textures.length; t++)
        {
            // tex\zones\Z_Band_Logo\RMM_band_name.dds
            // to tex\zones\Z_Hotel\RMM_band_name.dds
            
            var tlc = this.textures[t].checksum.toLowerCase();
            if (tlc == "ed46c69c" || tlc == "0xed46c69c")
            {
                console.log("Swapped GH5 band name");
                this.textures[t].checksum = "d0bea9df";
            }
            
            // tex\zones\Z_Band_Logo\JG_RS_LOGOTemp_D_dnc.dds
            // to tex\zones\Z_RecordStore\JG_RS_LOGOTemp_D_dnc.dds

            else if (tlc == "3d8438ed" || tlc == "0x3d8438ed")
            {
                console.log("Swapped GH5 band logo");
                this.textures[t].checksum = "101f74a4";
            }
        }
    }
    
    // -----------------------------
    // Has a texture by ID?
    // -----------------------------
    
    GetTextureIndex(id)
    {
        for (var i=0; i<this.textures.length; i++)
        {
            if (this.textures[i].checksum == id)
                return i;
        }
        
        return -1;
    }
    
    // -----------------------------
    // Remove a texture by ID
    // -----------------------------
    
    RemoveTexture(id)
    {
        var texIdx = this.GetTextureIndex(id);
        
        if (texIdx >= 0)
        {
            console.log("Removing texture " + id + "...");
            this.textures.splice(texIdx, 1);
        }
    }
    
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    //
    //  M E R G E
    //      MERGES WITH ANOTHER TEX FILE
    //
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    
    Merge(copyDict)
    {
        for (const tex of copyDict.textures)
        {
            var texIdx = this.GetTextureIndex(tex.checksum);
            
            if (texIdx >= 0)
                this.RemoveTexture(tex.checksum);
                
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
    // Get padding junk
    // -----------------------------
    
    GetPaddingUnknown()
    {
        var texCount = this.textures.length;
        var num3 = 2;
        
        while (texCount / Math.pow(2.0, num3 - 2) > 1.0)
            num3 = num3 + 1
            
        num3 = num3 - 1
        
        var texLog = num3
        var texPad = Math.floor(Math.pow(2.0, num3) * 12.0 + 28.0)
        
        return [texPad, texLog]
    }
    
    // -----------------------------
    // Serialize to a file.
    // -----------------------------
    
    Serialize(outPath, outFormat)
    {
        this.format = outFormat;
        
        this.writer = new Writer();
        var w = this.writer;
        
        this.WriteCore(w);
        
        fs.writeFileSync(outPath, w.buffer);
    }
    
    // -----------------------------
    // Writes core data.
    // -----------------------------
    
    WriteCore(w)
    {
        w.UInt32(0xFACECAA7);
        w.UInt16(0x011C);
        w.UInt16(this.textures.length);
        
        // Where does metadata start? Fill this in later
        w.UInt32(0);
        
        // Strange offset, fill this in later
        w.UInt32(0);
        
        w.Int32(-1);
        
        // Get tex padding, as well as log of tex count
        var padUnk = this.GetPaddingUnknown();
        w.UInt32(padUnk[1]);
        w.UInt32(28);
        w.Pad(padUnk[0], 0xEF);
        
        var metaStart = w.Tell();
        w.Seek(8);
        w.UInt32(metaStart);
        w.UInt32(metaStart + (this.textures.length * 44));
        w.Seek(metaStart);
        
        var startList = [];
        
        // Metadata
        var imagePos = metaStart + (40 * this.textures.length);
        
        var imgBuffers = [];
        
        for (const tex of this.textures)
        {
            var metaStart = w.Tell();
            
            w.UInt16(0x0A28);
            w.UInt8(0x13);          // Texture flags according to GHTCP, always 0x13
            w.UInt8(tex.imageClass);
            
            w.UInt32(parseInt(tex.checksum, 16));
            
            w.UInt16(tex.width);
            w.UInt16(tex.height);
            w.UInt16(1);
            w.UInt16(tex.width);
            w.UInt16(tex.height);
            w.UInt16(1);
            
            w.UInt8(tex.donor ? 1 : tex.mipmapCount);
            w.UInt8(tex.donor ? 4 : tex.bpp);
            
            if (tex.imageClass == ITYPE_CUBEMAP || tex.imageClass == ITYPE_NOISE)
                w.UInt8(0);
            else
            {
                switch (tex.fourCC)
                {
                    case 'DXT5':
                        w.UInt8(5);
                        break;
                        
                    default:
                        w.UInt8(1);
                        break;
                }
            }
        
            w.UInt8();
            
            w.UInt32(0);
            
            // img data start, fix later
            w.UInt32(imagePos);
            
            w.UInt32(tex.data.length);
            w.UInt32(0);
            
            imagePos += tex.data.length;
            imgBuffers.push(tex.data);
        }
        
        // ------------------
        
        w.Combine(Buffer.concat(imgBuffers));
    }
}

module.exports = TexDictionary;
