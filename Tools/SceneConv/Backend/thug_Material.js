// ----------------------------------------------
//
//  THUG Material
//      Tony Hawk's Underground material.
//
// ----------------------------------------------

const THUG2_Material = require('./thug2_Material.js');

class THUG_Material extends THUG2_Material
{    
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
        console.log("THUG material serializing not supported yet.");
    }
}

module.exports = THUG_Material;
