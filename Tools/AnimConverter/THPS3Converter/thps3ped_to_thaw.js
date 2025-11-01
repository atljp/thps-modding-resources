// -----------------------------------------
// THPS3 -> THAW
// -----------------------------------------

module.exports = {
    
    // src (thps3) -> dst (thaw)
    
    bone_mapping: {
        //~ 0: 0,               // Control_Root
        //~ 1: 1,               // Bone_Pelvis
        //~ 2: 43,              // Bone_Thigh_L
        //~ 3: 44,              // Bone_Knee_L
        //~ 4: 45,              // Bone_Ankle_L
        //~ 5: 42,              // Bone_Toe_R                   ???
        //~ 6: 2,               // Bone_Stomach_Lower
        //~ 7: 4,               // Bone_Chest
        //~ 8: 29,              // Bone_Neck
        //~ 9: 30,              // Bone_Head
        //~ 10: 23,             // Bone_Fingers_Base_R          ???
        //~ 11: 18,             // Bone_Bicep_R
        //~ 12: 19,             // Bone_Forearm_R
        //~ 13: 26,             // Bone_Wrist_R
        //~ 14: 20,             // Bone_Palm_R
        //~ 15: 21,             // Bone_Forefinger_Base_R
        //~ 16: 9,              // Bone_Fingers_Base_L          ???
        //~ 17: 6,              // Bone_Bicep_L
        //~ 18: 7,              // Bone_Forearm_L
        //~ 19: 14,             // Bone_Wrist_L
        //~ 20: 8,              // Bone_Palm_L
        //~ 21: 11,             // Bone_Forefinger_Base_L
        //~ 22: 39,             // Bone_Thigh_R
        //~ 23: 40,             // Bone_Knee_R
        //~ 24: 41,             // Bone_Ankle_R
        //~ 25: 46,             // Bone_Toe_L                   ???
        
        0: 0,                   // Control_Root
        1: 1,                   // Bone_Pelvis
        2: 39,                  // Bone_Thigh_R
        3: 40,                  // Bone_Knee_R
        4: 41,                  // Bone_Ankle_R
        5: 43,                  // Bone_Thigh_L
        6: 44,                  // Bone_Knee_L
        7: 45,                  // Bone_Ankle_L
        8: 4,                   // Bone_Chest
        9: 30,                  // Bone_Head
        10: 18,                 // Bone_Bicep_R
        11: 19,                 // Bone_Forearm_R
        12: 6,                  // Bone_Bicep_L
        13: 7,                  // Bone_Forearm_L
    },
    
    // Bones on the DESTINATION SKELETON to skip translations for.
    // This is taken into account AFTER the bones get mapped.
    
    translation_exclude: [
        2,      // Bone_Stomach_Lower
        3,      // Bone_Stomach_Upper
        4,      // Bone_Chest
        5,      // Bone_Collar_L
        6,      // Bone_Bicep_L
        7,      // Bone_Forearm_L
        8,      // Bone_Palm_L
        9,      // Bone_Fingers_Base_L
        10,     // Bone_Fingers_Tip_L
        11,     // Bone_Forefinger_Base_L
        12,     // Bone_Forefinger_Tip_L
        13,     // Bone_Thumb_L
        14,     // Bone_Wrist_L
        15,     // Bone_Bicep_Twist_Mid_L
        16,     // Bone_Bicep_Twist_Top_L
        17,     // Bone_Collar_R
        18,     // Bone_Bicep_R
        19,     // Bone_Forearm_R
        20,     // Bone_Palm_R
        21,     // Bone_Forefinger_Base_R
        22,     // Bone_Forefinger_Tip_R
        23,     // Bone_Fingers_Base_R
        24,     // Bone_Fingers_Tip_R
        25,     // Bone_Thumb_R
        26,     // Bone_Wrist_R
        27,     // Bone_Bicep_Twist_Mid_R
        28,     // Bone_Bicep_Twist_Top_R
        29,     // Bone_Neck
        30,     // Bone_Head
        31,     // Bone_Head_Top_Scale
        39,     // Bone_Thigh_R
        40,     // Bone_Knee_R
        41,     // Bone_Ankle_R
        42,     // Bone_Toe_R
        43,     // Bone_Thigh_L
        44,     // Bone_Knee_L
        45,     // Bone_Ankle_L
        46,     // Bone_Toe_L
        49,     // Bone_Trucks_Nose
        51,     // Bone_Trucks_Tail
    ],
    
    // Absolute angles to rotate certain bones by.
    // For DESTINATION SKELETON.
    // This is taken into account AFTER the bones get mapped.
    
    quaternion_mods: {
        //~ 20: [0.383, 0.000, 0.00, 0.924],     // Bone_Palm_R
        //~ 8: [0.383, 0.000, 0.00, 0.924],     // Bone_Palm_L
    },
    
    // Absolute vectors to translate certain bones by.
    // For DESTINATION SKELETON.
    // This is taken into account AFTER the bones get mapped.
    
    translation_mods: {
        0: [0.0, -40.781250, 0.0]
    },
    
    // Use junk data for these bones. Used to keep them 
    // decent default position.
    
    dummy_bones: {
        9: { quat: [-0.079224, -0.267090, -0.021851, 0.960161], trans: [0.0, 0.0, 0.0] },           // Left finger 
        10: { quat: [0.0, -0.235046, 0.0, 0.971984], trans: [0.0, 0.0, 0.0] },                      // Left finger tip
        11: { quat: [0.0, -0.153137, 0.0, 0.988205], trans: [0.0, 0.0, 0.0] },                      // Left index
        12: { quat: [0.0, -0.169922, 0.0, 0.985458], trans: [0.0, 0.0, 0.0] },                      // Left index tip
        13: { quat: [-0.019897, -0.179321, 0.049133, 0.982361], trans: [0.0, 0.0, 0.0] },           // Left thumb
        21: { quat: [-0.008606, 0.153015, -0.029541, 0.987745], trans: [0.0, 0.0, 0.0] },           // Right index
        22: { quat: [0.0, 0.169922, 0.0, 0.985458], trans: [0.0, 0.0, 0.0] },                       // Right index tip
        23: { quat: [-0.090942, 0.263184, -0.005066, 0.960436], trans: [0.0, 0.0, 0.0] },           // Right finger
        24: { quat: [0.0, 0.235046, 0.0, 0.971984], trans: [0.0, 0.0, 0.0] },                       // Right finger tip
        25: { quat: [-0.030334, 0.179443, -0.073669, 0.980537], trans: [0.0, 0.0, 0.0] },           // Right thumb
        32: { quat: [0.670532, 0.0, 0.0, 0.741880], trans: [0.0, 0.0, 0.0] }                        // Ponytail
    }
}
