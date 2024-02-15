// -------------------------------------------
// SKELCONVERT
//  Converts THUG2 skeleton to THAW. We
//  will NOT do the other way around.
// -------------------------------------------

// https://github.com/adragonite/math3d

var Quaternion = require('./math3d/Quaternion');
var Vector3 = require('./math3d/Vector3');
var Vector4 = require('./math3d/Vector4');
var Matrix4x4 = require('./math3d/Matrix4x4');
var Transform = require('./math3d/Transform');

const Vector = Vector4;
const Matrix = Matrix4x4;

const Reader = require('./Reader.js');
const Writer = require('./Writer.js');

const fs = require('fs');
const path = require('path');

// -------------------------------------------

class Skeleton
{
    constructor()
    {
        this.bones = [];
    }
    
    // -----------------------
    // Find a bone by name
    // -----------------------
    
    BoneIndex(boneName)
    {
        for (var b=0; b<this.bones.length; b++)
        {
            if (this.bones[b].name == boneName)
                return b;
        }
        
        return -1;
    }
    
    // -----------------------
    // Generate a final matrix for a bone.
    // -----------------------
    
    GenerateBoneMatrix(bone)
    {
        var quatMatrix = Matrix.RotationMatrix(bone.quat);
        
        var vec3 = new Vector3(bone.vector.x, bone.vector.y, bone.vector.z);
        var invVector = vec3.mulScalar(-1);
        var transMatrix = Matrix.TranslationMatrix(invVector);
        
        return quatMatrix.mul(transMatrix);
    }
    
    // -----------------------
    // Read skeleton data.
    // -----------------------
    
    Read(r)
    {
        console.log("Reading skeleton...");
        
        var version = r.UInt16();
        console.log("Version: " + version);
        
        if (version != 2)
        {
            console.log("This is NOT a THUG2 skeleton.");
            process.exit(1);
        }
        
        r.UInt16();
        r.UInt32();
        
        var bone_count = r.UInt32();
        console.log("Bone Count: " + bone_count);
        
        // Bone names
        for (var b=0; b<bone_count; b++)
        {
            this.bones.push({parent: -1, name: "0x00000000", flipname: "0x00000000", quat: null, vector: null});
            this.bones[this.bones.length-1].name = "0x" + r.UInt32().toString(16).padStart(8, "0");
        }
        
        // Bone parents
        for (var b=0; b<bone_count; b++)
        {
            var parentName = "0x" + r.UInt32().toString(16).padStart(8, "0");
            this.bones[b].parent = this.BoneIndex(parentName);
        }
        
        // Bone flips
        for (var b=0; b<bone_count; b++)
            this.bones[b].flipname = "0x" + r.UInt32().toString(16).padStart(8, "0");
            
        // Bone quaternions / vectors
        for (var b=0; b<bone_count; b++)
        {
            var quatX = r.Float();
            var quatY = r.Float();
            var quatZ = r.Float();
            var quatW = r.Float();
            
            var vecX = r.Float();
            var vecY = r.Float();
            var vecZ = r.Float();
            var vecW = r.Float();
            
            this.bones[b].quat = new Quaternion(quatX, quatY, quatZ, quatW);
            this.bones[b].vector = new Vector(vecX, vecY, vecZ, vecW);
        }
        
        console.log("  Reading ended at " + r.Tell() + ".");
    }
    
    // -----------------------
    // Write skeleton data.
    // -----------------------
    
    Write(w)
    {
        console.log("Writing skeleton...");
        
        w.UInt16(1);                // Version
        w.UInt16(48);               // Header length, constant
        
        w.UInt32(this.bones.length);
        w.UInt32(0);
        w.UInt32(0);
        
        // -- POINTERS! ------------------------
        w.Int32(-1);                // Names
        w.Int32(-1);                // Parent list
        w.Int32(-1);                // Flip list
        w.Int32(-1);                // Flip index list
        w.Int32(-1);                // Bone types
        w.Int32(-1);                // End section
        w.Int32(-1);                // Matrices
        w.Int32(w.Tell() + 4);      // Vectors
        
        // -- VECTORS --------------------------
        for (const bone of this.bones)
        {
            w.Float(bone.vector.x);
            w.Float(bone.vector.y);
            w.Float(bone.vector.z);
            w.Float(bone.vector.w);
        }
        
        // -- MATRICES -------------------------
        var matrixPos = w.Tell();
        w.Seek(40);
        w.UInt32(matrixPos);
        w.Seek(matrixPos);
        
        for (const bone of this.bones)
        {
            var finalMatrix = this.GenerateBoneMatrix(bone);
            var parent = bone.parent;
            
            while (parent >= 0)
            {
                var parentMatrix = this.GenerateBoneMatrix(this.bones[parent]);
                finalMatrix = finalMatrix.mul(parentMatrix);
                
                parent = this.bones[parent].parent;
            }
            
            for (const col of finalMatrix.columns)
            {
                w.Float(col[0]);
                w.Float(col[1]);
                w.Float(col[2]);
                w.Float(col[3]);
            }
        }
        
        // -- NAMES -----------------------------
        var namePos = w.Tell();
        w.Seek(16);
        w.UInt32(namePos);
        w.Seek(namePos);
        
        for (const bone of this.bones)
            w.UInt32(parseInt(bone.name, 16));
            
        // -- PARENTS ---------------------------
        var parentPos = w.Tell();
        w.Seek(20);
        w.UInt32(parentPos);
        w.Seek(parentPos);
        
        for (const bone of this.bones)
        {
            if (bone.parent == -1)
                w.UInt32(0);
            else
                w.UInt32(parseInt(this.bones[bone.parent].name, 16));
        }
        
        // -- FLIPS -----------------------------
        var flipPos = w.Tell();
        w.Seek(24);
        w.UInt32(flipPos);
        w.Seek(flipPos);
        
        for (const bone of this.bones)
            w.UInt32(parseInt(bone.flipname, 16));
            
        // -- FLIP INDEXES --------------------
        var flipIndexPos = w.Tell();
        w.Seek(28);
        w.UInt32(flipIndexPos);
        w.Seek(flipIndexPos);
        
        for (const bone of this.bones)
            w.Int32(this.BoneIndex(bone.flipname));
            
        // -- BONE PRIORITIES -----------------
        var priorityPos = w.Tell();
        w.Seek(32);
        w.UInt32(priorityPos);
        w.Seek(priorityPos);
        
        w.Pad(4 * this.bones.length);
        
        // -- END SECTION ---------------------
        var endPos = w.Tell();
        w.Seek(36);
        w.UInt32(endPos);
        w.Seek(endPos);
        
        for (var b=0; b<32; b++)
            w.UInt32(0x7F7FC99E);
    }
};

function HandleArgs()
{
    var args = process.argv;
    args.shift();
    args.shift();
    
    if (args.length < 1)
    {
        console.log("Specify a skeleton file.");
        return;
    }
    
    var inFile = args.shift();
    if (!path.isAbsolute(inFile))
        inFile = path.join(__dirname, inFile);
        
    if (!fs.existsSync(inFile))
    {
        console.log(path.basename(inFile) + " does not exist.");
        return;
    }
    
    var r = new Reader( fs.readFileSync(inFile) );
    r.LE = true;
    
    var skel = new Skeleton();
    skel.Read(r);
    
    var w = new Writer();
    w.LE = true;
    skel.Write(w);
    
    // Write the file
    var spl = inFile.split(".");
    if (spl[spl.length-1].toLowerCase() == "xbx")
        spl[spl.length-1] = "wpc";
    else
        spl[spl.length-1] = "out";
        
    var outFile = spl.join(".");
    fs.writeFileSync(outFile, w.buffer);
    
    console.log("  Written.");
}

HandleArgs();
