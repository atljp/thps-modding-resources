// ----------------------------------------------
//
//  COLLISION
//      A .col file.
//
// ----------------------------------------------

const Reader = require('./Reader.js');
const fs = require('fs');

class Collision
{
    constructor(converter)
    {
        this.converter = converter;
        this.From(null);
    }
    
    // -----------------------------
    // Clone another .col file.
    // -----------------------------
    
    From(col, fmt = "")
    {
        this.format = fmt;
        
        this.nodes = (col && col.nodes) || [];
        this.objects = (col && col.objects) || [];
        this.optimizations = (col && col.optimizations) || [];
        
        this.total_bounds_min = (col && col.total_bounds_min) || [0.0, 0.0, 0.0, 1.0];
        this.total_bounds_max = (col && col.total_bounds_max) || [0.0, 0.0, 0.0, 1.0];
        this.total_verts = (col && col.total_verts) || 0;
        
        this.supersector_rows = (col && col.supersector_rows) || 0;
        this.supersector_columns = (col && col.supersector_columns) || 0;
        
        this.total_large_faces = (col && col.total_large_faces) || 0;
        this.total_small_faces = (col && col.total_small_faces) || 0;
        
        this.total_large_verts = (col && col.total_large_verts) || 0;
        this.total_small_verts = (col && col.total_small_verts) || 0;
        
        this.off_objects = (col && col.off_objects) || 0;
        this.off_faces = (col && col.off_faces) || 0;
        this.off_vertices = (col && col.off_vertices) || 0;
        this.off_intensities = (col && col.off_intensities) || 0;
        this.off_optimizations = (col && col.off_optimizations) || 0;
        this.off_bsp_tree = (col && col.off_bsp_tree) || 0;
        this.off_bsp_faces = (col && col.off_bsp_faces) || 0;
    }
    
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    //
    //  D E S E R I A L I Z E
    //      DESERIALIZES FROM A FILE.
    //
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    
    Deserialize(inPath, inFormat)
    {
        this.format = inFormat;
        
        this.reader = new Reader( fs.readFileSync(inPath) );
        this.ReadCore(this.reader);
    }
    
    // -----------------------------
    // Reads the file.
    // -----------------------------
    
    ReadCore(r)
    {
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
        this.WriteCore(w);
    }
}

module.exports = Collision;
