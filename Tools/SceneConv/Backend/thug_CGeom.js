// ----------------------------------------------
//
//  THUG CGEOM
//      Tony Hawk's Underground geom.
//
// ----------------------------------------------

const CGeom = require('./CGeom.js');
const Vertex = require('./Vertex.js');

class THUG_CGeom extends CGeom
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
        console.log("    -- CGEOM @[" + r.Tell() + "] ------");
        
        this.sMesh_count = r.UInt32();
        console.log("    sMesh Count: " + this.sMesh_count);
        
        this.bounds_min = [ r.Float(), r.Float(), r.Float(), 0.0 ];
        console.log("    Bounds Min: (" + this.bounds_min.join(", ") + ")");
        this.bounds_max = [ r.Float(), r.Float(), r.Float(), 0.0 ];
        console.log("    Bounds Max: (" + this.bounds_max.join(", ") + ")");
        this.bounds_sphere = [ r.Float(), r.Float(), r.Float(), r.Float() ];
        console.log("    Bounds Sphere: (" + this.bounds_sphere.join(", ") + ")");
        
        if (this.sector.flags & SceneConverter.constants.SECFLAGS_BILLBOARD_PRESENT)
        {
            this.has_geom_billboard = true;
            this.billboard_type = r.UInt32();
            
            this.billboard_pivot_origin = [ r.Float(), r.Float(), r.Float() ];
            this.billboard_pivot_pos = [ r.Float(), r.Float(), r.Float() ];
            this.billboard_pivot_axis = [ r.Float(), r.Float(), r.Float() ];
        }
        
        // ---------------------------------
        
        this.thuginfo = {};
        
        this.thuginfo.count = r.UInt32();
        console.log("    Vertices: " + this.thuginfo.count);
        this.thuginfo.stride = r.UInt32();
        console.log("    Stride: " + this.thuginfo.stride);
        
        this.thuginfo.vertices = [];
        
        //~ console.log("Vertices at " + r.Tell());
        
        for (var v=0; v<this.thuginfo.count; v++)
        {
            var vert = new Vertex();
            
            vert.pos = [r.Float(), r.Float(), r.Float()];
            
            this.thuginfo.vertices.push(vert);
        }
        
        if (this.sector.flags & SceneConverter.constants.SECFLAGS_HAS_VERTEX_NORMALS)
        {
            //~ console.log("Normals at " + r.Tell());
            
            for (var v=0; v<this.thuginfo.count; v++)
            {
                this.thuginfo.vertices[v].no = [r.Float(), r.Float(), r.Float()];
            }
        }
        
        if (this.sector.flags & SceneConverter.constants.SECFLAGS_HAS_VERTEX_WEIGHTS)
        {
            //~ console.log("Weights at " + r.Tell());
            
            for (var v=0; v<this.thuginfo.count; v++)
                this.thuginfo.vertices[v].packed_weights = r.UInt32();
                
            for (var v=0; v<this.thuginfo.count; v++)
            {
                this.thuginfo.vertices[v].weights = [
                    [ r.UInt16(), 0.0 ],
                    [ r.UInt16(), 0.0 ],
                    [ r.UInt16(), 0.0 ],
                    [ r.UInt16(), 0.0 ],
                ];
            }
        }
        
        if (this.sector.flags & SceneConverter.constants.SECFLAGS_HAS_TEXCOORDS)
        {
            var coordsToRead = r.UInt32();
            console.log("    Reading " + coordsToRead + " UV set @[" + r.Tell() + "]");
            
            for (var v=0; v<this.thuginfo.count; v++)
            {
                for (var u=0; u<coordsToRead; u++)
                {
                    this.thuginfo.vertices[v].uvs.push([r.Float(), r.Float()]);
                }
            }
        }
        
        if (this.sector.flags & SceneConverter.constants.SECFLAGS_HAS_VERTEX_COLORS)
        {
            for (var v=0; v<this.thuginfo.count; v++)
            {
                this.thuginfo.vertices[v].color.b = r.UInt8();
                this.thuginfo.vertices[v].color.g = r.UInt8();
                this.thuginfo.vertices[v].color.r = r.UInt8();
                this.thuginfo.vertices[v].color.a = r.UInt8();
            }
        }
        
        if (this.sector.flags & SceneConverter.constants.SECFLAGS_HAS_VERTEX_COLOR_WIBBLES)
        {
            for (var v=0; v<this.thuginfo.count; v++)
                this.thuginfo.vertices[v].vc_wibble_value = r.UInt8();
        }
        
        console.log("    Vertex info finished at " + r.Tell());
        
        // ---------------------------------

        var sMeshClass = SceneConverter.CreateClass("sMesh", SceneConverter.inFormat);
        
        for (var s=0; s<this.sMesh_count; s++)
        {
            var mesh = new sMeshClass(this);
            
            mesh.Deserialize(r);
            
            this.meshes.push(mesh);
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
        console.log("THUG geom serializing not allowed.");
    }
}

module.exports = THUG_CGeom;
