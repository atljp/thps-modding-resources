// ----------------------------------------------
//
//  SMESH
//      A sMesh.
//
// ----------------------------------------------

const Vertex = require('./Vertex.js');
const VertexGroup = require('./VertexGroup.js');

// -----------------------------

// This is a list of material templates
// that must have lightmap UV's. If they do
// not exist, then we will pop the last UVmap
// off of the stack and assign it.
//
// This also includes valid scene types
// that we should swap it for.

const LightmapPopList = [
    ["0xf7541074", ["ghm", "gh5"]],                               // D_LM
    ["0x92af2fe3", ["gh5"]],                                      // D_3ChkBox_Pass0_Pass1
    //~ ["0x3b589f65", ["gh5"]],                                      // D_S_3ChkBox_Pass0_Pass1
];

// -----------------------------

class sMesh
{
    constructor(geom)
    {
        this.geom = geom;
        this.From(null, "");
    }
    
    // -----------------------------
    // Clone from sMesh.
    // -----------------------------
    
    From(mesh, fmt = "")
    {
        this.material = (mesh && mesh.material) || "0x00000000";
        
        this.weighted = (mesh && mesh.weighted) || false;
        
        this.sphere_pos = (mesh && mesh.sphere_pos) || [0.0, 0.0, 0.0];
        this.sphere_radius = (mesh && mesh.sphere_radius) || 0.0;
        
        this.bounds_min = (mesh && mesh.bounds_min) || [0.0, 0.0, 0.0, 0.0];
        this.bounds_max = (mesh && mesh.bounds_max) || [0.0, 0.0, 0.0, 0.0];
        
        this.billboard_type = (mesh && mesh.billboard_type) || 0;
        this.billboard_pivot = (mesh && mesh.billboard_pivot) || [0.0, 0.0, 0.0, 0.0];
        this.billboard_junk = (mesh && mesh.billboard_junk) || [0, 0, 0, 1.0];
        
        this.face_block_length = (mesh && mesh.face_block_length) || 0;
        this.uv_block_length = (mesh && mesh.uv_block_length) || 0;
        
        this.uv_bool = (mesh && mesh.uv_bool) || 0;
        this.uv_stride = (mesh && mesh.uv_stride) || 0;
        
        this.face_count = (mesh && mesh.face_count) || 0;
        this.vertex_count = (mesh && mesh.vertex_count) || 0;
        
        this.face_type = (mesh && mesh.face_type) || SceneConverter.constants.FACETYPE_TRIANGLES;
        
        this.off_billboards = (mesh && mesh.off_billboards) || 0;
        this.off_uvs = (mesh && mesh.off_uvs) || 0;
        this.off_verts = (mesh && mesh.off_verts) || 0;
        this.off_faces = (mesh && mesh.off_faces) || 0;
        this.off_vertwibbles = (mesh && mesh.off_vertwibbles) || 0;
        
        this.mesh_flags = (mesh && mesh.mesh_flags) || 0;
        this.unk_flags = (mesh && mesh.unk_flags) || 0;
        
        this.unk_a = (mesh && mesh.unk_a) || 0;
        this.unk_b = (mesh && mesh.unk_b) || 0;
        this.unk_c = (mesh && mesh.unk_c) || 0;
        this.unk_d = (mesh && mesh.unk_d) || 0;
        this.unk_e = (mesh && mesh.unk_e) || 0;
        this.unk_f = (mesh && mesh.unk_f) || 0;
        this.unk_g = (mesh && mesh.unk_g) || 0;
        
        this.faces = (mesh && mesh.faces) || [];
        this.vertices = (mesh && mesh.vertices) || [];
        this.vertex_groups = (mesh && mesh.vertex_groups) || [
            [],
            [],
            []
        ];
        
        this.lods = (mesh && mesh.lods) || [];
    }
    
    // -----------------------------
    // Gets file version.
    // -----------------------------
    
    GetSceneFormat()
    {
        return this.geom.sector.scene.sceneFile.format;
    }
    
    // -----------------------------
    // Does this type use high-resolution values?
    // -----------------------------
    
    IsHires() { return true; }
    
    // -----------------------------
    // Unpack some normals.
    // -----------------------------
    
    UnpackNormals(packed_norms)
    {
        var nX = (packed_norms & 0x7FF) / 1024.0
        var nY = ((packed_norms >> 11) & 0x7FF) / 1024.0
        var nZ = ((packed_norms >> 22) & 0x3FF) / 512.0
        
        if (nX > 1.0)
            nX = -(2.0 - nX)
        if (nY > 1.0)
            nY = -(2.0 - nY)
        if (nZ > 1.0)
            nZ = -(2.0 - nZ)
            
        return [nX, nY, nZ];
    }
    
    // -----------------------------
    // Has vertex color?
    // -----------------------------
    
    HasVertexColor()
    {
        return (this.mesh_flags & SceneConverter.constants.MESHFLAG_HASVERTEXCOLORS) ? true : false;
    }
    
    // -----------------------------
    // Has primary lightmap?
    // -----------------------------
    
    HasPrimaryLightmap()
    {
        return ((this.mesh_flags & SceneConverter.constants.MESHFLAG_LIGHTMAPPED) || (this.mesh_flags & SceneConverter.constants.MESHFLAG_LIGHTMAPPED_COMPR)) ? true : false;
    }
    
    // -----------------------------
    // Has secondary lightmap?
    // -----------------------------
    
    HasSecondaryLightmap()
    {
        return ((this.mesh_flags & SceneConverter.constants.MESHFLAG_ALTLIGHTMAP) || (this.mesh_flags & SceneConverter.constants.MESHFLAG_ALTLIGHTMAP_COMPR)) ? true : false;
    }
    
    // -----------------------------
    // Has weights
    // -----------------------------
    
    HasWeights()
    {
        return (this.mesh_flags & SceneConverter.constants.MESHFLAG_HASWEIGHTS) ? true : false;
    }
    
    // -----------------------------
    // Has a billboard pivot?
    // -----------------------------
    
    HasBillboardPivot()
    {
        return (this.mesh_flags & SceneConverter.constants.MESHFLAG_BILLBOARDPIVOT) ? true : false;
    }
    
    // -----------------------------
    // Has pre-color unk
    // -----------------------------
    
    HasPreColorUnk()
    {
        return (this.mesh_flags & SceneConverter.constants.MESHFLAG_PRECOLORUNK) ? true : false;
    }
    
    // -----------------------------
    // Has post-color unk
    // -----------------------------
    
    HasPostColorUnk()
    {
        return (this.mesh_flags & SceneConverter.constants.MESHFLAG_POSTCOLORUNK) ? true : false;
    }
    
    // -----------------------------
    // How many UV sets do we have?
    // -----------------------------
    
    GetUVSetCount()
    {
        var sets = 0;
        
        sets += (this.mesh_flags & SceneConverter.constants.MESHFLAG_1UVSET) ? 1 : 0;
        sets += (this.mesh_flags & SceneConverter.constants.MESHFLAG_2UVSET) ? 1 : 0;
        sets += (this.mesh_flags & SceneConverter.constants.MESHFLAG_3UVSET) ? 1 : 0;
        sets += (this.mesh_flags & SceneConverter.constants.MESHFLAG_4UVSET) ? 1 : 0;
        
        sets += (this.mesh_flags & SceneConverter.constants.MESHFLAG_1UVSET_COMPR) ? 1 : 0;
        sets += (this.mesh_flags & SceneConverter.constants.MESHFLAG_2UVSET_COMPR) ? 1 : 0;
        sets += (this.mesh_flags & SceneConverter.constants.MESHFLAG_3UVSET_COMPR) ? 1 : 0;
        sets += (this.mesh_flags & SceneConverter.constants.MESHFLAG_4UVSET_COMPR) ? 1 : 0;
        
        return sets;
    }
    
    // -----------------------------
    // How many tangents do we have?
    // -----------------------------
    
    GetTangentCount()
    {
        if (this.mesh_flags & SceneConverter.constants.MESHFLAG_2TANGENT)
            return 2;
        else if (this.mesh_flags & SceneConverter.constants.MESHFLAG_1TANGENT)
            return 1;
        else
            return 0;
    }
    
    // -----------------------------
    // Rebuild mesh flags based on
    // the data we currently have.
    // -----------------------------
    
    RebuildMeshFlags()
    {
        var new_flags = 0;
        console.log("  Old Flags: 0x" + this.mesh_flags.toString(16).padStart(8, "0"));
        
        var uv_sets = Math.min((this.vertices[0] && this.vertices[0].uvs.length), this.GetUVSetCount());
        var tan_count = this.GetTangentCount();
        var has_vertex_color = this.HasVertexColor();
        var has_weights = this.HasWeights();
        var has_pre_cu = this.HasPreColorUnk();
        var has_post_cu = this.HasPostColorUnk();
        var has_prim_lm = this.HasPrimaryLightmap();
        var has_sec_lm = this.HasSecondaryLightmap();
        var has_pivot = this.HasBillboardPivot();
        
        // For GHWT, we don't use this. No idea what it is. Just skip it.
        has_post_cu = false;
        
        if (uv_sets >= 1)
            new_flags |= SceneConverter.constants.MESHFLAG_1UVSET;
        if (uv_sets >= 2)
            new_flags |= SceneConverter.constants.MESHFLAG_2UVSET;
        if (uv_sets >= 3)
            new_flags |= SceneConverter.constants.MESHFLAG_3UVSET;
        if (uv_sets >= 4)
            new_flags |= SceneConverter.constants.MESHFLAG_4UVSET;
            
        // Only weighted meshes should have tangents.
        if (has_weights)
        {
            if (tan_count == 2)
                new_flags |= SceneConverter.constants.MESHFLAG_2TANGENT;
            else if (tan_count == 1)
                new_flags |= SceneConverter.constants.MESHFLAG_1TANGENT;
        }
            
        if (has_weights)
            new_flags |= SceneConverter.constants.MESHFLAG_HASWEIGHTS;
            
        //~ if (has_pre_cu)
            //~ new_flags |= SceneConverter.constants.MESHFLAG_PRECOLORUNK;
        //~ if (has_post_cu)
            //~ new_flags |= SceneConverter.constants.MESHFLAG_POSTCOLORUNK;
            
        if (has_vertex_color)
            new_flags |= SceneConverter.constants.MESHFLAG_HASVERTEXCOLORS;
            
        if (has_pivot)
            new_flags |= SceneConverter.constants.MESHFLAG_BILLBOARDPIVOT;
        
        if (has_prim_lm)
            new_flags |= SceneConverter.constants.MESHFLAG_LIGHTMAPPED;
            
        if (has_sec_lm)
            new_flags |= SceneConverter.constants.MESHFLAG_ALTLIGHTMAP;
            
        // Always has these
        new_flags |= SceneConverter.constants.MESHFLAG_Q;
        new_flags |= SceneConverter.constants.MESHFLAG_R;
        new_flags |= SceneConverter.constants.MESHFLAG_S;
        
        if (has_weights)
        {
            new_flags |= SceneConverter.constants.MESHFLAG_T;
            new_flags |= SceneConverter.constants.MESHFLAG_U;
        }
            
        console.log("  New Flags: 0x" + new_flags.toString(16).padStart(8, "0"));
        
        this.mesh_flags = new_flags;
    }
    
    // -----------------------------
    // Validate vertex data depending
    // on certain things.
    // -----------------------------
    
    ValidateVertices()
    {
        var sf = this.geom.sector.scene.sceneFile;
        var format = this.GetSceneFormat().toLowerCase();
         
        var mIndex = sf.GetMaterialIndex(this.material);
        
        if (mIndex >= 0)
        {
            var mat = sf.materials[mIndex];
            
            // See if this is a lightmap material
            // that we need to swap.
            
            for (const popper of LightmapPopList)
            {
                if (mat.original_template.toLowerCase() == popper[0])
                {
                    var valid = false;
                    
                    for (const mode of popper[1])
                    {
                        if (format == mode)
                        {
                            valid = true;
                            break;
                        }
                    }
                    
                    if (valid)
                    {
                        console.log("Fixing up " + popper[0] + " lightmaps...");
                        
                        var uv_sets = 1;
                
                        for (var v=0; v<this.vertices.length; v++)
                        {
                            var vert = this.vertices[v];
                            
                            // This template uses the last UV channel for lightmap.
                            // We'll pop it off and assign it to the lightmap UV.
                            
                            uv_sets = vert.uvs.length;
                            
                            if (vert.uvs.length > 1 && !vert.lightmap)
                            {
                                var lightmap_uv = this.vertices[v].uvs.pop();
                                this.vertices[v].lightmap = lightmap_uv;
                            }
                        }
                        
                        // Now change our mesh flags.
                        // We only have ONE uv set, but we now have a lightmap.
                        
                        if (uv_sets == 3)
                        {
                            this.mesh_flags &= ~SceneConverter.constants.MESHFLAG_3UVSET;
                            this.mesh_flags &= ~SceneConverter.constants.MESHFLAG_3UVSET_COMPR;
                        }
                        else if (uv_sets == 2)
                        {
                            this.mesh_flags &= ~SceneConverter.constants.MESHFLAG_2UVSET;
                            this.mesh_flags &= ~SceneConverter.constants.MESHFLAG_2UVSET_COMPR;
                        }
                        
                        if (this.mesh_flags & SceneConverter.constants.MESHFLAG_1UVSET_COMPR)
                            this.mesh_flags |= SceneConverter.constants.MESHFLAG_LIGHTMAPPED_COMPR;
                        else
                            this.mesh_flags |= SceneConverter.constants.MESHFLAG_LIGHTMAPPED;
                    }
                }
            }
            
            // EnvMask_D_N_S_2ChkBox
            // Has 2 UV's, first 1 are normal but 2nd is lightmap
            // We need to duplicate the first UV
            
            if (mat.original_template.toLowerCase() == "0xf4e6db51" && format == "gh5")
            {
                console.log("Fixing EnvMask_D_N_S_2ChkBox lightmaps...");
                
                for (var v=0; v<this.vertices.length; v++)
                {
                    var vert = this.vertices[v];
                    
                    // Last UV will be used for lightmaps
                    var lmuv = vert.uvs.pop();
                    
                    // Duplicate first UV
                    vert.uvs.unshift(vert.uvs[0]);       
                                 
                    vert.altlightmap = lmuv;
                    
                    // Ensure that we have necessary UV flags
                    
                    if (this.mesh_flags & SceneConverter.constants.MESHFLAG_1UVSET_COMPR)
                    {
                        if (!(this.mesh_flags & SceneConverter.constants.MESHFLAG_2UVSET_COMPR))
                            this.mesh_flags |= SceneConverter.constants.MESHFLAG_2UVSET_COMPR;
                        if (!(this.mesh_flags & SceneConverter.constants.MESHFLAG_ALTLIGHTMAP_COMPR))
                            this.mesh_flags |= SceneConverter.constants.MESHFLAG_ALTLIGHTMAP_COMPR;
                    }
                    else
                    {
                        if (!(this.mesh_flags & SceneConverter.constants.MESHFLAG_2UVSET))
                            this.mesh_flags |= SceneConverter.constants.MESHFLAG_2UVSET;
                        if (!(this.mesh_flags & SceneConverter.constants.MESHFLAG_ALTLIGHTMAP))
                            this.mesh_flags |= SceneConverter.constants.MESHFLAG_ALTLIGHTMAP;
                    }
                }
            }
            
            // D_3ChkBox_Pass0_Pass1_Pass2
            // Has 4 UV's, first 3 are normal but 4th is lightmap
            // We need to duplicate the first UV
            
            if (mat.original_template.toLowerCase() == "0x253cd303" && format == "gh5")
            {
                console.log("Fixing D_3ChkBox_Pass0_Pass1_Pass2 lightmaps...");
                
                for (var v=0; v<this.vertices.length; v++)
                {
                    var vert = this.vertices[v];
                    
                    // Last UV will be used for lightmaps
                    var lmuv = vert.uvs.pop();
                    
                    // Duplicate first UV
                    vert.uvs.unshift(vert.uvs[0]);       
                                 
                    vert.lightmap = lmuv;
                    
                    // Ensure that we have necessary UV flags
                    
                    if (this.mesh_flags & SceneConverter.constants.MESHFLAG_1UVSET_COMPR)
                    {
                        if (!(this.mesh_flags & SceneConverter.constants.MESHFLAG_2UVSET_COMPR))
                            this.mesh_flags |= SceneConverter.constants.MESHFLAG_2UVSET_COMPR;
                        if (!(this.mesh_flags & SceneConverter.constants.MESHFLAG_3UVSET_COMPR))
                            this.mesh_flags |= SceneConverter.constants.MESHFLAG_3UVSET_COMPR;
                        if (!(this.mesh_flags & SceneConverter.constants.MESHFLAG_4UVSET_COMPR))
                            this.mesh_flags |= SceneConverter.constants.MESHFLAG_4UVSET_COMPR;
                        if (!(this.mesh_flags & SceneConverter.constants.MESHFLAG_LIGHTMAPPED_COMPR))
                            this.mesh_flags |= SceneConverter.constants.MESHFLAG_LIGHTMAPPED_COMPR;
                    }
                    else
                    {
                        if (!(this.mesh_flags & SceneConverter.constants.MESHFLAG_2UVSET))
                            this.mesh_flags |= SceneConverter.constants.MESHFLAG_2UVSET;
                        if (!(this.mesh_flags & SceneConverter.constants.MESHFLAG_3UVSET))
                            this.mesh_flags |= SceneConverter.constants.MESHFLAG_3UVSET;
                        if (!(this.mesh_flags & SceneConverter.constants.MESHFLAG_4UVSET))
                            this.mesh_flags |= SceneConverter.constants.MESHFLAG_4UVSET;
                        if (!(this.mesh_flags & SceneConverter.constants.MESHFLAG_LIGHTMAPPED))
                            this.mesh_flags |= SceneConverter.constants.MESHFLAG_LIGHTMAPPED;
                    }
                }
            }
            
            // Wibble_Pos_Pass0
            // Seems to have 3 UV's, 4th is lightmap?
            // But has no explicit lightmap flag? What?
            
            if (mat.original_template.toLowerCase() == "0x954bf282" && format == "gh5")
            {
                console.log("Fixing Wibble_Pos_Pass0 lightmaps...");
                
                for (var v=0; v<this.vertices.length; v++)
                {
                    var vert = this.vertices[v];
                    
                    var lmuv = vert.uvs.pop();
                    
                    // Ensure we have 3 UV's
                    while (vert.uvs.length < 3)
                    {
                        vert.uvs.push(vert.uvs[0]);
                    }
                    
                    vert.uvs.push(lmuv);
                    
                    // Ensure that we have necessary UV flags
                    
                    if (this.mesh_flags & SceneConverter.constants.MESHFLAG_1UVSET_COMPR)
                    {
                        if (!(this.mesh_flags & SceneConverter.constants.MESHFLAG_2UVSET_COMPR))
                            this.mesh_flags |= SceneConverter.constants.MESHFLAG_2UVSET_COMPR;
                        if (!(this.mesh_flags & SceneConverter.constants.MESHFLAG_3UVSET_COMPR))
                            this.mesh_flags |= SceneConverter.constants.MESHFLAG_3UVSET_COMPR;
                        if (!(this.mesh_flags & SceneConverter.constants.MESHFLAG_4UVSET_COMPR))
                            this.mesh_flags |= SceneConverter.constants.MESHFLAG_4UVSET_COMPR;
                    }
                    else
                    {
                        if (!(this.mesh_flags & SceneConverter.constants.MESHFLAG_2UVSET))
                            this.mesh_flags |= SceneConverter.constants.MESHFLAG_2UVSET;
                        if (!(this.mesh_flags & SceneConverter.constants.MESHFLAG_3UVSET))
                            this.mesh_flags |= SceneConverter.constants.MESHFLAG_3UVSET;
                        if (!(this.mesh_flags & SceneConverter.constants.MESHFLAG_4UVSET))
                            this.mesh_flags |= SceneConverter.constants.MESHFLAG_4UVSET;
                    }
                }
            }
            
            // 0x3b589f65
            // Needs alt lightmap flag, that's about it. I think?
            
            if (mat.original_template.toLowerCase() == "0x3b589f65")
            {
                console.log("Fixing 0x3b589f65 lightmaps...");
                
                for (var v=0; v<this.vertices.length; v++)
                {
                    var vert = this.vertices[v];
                    
                    // I'm not actually sure which UV's are used for what.
                    // Let's pop lightmap off first.
                    
                    var lmuv = vert.uvs.pop();
                    
                    // Let's get our last UV, we'll duplicate it.
                    
                    var lastUV = vert.uvs.pop();
                    
                    vert.uvs.push(lastUV);
                    vert.uvs.push(lastUV);
                    
                    vert.altlightmap = lmuv;
                    
                    if (this.mesh_flags & SceneConverter.constants.MESHFLAG_1UVSET_COMPR)
                        this.mesh_flags |= SceneConverter.constants.MESHFLAG_ALTLIGHTMAP_COMPR;
                    else
                        this.mesh_flags |= SceneConverter.constants.MESHFLAG_ALTLIGHTMAP;
                }
            }
        }
    }
    
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    //
    //  D E S E R I A L I Z E
    //      DESERIALIZES FROM A FILE.
    //
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    
    // -----------------------------
    // Read our UV's
    // -----------------------------
    
    ReadUVs()
    {
        var r = this.reader;
        
        console.log("    Reading UV's @ " + r.Tell());
        
        var is_hires = this.IsHires();
        
        var has_weights = this.HasWeights();
        var has_vertex_color = this.HasVertexColor();
        var has_prim_lightmap = this.HasPrimaryLightmap();
        var has_sec_lightmap = this.HasSecondaryLightmap();
        var has_pivot = this.HasBillboardPivot();
        var has_precolorunk = this.HasPreColorUnk();
        var has_postcolorunk = this.HasPostColorUnk();
        
        var uv_sets = this.GetUVSetCount();
        var tan_count = this.GetTangentCount();
        
        console.log("    Hi-res Values: " + is_hires);
        console.log("    UV Stride: " + this.uv_stride);
        console.log("    Has Vertex Color: " + has_vertex_color);
        console.log("    Has Primary Lightmap: " + has_prim_lightmap);
        console.log("    Has Secondary Lightmap: " + has_sec_lightmap);
        console.log("    Has Weights: " + has_weights);
        console.log("    Has BB Pivot: " + has_pivot);
        console.log("    Has Pre-Color Unk: " + has_precolorunk);
        console.log("    Has Post-Color Unk: " + has_postcolorunk);
        console.log("    UV Sets: " + uv_sets);
        console.log("    Tangents: " + tan_count);
        
        // Regardless, UV's start with 32 bytes.
        // In X360, these seem to be values? PC is just 
        // junk, as I recall
        
        r.Chunk(32);
        
        for (var v=0; v<this.vertex_count; v++)
        {
            var uv_start = r.Tell();
            var nextUV = uv_start + this.uv_stride;
            
            var vert = new Vertex(this);
            this.vertices.push(vert);
            
            // --------
            
            if (!has_weights)
            {
                vert.pos = [ r.Float(), r.Float(), r.Float() ];
                
                if (has_pivot)
                    vert.pivot = [ r.Float(), r.Float(), r.Float() ];
                
                if (is_hires)
                    vert.no = [ r.Float(), r.Float(), r.Float() ];
                else
                {
                    var packed_normals = r.UInt32();
                    vert.no = this.UnpackNormals(packed_normals);
                }
                
                if (tan_count == 2)
                {
                    if (is_hires)
                    {
                        vert.tangent = [r.Float(), r.Float(), r.Float()];
                        vert.bitangent = [r.Float(), r.Float(), r.Float()];
                    }
                    else
                    {
                        var tan = r.UInt32();
                        var bitan = r.UInt32();
                        vert.tangent = this.UnpackNormals(tan);
                        vert.bitangent = this.UnpackNormals(bitan);
                    }
                }
                else if (tan_count == 1)
                {
                    if (is_hires)
                    {
                         vert.tangent = [r.Float(), r.Float(), r.Float()];
                    }
                    else
                    {
                        var tan = r.UInt32();
                        vert.tangent = this.UnpackNormals(tan);
                    }
                }
            }
            
            if (has_precolorunk && !has_weights)
                vert.pre_color_int = r.UInt32();
            
            if (has_vertex_color)
            {
                vert.color.a = r.UInt8();
                vert.color.r = r.UInt8();
                vert.color.g = r.UInt8();
                vert.color.b = r.UInt8();
            }
            
            if (has_postcolorunk && !has_weights)
                vert.post_color_int = r.UInt32();
            
            // --------
            
            for (var u=0; u<uv_sets; u++)
            {
                if (is_hires)
                    vert.uvs.push( [ r.Float(), r.Float() ] );
                else
                    vert.uvs.push( [ r.HalfFloat(), r.HalfFloat() ] );
            }
            
            if (has_prim_lightmap)
            {
                if (is_hires)
                    vert.lightmap = [ r.Float(), r.Float() ];
                else
                    vert.lightmap = [ r.HalfFloat(), r.HalfFloat() ];
            }
            
            if (has_sec_lightmap)
            {
                if (is_hires)
                    vert.altlightmap = [ r.Float(), r.Float() ];
                else
                    vert.altlightmap = [ r.HalfFloat(), r.HalfFloat() ];
            }
            
            //~ vert.Debug();
            
            if (r.Tell() != nextUV)
            {
                var gap = nextUV - r.Tell();
                console.log("Read " + (r.Tell() - uv_start) + " bytes");
                console.log("!! ERROR: WAS NOT AT NEXT UV POSITION - Gap: " + gap + " !!");
                return;
            }
            
            r.Seek(nextUV);
        }
        
        console.log("");
    }
    
    // -----------------------------
    // Read our faces
    // -----------------------------
    
    ReadFaces()
    {
        var r = this.reader;
        
        console.log("    Faces @[" + r.Tell() + "]");
        
        // Don't care about this (for now)
        r.Chunk(32);
        
        // How many indices do we want to read?
        console.log("    Reading " + this.face_count + " face indices...");
        var indices = [];
        
        for (var i=0; i<this.face_count; i++)
            indices.push( r.UInt16() );
            
        // Read our faces depending on our face type.
        switch (this.face_type)
        {
            case SceneConverter.constants.FACETYPE_QUADS:
            case SceneConverter.constants.FACETYPE_TRIANGLES:
            
                var perFace = (this.face_type == SceneConverter.constants.FACETYPE_QUADS) ? 4 : 3;
            
                var idx = 0;
                while (idx < indices.length)
                {
                    var face = [];
                    for (var f=0; f<perFace; f++)
                        face.push(indices[idx+f]);
                    
                    this.faces.push(face);
                    
                    idx += perFace;
                }
            
                break;
                
            case SceneConverter.constants.FACETYPE_TRISTRIP:
                var strips = [];
                var current_strip = [];
                
                for (const face_index of indices)
                {
                    if (face_index == 0x7FFF)
                    {
                        strips.push(current_strip);
                        current_strip = [];
                    }
                    else
                        current_strip.push(face_index);
                }
                
                if (current_strip.length)
                    strips.push(current_strip);
                    
                // Now loop through our strips and create them appropriately
                for (const indices_list of strips)
                {
                    for (var f=2; f<indices_list.length; f++)
                    {
                        if (f % 2 == 0)
                            var indexes = [indices_list[f-2], indices_list[f-1], indices_list[f]];
                        else
                            var indexes = [indices_list[f-2], indices_list[f], indices_list[f-1]];
                            
                        this.faces.push([indexes[0], indexes[1], indexes[2]])
                    }
                }
                break;
                
            default:
                console.log("!! FACE TYPE " + this.face_type + " NOT SUPPORTED");
                break;
        }
        
        console.log("");
    }
    
    // -----------------------------
    // Read our vertices
    // -----------------------------
    
    ReadVertices()
    {
        var r = this.reader;
        
        console.log("    Vertices @[" + r.Tell() + "]");
        
        // Skip 0xCAFEBAB4
        r.Chunk(16);
        r.UInt32();
        
        var is_hires = this.IsHires();
        
        // Bone weight groups
        // 1 weight, 2 weights, 3 weights
        var sinGroups = r.UInt32();
        var dblGroups = r.UInt32();
        var triGroups = r.UInt32();
        
        console.log("    1 Weights: " + sinGroups);
        console.log("    2 Weights: " + dblGroups);
        console.log("    3 Weights: " + triGroups);
        
        var groupCount = sinGroups + dblGroups + triGroups;
        
        console.log("    Total Groups: " + groupCount);
        
        var vert_idx = 0;
        
        var toLoop = [sinGroups, dblGroups, triGroups];
        
        for (var l=0; l<toLoop.length; l++)
        {
            for (var g=0; g<toLoop[l]; g++)
            {
                var newGroup = new VertexGroup();
                
                var vertCount = r.UInt32();
                var boneIndices = [ r.UInt8(), r.UInt8(), r.UInt8(), r.UInt8() ];
                newGroup.boneIndices = boneIndices;
                
                var vertCountB = r.UInt32();
                var faceText = r.UInt32();
                
                for (var v=0; v<vertCount; v++)
                {
                    var vert;
                    
                    if (vert_idx >= this.vertices.length)
                    {
                        vert = new Vertex(this);
                        vert.group_weights = l+1;
                        this.vertices.push(vert);
                    }
                    else
                    {
                        vert = this.vertices[vert_idx];
                        vert.group_weights = l+1;
                    }
                    
                    newGroup.vertices.push(vert);
                        
                    // -----------------------
                    // PC VERTEX VALUES
                    
                    if (is_hires)
                    {
                        //~ r.f32(wt_pos[0])
                        //~ r.f32(wt_normal[0])
                        //~ r.f32(-wt_bitan[0])
                        //~ r.f32(wt_tan[0])
                        
                        //~ r.f32(wt_pos[1])
                        //~ r.f32(wt_normal[1])
                        //~ r.f32(-wt_bitan[1])
                        //~ r.f32(wt_tan[1])
                        
                        //~ r.f32(wt_pos[2])
                        //~ r.f32(wt_normal[2])
                        //~ r.f32(-wt_bitan[2])
                        //~ r.f32(wt_tan[2])
                        
                        var x1 = [r.Float(), r.Float(), r.Float()];
                        var w1 = r.Float();
                          
                        var x2 = [r.Float(), r.Float(), r.Float()];
                        var w2 = r.Float();
                        
                        var x3 = [r.Float(), r.Float(), r.Float()];
                        var w3 = r.Float();
                        
                        var weight_u = r.Float();
                        var weight_v = r.Float();
                        
                        vert.raw_weight_u = weight_u;
                        vert.raw_weight_v = weight_v;
                    
                        // Position
                        vert.pos = [x1[0], x2[0], x3[0]];
                            
                        // Normals
                        vert.no = [x1[1], x2[1], x3[1]];
                        
                        // Tangents
                        vert.tangent = [w1, w2, w3];
                        vert.bitangent = [x1[2], x2[2], x3[2]];
                    }
                    
                    // -----------------------
                    // X360 VERTEX VALUES
                    
                    else
                    {
                        vert.pos = [ r.Float(), r.Float(), r.Float() ];
                        
                        // Weight values are flipped, odd
                        var weight_v = r.UInt16() / 65535.0;
                        var weight_u = r.UInt16() / 65535.0;
                        
                        vert.raw_weight_u = weight_u;
                        vert.raw_weight_v = weight_v;
                        
                        vert.no = this.UnpackNormals( r.UInt32() );
                        vert.tangent = this.UnpackNormals( r.UInt32() );
                        vert.bitangent = this.UnpackNormals( r.UInt32() );
                        
                        r.UInt32();         // BAADFOOD
                        
                    }
                    
                    var weight_diff = 1.0 - (weight_u+weight_v)
                    vert.weights[0][0] = boneIndices[0];
                    vert.weights[1][0] = boneIndices[1];
                    vert.weights[2][0] = boneIndices[2];
                    
                    vert.weights[0][1] = weight_u + weight_diff;
                    vert.weights[1][1] = weight_v + weight_diff;
                    vert.weights[2][1] = weight_diff;
                    
                    // -----------------------
                        
                    vert_idx ++;
                    
                    //~ vert.Debug();
                }
                
                this.vertex_groups[l].push(newGroup);
            }
        }
    }
    
    // -----------------------------
    // Deserialize from a file.
    // -----------------------------
    
    Deserialize(r)
    {
        this.reader = r;
        
        console.log("    -- SMESH " + this.geom.meshes.length + " @[" + r.Tell() + "] ----");
        
        this.sphere_pos = [ r.Float(), r.Float(), r.Float() ];
        console.log("    Sphere Pos: (" + this.sphere_pos.join(", ") + ")");
        this.sphere_radius = r.Float();
        console.log("    Sphere Radius: " + this.sphere_radius);
        
        var ptUV = r.Int32();
        if (ptUV >= 0)
        {
            this.off_uvs = this.geom.sector.scene.sceneFile.off_scene + ptUV;
            console.log("    UV's @ " + this.off_uvs);
        }
        
        r.Chunk(8);
        
        this.uv_block_length = r.UInt32();
        console.log("    UV Block Length: " + this.uv_block_length);
        
        r.UInt32();
        
        this.mesh_flags = r.UInt32();
        console.log("    Mesh Flags: 0x" + this.mesh_flags.toString(16).padStart(8, "0"));
        
        r.UInt8();
        r.UInt8();
        
        this.uv_bool = r.UInt8();
        console.log("    UV Bool: " + this.uv_bool);
        this.uv_stride = r.UInt8();
        console.log("    UV Stride: " + this.uv_stride);
        
        var ptFaces = r.Int32();
        if (ptFaces >= 0)
        {
            this.off_faces = this.geom.sector.scene.sceneFile.off_scene + ptFaces;
            console.log("    Faces @ " + this.off_faces);
        }
        
        r.Chunk(8);
        
        this.face_block_length = r.UInt32();
        console.log("    Face Block Length: " + this.face_block_length);
        
        r.UInt32();
        
        var always_const = r.UInt32();
        console.log("    Always 258: " + always_const);
        
        this.unk_a = r.UInt16();
        this.unk_b = r.UInt16();
        
        console.log("    Unk A: " + this.unk_a);
        console.log("    Unk B: " + this.unk_b);
        
        r.UInt32();
        
        this.material = "0x" + r.UInt32().toString(16).padStart(8, "0");
        console.log("    Material: " + this.material);
        
        r.Chunk(12);
        
        this.face_count = r.UInt16();
        console.log("    Face Count: " + this.face_count);
        this.vertex_count = r.UInt16();
        console.log("    Vertex Count: " + this.vertex_count);
        
        r.Chunk(8);
        
        this.unk_c = r.UInt32();
        console.log("    Unk C: 0x" + this.unk_c.toString(16).padStart(8, "0"));
        this.unk_d = r.UInt32();
        console.log("    Unk D: 0x" + this.unk_d.toString(16).padStart(8, "0"));
        this.unk_e = r.UInt16();
        console.log("    Unk E: 0x" + this.unk_e.toString(16).padStart(4, "0"));
        this.unk_f = r.UInt16();
        console.log("    Unk F: 0x" + this.unk_f.toString(16).padStart(4, "0"));
        this.unk_g = r.UInt32();
        console.log("    Unk G: 0x" + this.unk_g.toString(16).padStart(8, "0"));
        
        r.UInt32();
        
        var ptVertices = r.Int32();
        if (ptVertices >= 0)
        {
            this.off_verts = this.geom.sector.scene.sceneFile.off_scene + ptVertices;
            console.log("    Weighted Verts @ " + this.off_verts);
        }
        
        r.UInt32();
        
        this.face_type = r.UInt32();
        console.log("    Face Type: " + this.face_type);
        
        r.Chunk(8);
        console.log("");
        
        var mesh_end = r.Tell();
        
        // ------------------------------------
        
        if (this.off_uvs > 0)
        {
            r.Seek(this.off_uvs);
            this.ReadUVs();
        }
            
        if (this.off_faces > 0)
        {
            r.Seek(this.off_faces);
            this.ReadFaces();
        }
            
        if (this.off_verts > 0)
        {
            r.Seek(this.off_verts);
            this.ReadVertices();
        }
        
        this.ValidateVertices();
        
        // ------------------------------------
        
        r.Seek(mesh_end);
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
        w.Float(this.sphere_pos[0]);
        w.Float(this.sphere_pos[1]);
        w.Float(this.sphere_pos[2]);
        w.Float(this.sphere_radius);
        
        // UV start, we'll fix this later.
        this.pt_uvs = w.Tell();
        w.Int32(-1);
        
        w.Int32(-1);
        w.Int32(-1);
        
        // UV length, we'll fix this later.
        // We could calculate this based on stride, but
        // to be safe, we'll just fill it in after.
        
        this.pt_uvLength = w.Tell();
        w.UInt32(0);
        
        w.UInt32(0);
        
        // We will rebuild our mesh flags based on
        // what we actually have. This fixes up
        // X360 mesh flags to work on PC.
        
        var new_flags = this.RebuildMeshFlags();
        w.UInt32(this.mesh_flags);
        
        w.UInt16();
        w.UInt8(this.uv_bool);
        
        // Fill this in later based on our stride.
        this.pt_uvStride = w.Tell();
        w.UInt8(0);
        
        w.UInt16(0x02);
        w.UInt16(0x40);
        
        w.UInt32(0);
        
        w.UInt32( parseInt(this.material, 16) );
        
        w.UInt32(0);
        w.UInt32(255);
        
        w.UInt32(0);
        
        // This is the number of face INDICES.
        // This varies based on our face type!
        
        switch (this.face_type)
        {
            case SceneConverter.constants.FACETYPE_QUADS:
                w.UInt16(this.faces.length * 4);
                break;
                
            default:
            case SceneConverter.constants.FACETYPE_TRIANGLES:
                w.UInt16(this.faces.length * 3);
                break;
        }
        
        w.UInt16(this.vertices.length);
        
        w.Pad(8);
        w.UInt32(0x001E5B00);
        w.UInt32(0);
        
        // Fill this in later
        this.pt_faces = w.Tell();
        w.Int32(-1);
        
        // Fill this in later
        this.pt_verts = w.Tell();
        w.Int32(-1);
        
        w.UInt32(0);
        
        // We ALWAYS export as triangle format.
        w.UInt32(this.face_type);
        
        w.Pad(8);
        
        console.log("sMesh finished at " + w.Tell());
    }
    
    // -----------------------------
    // Serialize our UV's.
    // -----------------------------
    
    SerializeUVs(w)
    {
        var off_uvs = w.Tell();
        
        // GHWTPC uses 0x00 padding
        w.Pad(32, 0);
        
        var uv_stride = 0;
        
        for (var v=0; v<this.vertices.length; v++)
        {
            var vert = this.vertices[v];
            
            if (!uv_stride)
                var preVert = w.Tell();
                
            vert.SerializeUVs(w);
            
            if (!uv_stride)
                uv_stride = w.Tell() - preVert;
        }
        
        var uv_end = w.Tell();
        
        return {
            uv_length: uv_end - off_uvs,
            uv_stride: uv_stride
        };
        
        //~ w.Seek(this.pt_uvLength);
        //~ w.UInt32(uv_end - off_uvs);

        //~ w.Seek(this.pt_uvStride);
        //~ w.UInt8(uv_stride);
        //~ w.Seek(uv_end);
        
        //~ console.log("UV stride: " + uv_stride);
        //~ console.log("UV Length: " + (uv_end - off_uvs));
    }
    
    // -----------------------------
    // Serialize our Faces.
    // -----------------------------
    
    SerializeFaces(w)
    {
        var off_faces = w.Tell();
        
        w.Pad(16);
        
        // Bone levels 1, 2, and 3 (in reverse!)
        w.UInt32(this.vertex_groups[2].length);
        w.UInt32(this.vertex_groups[1].length);
        w.UInt32(this.vertex_groups[0].length);
        
        var indicesPerFace = 0;
        
        switch (this.face_type)
        {
            default:
            case SceneConverter.constants.FACETYPE_TRIANGLES:
                indicesPerFace = 3;
                break;
                
            case SceneConverter.constants.FACETYPE_QUADS:
                indicesPerFace = 4;
                break;
        }
        
        w.UInt32(this.faces.length * indicesPerFace);
        
        for (const face of this.faces)
        {
            for (var i=0; i<indicesPerFace; i++)
            {
                w.UInt16(face[i]);
            }
        }
        
        // Pad to nearest 256 bytes, just because
        w.PadToNearest(256, 0xEE);
    }
    
    // -----------------------------
    // Serialize our faces.
    // -----------------------------
    
    SerializeVertices(w)
    {
        var off_verts = w.Tell();
        
        w.Seek(this.pt_verts);
        w.UInt32(off_verts - this.geom.sector.scene.sceneFile.off_scene);
        w.Seek(off_verts);
        
        for (var l=0; l<4; l++)
            w.UInt32(0xCAFEBAB4);
        
        w.UInt32(0);
        
        // Vertex group counts
        w.UInt32(this.vertex_groups[0].length);
        w.UInt32(this.vertex_groups[1].length);
        w.UInt32(this.vertex_groups[2].length);
        
        for (const grouplist of this.vertex_groups)
        {
            for (const group of grouplist)
            {
                w.UInt32(group.vertices.length);
                w.UInt8(group.boneIndices[0]);
                w.UInt8(group.boneIndices[1]);
                w.UInt8(group.boneIndices[2]);
                w.UInt8(group.boneIndices[3]);
                w.UInt32(group.vertices.length);
                w.UInt32(0xFACEF000);
                
                for (const vert of group.vertices)
                    vert.Serialize(w);
            }
        }
    }
    
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    // UTILITY FUNCTIONS
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    
    CloneUVs(new_count)
    {
        console.log("CloneUVs not supported for " + this.constructor.name + ".");
    }
}

module.exports = sMesh;
