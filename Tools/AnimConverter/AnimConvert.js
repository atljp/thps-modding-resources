// ------------------------------------------
//
// A N I M C O N V E R T
//      .ska converter for THUG / THUG2 / THAW
//
// ------------------------------------------

const fs = require('fs');
const path = require('path');

const Quaternion = require('./math3d/Quaternion');

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
        this.longTime = false;      // Stores time as separate value.
    }
   
    // -------------------------------
    // Set components from float values.
    // -------------------------------
    
    SetComponents(x, y, z)
    {
        this.x = Math.floor(x * 16384.0);
        this.y = Math.floor(y * 16384.0);
        this.z = Math.floor(z * 16384.0);
    }
    
    // -------------------------------
    // Rebuilds W component.
    // -------------------------------
    
    GetComponents()
    {
        var qX = this.x / 16384.0;
        var qY = this.y / 16384.0;
        var qZ = this.z / 16384.0;
        
        var sqX = qX * qX;
        var sqY = qY * qY;
        var sqZ = qZ * qZ;
    
        var sub = ((1.0 - sqX) - sqY) - sqZ;
        sub = (sub < 0.0) ? 0.0 : sub;
        
        var qW = Math.sqrt(sub);
        
        if (this.signed)
            qW = -qW;
            
        return [qX, qY, qZ, qW];
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
        var use_long_time = (currentSkaFlags & nxBONEDANIMFLAGS_LONGFRAMETIMES);
        
        // nxBONEDANIMFLAGS_LONGFRAMETIMES stores time as a completely separate value.
        if (use_long_time)
        {
            this.longTime = true;
            this.time = data.readUInt16LE(off);
            off += 2;
        }
        
        // Contains flags, as well as time.
        var flagtime = data.readUInt16LE(off);
        
        if (!use_long_time)
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
        var buf = Buffer.alloc(this.longTime ? 10 : 8);
    
        // No flags, since we don't use single-byte values.
        // If we'd like, we can fix this later, but no.
        
        var flags = 0;
        var off = 0;
        
        if (this.longTime)
        {
            buf.writeUInt16LE(this.time, off);
            buf.writeUInt16LE(flags | (this.signed ? 0x8000 : 0), off+2);
            off += 4;
        }
        else
        {
            buf.writeUInt16LE(flags | this.time | (this.signed ? 0x8000 : 0), off);
            off += 2;
        }
            
        buf.writeInt16LE(this.x, off);
        buf.writeInt16LE(this.y, off+2);
        buf.writeInt16LE(this.z, off+4);
        off += 6;
        
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
    // Set components from float values.
    // -------------------------------
    
    SetComponents(x, y, z)
    {
        this.x = Math.floor(x * 32.0);
        this.y = Math.floor(y * 32.0);
        this.z = Math.floor(z * 32.0);
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
        this.partialFlags = [];
    }
    
    AllocQuaternion() { return new QuaternionFrame(); }
    AllocTranslation() { return new TranslationFrame(); }
    
    // -------------------------------
    // Read partial flags from a file.
    // -------------------------------
    
    ReadPartialFlags(data, off)
    {
        var partialBoneCount = data.readUInt32LE(off);
        off += 4;
        
        console.log("Partial anim had " + partialBoneCount + " bones.");
        
        var maskCount = Math.floor((partialBoneCount-1) / 32) + 1;
        console.log("  Had " + maskCount + " masks.");
        
        this.partialFlags = [];
        for (var m=0; m<maskCount*32; m++)
            this.partialFlags.push(false);
        
        var maskOffset = 0;
        
        // Flags are ordered from lowest bone to highest bone, from left to right.
        // Remember that every 32 bits is little endian, so it has to be flipped.
        
        for (var m=0; m<maskCount; m++)
        {
            var mask = data.readUInt32LE(off);
            
            for (var mi=0; mi<32; mi++)
            {
                var destIndex = maskOffset + mi;
                
                //~ if (destIndex < partialBoneCount)
                    this.partialFlags[destIndex] = (mask & (1 << mi)) ? true : false;
            }
            
            off += 4;
            maskOffset += 32;
        }
        
        //~ for (var p=0; p<this.partialFlags.length; p++)
            //~ console.log(p.toString().padStart(2, " ") + ". " + this.partialFlags[p]);
            
        return off;
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
        
        if (this.flags & nxBONEDANIMFLAGS_PARTIALANIM)
            off = this.ReadPartialFlags(data, off);
        
        // ----------------------------------
        
        var quatEnd = off + this.qAllocSize;
        
        for (var b=0; b<this.numBones; b++)
        {
            if (this.bones[b].quat_size)
            {
                var nextBone = off + this.bones[b].quat_size;
                
                while (off < nextBone)
                {
                    var frm = this.AllocQuaternion();
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
                    var frm = this.AllocTranslation();
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
        
        // ???
        off ++;
        
        this.numBones = data[off]
        off ++;
        console.log("Bone Count: " + this.numBones);
        
        this.numQKeys = data.readUInt16LE(off);
        off += 2;
        console.log("Quaternion Frames: " + this.numQKeys);
        
        this.numTKeys = data.readUInt16LE(off);
        off += 2;
        console.log("Translation Frames: " + this.numTKeys);
        
        this.numCustomAnimKeys = data.readUInt16LE(off);
        off += 2;
        console.log("Custom Frames: " + this.numCustomAnimKeys);
        
        // Always -1, it seems.
        off += 20;
        
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

        if (this.flags & nxBONEDANIMFLAGS_PARTIALANIM)
            off = this.ReadPartialFlags(data, off);
        
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
        // Partial animation flags.
        
        if (this.flags & nxBONEDANIMFLAGS_PARTIALANIM)
        {
            var numMasks = Math.floor((this.partialFlags.length-1) / 32) + 1;
            console.log("Writing " + numMasks + " partial animation masks...");
            
            var maskBuf = Buffer.alloc(4 + (numMasks*4));
            maskBuf.writeUInt32LE(this.numBones, 0);
            
            for (var m=0; m<numMasks; m++)
            {
                var mask = 0;
                var flagOffset = (m*32);
                
                for (var mi=0; mi<32; mi++)
                {
                    // Within range?
                    if (flagOffset+mi < this.partialFlags.length)
                    {
                        if (this.partialFlags[flagOffset+mi])
                            mask |= (1 << mi);
                    }
                }
                
                maskBuf.writeUInt32LE(mask >>> 0, 4 + (m*4));
            }
            
            buffers.push(maskBuf);
        }
        
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
        this.ReadTTable("thaw", "standardkeyT.bin");
        this.ReadQTable("thug2", "standardkeyQ_thug2.bin");
        this.ReadTTable("thug2", "standardkeyT_thug2.bin");
        this.ReadQTable("thug1", "standardkeyQ_thug1.bin");
        this.ReadTTable("thug1", "standardkeyT_thug1.bin");
        this.ReadQTable("thps4", "standardkeyQ_thps4.bin");
        this.ReadTTable("thps4", "standardkeyT_thps4.bin");
        this.ReadQTable("desa", "standardkeyQ_desa.bin");
        this.ReadTTable("desa", "standardkeyT_desa.bin");
        this.ReadQTable("thpg", "standardkeyQ_thpg.bin");
        this.ReadTTable("thpg", "standardkeyT_thpg.bin");
    }
    
    // -------------------------------
    // Read a bone mapping file.
    // -------------------------------
    
    ReadMapFile(mapFile)
    {
        var mapping = {};
        
        // ------------------------
        // JAVASCRIPT FILE
        // ------------------------
        
        if (mapFile.toLowerCase().endsWith(".js"))
        {
            var result = {};
            var map = require(mapFile);
            
            if (map.bone_mapping == null)
            {
                console.log("!! Bone map MUST have bone_mapping object! !!");
                process.exit(1);
            }
            
            var bm = map.bone_mapping;
            
            // Figure out how many bones we have.
            var highest = 0;
            
            for (const key of Object.keys(bm))
            {
                var src = parseInt(key);
                var dst = bm[parseInt(key)];

                highest = Math.max(highest, dst+1);
            }
            
            result["max"] = highest;
            console.log("Mapping file maps to " + (highest+1).toString() + " bones.");
            
            for (var b=0; b<highest; b++)
            {
                var src = b;
                var dst = bm[b];
                
                if (bm[b] != isNaN)
                    result[dst] = b;
                else
                    result["exclude_" + b.toString()] = true;
            }
            
            if (map.translation_exclude)
                result["translation_exclude"] = map.translation_exclude;
            if (map.translation_mods)
                result["translation_mods"] = map.translation_mods;
            if (map.quaternion_mods)
                result["quaternion_mods"] = map.quaternion_mods;
            if (map.dummy_bones)
                result["dummy_bones"] = map.dummy_bones;
                
            if (map.exclude)
            {
                for (const exc of map.exclude)
                    result["exclude_" + exc.toString()] = true;
            }
            
            return result;
        }
        
        // ------------------------
        // TEXT FILE
        // ------------------------
        
        else
        {
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
        }
        
        return mapping;
    }
    
    // -------------------------------
    // Return anim class.
    // -------------------------------
    
    AllocAnimation()
    {
        return new BonedAnimation();
    }
    
    // -------------------------------
    // Convert a single .ska file.
    // -------------------------------
    
    ConvertFile(inPath, outPath, options = {})
    {
        console.log("-- Converting " + path.basename(inPath) + "... (" + options.inFormat + " -> " + options.outFormat + ") --");
        
        var anim = this.AllocAnimation();
        var data = fs.readFileSync(inPath);
        
        // See which file it is based on version.
        // Version 1 is THUG2, THAW is different.
        
        var vers = data.readUInt32LE(0);
        console.log("SKA Version: " + vers);
        
        if (vers == 1 && (options.inFormat != "thug2" && options.inFormat != "thug1" && options.inFormat != "thps4" && options.inFormat != "desa"))
        {
            console.log("This is NOT a THUG2 file.");
            process.exit(1);
        }
        
        else if (vers != 1 && (options.inFormat != "thaw" && options.inFormat != "thpg"))
        {
            console.log("This is NOT a THAW file.");
            process.exit(1);
        }
        
        if (vers == 1)
            anim.ReadTHUG2(data);
        else
            anim.ReadTHAW(data);
            
        this.WriteAnimation(anim, outPath, options);
    }
    
    // -------------------------------
    // Writes animation data to file.
    // -------------------------------
    
    WriteAnimation(anim, outPath, options)
    {
        if (options.mapFile)
        {
            console.log("Remapping bones...");
            
            var mapping = this.ReadMapFile(options.mapFile);
            
            var newBones = [];
            var newFlags = [];
            
            // Loop through the number of DST bones, and
            // find the SRC bone for each.
            
            var keys = Object.keys(mapping);
            
            console.log("  Max bones: " + mapping.max);
            
            var trn_exc = mapping["translation_exclude"];
            var trn_mod = mapping["translation_mods"];
            var qut_exc = mapping["quaternion_exclude"];
            var qut_mod = mapping["quaternion_mods"];
            var dummy = mapping["dummy_bones"] || {};
            
            for (var b=0; b<mapping.max+1; b++)
            {
                // Didn't have a src bone. Use a blank bone.
                if (!mapping.hasOwnProperty(b.toString()))
                {
                    newBones.push({quats: [], translations: [], quat_size: 0, trans_size: 0});
                    newFlags.push(false);
                }
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
                            newFlags.push(false);
                        }
                        else
                        {
                            console.log(b.toString() + " <- " + src);
                            
                            var newBone = { quats: boneSrc.quats, translations: boneSrc.translations, quat_size: boneSrc.quat_size, trans_size: boneSrc.trans_size };
                            
                            // Should this bone retain translation information?
                            if (trn_exc && trn_exc.includes(b))
                            {
                                console.log("Excluding translations for bone " + b + "...");
                                newBone.translations = [];
                            }
                            
                            // Modify quaternions
                            if (qut_mod && qut_mod[b])
                            {
                                var mod = qut_mod[b];
                                var modQuat = new Quaternion(mod[0], mod[1], mod[2], mod[3]);
                                
                                for (var q=0; q<newBone.quats.length; q++)
                                {
                                    var quat = newBone.quats[q];
                                    var comps = quat.GetComponents();
                                    
                                    var thisQuat = new Quaternion(comps[0], comps[1], comps[2], comps[3]);
                                    thisQuat = thisQuat.mul(modQuat);
                                    
                                    newBone.quats[q].x = Math.floor(thisQuat.x * 16384.0);
                                    newBone.quats[q].y = Math.floor(thisQuat.y * 16384.0);
                                    newBone.quats[q].z = Math.floor(thisQuat.z * 16384.0);
                                }
                            }
                            
                            // Modify translations
                            if (trn_mod && trn_mod[b])
                            {
                                var mod = trn_mod[b];
                                
                                for (var t=0; t<newBone.translations.length; t++)
                                {
                                    newBone.translations[t].x += Math.floor(mod[0] * 32.0);
                                    newBone.translations[t].y += Math.floor(mod[1] * 32.0);
                                    newBone.translations[t].z += Math.floor(mod[2] * 32.0);
                                }
                            }
                            
                            newBones.push(newBone);
                            newFlags.push(anim.partialFlags[src] || false);
                        }
                    }
                    else
                    {
                        newBones.push({quats: [], translations: [], quat_size: 0, trans_size: 0});
                        newFlags.push(false);
                    }
                }
            }
            
            anim.bones = newBones;
            anim.numBones = newBones.length;
            anim.partialFlags = newFlags;
        }
        
        // ------------------------------------
        
        // Handle dummy bones.
        if (dummy)
        {
            for (var b=0; b<newBones.length; b++)
            {
                var dummyData = dummy[b.toString()];
                
                if (dummyData && dummyData.quat)
                {
                    var q = new QuaternionFrame();
                    q.time = 0;
                    q.SetComponents(dummyData.quat[0], dummyData.quat[1], dummyData.quat[2]);
                    newBones[b].quats = [q];
                }
                
                if (dummyData && dummyData.trans)
                {
                    var t = new TranslationFrame();
                    t.time = 0;
                    t.SetComponents(dummyData.trans[0], dummyData.trans[1], dummyData.trans[2]);
                    newBones[b].translations = [t];
                }
            }
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
        
        // Ensure in folder exists.
        if (!fs.existsSync(inFolder))
            fs.mkdirSync(inFolder);
        
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
        var nodeArg = args.shift();
        var fileArg = args.shift();
        
        if (path.basename(fileArg) != path.basename(__filename))
            return;

        if (args.length < 2)
        {
            console.log("Please specify an INPUT and OUTPUT format.");
            return;
        }
        
        var inFormat = args.shift();
        var outFormat = args.shift();
        
        var validIn = (inFormat == "thug2" || inFormat == "thaw" || inFormat == "thug1" || inFormat == "thpg" || inFormat == "thps4" || inFormat == "desa");
        var validOut = (outFormat == "thug2" || outFormat == "thaw");
        
        if (!validIn)
        {
            console.log("Input format must be thug1, thug2, thpg, thps4, desa, or thaw");
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
