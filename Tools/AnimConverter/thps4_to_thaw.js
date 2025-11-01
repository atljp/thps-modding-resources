// -----------------------------------------
// THPS4 -> THAW
// -----------------------------------------

// THPS4 BONE NAMES:
//
// 0: Control_Root
// 1: Bone_Pelvis
// 2: Bone_Stomach_Lower (Only one stomach bone)
// 3: Bone_Chest
// 4: Bone_Neck
// 5: Bone_Head
// 6: ???
// 7: Bone_Chin_Scale
// 8: ???
// 9: Bone_Collar_L
// 10: Bone_Bicep_L
// 11: Bone_Forearm_L
// 12: Bone_Wrist_L
// 13: Bone_Palm_L
// 14: Bone_Thumb_L
// 15: Bone_Forefinger_Base_L
// 16: Bone_Forefinger_Tip_L
// 17: Bone_Fingers_Base_L
// 18: Bone_Fingers_Tip_L
// 19: ???
// 20: ???
// 21: Bone_Collar_R
// 22: Bone_Bicep_R
// 23: Bone_Forearm_R
// 24: Bone_Wrist_R
// 25: Bone_Hand_R
// 26: Bone_Thumb_R
// 27: Bone_Forefinger_Base_R
// 28: Bone_Forefinger_Tip_R
// 29: Bone_Fingers_Base_R
// 30: Bone_Fingers_Tip_R
// 31: ???
// 32: ???
// 33: ???
// 34: Bone_Thigh_R
// 35: Bone_Knee_R
// 36: Bone_Ankle_R
// 37: Bone_Toe_R
// 38: ???
// 39: ???
// 40: ???
// 41: Bone_Thigh_L
// 42: ???
// 43: Bone_Knee_L
// 44: Bone_Ankle_L
// 45: Bone_Toe_L
// 46: ???
// 47: Bone_Board_Root
// 48: Bone_Trucks_Nose
// 49: Bone_Trucks_Tail

module.exports = {
    
    // src (thps4) -> dst (thaw)
    
    bone_mapping: {
        0: 0, // Control_Root
        1: 1, // Bone_Pelvis
        2: 2, // Bone_Stomach_Lower (Only one stomach bone)
        3: 4, // Bone_Chest
        4: 29, // Bone_Neck
        5: 30, // Bone_Head
        //~ 6, // ???
        //~ 7: 34, // Bone_Chin_Scale
        //~ 8, // ???
        9: 5, // Bone_Collar_L
        10: 6, // Bone_Bicep_L
        11: 7, // Bone_Forearm_L
        12: 14, // Bone_Wrist_L
        13: 8, // Bone_Palm_L
        14: 13, // Bone_Thumb_L
        15: 11, // Bone_Forefinger_Base_L
        16: 12, // Bone_Forefinger_Tip_L
        17: 9, // Bone_Fingers_Base_L
        18: 10, // Bone_Fingers_Tip_L
        //~ 19, // ???
        //~ 20, // ???
        21: 17, // Bone_Collar_R
        22: 18, // Bone_Bicep_R
        23: 19, // Bone_Forearm_R
        24: 26, // Bone_Wrist_R
        25: 20, // Bone_Palm_R
        26: 25, // Bone_Thumb_R
        27: 21, // Bone_Forefinger_Base_R
        28: 22, // Bone_Forefinger_Tip_R
        29: 23, // Bone_Fingers_Base_R
        30: 24, // Bone_Fingers_Tip_R
        //~ 31, // ???
        //~ 32, // ???
        //~ 33, // ???
        34: 39, // Bone_Thigh_R
        35: 40, // Bone_Knee_R
        36: 41, // Bone_Ankle_R
        37: 42, // Bone_Toe_R
        //~ 38, // ???
        //~ 39, // ???
        //~ 40, // ???
        41: 43, // Bone_Thigh_L
        //~ 42, // ???
        43: 44, // Bone_Knee_L
        44: 45, // Bone_Ankle_L
        45: 46, // Bone_Toe_L
        //~ 46, // ???
        47: 47, // Bone_Board_Root
        48: 49, // Bone_Trucks_Nose
        49: 51 // Bone_Trucks_Tail
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
        // 1: [-10.0, 0.0, -0.0]
    }
}
