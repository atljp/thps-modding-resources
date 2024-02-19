// ----------------------------------------------
//
//  THAW Material
//      Tony Hawk's American Wasteland material.
//
// ----------------------------------------------

const Material = require('./Material.js');

const MATFLAG_UV_WIBBLE =                           (1 << 0);
const MATFLAG_VC_WIBBLE =                           (1 << 1);
const MATFLAG_TEXTURED =                            (1 << 2);
const MATFLAG_ENVIRONMENT =                         (1 << 3);
const MATFLAG_DECAL =                               (1 << 4);
const MATFLAG_SMOOTH =                              (1 << 5);
const MATFLAG_TRANSPARENT =                         (1 << 6);
const MATFLAG_PASS_COLOR_LOCKED =                   (1 << 7);
const MATFLAG_SPECULAR =                            (1 << 8);
const MATFLAG_BUMP_SIGNED_TEXTURE =                 (1 << 9);
const MATFLAG_BUMP_LOAD_MATRIX =                    (1 << 10);
const MATFLAG_PASS_TEXTURE_ANIMATES =               (1 << 11);
const MATFLAG_PASS_IGNORE_VERTEX_ALPHA =            (1 << 12);
const MATFLAG_EXPLICIT_UV_WIBBLE =                  (1 << 14);
const MATFLAG_WATER_EFFECT =                        (1 << 27);
const MATFLAG_NO_MAT_COL_MOD =                      (1 << 28);

class THAW_Material extends Material
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
        
        var num_passes = r.UInt32();
        console.log("Pass Count: " + num_passes);
        
        this.unk_bool = r.UInt8();
        console.log("Unk Bool: " + this.unk_bool);
        
        this.double_sided = r.UInt8() ? true : false;
        console.log("Double Sided: " + this.double_sided);
        
        console.log("Use UV Wibble: " + (r.UInt8() ? true : false));
        console.log("Use VC Wibble: " + (r.UInt8() ? true : false));
        
        this.alpha_cutoff = r.UInt8();
        console.log("Alpha Cutoff: " + this.alpha_cutoff);
        
        r.UInt8();
        
        this.z_bias = r.Int16();
        console.log("Z Bias: " + this.z_bias);
        
        r.Chunk(24);

        this.draw_order = r.Float();
        console.log("Draw Order: " + this.draw_order);
        
        this.passes = [{}, {}, {}, {}];
        
        var p;
        
        for (p=0; p<4; p++)
            this.passes[p].flags = r.UInt32();
        for (p=0; p<4; p++)
            this.passes[p].checksum = "0x" + r.UInt32().toString(16).padStart(8, "0");
        for (p=0; p<4; p++)
            this.passes[p].color = [r.Float(), r.Float(), r.Float(), r.Float()];
        for (p=0; p<4; p++)
            this.passes[p].blend_mode = r.UInt32();
        for (p=0; p<4; p++)
        {
            this.passes[p].address_u = r.UInt16();
            this.passes[p].address_v = r.UInt16();
        }
        for (p=0; p<4; p++)
            this.passes[p].envmap_multiples = [r.Float(), r.Float()];
        for (p=0; p<4; p++)
        {
            this.passes[p].mipmap_min = r.UInt16();
            this.passes[p].mipmap_mag = r.UInt16();
        }
        for (p=0; p<4; p++)
            this.passes[p].pt_wibbles = this.sceneFile.off_materials + r.Int32();
        
        r.Chunk(16);
        
        var vc_wibble_count = r.UInt32();
        var vc_wibble_offset_a = this.sceneFile.off_materials + r.Int32();
        var vc_wibble_offset_b = this.sceneFile.off_materials + r.Int32();
        var anim_data_offset = this.sceneFile.off_materials + r.Int32();
        
        r.Chunk(16);
        
        // ----------------------
        // UV wibbles!
        // ----------------------
        
        for (var p=0; p<4; p++)
        {
            if (this.passes[p].pt_wibbles && (this.passes[p].flags & MATFLAG_UV_WIBBLE))
            {
                var old_off = r.Tell();
                r.Seek(this.passes[p].pt_wibbles);
                
                this.passes[p].uv_velocity = [r.Float(), r.Float()];
                console.log("    UV Velocity: (" + this.passes[p].uv_velocity.join(", ") + ")");
                this.passes[p].uv_frequency = [r.Float(), r.Float()];
                console.log("    UV Frequency: (" + this.passes[p].uv_frequency.join(", ") + ")");
                this.passes[p].uv_amplitude = [r.Float(), r.Float()];
                console.log("    UV Amplitude: (" + this.passes[p].uv_amplitude.join(", ") + ")");
                this.passes[p].uv_phase = [r.Float(), r.Float()];
                console.log("    UV Phase: (" + this.passes[p].uv_phase.join(", ") + ")");
                this.passes[p].uv_scale = r.Float();
                console.log("    UV Scale: " + this.passes[p].uv_scale);
                this.passes[p].uv_rotate = r.Float();
                console.log("    UV Rotate: " + this.passes[p].uv_rotate);
                this.passes[p].uv_unk = [r.Float(), r.Float()];
                
                r.Seek(old_off);
            }
        }
        
        // ----------------------
        // VC wibbles!
        // ----------------------
        
        if (this.passes[0].flags & MATFLAG_VC_WIBBLE)
        {
            this.vc_wibbles = {
                unknowns: [],
                objects: []
            };
            
            var old_off = r.Tell();
            
            // -- VC wibble objects / frames
            
            r.Seek(vc_wibble_offset_a);
            
            for (var f=0; f<vc_wibble_count; f++)
            {
                var frame_count = r.UInt32();
                var object = {time_offset: r.UInt32(), frames: []};
                var keyframePos = this.sceneFile.off_materials + r.Int32();
                
                var frame_off = r.Tell();
                
                r.Seek(keyframePos);
                
                for (var fidx=0; fidx<frame_count; fidx++)
                {
                    object.frames.push({
                        time: r.UInt32(),
                        b: r.UInt8(),
                        g: r.UInt8(),
                        r: r.UInt8(),
                        a: r.UInt8()
                    });
                }
                
                r.Seek(frame_off);
                
                this.vc_wibbles.objects.push(object);
            }
            
            // -- Unknown objects
            // (What are these? No idea)

            r.Seek(vc_wibble_offset_b);
            
            for (var f=0; f<vc_wibble_count; f++)
                this.vc_wibbles.unknowns.push(r.UInt32());
                
            r.Seek(old_off);
        }
        
        // ----------------------
        // Animation data!
        // ----------------------
        
        var is_animated = false;
        for (const pass of this.passes)
        {
            if (pass.flags & MATFLAG_PASS_TEXTURE_ANIMATES)
                is_animated = true;
        }
        
        if (is_animated)
        {
            var old_off = r.Tell();
            
            r.Seek(anim_data_offset);
            
            console.log("Reading animation at " + r.Tell() + "...");
            
            r.UInt32();         // Always zero.
            
            var frame_counts = [r.UInt32(), r.UInt32(), r.UInt32(), r.UInt32()];
            var unkA = [r.UInt32(), r.UInt32(), r.UInt32(), r.UInt32()];
            var unkB = [r.UInt32(), r.UInt32(), r.UInt32(), r.UInt32()];
            
            var frameListPos = this.sceneFile.off_materials + r.UInt32();
            console.log("  Frames at " + r.Tell());
            
            r.Seek(frameListPos);
            
            // Now read pass things.
            for (var p=0; p<this.passes.length; p++)
            {
                this.passes[p].frames = [];
                
                // Read frames.
                for (var f=0; f<frame_counts[p]; f++)
                {
                    var passFrameTimes = [r.UInt32(), r.UInt32(), r.UInt32(), r.UInt32()];
                    var passFrameTextures = [r.UInt32(), r.UInt32(), r.UInt32(), r.UInt32()];
                    var passFrameUnks = [r.UInt32(), r.UInt32(), r.UInt32(), r.UInt32()];
                    
                    r.UInt32();
                    r.UInt32();
                    
                    this.passes[p].frames.push({
                        time: passFrameTimes[p],
                        image: "0x" + passFrameTextures[p].toString(16).padStart(8, "0")
                    });
                }
            }
            
            r.Seek(old_off);
        }
        
        // ----------------------
        
        // Remove unnecessary passes.
        this.passes = this.passes.slice(0, num_passes);
    }
    
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    //
    //  S E R I A L I Z E
    //      SERIALIZES TO A FILE.
    //
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
         
    // -----------------------------
    // Serialize animation data.
    // -----------------------------
    
    SerializeAnimation(w)
    {
        var is_animated = false;
        
        for (const pass of this.passes)
        {
            if (pass.flags & MATFLAG_PASS_TEXTURE_ANIMATES)
                is_animated = true;
        }
        
        if (!is_animated)
            return;
        
        var anim_pos = w.Tell();
        w.Seek(this.pt_animoffset);
        w.UInt32(anim_pos - 32);        // Material block starts at 32.
        w.Seek(anim_pos);
        
        w.UInt32(0);                    // Always zero.
        
        // Frame counts.
        for (var p=0; p<4; p++)
            w.UInt32((this.passes[p] && this.passes[p].frames && this.passes[p].frames.length) || 0);
            
        // Per-pass ???
        w.Pad(16);
        // Per-pass ???
        w.Pad(16);
        
        // Pointer to frame list.
        // Just write frames here, because why not!
        // Surely THAW doesn't care... right?
        
        w.UInt32((w.Tell() + 4) - 32);          // Material block starts at 32.
        
        // Now for each of our passes, write their frames.
        
        for (p=0; p<this.passes.length; p++)
        {
            var pass = this.passes[p];
            
            for (const frame of pass.frames)
            {
                // Frame times. This depends on the pass.
                w.UInt32((p == 0) ? frame.time : 0);
                w.UInt32((p == 1) ? frame.time : 0);
                w.UInt32((p == 2) ? frame.time : 0);
                w.UInt32((p == 3) ? frame.time : 0);
                
                // Textures. This depends on the pass.
                w.UInt32((p == 0) ? parseInt(frame.image, 16) : 0xFFFFFFFF);
                w.UInt32((p == 1) ? parseInt(frame.image, 16) : 0xFFFFFFFF);
                w.UInt32((p == 2) ? parseInt(frame.image, 16) : 0xFFFFFFFF);
                w.UInt32((p == 3) ? parseInt(frame.image, 16) : 0xFFFFFFFF);
                
                // Unknowns. Iteration? Maybe...
                w.Pad(16);
                
                // ??? values
                w.UInt32(0);
                w.UInt32(0);
            }
        }
    }
         
    // -----------------------------
    // Serialize UV wibbles.
    // -----------------------------
    
    SerializeWibbles(w)
    {
        for (var p=0; p<4; p++)
        {
            var pass = this.passes[p];
            
            if (!pass)
                continue;
                
            if (pass.flags & MATFLAG_UV_WIBBLE)
            {
                var propPos = w.Tell();
                
                w.Float(pass.uv_velocity[0]);
                w.Float(pass.uv_velocity[1]);
                
                w.Float(pass.uv_frequency[0]);
                w.Float(pass.uv_frequency[1]);
                
                w.Float(pass.uv_amplitude[0]);
                w.Float(pass.uv_amplitude[1]);
                
                w.Float(pass.uv_phase[0]);
                w.Float(pass.uv_phase[1]);
                
                w.Float(pass.uv_scale || 1.0);       // Scale
                w.Float(pass.uv_rotate || 0.0);       // Rotate
                
                if (pass.uv_unk)
                {
                    w.Float(pass.uv_unk[0]);
                    w.Float(pass.uv_unk[1]);
                }
                else
                {
                    w.Float(0.0);       // ???
                    w.Float(0.0);       // ???
                }
                
                var postPropPos = w.Tell();
                w.Seek(this.passes[p].pt_flags);
                w.UInt32(propPos - 32);                 // Material block starts at 32.
                w.Seek(postPropPos);
            }
        }
    }
    
    // -----------------------------
    // Serialize to a file.
    // -----------------------------
    
    Serialize(w)
    { 
        var mat_start = w.Tell();
        
        w.UInt32( parseInt(this.checksum, 16) );
        w.UInt32( parseInt(this.name_checksum, 16) );
        w.UInt32(this.passes.length);
        
        w.UInt8(this.sorted ? 1 : 0);
        w.UInt8(this.double_sided ? 1 : 0);     // No backface culling
        
        var useWibbles = 0;
        for (const pass of this.passes)
        {
            if (pass.flags & MATFLAG_UV_WIBBLE)
                useWibbles = 1;
        }
        
        w.UInt8(useWibbles ? 1 : 0);            // 1 if material uses UV wibbles
        w.UInt8(0);                             // Texture wibbles apparently (animated)
        
        w.UInt8(this.alpha_cutoff & 0xFF);
        w.UInt8(this.z_bias);                   // Z bias
        
        useWibbles = 0;
        for (const pass of this.passes)
        {
            if (pass.flags & MATFLAG_VC_WIBBLE)
                useWibbles = 1;
        }
        
        w.UInt16(useWibbles);
        
        w.Pad(24);
        
        w.Float(this.draw_order);
        
        // Flags
        for (var p=0; p<4; p++)
        {
            var flags = (this.passes[p] && this.passes[p].flags) || 0;
            w.UInt32(flags);
        }
            
        // Checksums
        for (var p=0; p<4; p++)
            w.UInt32(parseInt((this.passes[p] && this.passes[p].checksum) || 0, 16));
            
        // Colors
        for (var p=0; p<4; p++)
        {
            w.Float((this.passes[p]) ? this.passes[p].color[0] : 0.0);
            w.Float((this.passes[p]) ? this.passes[p].color[1] : 0.0);
            w.Float((this.passes[p]) ? this.passes[p].color[2] : 0.0);
            w.Float(0.0);
        }
        
        // Blend modes
        for (var p=0; p<4; p++)
        {
            w.UInt8((this.passes[p] && this.passes[p].blend_mode) || 0);
            w.Pad(2);
            w.UInt8((this.passes[p] && this.passes[p].blend_fixed_alpha) || 0);
        }
            
        // UV modes
        for (var p=0; p<4; p++)
        {
            w.UInt16((this.passes[p] && this.passes[p].address_u) || 0);
            w.UInt16((this.passes[p] && this.passes[p].address_v) || 0);
        }
        
        // EnvMap values
        for (var p=0; p<4; p++)
        {
            w.Float((this.passes[p]) ? this.passes[p].envmap_multiples[0] : 0.0);
            w.Float((this.passes[p]) ? this.passes[p].envmap_multiples[1] : 0.0);
        }
        
        // Mipmap stuff
        for (var p=0; p<4; p++)
        {
            w.UInt16((this.passes[p]) ? this.passes[p].mipmap_min : 0);
            w.UInt16((this.passes[p]) ? this.passes[p].mipmap_mag : 0);
        }
        
        // Offsets to UV wibble data.
        for (var p=0; p<4; p++)
        {
            var flags = (this.passes[p] && this.passes[p].flags) || 0;
            
            if (flags & MATFLAG_UV_WIBBLE)
            {
                this.passes[p].pt_flags = w.Tell();
                w.Pad(4, 0xFF);
            }
            else
                w.Pad(4, 0xFF);
        }
        
        w.Pad(16);
        
        var flags = (this.passes[0] && this.passes[0].flags) || 0;
        if (this.vc_wibbles && (flags & MATFLAG_VC_WIBBLE))
        {
            w.UInt32(this.vc_wibbles.objects.length);
            
            this.vc_wibbles.pt_wibbleoffset = w.Tell();
            w.Int32(-1);        // Fix momentarily.
            w.Int32(-1);        // Fix momentarily.
        }
        else
        {
            w.UInt32(0);
            w.Pad(8, 0xFF);
        }
        
        // Fix momentarily.
        this.pt_animoffset = w.Tell();
        w.Int32(-1);
        
        w.Pad(16);
    }
}

module.exports = THAW_Material;
