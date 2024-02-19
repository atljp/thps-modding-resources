// ----------------------------------------------
//
//  THUG2 Material
//      Tony Hawk's Underground 2 material.
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

class THUG2_Material extends Material
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
        
        if (num_passes > 16)
        {
            console.log("  We probably don't have " + num_passes + " passes.");
            process.exit(1);
        }
        
        this.alpha_cutoff = r.UInt32();
        console.log("Alpha Cutoff: " + this.alpha_cutoff);
        
        this.sorted = (r.UInt8()) ? true : false;
        console.log("Sorted: " + this.sorted);
        
        this.draw_order = r.Float();
        console.log("Draw Order: " + this.draw_order);
        
        var single_sided = r.UInt8();
        console.log("Single Sided: " + single_sided);
        
        var no_backface_culling = r.UInt8() ? true : false;
        console.log("No Backface Culling: " + no_backface_culling);
        
        this.z_bias = r.UInt32();
        console.log("Z Bias: " + this.z_bias);
        
        var grassify = r.UInt8();
        console.log("Grassify: " + grassify);
        
        if (grassify)
        {
            console.log("  Grass Height: " + r.Float());
            console.log("  Grass Layers: " + r.UInt32());
        }
        
        var specular_power = r.Float();
        console.log("Specular Power: " + specular_power);
        
        if (specular_power)
            console.log("  Color: " + r.Float() + ", " + r.Float() + ", " + r.Float());
            
        for (var p=0; p<num_passes; p++)
        {
            var pass = {
                frames: []
            };
            
            pass.checksum = "0x" + r.UInt32().toString(16).padStart(8, "0");
            
            console.log("  Pass " + p + ": " + pass.checksum);
            
            pass.flags = r.UInt32();
            console.log("    Flags: 0x" + pass.flags.toString(16).padStart(8, "0"));
            console.log("    Has Color: " + r.UInt8());
            
            pass.color = [r.Float(), r.Float(), r.Float()];
            console.log("    Color: (" + pass.color.join(", ") + ")");
            
            pass.blend_mode = r.UInt32();
            console.log("    Blend Mode: " + pass.blend_mode);
            
            pass.blend_fixed_alpha = r.UInt32();
            console.log("    Blend Fixed Alpha: " + pass.blend_fixed_alpha);
            
            pass.address_u = r.UInt32();
            pass.address_v = r.UInt32();
            console.log("    Address Modes: [" + pass.address_u + ", " + pass.address_v + "]");
            
            pass.envmap_multiples = [r.Float(), r.Float()];
            console.log("    Envmap Multiples: (" + pass.envmap_multiples.join(", ") + ")");
            
            pass.filtering_mode = r.UInt32();
            console.log("    Filtering Mode: " + pass.filtering_mode);

            // These are important, we'll add these later.
            if (pass.flags & MATFLAG_UV_WIBBLE)
            {
                pass.uv_velocity = [r.Float(), r.Float()];
                console.log("    UV Velocity: (" + pass.uv_velocity.join(", ") + ")");
                pass.uv_frequency = [r.Float(), r.Float()];
                console.log("    UV Frequency: (" + pass.uv_frequency.join(", ") + ")");
                pass.uv_amplitude = [r.Float(), r.Float()];
                console.log("    UV Amplitude: (" + pass.uv_amplitude.join(", ") + ")");
                pass.uv_phase = [r.Float(), r.Float()];
                console.log("    UV Phase: (" + pass.uv_phase.join(", ") + ")");
            }
            
            if (p == 0 && (pass.flags & MATFLAG_VC_WIBBLE))
            {
                this.vc_wibbles = {
                    unknowns: [],
                    objects: []
                };
                
                var old_off = r.Tell();
                
                // -- VC wibble objects / frames
                
                var vc_wibble_count = r.UInt32();

                for (var f=0; f<vc_wibble_count; f++)
                {
                    var frame_count = r.UInt32();
                    var object = {time_offset: r.UInt32(), frames: []};

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
                    
                    this.vc_wibbles.objects.push(object);
                }
                
                // -- Unknown objects
                // (What are these? No idea)

                for (var f=0; f<vc_wibble_count; f++)
                    this.vc_wibbles.unknowns.push(0);
            }
            
            if (p == 0 && (pass.flags & MATFLAG_PASS_TEXTURE_ANIMATES))
            {
                var keyframe_count = r.UInt32();

                console.log("    Has " + keyframe_count + " keyframes.");
                
                pass.anim_period = r.Int32();
                pass.anim_iterations = r.Int32();
                pass.anim_phase = r.Int32();
                
                console.log("      Period: " + pass.anim_period);
                console.log("      Iterations: " + pass.anim_iterations);
                console.log("      Phase: " + pass.anim_phase);
                
                for (var k=0; k<keyframe_count; k++)
                {
                    var frame = {
                        time: r.UInt32(),
                        image: "0x" + r.UInt32().toString(16).padStart(8, "0")
                    };
                    
                    pass.frames.push(frame);
                }
            }
            
            pass.mipmap_mag = r.UInt32();
            console.log("    Mipmap Mag: " + pass.mipmap_mag);
            pass.mipmap_min = r.UInt32();
            console.log("    Mipmap Min: " + pass.mipmap_min);
            pass.mipmap_lod_bias = r.Float();
            console.log("    Mipmap LOD Bias: " + pass.mipmap_lod_bias);
            pass.mipmap_l = r.Float();
            console.log("    Mipmap L: " + pass.mipmap_l);
            
            this.passes.push(pass);
        }
        
        // Decide whether material is double-sided.
        //  - single_sided: If the material is not using the Diffuse blend mode this can be toggled to force it to be single sided
        //  - no_backface_culling: Makes material with Diffuse blend mode double sided
        
        var is_blend_mode = (this.passes.length && this.passes[0].blend_mode == 5);
        
        // Blend is double-sided unless we force it not to be.
        if (is_blend_mode)
            this.double_sided = (single_sided == 1) ? false : true;
            
        // Other modes are single-sided unless we force them not to be.
        else
            this.double_sided = (no_backface_culling == 1) ? true : false;
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
        console.log("THUG2 material serializing not supported yet.");
    }
}

module.exports = THUG2_Material;
