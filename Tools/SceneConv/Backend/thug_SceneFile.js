// ----------------------------------------------
//
//  THUG SCENE FILE
//      Tony Hawk's Underground scene file.
//
// ----------------------------------------------

const THUG2_SceneFile = require('./thug2_SceneFile.js');

class THUG_SceneFile extends THUG2_SceneFile
{
    // -----------------------------
    // Write the whole file.
    // -----------------------------
    
    WriteCore()
    {
        console.log("THUG writing not supported.");
    }
}

module.exports = THUG_SceneFile;
