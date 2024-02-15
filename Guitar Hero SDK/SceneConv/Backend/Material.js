// ----------------------------------------------
//
//  MATERIAL
//      A material. References textures.
//
// ----------------------------------------------

class Material
{
    constructor(sceneFile)
    {
        this.sceneFile = sceneFile;
        this.From(null);
    }
    
    // -----------------------------
    // Clone from another material.
    // -----------------------------
    
    From(mat)
    {
        this.checksum = (mat && mat.checksum) || "0x00000000";
        this.name_checksum = (mat && mat.name_checksum) || "0x00000000";
        
        this.template = (mat && mat.template) || "0x00000000";
        this.original_template = (mat && mat.original_template) || "0x00000000";
        
        this.flags = (mat && mat.flags) || 0;
        this.alpha_maybe = (mat && mat.alpha_maybe) || 0;
        this.blend_mode = (mat && mat.blend_mode) || 0;
        this.bloom = (mat && mat.bloom) || 0;
        this.alpha_cutoff = (mat && mat.alpha_cutoff) || 0;
        this.use_alpha_cutoff = (mat && mat.use_alpha_cutoff) || false;
        this.double_sided = (mat && mat.double_sided) || false;
        this.usually_two = (mat && mat.usually_two) || 2;
        this.uv_wrap_mode = (mat && mat.uv_wrap_mode) || 0;
        this.draw_order = (mat) ? mat.draw_order : 0.0;
        this.z_bias = (mat) ? mat.z_bias : 0;
        this.unk_bool = (mat) ? mat.unk_bool : 0;
        this.sorted = (mat) ? mat.sorted : false;
        
        // In case we want to copy the whole material
        this.raw_data = (mat) ? mat.raw_data : null;
        
        this.vsProperties = (mat && mat.vsProperties) || [];
        this.psProperties = (mat && mat.psProperties) || [];
        this.texSamples = (mat && mat.texSamples) || [];
        this.original_texSamples = (mat && mat.original_texSamples) || [];
        
        this.clipBytes = (mat && mat.clipBytes) || [0, 0, 0, 0, 0, 0, 0, 0];
        
        // THUG2 / THAW properties.
        this.passes = (mat && mat.passes) || [];
        this.vc_wibbles = (mat && mat.vc_wibbles) || null;
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
    
    Deserialize(r)
    {
        var mat_start = r.Tell();
        
        console.log("-- MATERIAL " + this.sceneFile.materials.length + " @[" + mat_start + "] -------------");
        
        this.checksum = "0x" + r.UInt32().toString(16).padStart(8, "0");
        console.log("Checksum: " + this.checksum)
        this.name_checksum = "0x" + r.UInt32().toString(16).padStart(8, "0");
        console.log("Checksum: " + this.name_checksum)
        
        r.Chunk(104);
        
        this.template = "0x" + r.UInt32().toString(16).padStart(8, "0");
        this.original_template = this.template;
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
        
        if (vsPropertyCount > 9000)
        {
            console.error("vsPropertyCount of " + vsPropertyCount + " is probably wrong.");
        }
        
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
        
        this.original_texSamples = this.texSamples.slice();
        
        r.Seek(mat_start);
        this.raw_data = r.Chunk(material_size);
        
        console.log("");
    }
    
    // -----------------------------
    // Applies appropriate properties depending
    // on the template that we are using.
    //
    // Some templates are not in GHWT.
    // -----------------------------
    
    ValidateTemplate()
    {
        // Replace band name textures as necessary.
        for (var l=0; l<this.texSamples.length; l++)
        {
            // tex\zones\Z_Band_Logo\RMM_band_name.dds
            // to tex\zones\Z_Hotel\RMM_band_name.dds
            
            if (this.texSamples[l].toLowerCase() == "0xed46c69c")
                this.texSamples[l] = "0xd0bea9df";
                
            // tex\zones\Z_Band_Logo\JG_RS_LOGOTemp_D_dnc.dds
            // to tex\zones\Z_RecordStore\JG_RS_LOGOTemp_D_dnc.dds
            
            if (this.texSamples[l].toLowerCase() == "0x3d8438ed")
                this.texSamples[l] = "0x101f74a4";
        }
        
        // D_LM
        if (this.template.toLowerCase() == "0xf7541074")
        {
            console.log("Converting D_LM to D_3ChkBox_Pass0...");
            
            // D_LM has two PS properties:
            //  m_psPass0MaterialColor
            //  m_psPass0Tiling
            
            // D_3ChkBox_Pass0 has 1 PS property:
            //  m_psPass0MaterialColor
            
            var colorValue = this.psProperties[0];
            var tileValue = this.psProperties[1];
            
            // Generally in GHSH, tile values are 1.0. Some
            // venues like z_greatwall have different values, I think?
            
            if (tileValue[0] != 1.0 || tileValue[1] != 1.0)
                console.log("  !! WARNING: NON-1.0 TILING !!");
                
            this.psProperties = [ colorValue ];
            this.template = "0xe0ab9772";
        }
    }
    
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    //
    //  S E R I A L I Z E
    //      SERIALIZES TO A FILE.
    //
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    
    // -----------------------------
    // Serialize to a file.
    // -----------------------------
    
    Serialize(w)
    {
        this.ValidateTemplate();
        
        var mat_start = w.Tell();
        
        w.UInt32( parseInt(this.checksum, 16) );
        w.UInt32( parseInt(this.name_checksum, 16) );
        
        w.Pad(104);
        
        w.UInt32( parseInt(this.template, 16) );
        w.UInt32(0);
        
        w.UInt32(this.vsProperties.length);
        var pt_vsProps = w.Tell();
        w.UInt32(0);
        
        w.UInt32(this.psProperties.length);
        var pt_psProps = w.Tell();
        w.UInt32(0);
        
        w.UInt32(this.texSamples.length);
        var pt_texSamples = w.Tell();
        w.UInt32(0);
        
        // -----
        
        w.UInt32(0);
        
        var pt_matSizeA = w.Tell();
        w.UInt32(0);
        
        w.UInt32(0);
        
        w.UInt32(this.flags);
        w.UInt32(0);
        
        w.UInt32(this.alpha_maybe);
        w.UInt32(this.blend_mode);
        w.UInt32(this.bloom);
        
        w.UInt32(0);
        
        var pt_matSizeB = w.Tell();
        w.UInt32(0);
        
        w.UInt8(this.alpha_cutoff);
        w.UInt8(2);
        w.UInt8(this.uv_wrap_mode);

        for (const cb of this.clipBytes)
            w.UInt8(cb);
        
        w.Pad(13);
        
        // ---------------
        
        var vsStart = w.Tell();
        w.Seek(pt_vsProps);
        w.UInt32(vsStart - mat_start);
        w.Seek(vsStart);
        
        for (const prop of this.vsProperties)
        {
            w.Float(prop[0]);
            w.Float(prop[1]);
            w.Float(prop[2]);
            w.Float(prop[3]);
        }
        
        var psStart = w.Tell();
        w.Seek(pt_psProps);
        w.UInt32(psStart - mat_start);
        w.Seek(psStart);
        
        for (const prop of this.psProperties)
        {
            w.Float(prop[0]);
            w.Float(prop[1]);
            w.Float(prop[2]);
            w.Float(prop[3]);
        }
        
        var texStart = w.Tell();
        w.Seek(pt_texSamples);
        w.UInt32(texStart - mat_start);
        w.Seek(texStart);
        
        for (const tex of this.texSamples)
        {
            w.UInt32(parseInt(tex, 16));
        }
        
        // ---------------
        
        w.PadToNearest(16);
        
        var mat_end = w.Tell();
        
        w.Seek(pt_matSizeA);
        w.UInt32(mat_end - mat_start);
        w.Seek(pt_matSizeB);
        w.UInt32(mat_end - mat_start);
        
        w.Seek(mat_end);
    }
    
    // -----------------------------
    // For TH files.
    // -----------------------------
    
    SerializeWibbles(w) {}
    SerializeAnimation(w) {}
}

module.exports = Material;
