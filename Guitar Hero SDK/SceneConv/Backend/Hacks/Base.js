// --------------------------------------------------
//
// H A C K :   B A S E   C L A S S
//      This is an internal class, do not touch!
//
//  Hacks are used for modifying certain scenes.
//  This is useful for modifying materials, UV's, etc.
//
// --------------------------------------------------

class Hack
{
    constructor()
    {
        console.log("Registered hack " + this.GetName() + "...");
        this.Initialize();
    }
    
    // -----------------------------
    // Init parameters.
    // -----------------------------
    
    Initialize() {}
    
    // -----------------------------
    // Get hack's name.
    // -----------------------------
    
    GetName() { return this.constructor.name; }
    
    // -----------------------------
    // Called before deserialize.
    // -----------------------------
    
    PreDeserialize() {}
    
    // -----------------------------
    // Called after deserialize.
    // -----------------------------
    
    PostDeserialize() {}
}

module.exports = Hack;
