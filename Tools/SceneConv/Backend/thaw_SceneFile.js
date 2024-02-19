// ----------------------------------------------
//
//  THAW SCENE FILE
//      Tony Hawk's American Wasteland scene file.
//
// ----------------------------------------------

const SceneFile = require('./SceneFile.js');

const MATFLAG_VC_WIBBLE =                           (1 << 1);

class THAW_SceneFile extends SceneFile
{
    // -----------------------------
    // Reads the actual file.
    // -----------------------------
    
    ReadFileCore()
    {
        var r = this.reader;
        r.LE = true;
        
        this.off_disquals = r.UInt32();
        console.log("Disqual Offset: " + this.off_disquals);
        
        // FAAABACA x 7
        r.Chunk(28);
        
        this.ReadCore();
        
        if (this.off_disquals)
            this.off_disquals += this.off_core;
        
        // Read disqual block if we can
        
        //~ if (this.off_disquals > 0)
            //~ this.ReadDisquals();
    }
    
    // -----------------------------
    // Write the file data.
    // -----------------------------
    
    WriteCore()
    {
        var w = this.writer;
        w.LE = true;
        
        console.log("Writing core...");
        
        // For now, we're not handling disqualifiers.
        w.UInt32();
        
        for (var l=0; l<7; l++)
            w.UInt32(0xCABAAAFA);
            
        if (!this.scene)
        {
            console.log("Had no scene.");
            return;
        }
        
        this.off_core = w.Tell();
        this.off_materials = w.Tell();
        
        console.log("Writing materials...");
        var matTime = SceneConverter.TimeStart();
        
        this.material_version = 2;
        this.WriteMaterialList();
        
        w.UInt32(0xBABEFACE);
        
        // Use known number of padding for now.
        var paddingCount = 8;
        w.UInt32(paddingCount);
        w.UInt32(234);
        w.Pad(paddingCount-4);
        
        console.log("  Took " + SceneConverter.TimeEnd(matTime) + " seconds.");
        
        // The scene starts here.
        
        if (this.scene)
        {
            console.log("Writing scene...");
            
            this.off_scene = w.Tell();
            
            var newSceneClass = SceneConverter.CreateClass("CScene", SceneConverter.outFormat);
            var newScene = new newSceneClass(this);
            newScene.From(this.scene, SceneConverter.outFormat);
            
            newScene.Serialize(w);
        }
    }
    
    // -----------------------------
    // Write VC wibble data if necessary.
    // -----------------------------
    
    WriteMaterialVCWibbleData()
    {
        var w = this.writer;
        w.PadToNearest(4, 0);
         
        // ----------------------
        // Loop through all materials and write VC wibbles.
        // ----------------------
        
        var wibblers = [];
        
        for (const mat of this.materials)
        {
            if (mat.vc_wibbles && (mat.passes[0].flags & MATFLAG_VC_WIBBLE))
                wibblers.push(mat);
        }
        
        var wibble_pos;
        
        // Write objects first.
        for (const wibbler of wibblers)
        {
            wibble_pos = w.Tell();
            w.Seek(wibbler.vc_wibbles.pt_wibbleoffset);
            w.UInt32(wibble_pos - 32);      // Material block starts at 32.
            w.Seek(wibble_pos);
            
            // We're going to write our vertex frames after this.
            // A little unorthodox, but I can't be bothered.
            
            for (const obj of wibbler.vc_wibbles.objects)
            {
                w.UInt32(obj.frames.length);
                w.UInt32(obj.time_offset);
                
                obj.pt_frames = w.Tell();
                w.Int32(-1);   // Fix momentarily.
            }
        }
        
        // Write unknowns next.
        for (const wibbler of wibblers)
        {
            wibble_pos = w.Tell();
            w.Seek(wibbler.vc_wibbles.pt_wibbleoffset + 4);
            w.UInt32(wibble_pos - 32);      // Material block starts at 32.
            w.Seek(wibble_pos);
            
            w.Pad(4 * wibbler.vc_wibbles.objects.length);
        }
            
        // Write frames next.
        for (const wibbler of wibblers)
        {
            for (const obj of wibbler.vc_wibbles.objects)
            {
                wibble_pos = w.Tell();
                w.Seek(obj.pt_frames);
                w.UInt32(wibble_pos - 32);      // Material block starts at 32.
                w.Seek(wibble_pos);
                
                for (const frame of obj.frames)
                {
                    w.UInt32(frame.time);
                    w.UInt8(frame.b);
                    w.UInt8(frame.g);
                    w.UInt8(frame.r);
                    w.UInt8(frame.a);
                }
            }
        }
    }
}

module.exports = THAW_SceneFile;
