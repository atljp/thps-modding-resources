// ----------------------------------------------
//
//  GH3 MATERIAL
//      A Guitar Hero III material. References textures.
//
// ----------------------------------------------

const Material = require('./Material.js');

class GH3Material extends Material
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
    
    Deserialize(r)
    {
        var mat_start = r.Tell();
        
        console.log("-- MATERIAL " + this.sceneFile.materials.length + " @[" + mat_start + "] -------------");
        
        this.checksum = "0x" + r.UInt32().toString(16).padStart(8, "0");
        console.log("Checksum: " + this.checksum)
        this.name_checksum = "0x" + r.UInt32().toString(16).padStart(8, "0");
        console.log("Checksum: " + this.name_checksum)
        
        r.Chunk(152);
        
        this.template = "0x" + r.UInt32().toString(16).padStart(8, "0");
        console.log("Template: " + this.template)
        
        r.UInt32();
        
        var vsPropertyCount = r.UInt32();
        var vsPropertyOffset = mat_start + r.UInt32();
        console.log(vsPropertyCount + " VS properties @ " + vsPropertyOffset);
        
        var psPropertyCount = r.UInt32();
        var psPropertyOffset = mat_start + r.UInt32();
        console.log(psPropertyCount + " PS properties @ " + psPropertyOffset);
        
        var texSampleCount = r.UInt32();
        var texSampleOffset = mat_start + r.UInt32();
        console.log(texSampleCount + " samples @ " + texSampleOffset);
        
        r.UInt32();
        
        var material_size = r.UInt32();
        console.log("Material size: " + material_size);
        
        r.UInt32();
        
        this.flags = r.UInt32();
        console.log("Flags: 0x" + this.flags.toString(16).padStart(8, "0"));
        
        r.UInt32();
        
        this.alpha_maybe = r.UInt32();
        console.log("Alpha(?): " + this.alpha_maybe);
        
        this.blend_mode = r.UInt32();
        console.log("Blend Mode: " + this.blend_mode);
        
        this.bloom = r.UInt32();
        console.log("Bloom: " + this.bloom);
        
        // If bloom is 1, let's set it to 128.
        // This will convert it to GHWTPC format.
        
        if (this.bloom == 1)
            this.bloom = 128;
        
        r.UInt32();
        
        var mat_size_b = r.UInt32();
        console.log("Material Size B: " + mat_size_b);
        
        this.alpha_cutoff = r.UInt8();
        console.log("Alpha Cutoff: " + this.alpha_cutoff);
        
        this.usually_two = r.UInt8();
        console.log("Usually 2: " + this.usually_two);
        
        this.uv_wrap_mode = r.UInt8();
        console.log("UV Wrap Mode: " + this.uv_wrap_mode);
        
        this.clipBytes = [ r.UInt8(), r.UInt8(), r.UInt8(), r.UInt8(), r.UInt8(), r.UInt8(), r.UInt8(), r.UInt8() ];
        
        r.Chunk(13);
        
        // -----------------
        // VS PROPERTIES
        
        if (vsPropertyCount > 0)
        {
            r.Seek(vsPropertyOffset);
            for (var p=0; p<vsPropertyCount; p++)
                this.vsProperties.push([ r.Float(), r.Float(), r.Float(), r.Float() ]);
        }
        
        // -----------------
        // PS PROPERTIES
        
        if (psPropertyCount > 0)
        {
            r.Seek(psPropertyOffset);
            for (var p=0; p<psPropertyCount; p++)
                this.psProperties.push([ r.Float(), r.Float(), r.Float(), r.Float() ]);
        }
        
        // -----------------
        // TEXTURE SAMPLES
        
        if (texSampleCount > 0)
        {
            r.Seek(texSampleOffset);
            for (var p=0; p<texSampleCount; p++)
                this.texSamples.push("0x" + r.UInt32().toString(16).padStart(8, "0"));
        }
        
        r.Seek(mat_start);
        this.raw_data = r.Chunk(material_size);
        
        console.log("");
    }
}

module.exports = GH3Material;
