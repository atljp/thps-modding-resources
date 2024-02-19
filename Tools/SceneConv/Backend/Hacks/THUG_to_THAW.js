// --------------------------------------------------
//
// H A C K :   B O N E   S C R I P T
//      (THUG -> THAW)
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
    0: 0,
    1: 1,
    2: 2,
    3: 3,
    4: 4,
    5: 5,
    6: 6,
    7: 7,
    8: 8,
    9: 9,
    10: 10,
    11: 11,
    12: 12,
    13: 13,
    14: 14,
    15: 15,
    16: 16,
    17: 17,
    18: 18,
    19: 19,
    20: 20,
    21: 21,
    22: 22,
    23: 23,
    24: 24,
    25: 25,
    26: 26,
    27: 27,
    28: 28,
    29: 29,
    30: 30,
    31: 34,
    32: 31,                 // Head top scale
    33: 33,                 // Nose scale???
    34: 32,                 // Ponytail
    35: 32,                 // Ponytail 2
    36: 35,                 // Chest cloth
    37: 36,                 // Left cloth, I guess?
    38: 37,                 // Center cloth?
    39: 38,                 // Right cloth, I guess?
    40: 39,
    41: 40,                 // Right Knee
    42: 41,                 // Right Ankle
    43: 42,                 // Right toe
    44: 40,                 // Right knee twist
    45: 43,
    46: 44,                 // Left Knee
    47: 46,                 // Left knee twist
    48: 45,                 // Left Ankle
    49: 46                  // Left toe
};

const Hack = require('./Base.js');

class THUGtoTHAW_Hack extends Hack
{
    // -----------------------------
    // Called after deserialize.
    // -----------------------------
    
    PostDeserialize()
    {
        if (SceneConverter.inFormat != "thug" || SceneConverter.outFormat != "thaw")
            return;
            
        console.log("Converting THUG -> THAW bones...");
        
        var scene = SceneConverter.GetScene();
        
        if (!scene)
            return;
            
        var parsed = {};
            
        for (const sect of scene.sectors)
        {
            for (const mesh of sect.geom.meshes)
            {
                if (!mesh.weighted)
                    continue;
                
                for (const lod of mesh.lods)
                {
                    for (const buf of lod.vertex_buffers)
                    {
                        console.log("  Converting " + buf.length + " vertices...");
        
                        for (var v=0; v<buf.length; v++)
                        {
                            const vert = buf[v];
                            
                            if (vert.converted)
                                continue;
                            
                            vert.converted = true;
                            
                            for (var w=0; w<vert.weights.length; w++)
                            {
                                var idx = vert.weights[w][0];
                                var mapping = bone_mapping[idx];
                                
                                if (!mapping && (idx > 0))
                                    console.log("MISSING BONE MAPPING: " + idx);
                                
                                vert.weights[w][0] = mapping;
                            }
                        }
                    }
                }
            }
        }
    }
}

module.exports = THUGtoTHAW_Hack;
