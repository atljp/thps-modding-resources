// --------------------------------------------------
//
// H A C K :   B O N E   S C R I P T
//      (THUG2 -> THAW)
//
//  Reorganizes bone weights.
//
// --------------------------------------------------

// -- THAW BONES: --
// 0 Control_Root 
// 1 Bone_Pelvis
// 2 Bone_Stomach_Lower
// 3 Bone_Stomach_Upper
// 4 Bone_Chest
// 5 Bone_Collar_L
// 6 Bone_Bicep_L
// 7 Bone_Forearm_L
// 8 Bone_Palm_L
// 9 Bone_Fingers_Base_L
// 10 Bone_Fingers_Tip_L
// 11 Bone_Forefinger_Base_L
// 12 Bone_Forefinger_Tip_L
// 13 Bone_Thumb_L
// 14 bone_wrist_l
// 15 Bone_Bicep_Twist_Mid_L
// 16 Bone_Bicep_Twist_Top_L
// 17 Bone_Collar_R
// 18 Bone_Bicep_R
// 19 Bone_Forearm_R
// 20 Bone_Palm_R
// 21 Bone_Forefinger_Base_R
// 22 bone_forefinger_tip_r
// 23 Bone_Fingers_Base_R
// 24 Bone_Fingers_Tip_R
// 25 Bone_Thumb_R
// 26 bone_wrist_r
// 27 Bone_Bicep_Twist_Mid_R
// 28 Bone_Bicep_Twist_Top_R
// 29 Bone_Neck
// 30 Bone_Head
// 31 Bone_Head_Top_Scale
// 32 Bone_Ponytail_1
// 33 Bone_Nose_Scale
// 34 Bone_Chin_Scale
// 35 Cloth_Breast
// 36 Cloth_Shirt_L
// 37 Cloth_Shirt_C
// 38 Cloth_Shirt_R
// 39 Bone_Thigh_R
// 40 Bone_Knee_R
// 41 Bone_Ankle_R
// 42 Bone_Toe_R
// 43 Bone_Thigh_L
// 44 Bone_Knee_L
// 45 Bone_Ankle_L
// 46 Bone_Toe_L
// 47 bone_board_root
// 48 bone_board_nose
// 49 Bone_Trucks_Nose
// 50 Bone_Board_Tail
// 51 Bone_Trucks_Tail

const bone_mapping = {
    51: 53,
    50: 53, 
    49: 52,
    48: 50,    
    47: 49,
    46: 48,
    45: 47,
    44: 46,    
    43: 45,
    42: 44,
    41: 43,
    40: 42,    
    39: 41,
    38: 40,
    37: 39,
    36: 38,    
    35: 37,
    34: 36,
    33: 35,
    32: 34,
    31: 33,
    30: 32,
    29: 31,
    28: 30,
    27: 29,
    26: 27,
    25: 26,
    24: 25,
    23: 24,
    22: 23,
    21: 22,
    20: 21,
    19: 20,
    18: 19,
    17: 18,
    16: 17,
    15: 15,
    14: 14,
    13: 13,
    12: 12,
    11: 11,
    10: 10,
    9: 9,
    8: 8,
    7: 7,
    6: 6,
    5: 5,
    4: 4,
    3: 3,
    2: 2,
    1: 1,
    0: 0,
};

const Hack = require('./Base.js');

class THUG2toTHAW_Hack extends Hack
{
    // -----------------------------
    // Called after deserialize.
    // -----------------------------
    
    PostDeserialize()
    {
        if (SceneConverter.inFormat != "thug2" || SceneConverter.outFormat != "thaw")
            return;
            
        console.log("Converting THUG2 -> THAW bones...");
        
        var scene = SceneConverter.GetScene();
        
        if (!scene)
            return;
            
        for (const sect of scene.sectors)
        {
            for (const mesh of sect.geom.meshes)
            {
                if (!mesh.weighted)
                    continue;
                
                for (const lod of mesh.lods)
                {
                    for (var b=0; b<lod.vertex_buffers.length; b++)
                    {
                        const buf = lod.vertex_buffers[b];
                        console.log("  Converting " + buf.length + " vertices...");
        
                        for (var v=0; v<buf.length; v++)
                        {
                            const vert = buf[v];
                            
                            for (var w=0; w<vert.weights.length; w++)
                            {
                                var idx = vert.weights[w][0];
                                lod.vertex_buffers[b][v].weights[w][0] = bone_mapping[idx] || lod.vertex_buffers[b][v].weights[w][0];
                            }
                        }
                    }
                }
            }
        }
    }
}

module.exports = THUG2toTHAW_Hack;
