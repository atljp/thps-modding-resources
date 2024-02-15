// ----------------------------------------------
//
//  VERTEX
//      A vertex.
//
// ----------------------------------------------

class Vertex
{
    constructor(mesh)
    {
        this.mesh = mesh;
        
        this.From(null);
    }
    
    // -----------------------------
    // Clone from another vertex.
    // -----------------------------
    
    From(vert)
    {
        this.pos = (vert && vert.pos) || [0.0, 0.0, 0.0];
        this.no = (vert && vert.no) || [0.0, 0.0, 0.0];
        this.pivot = (vert && vert.pivot) || [0.0, 0.0, 0.0];
        
        this.post_color_int = (vert && vert.post_color_int) || 0;
        
        this.lightmap = (vert && vert.lightmap) || null;
        this.altlightmap = (vert && vert.altlightmap) || null;
        
        this.uvs = (vert && vert.uvs) || [];
        this.weights = (vert && vert.weights) || [
            [0, 0.0],
            [0, 0.0],
            [0, 0.0],
        ];
        
        this.raw_weight_u = (vert && vert.raw_weight_u) || 0;
        this.raw_weight_v = (vert && vert.raw_weight_v) || 0;
        
        this.packed_normals = (vert && vert.packed_normals) || 0;
        this.packed_weights = (vert && vert.packed_weights) || 0;
        
        this.tangent = (vert && vert.tangent) || [0.0, 0.0, 0.0];
        this.bitangent = (vert && vert.bitangent) || [0.0, 0.0, 0.0];
        
        this.color = (vert && vert.color) || {r: 0, g: 0, b: 0, a: 0}
        
        this.vc_wibble_value = (vert && vert.vc_wibble_value) || 0;
        
        // Used interally.
        this.group_index = (vert && vert.group_index) || 0;
    }
    
    // -----------------------------
    // Debug values to console.
    // -----------------------------
    
    Debug()
    {
        console.log("  Pos: (" + this.pos.join(", ") + ")");
        console.log("  Nrm: (" + this.no.join(", ") + ")");
        console.log("  Tan: (" + this.tangent.join(", ") + ")");
        console.log("  BiTan: (" + this.bitangent.join(", ") + ")");
        console.log("  Col: (R: " + this.color.r + ", G: " + this.color.g + ", B: " + this.color.b + ", A: " + this.color.a + ")");
        console.log("  Weights:");
        
        for (const wgt of this.weights)
        {
            console.log("    [" + wgt[0] + ": " + wgt[1] + "]");
        }
        
        if (this.uvs.length > 0)
        {
            console.log("  UV's:");
            
            for (const uv of this.uvs)
            {
                console.log("    (" + uv.join(", ") + ")");
            }
        }
        
        console.log("");
    }
    
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    //
    //  S E R I A L I Z E
    //      SERIALIZES TO A FILE.
    //
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    
    // -----------------------------
    // Serialize our UV's.
    // -----------------------------
    
    SerializeUVs(w)
    {
        // Unweighted data here.
        if (!this.mesh.HasWeights())
        {
            // Position
            w.Float(this.pos[0]);
            w.Float(this.pos[1]);
            w.Float(this.pos[2]);
            
            // Pivot
            if (this.mesh.HasBillboardPivot())
            {
                w.Float(this.pivot[0]);
                w.Float(this.pivot[1]);
                w.Float(this.pivot[2]);
            }
            
            w.Float(this.no[0]);
            w.Float(this.no[1]);
            w.Float(this.no[2]);
            
            var tc = this.mesh.GetTangentCount();
            
            if (tc >= 1)
            {
                w.Float(this.tangent[0]);
                w.Float(this.tangent[1]);
                w.Float(this.tangent[2]);
            }
            
            if (tc >= 2)
            {
                w.Float(this.bitangent[0]);
                w.Float(this.bitangent[1]);
                w.Float(this.bitangent[2]);
            }
        }
        
        // Vertex color
        if (this.mesh.HasVertexColor())
        {
            w.UInt8(this.color.a);
            w.UInt8(this.color.r);
            w.UInt8(this.color.g);
            w.UInt8(this.color.b);
        }

        for (const uv of this.uvs)
        {
            w.Float(uv[0]);
            w.Float(uv[1]);
        }
        
        if (this.lightmap && this.mesh.HasPrimaryLightmap())
        {
            w.Float(this.lightmap[0]);
            w.Float(this.lightmap[1]);
        }
        
        if (this.altlightmap && this.mesh.HasSecondaryLightmap())
        {
            w.Float(this.altlightmap[0]);
            w.Float(this.altlightmap[1]);
        }
    }
    
    // -----------------------------
    // Serialize our weighted data.
    // -----------------------------
    
    Serialize(w)
    {
        // A
        w.Float(this.pos[0]);
        w.Float(this.no[0]);
        w.Float(this.bitangent[0]);
        w.Float(this.tangent[0]);
        
        // B
        w.Float(this.pos[1]);
        w.Float(this.no[1]);
        w.Float(this.bitangent[1]);
        w.Float(this.tangent[1]);
        
        // C
        w.Float(this.pos[2]);
        w.Float(this.no[2]);
        w.Float(this.bitangent[2]);
        w.Float(this.tangent[2]);
        
        // Write our weight values.
        
        w.Float(this.raw_weight_u);
        w.Float(this.raw_weight_v);
    }
}

module.exports = Vertex;
