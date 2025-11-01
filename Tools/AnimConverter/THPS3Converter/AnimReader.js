// --------------------------------------------------
// THPS3 ANIM READER
//      Reads THPS3 anims
// --------------------------------------------------

const fs = require('fs');
const path = require('path');
const Reader = require('./Reader.js');
const Writer = require('./Writer.js');

// --------------------------------------------------

const ANIMCONVERT_PATH = require(path.join(__dirname, '..', 'AnimConvert.js'));
const WRITE_ANIM_TXT = false;

var USE_PED_MAP = false;

// --------------------------------------------------

class QuatFrame
{
    constructor(localOffset)
    {
        this.localOffset = localOffset;
        this.time = 0.0;
        this.x = 0.0;
        this.y = 0.0;
        this.z = 0.0;
        this.w = 0.0;
        this.frameOffset = 0;
    }
    
    Read(r)
    {
        this.x = r.Float();
        this.y = r.Float();
        this.z = r.Float();
        this.w = r.Float();
        this.time = r.Float();
        this.frameOffset = r.Int32();
    }
}

// --------------------------------------------------

class TransFrame
{
    constructor(localOffset)
    {
        this.localOffset = localOffset;
        this.time = 0.0;
        this.x = 0.0;
        this.y = 0.0;
        this.z = 0.0;
        this.frameOffset = 0;
    }
    
    Read(r)
    {
        this.x = r.Float();
        this.y = r.Float();
        this.z = r.Float();
        this.time = r.Float();
        this.frameOffset = r.Int32();
    }
}

// --------------------------------------------------

class THPS3Animation
{
    constructor()
    {
        this.qFrames = [];
        this.tFrames = [];
        
        this.highestQuatOffset = 0;
        this.highestTransOffset = 0;
        
        this.qBlockStart = 0;
        this.tBlockStart = 0;
    }
    
    OrganizeFrames(frames)
    {
        var result = [];
        
        while (frames.length)
        {
            var thisFrameArray = [];
            
            // Get first frame on the stack.
            var thisFrame = frames.shift();
            
            while (thisFrame)
            {
                thisFrameArray.push(thisFrame);
                
                // Has a previous frame.
                // Attempt to find the frame that matches this offset.
                var foundMatch = false;
                
                for (var q=0; q<frames.length; q++)
                {
                    if (frames[q].frameOffset == thisFrame.localOffset)
                    {
                        thisFrame = frames[q];
                        frames.splice(q, 1);
                        foundMatch = true;
                        break;
                    }
                }
                
                if (!foundMatch)
                    thisFrame = null;                
            }
            
            result.push(thisFrameArray);
        }
        
        return result;
    }
    
    Read(filepath, outpath)
    {
        var r = new Reader(fs.readFileSync(filepath));
        r.LE = true;
        
        console.log("Version: " + r.UInt32());
        console.log("Unk: " + r.UInt32());
        
        var duration = r.Float();
        console.log("Duration: " + duration);
        
        var numQKeys = r.UInt32();
        console.log("Num Q Keys: " + numQKeys);
        var numTKeys = r.UInt32();
        console.log("Num T Keys: " + numTKeys);
        
        // -----------------------
        // READ QUATERNIONS
        // -----------------------
        
        this.qBlockStart = r.Tell();
        console.log("Reading quats at " + this.qBlockStart + "...");
        
        for (var q=0; q<numQKeys; q++)
        {
            var quat = new QuatFrame(r.Tell() - this.qBlockStart);
            quat.Read(r);
            
            this.qFrames.push(quat);
        }
        
        // -----------------------
        // READ TRANSLATIONS
        // -----------------------
        
        this.tBlockStart = r.Tell();
        console.log("Reading trans at " + this.tBlockStart + "...");
        
        for (var t=0; t<numTKeys; t++)
        {
            var tran = new TransFrame(r.Tell() - this.tBlockStart);
            tran.Read(r);
            
            this.tFrames.push(tran);
        }
        
        // -----------------------
        // ORGANIZE FRAMES
        // -----------------------
        
        var quatArrays = this.OrganizeFrames(this.qFrames);
        var transArrays = this.OrganizeFrames(this.tFrames);

        // -----------------------
        
        console.log("Animation ended at " + r.Tell() + "...");
        
        if (quatArrays.length != transArrays.length)
        {
            console.log("!! Bone counts do not match !!");
            return;
        }
        
        if (WRITE_ANIM_TXT)
        {
            var lines = [];
            
            for (var q=0; q<quatArrays.length; q++)
            {
                lines.push("QUATERNION " + q + ":");
                
                for (const frame of quatArrays[q])
                {
                    var xs = frame.x.toPrecision(2).toString().padEnd(10, " ");
                    var ys = frame.y.toPrecision(2).toString().padEnd(10, " ");
                    var zs = frame.z.toPrecision(2).toString().padEnd(10, " ");
                    var ws = frame.w.toPrecision(2).toString().padEnd(10, " ");
                    
                    lines.push(frame.time.toPrecision(4).toString().padStart(8, " ") + ":   " + xs + ys + zs + ws);
                }
                
                lines.push("TRANSLATION " + q + ":");
                
                for (const frame of transArrays[q])
                {
                    var xs = frame.x.toPrecision(2).toString().padEnd(10, " ");
                    var ys = frame.y.toPrecision(2).toString().padEnd(10, " ");
                    var zs = frame.z.toPrecision(2).toString().padEnd(10, " ");
                    
                    lines.push(frame.time.toPrecision(4).toString().padStart(8, " ") + ":   " + xs + ys + zs);
                }
                
                lines.push("");
                lines.push("");
            }

            fs.writeFileSync("./anim.txt", lines.join("\n"));
        }
        
        // -----------------------
        // WRITE THAW ANIMATION FILE
        // -----------------------
        
        console.log("");
        console.log("READING THPS3 MAP:");
        
        //~ var map = AnimConvert.ReadMapFile(path.join(__dirname, "thps3_to_thaw.js"));
        var map = AnimConvert.ReadMapFile(path.join(__dirname, "thps3ped_to_thaw.js"));
        var anim = AnimConvert.AllocAnimation();
        
        anim.flags = 0x06820000;
        anim.version = 40;
        anim.numBones = 52;
        
        var mapFile = require('./thps3ped_to_thaw.js');
        var bm = mapFile.bone_mapping;
        var tex = mapFile.translation_exclude;
        var db = mapFile.dummy_bones || {};
        var qm = mapFile.quaternion_mods || {};
        var tm = mapFile.translation_mods || {};
        
        for (var b=0; b<anim.numBones; b++)
        {
            var bone = {quats: [], translations: [], quat_size: 0, trans_size: 0};
            
            if (db[b])
            {
                if (db[b].quat)
                {
                    bone.ignoreQuat = true;
                    
                    var qu = anim.AllocQuaternion();
                    qu.time = 0;
                    qu.x = Math.floor(db[b].quat[0] * 16384.0);
                    qu.y = Math.floor(db[b].quat[1] * 16384.0);
                    qu.z = Math.floor(db[b].quat[2] * 16384.0);
                    qu.w = Math.floor(db[b].quat[3] * 16384.0);
                    qu.signed = (qu.w < 0.0);
                    
                    anim.numQKeys ++;

                    bone.quats.push(qu);
                }
                
                if (db[b].trans)
                {
                    bone.ignoreTrans = true;
                    
                    var tr = anim.AllocTranslation();
                    
                    tr.time = 0;
                    tr.x = Math.floor(db[b].trans[0] * 32.0);
                    tr.y = Math.floor(db[b].trans[1] * 32.0);
                    tr.z = Math.floor(db[b].trans[2] * 32.0);
                    
                    anim.numTKeys ++;
                    
                    bone.translations.push(tr);
                }
            }
            
            anim.bones.push(bone);
        }
            
        for (var q=0; q<quatArrays.length; q++)
        {
            var dst = bm[q];
            var mod = [0.0, 0.0, 0.0, 0.0];
            
            /*
            if (dst != undefined)
            {
                var qMod = qm[dst];
                
                if (qMod)
                    mod = qMod;
            }
            */
            
            for (const frame of quatArrays[q])
            {
                var quat = anim.AllocQuaternion();
                anim.numQKeys ++;
                
                // Assume THAW rotation of root bone - IF YOU
                // RUN INTO ISSUES WHERE ROOT BONE NEEDS ROTATED, LOOK AT THIS!
                // (Perhaps we should use math3d to rotate the quat)
                
                if (q == 0)
                {
                    quat.x = Math.floor(0.707092 * 16384.0);
                    quat.y = Math.floor(0 * 16384.0);
                    quat.z = Math.floor(0 * 16384.0);
                }
                else
                {
                    quat.x = Math.floor(frame.x * 16384.0);
                    quat.y = Math.floor(frame.y * 16384.0);
                    quat.z = Math.floor(frame.z * 16384.0);
                    quat.w = frame.w;
                    
                    quat.x *= -1;
                    quat.y *= -1;
                    quat.z *= -1;
                    quat.w *= -1;
                    
                    quat.signed = (quat.w < 0.0);
                }
                
                quat.time = Math.floor(frame.time * 60.0);
                
                if (dst != undefined && !anim.bones[dst].ignoreQuat)
                {
                    anim.bones[dst].quats.push(quat);
                    anim.duration = Math.max(anim.duration, frame.time);
                }
            }
        }
        
        for (var t=0; t<transArrays.length; t++)
        {
            var dst = bm[t];
            var mod = [0.0, 0.0, 0.0];
            
            if (dst != undefined)
            {
                var tMod = tm[dst];
                
                if (tMod)
                    mod = tMod;
            }
            
            for (const frame of transArrays[t])
            {
                var trans = anim.AllocTranslation();
                
                if (t == 0)
                {
                    trans.x = Math.floor((frame.x + mod[0]) * 32.0);
                    trans.y = Math.floor(((frame.y + mod[1]) + 40.78125) * 32.0);
                    trans.z = Math.floor((frame.z + mod[2]) * 32.0);
                }
                else
                {
                    trans.x = Math.floor((frame.x + mod[0]) * 32.0);
                    trans.y = Math.floor((frame.y + mod[1]) * 32.0);
                    trans.z = Math.floor((frame.z + mod[2]) * 32.0);
                }
            
                trans.time = Math.floor(frame.time * 60.0);
                
                anim.numTKeys ++;

                if (dst != undefined && !tex.includes(dst) && !anim.bones[dst].ignoreTrans)
                {
                    anim.bones[dst].translations.push(trans);
                    anim.duration = Math.max(anim.duration, frame.time);
                }
            }
        }
        
        // Duplicate dummy bones.
        
        var maxTime = Math.floor(anim.duration * 60.0);
        
        for (var b=0; b<anim.bones.length; b++)
        {
            if (anim.bones[b].ignoreQuat)
            {
                var eq = anim.AllocQuaternion();
                
                eq.x = anim.bones[b].quats[0].x;
                eq.y = anim.bones[b].quats[0].y;
                eq.z = anim.bones[b].quats[0].z;
                eq.w = anim.bones[b].quats[0].w;
                eq.signed = anim.bones[b].quats[0].signed;
                eq.time = maxTime;
                
                anim.bones[b].quats.push(eq);
                    
                anim.numQKeys ++;
            }
            
            if (anim.bones[b].ignoreTrans)
            {
                var tr = anim.AllocTranslation();
                
                tr.x = anim.bones[b].translations[0].x;
                tr.y = anim.bones[b].translations[0].y;
                tr.z = anim.bones[b].translations[0].z;
                tr.time = maxTime;
                
                anim.bones[b].translations.push(tr);
                    
                anim.numTKeys ++;
            }
        }
        
        var options = {};
        var shorthand = path.basename(filepath).split(".")[0];
        
        var outdir = path.dirname(outpath);
        
        // Seems to be a required flag for making fingers work. Why?
        // This animation could be something about retaining data throughout
        // the whole anim if other frames don't exist. Not too sure.
        
        anim.flags |= (1 << 14);
        
        AnimConvert.WriteAnimation(anim, path.join(outdir, shorthand + ".ska.wpc"), options);
    }
}

for (const arg of process.argv)
{
    if (arg.toLowerCase() == "-ped")
    {
        USE_PED_MAP = true;
        console.log("");
        console.log("** Using ped mapping... **");
        console.log("");
        break;
    }
}

var files = fs.readdirSync("in");

for (const file of files)
{
    const fPath = path.join(__dirname, "in", file);
    const oPath = path.join(__dirname, "out", file);
    
    console.log("-- CONVERTING " + file + "... --");
    var anim = new THPS3Animation();
    
    anim.Read(fPath, oPath);
}
