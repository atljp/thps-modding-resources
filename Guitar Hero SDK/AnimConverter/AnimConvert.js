// ------------------------------------------
//
// A N I M C O N V E R T
//      .ska converter for THUG / THUG2 / THAW
//
// ------------------------------------------

const fs = require('fs');
const path = require('path');

var currentSkaFlags = 0;

var qTables = {};
var tTables = {};

function GetQEntry(index)
{
    if (!qTables[AnimConvert.options.inFormat])
    {
        console.log("No Q tables for " + AnimConvert.options.inFormat + " exist.");
        process.exit(1);
    }
    
    return qTables[AnimConvert.options.inFormat][index];
}

function GetTEntry(index)
{
    if (!tTables[AnimConvert.options.inFormat])
    {
        console.log("No T tables for " + AnimConvert.options.inFormat + " exist.");
        process.exit(1);
    }
    
    return tTables[AnimConvert.options.inFormat][index];
}

// Forces nxBONEDANIMFLAGS_KEEPMISSINGBONEPOS
const FORCE_MISSINGBONEPOS = true;

// -----------------------------------------------------
// Global .ska file flags.

const nxBONEDANIMFLAGS_INTERMEDIATE =   	        (1 << 30);
const nxBONEDANIMFLAGS_UNCOMPRESSED =   	        (1 << 29);
const nxBONEDANIMFLAGS_PLATFORM =      		        (1 << 28);	
const nxBONEDANIMFLAGS_CAMERADATA =    		        (1 << 27);	
const nxBONEDANIMFLAGS_COMPRESSEDTIME = 	        (1 << 26);
const nxBONEDANIMFLAGS_PREROTATEDROOT = 	        (1 << 25);
const nxBONEDANIMFLAGS_OBJECTANIMDATA =		        (1 << 24);
const nxBONEDANIMFLAGS_USECOMPRESSTABLE =	        (1 << 23);        // Uses x48, y48, z48 from compression table for single-byte values
const nxBONEDANIMFLAGS_HIRESFRAMEPOINTERS =	        (1 << 22);
const nxBONEDANIMFLAGS_CUSTOMKEYSAT60FPS =	        (1 << 21);
const nxBONEDANIMFLAGS_CUTSCENEDATA =		        (1 << 20);
const nxBONEDANIMFLAGS_PARTIALANIM =		        (1 << 19);
const nxBONEDANIMFLAGS_UNK_14 =                     (1 << 14);
const nxBONEDANIMFLAGS_USECOMPRESSTABLE_N8 =        (1 << 16);       // Uses n8 from compression table for single-byte values
const nxBONEDANIMFLAGS_UNK_15_QUATS =               (1 << 15);
const nxBONEDANIMFLAGS_KEEPMISSINGBONEPOS =         (1 << 17);       // Excluded bones will NOT assume (0, 0, 0) and will basically be ignored.
const nxBONEDANIMFLAGS_ONLYSINGLEBYTEQUATS =        (1 << 15);
const nxBONEDANIMFLAGS_CUSTOMLOOKUPBUFFER =         (1 << 13);       // Custom quat lookups
const nxBONEDANIMFLAGS_LONGFRAMETIMES =             (1 << 8);

// -----------------------------------------------------
// Quaternion frame flags.

const FLAG_SINGLEBYTEVALUE =                        0x4000;
const FLAG_SINGLEBYTEX =                            0x2000;
const FLAG_SINGLEBYTEY =                            0x1000;
const FLAG_SINGLEBYTEZ =                            0x0800;
const FLAG_SINGLEBYTEMASK =                         0x3800;   // XYZ values masked together
const FLAG_TRANS_USELOOKUP =                        0x80;

// -----------------------------------------------------
// THUG2 bones:

// 0: Control_Root

// -----------------------------------------------------
// THAW bones:

// 0: Control_Root
// 1: Bone_Pelvis
// 2: Bone_Stomach_Lower
// 3: Bone_Stomach_Upper
// 4: Bone_Chest
// 5: Bone_Collar_L
// 6: Bone_Bicep_L
// 7: Bone_Forearm_L
// 8: Bone_Palm_L
// 9: Bone_Fingers_Base_L
// 10: Bone_Fingers_Tip_L
// 11: Bone_Forefinger_Base_L
// 12: Bone_Forefinger_Tip_L
// 13: Bone_Thumb_L
// 14: Bone_Wrist_L
// 15: Bone_Bicep_Twist_Mid_L
// 16: Bone_Bicep_Twist_Top_L
// 17: Bone_Collar_R
// 18: Bone_Bicep_R
// 19: Bone_Forearm_R
// 20: Bone_Palm_R
// 21: Bone_Forefinger_base_R
// 22: Bone_Forefinger_Tip_R
// 23: Bone_Fingers_Base_R
// 24: Bone_Fingers_Tip_R
// 25: Bone_Thumb_R
// 26: Bone_Wrist_R
// 27: Bone_Bicep_Twist_Mid_R
// 28: Bone_Bicep_Twist_Top_R
// 29: Bone_Neck
// 30: Bone_Head
// 31: Bone_Head_Top_Scale
// 32: Bone_PonyTail_1
// 33: Bone_Nose_Scale
// 34: Bone_Chin_Scale
// 35: Cloth_Breast
// 36: Cloth_Shirt_L
// 37: Cloth_Shirt_C
// 38: Cloth_Shirt_R
// 39: Bone_Thigh_R
// 40: Bone_Knee_R
// 41: Bone_Ankle_R
// 42: Bone_Toe_R
// 43: Bone_Thigh_L
// 44: Bone_Knee_L
// 45: Bone_Ankle_L
// 46: Bone_Toe_L
// 47: Bone_Board_Root
// 48: Bone_Board_Nose
// 49: Bone_Trucks_Nose
// 50: Bone_Board_Tail
// 51: Bone_Trucks_Tail

// -----------------------------------------------------

class QuaternionFrame
{
    constructor()
    {
        this.time = 0;
        this.x = 0;
        this.y = 0;
        this.z = 0;
        this.signed = false;        // 0x8000 bit.
    }
    
    // -------------------------------
    // Read from data. This returns
    // the new offset we should be at.
    // -------------------------------
    
    Read(data, off)
    {
        // ------------------------------
        // Are verbatim single-byte values allowed? If we want
        // to use n8 lookups, any single-bytes that we have are
        // going to be lookup values.
        // ------------------------------
        
        var use_n8 = (currentSkaFlags & nxBONEDANIMFLAGS_USECOMPRESSTABLE_N8);
        
        // Contains flags, as well as time.
        var flagtime = data.readUInt16LE(off);
        this.time = (flagtime & 0x07FF);
        this.signed = (flagtime & 0x8000) ? true : false;
        
        off += 2;
        
        var xSize = 2;
        var ySize = 2;
        var zSize = 2;
        
        // ------------------------------
        // All quats will be 1 byte. HOWEVER, they will take up the TOP 8 bits
        // of the u16. This means that each byte of the quat needs to be
        // shifted to the left 8 bits.
        // ------------------------------
        
        var only_single_quats = (currentSkaFlags & nxBONEDANIMFLAGS_ONLYSINGLEBYTEQUATS);
        
        if (only_single_quats)
        {
            xSize = 1;
            ySize = 1;
            zSize = 1;
        }
        
        // One of our values was a single byte!
        if (flagtime & FLAG_SINGLEBYTEVALUE)
        {
            // One or more values were single.
            if (flagtime & FLAG_SINGLEBYTEMASK)
            {
                if (flagtime & FLAG_SINGLEBYTEX)
                    xSize = 1;
                if (flagtime & FLAG_SINGLEBYTEY)
                    ySize = 1;
                if (flagtime & FLAG_SINGLEBYTEZ)
                    zSize = 1;
            }
            // NO values were single, this is a lookup value.
            else
            {
                var ent = GetQEntry(data[off]);
                off ++;
                
                this.x = ent.x48;
                this.y = ent.y48;
                this.z = ent.z48;

                return off;
            }
        }
        
        if (xSize == 1)
        {
            if ((flagtime & FLAG_SINGLEBYTEX) && use_n8)
                this.x = GetQEntry(data[off]).n8;
            else if (only_single_quats)
            {
                this.x = data[off] << 8;
                this.x = (this.x << 16) >> 16;
            }
            else
                this.x = data[off];
                
            off ++;
        }
        else
        {
            this.x = data.readInt16LE(off);
            off += 2;
        }
        
        if (ySize == 1)
        {
            if ((flagtime & FLAG_SINGLEBYTEY) && use_n8)
                this.y = GetQEntry(data[off]).n8;
            else if (only_single_quats)
            {
                this.y = data[off] << 8;
                this.y = (this.y << 16) >> 16;
            }
            else
                this.y = data[off];
                
            off ++;
        }
        else
        {
            this.y = data.readInt16LE(off);
            off += 2;
        }
        
        if (zSize == 1)
        {
            if ((flagtime & FLAG_SINGLEBYTEZ) && use_n8)
                this.z = GetQEntry(data[off]).n8;
            else if (only_single_quats)
            {
                this.z = data[off] << 8;
                this.z = (this.z << 16) >> 16;
            }
            else
                this.z = data[off];
                
            off ++;
        }
        else
        {
            this.z = data.readInt16LE(off);
            off += 2;
        }
        
        return off;
    }
    
    // -------------------------------
    // Convert frame to bytes. We
    // will NEVER use lookup values.
    // -------------------------------
    
    Bytes()
    {
        var timeVal = 0;
        var xVal = 0;
        var yVal = 0;
        var zVal = 0;
        
        // We will always use uncompressed values, always.
        var buf = Buffer.alloc(8);
    
        // No flags, since we don't use single-byte values.
        // If we'd like, we can fix this later, but no.
        
        var flags = 0;
        
        buf.writeUInt16LE(flags | this.time | (this.signed ? 0x8000 : 0), 0);
        buf.writeInt16LE(this.x, 2);
        buf.writeInt16LE(this.y, 4);
        buf.writeInt16LE(this.z, 6);
        
        return buf;
    }
};

class TranslationFrame
{
    constructor()
    {
        this.time = 0;
        this.x = 0.0;
        this.y = 0.0;
        this.z = 0.0;
    }
    
    // -------------------------------
    // Read from data. This returns
    // the new offset we should be at.
    // -------------------------------
    
    Read(data, off)
    {
        var flagtime = data[off];
        off ++;
        
        if (flagtime & 0x40)
            this.time = flagtime & 0x3F;
        else
        {
            this.time = data.readUInt16LE(off);
            off += 2;
        }
        
        if (flagtime & FLAG_TRANS_USELOOKUP)
        {
            var ent = GetTEntry(data[off]);
            off ++;
            
            this.x = ent.x48;
            this.y = ent.y48;
            this.z = ent.z48;
        }
        else
        {
            this.x = data.readInt16LE(off);
            this.y = data.readInt16LE(off+2);
            this.z = data.readInt16LE(off+4);            
            off += 6;
        }
            
        return off;
    }
    
    // -------------------------------
    // Convert frame to bytes. We
    // will NEVER use lookup values.
    // -------------------------------
    
    Bytes()
    {
        // We will always use uncompressed values, always.
        var buf = Buffer.alloc(9);
    
        // No flags, since we don't use single-byte values.
        // If we'd like, we can fix this later, but no.
        
        buf.writeUInt16LE(this.time, 1);
        buf.writeInt16LE(this.x, 3);
        buf.writeInt16LE(this.y, 5);
        buf.writeInt16LE(this.z, 7);
        
        return buf;
    }
};

class BonedAnimation
{
    constructor()
    {
        this.version = 0;
        this.flags = 0;
        this.duration = 0.0;
        
        this.numBones = 0;
        this.numQKeys = 0;
        this.numTKeys = 0;
        this.numCustomAnimKeys = 0;
        
        this.qAllocSize = 0;
        this.tAllocSize = 0;
        
        this.bones = [];
    }
    
    // -------------------------------
    // Read a THUG2 .ska file.
    // -------------------------------
    
    ReadTHUG2(data)
    {
        var off = 0;
        
        this.version = data.readUInt32LE(off);
        off += 4;
        console.log("Version: " + this.version);
        
        this.flags = data.readUInt32LE(off);
        currentSkaFlags = this.flags;
        off += 4;
        console.log("Flags: 0x" + this.flags.toString(16).padStart(8, "0"));
        
        this.duration = data.readFloatLE(off);
        off += 4;
        console.log("Duration: " + this.duration + " seconds");
        
        this.numBones = data.readUInt32LE(off);
        off += 4;
        console.log("Bone Count: " + this.numBones);
        
        this.numQKeys = data.readUInt32LE(off);
        off += 4;
        console.log("Quaternion Frames: " + this.numQKeys);
        
        this.numTKeys = data.readUInt32LE(off);
        off += 4;
        console.log("Translation Frames: " + this.numTKeys);
        
        this.numCustomAnimKeys = data.readUInt32LE(off);
        off += 4;
        console.log("Custom Frames: " + this.numCustomAnimKeys);
        
        this.qAllocSize = data.readUInt32LE(off);
        off += 4;
        console.log("Q Alloc Size: " + this.qAllocSize);
        
        this.tAllocSize = data.readUInt32LE(off);
        off += 4;
        console.log("T Alloc Size: " + this.tAllocSize);
        
        for (var b=0; b<this.numBones; b++)
        {
            this.bones.push({quats: [], translations: [], quat_size: 0, trans_size: 0});
            this.bones[b].quat_size = data.readUInt16LE(off);
            off += 2;
        }
        
        for (var b=0; b<this.numBones; b++)
        {
            this.bones[b].trans_size = data.readUInt16LE(off);
            off += 2;
        }
        
        // ----------------------------------
        
        var quatEnd = off + this.qAllocSize;
        
        for (var b=0; b<this.numBones; b++)
        {
            if (this.bones[b].quat_size)
            {
                var nextBone = off + this.bones[b].quat_size;
                
                while (off < nextBone)
                {
                    var frm = new QuaternionFrame();
                    off = frm.Read(data, off);
                    
                    this.bones[b].quats.push(frm);
                }
                
                if (off != nextBone)
                {
                    console.log("!! ERROR READING QUATS, we're at " + off + ", should be " + nextBone);
                }
            }
        }
        
        if (off != quatEnd)
        {
            console.log("ERROR: " + off + " did not match quaternion end spot of " + quatEnd + ".");
            process.exit(1);
        }
        
        // ----------------------------------
        
        var transEnd = off + this.tAllocSize;
        
        for (var b=0; b<this.numBones; b++)
        {
            if (this.bones[b].trans_size)
            {
                var nextBone = off + this.bones[b].trans_size;
                
                while (off < nextBone)
                {
                    var frm = new TranslationFrame();
                    off = frm.Read(data, off);
                    
                    this.bones[b].translations.push(frm);
                }
                
                if (off != nextBone)
                {
                    console.log("!! ERROR READING QUATS, we're at " + off + ", should be " + nextBone);
                }
            }
        }
        
        if (off != transEnd)
        {
            console.log("ERROR: " + off + " did not match translation end spot of " + transEnd + ".");
            process.exit(1);
        }
        
        // ----------------------------------
        
        console.log("File ended at " + off + ".");
    }
    
    // -------------------------------
    // Read a THAW .ska file.
    // -------------------------------
    
    ReadTHAW(data)
    {
        console.log("Reading THAW anims is not supported yet.");
        process.exit(1);
        return;
    }
    
    // -------------------------------
    // Write a THUG2 .ska file.
    // -------------------------------
    
    WriteTHUG2()
    {
        console.log("Writing THUG2 anims is not supported yet.");
        process.exit(1);
        return;
    }
    
    // -------------------------------
    // Write a THAW .ska file.
    // -------------------------------
    
    WriteTHAW()
    {
        console.log("Serializing...");
        
        var buffers = [];
        
        // -----------------------------------
        // Header buffer, always 48 bytes. Always.
        var header = Buffer.alloc(48);
        
        header.writeUInt32LE(40, 0);
        
        // nxBONEDANIMFLAGS_ONLYSINGLEBYTEQUATS is NEVER allowed in output.
        var finalFlags = this.flags & ~nxBONEDANIMFLAGS_ONLYSINGLEBYTEQUATS;
        
        if (FORCE_MISSINGBONEPOS && !(finalFlags & nxBONEDANIMFLAGS_KEEPMISSINGBONEPOS))
        {
            console.log("  Forcing nxBONEDANIMFLAGS_KEEPMISSINGBONEPOS");
            finalFlags |= nxBONEDANIMFLAGS_KEEPMISSINGBONEPOS;
        }
        
        header.writeUInt32LE(finalFlags, 4);
        header.writeFloatLE(this.duration, 8);
        
        header[13] = (this.numBones & 0xFF);
        header.writeUInt16LE(this.numQKeys, 14);
        header.writeUInt16LE(this.numTKeys, 16);
        header.writeUInt16LE(this.numCustomAnimKeys, 18);
        
        // These are always -1 in THAW. I don't know why, they just are.
        header.writeInt32LE(-1, 20);
        header.writeInt32LE(-1, 24);
        header.writeInt32LE(-1, 28);
        header.writeInt32LE(-1, 32);
        header.writeInt32LE(-1, 36);
        
        // Fix this up later.
        header.writeUInt32LE(0, 40);
        header.writeUInt32LE(0, 44);
        
        buffers.push(header);
        
        // -----------------------------------
        // Quat sizes header.
        
        var qSizes = Buffer.alloc(2 * this.numBones);
        for (var b=0; b<this.numBones; b++)
            qSizes.writeUInt16LE(this.bones[b].quat_size, b*2);
        buffers.push(qSizes);
        
        // -----------------------------------
        // Translation sizes header.
        
        var tSizes = Buffer.alloc(2 * this.numBones);
        for (var b=0; b<this.numBones; b++)
            tSizes.writeUInt16LE(this.bones[b].trans_size, b*2);
        buffers.push(tSizes);
        
        // -----------------------------------
        // Quaternion datas.
        
        var totalQSize = 0;
        
        for (var b=0; b<this.numBones; b++)
        {
            this.bones[b].quat_size = 0;
            
            if (this.bones[b].quats.length)
            {
                for (const quat of this.bones[b].quats)
                {
                    var bytes = quat.Bytes();
                    totalQSize += bytes.length;
                    this.bones[b].quat_size += bytes.length;
                    
                    buffers.push(bytes);
                }
            }
        }
            
        // -----------------------------------
        // Translation datas.
        
        var totalTSize = 0;
        
        for (var b=0; b<this.numBones; b++)
        {
            this.bones[b].trans_size = 0;
            
            if (this.bones[b].translations.length)
            {
                for (const trans of this.bones[b].translations)
                {
                    var bytes = trans.Bytes();
                    totalTSize += bytes.length;
                    this.bones[b].trans_size += bytes.length;
                    
                    buffers.push(bytes);
                }
            }
        }
        
        // -----------------------------------
        
        var final = Buffer.concat(buffers);
        
        // Fix up sizes.
        final.writeUInt32LE(totalQSize, 40);
        final.writeUInt32LE(totalTSize, 44);
        
        var qSizePos = 48;
        var tSizePos = 48 + (2 * this.bones.length);
        
        for (var b=0; b<this.bones.length; b++)
        {
            final.writeUInt16LE(this.bones[b].quat_size, qSizePos + (2*b));
            final.writeUInt16LE(this.bones[b].trans_size, tSizePos + (2*b));
        }
        
        console.log("  Total Q size: " + totalQSize);
        console.log("  Total T size: " + totalTSize);
        
        return final;
    }
};

class AnimConvertCore
{
    constructor()
    {
        global.AnimConvert = this;
        console.log("AnimConvert initialized.");
        
        this.ReadTables();
    }
    
    // -------------------------------
    // Read a Q table.
    // -------------------------------
    
    ReadQTable(id, fileName)
    {
        var qFile = path.join(__dirname, fileName);
        
        if (fs.existsSync(qFile))
        {
            var dat = fs.readFileSync(qFile);
            var off = 0;
            
            qTables[id] = [];
            
            for (var q=0; q<256; q++)
            {
                qTables[id].push({
                    x48: dat.readInt16LE(off),
                    y48: dat.readInt16LE(off+2),
                    z48: dat.readInt16LE(off+4),
                    n8: dat.readInt16LE(off+6)
                });
                
                off += 8;
            }
        }
    }
    
    // -------------------------------
    // Read a T table.
    // -------------------------------
    
    ReadTTable(id, fileName)
    {
        var qFile = path.join(__dirname, fileName);
        
        if (fs.existsSync(qFile))
        {
            var dat = fs.readFileSync(qFile);
            var off = 0;
            
            tTables[id] = [];
            
            for (var q=0; q<256; q++)
            {
                tTables[id].push({
                    x48: dat.readInt16LE(off),
                    y48: dat.readInt16LE(off+2),
                    z48: dat.readInt16LE(off+4),
                    n8: dat.readInt16LE(off+6)
                });
                
                off += 8;
            }
        }
    }
    
    // -------------------------------
    // Read compressed Q / T lookup tables.
    // -------------------------------
    
    ReadTables()
    {
        console.log("  Reading compressed lookup tables...");
        
        this.ReadQTable("thaw", "standardkeyQ.bin");
        this.ReadQTable("thug2", "standardkeyQ_thug2.bin");
        this.ReadTTable("thug2", "standardkeyT_thug2.bin");
        this.ReadQTable("thug1", "standardkeyQ_thug1.bin");
        this.ReadTTable("thug1", "standardkeyT_thug1.bin");
    }
    
    // -------------------------------
    // Read a bone mapping file.
    // -------------------------------
    
    ReadMapFile(mapFile)
    {
        var mapping = {};
        
        var lines = fs.readFileSync(mapFile).toString().replace(/\r/g, '\n').split('\n');
        
        var highest = 0;
        
        for (var line of lines)
        {
            line = line.trim();
            
            if (line.length <= 0)
                continue;
                
            // Starts with a !, this is an excluder.
            // This EXCLUDES ALL ANIMATIONS ON THESE BONES.
            
            if (line[0] == "!")
            {
                var num = line.slice(1, line.length);
                var toExclude = parseInt(num);
                
                mapping["exclude_" + toExclude] = true;
            }
            
            else
            { 
                if (line.indexOf(" ") == -1)
                    continue;
                    
                var spl = line.split(" ");
                if (spl.length != 2)
                    continue;
                    
                var src = parseInt(spl[0]);
                var dst = parseInt(spl[1]);
                
                highest = Math.max(spl[0], highest);
                
                mapping[src] = dst;
            }
        }
        
        mapping["max"] = highest;
        
        return mapping;
    }
    
    // -------------------------------
    // Convert a single .ska file.
    // -------------------------------
    
    ConvertFile(inPath, outPath, options = {})
    {
        console.log("-- Converting " + path.basename(inPath) + "... (" + options.inFormat + " -> " + options.outFormat + ") --");
        
        var anim = new BonedAnimation();
        var data = fs.readFileSync(inPath);
        
        // See which file it is based on version.
        // Version 1 is THUG2, THAW is different.
        
        var vers = data.readUInt32LE(0);
        console.log("SKA Version: " + vers);
        
        if (vers == 1 && (options.inFormat != "thug2" && options.inFormat != "thug1"))
        {
            console.log("This is NOT a THUG2 file.");
            process.exit(1);
        }
        
        else if (vers != 1 && options.inFormat != "thaw")
        {
            console.log("This is NOT a THAW file.");
            process.exit(1);
        }
        
        if (vers == 1)
            anim.ReadTHUG2(data);
        else
            anim.ReadTHAW(data);
            
        // ------------------------------------
        
        if (options.mapFile)
        {
            console.log("Remapping bones...");
            
            var mapping = this.ReadMapFile(options.mapFile);
            
            var newBones = [];
            
            // Loop through the number of DST bones, and
            // find the SRC bone for each.
            
            var keys = Object.keys(mapping);
            
            console.log("  Max bones: " + mapping.max);
            
            for (var b=0; b<mapping.max+1; b++)
            {
                // Didn't have a src bone. Use a blank bone.
                if (!mapping.hasOwnProperty(b.toString()))
                    newBones.push({quats: [], translations: [], quat_size: 0, trans_size: 0});
                // Did have a src bone.
                else
                {
                    var src = mapping[b.toString()];
                    
                    if (src >= 0)
                    {
                        var boneSrc = anim.bones[src];
                        
                        if (mapping["exclude_" + b.toString()])
                        {
                            console.log("Excluding " + b + "...");
                            newBones.push({quats: [], translations: [], quat_size: 0, trans_size: 0});
                        }
                        else
                            newBones.push(boneSrc);
                    }
                    else
                        newBones.push({quats: [], translations: [], quat_size: 0, trans_size: 0});
                }
            }
            
            anim.bones = newBones;
            anim.numBones = newBones.length;
        }
        
        // ------------------------------------
            
        var outBuffer = null;
        
        if (options.outFormat == "thug2")
            outBuffer = anim.WriteTHUG2();
        else
            outBuffer = anim.WriteTHAW();
            
        if (!outBuffer) { console.log("Did not have output buffer for writing."); return; }
        
        fs.writeFileSync(outPath, outBuffer);
    }
    
    // -------------------------------
    // Actually convert animations.
    // -------------------------------
    
    Convert(options = {})
    {
        this.options = options;
        
        if (!options.inFormat) { console.log("Need inFormat when converting."); return; }
        if (!options.outFormat) { console.log("Need outFormat when converting."); return; }
        
        var inFolder = path.join(__dirname, "in");
        var outFolder = path.join(__dirname, "out");
        
        // Ensure out folder exists.
        if (!fs.existsSync(outFolder))
            fs.mkdirSync(outFolder);
            
        // Get a list of files to convert.
        var files = fs.readdirSync(inFolder);
        
        if (!files.length) { console.log("Had no files to convert."); return; }
        
        for (const file of files)
        {
            var inPath = path.join(inFolder, file);
            var outPath = path.join(outFolder, file);
            
            // Fix extension.
            var spl = outPath.split(".");
            var ext = spl[spl.length-1].toLowerCase();
            
            if (options.outFormat == "thaw" && ext == "xbx")
                spl[spl.length-1] = "wpc";
                
            outPath = spl.join(".");
            
            this.ConvertFile(inPath, outPath, options);
        }
        
        console.log("");
        console.log("!! Finished !!");
    }
    
    // -------------------------------
    // Handle command-line args.
    // -------------------------------
    
    HandleArguments()
    {
        var options = {};
        
        var args = process.argv;
        args.shift();
        args.shift();

        if (args.length < 2)
        {
            console.log("Please specify an INPUT and OUTPUT format.");
            return;
        }
        
        var inFormat = args.shift();
        var outFormat = args.shift();
        
        var validIn = (inFormat == "thug2" || inFormat == "thaw" || inFormat == "thug1");
        var validOut = (outFormat == "thug2" || outFormat == "thaw");
        
        if (!validIn)
        {
            console.log("Input format must be thug1, thug2, or thaw");
            return;
        }
        
        if (!validOut)
        {
            console.log("Output format must be 'thug2' or 'thaw'.");
            return;
        }
        
        options.inFormat = inFormat;
        options.outFormat = outFormat;
        
        while (args.length)
        {
            var arg = args.shift();
            
            switch (arg.toLowerCase())
            {
                case "-map":
                    if (args.length < 1)
                    {
                        console.log("Please specify a bone mapping file.");
                        process.exit(1);
                    }
                    
                    var mapFile = args.shift();
                    if (!path.isAbsolute(mapFile))
                        mapFile = path.join(__dirname, mapFile);
                        
                    if (!fs.existsSync(mapFile))
                    {
                        console.log(path.basename(mapFile) + " does not exist.");
                        process.exit(1);
                    }
                    
                    options.mapFile = mapFile;
                        
                    break;
            }
        }
        
        this.Convert(options);
    }
};

new AnimConvertCore();
AnimConvert.HandleArguments();
