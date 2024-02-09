
script game_progress_disallow_save 
    goals = [
        Z_HO_Goal_Gaps15
        Z_HO_Goal_Gaps30
        z_ho_goal_gaps31
        Z_EL_Goal_Gaps100
        Z_ELDT_Goal_Gaps102
        Z_DT_Goal_Gaps101
        Z_DTHO_Goal_Gaps104
        Z_HO_Goal_Gaps106
        Z_HOBH_Goal_Gaps105
        Z_BH_Goal_Gaps103
        Z_BHSR_Goal_Gaps107
    ]
    GetArraySize goals
    i = 0
    begin 
    if GoalManager_GoalExists name = (<goals> [ <i> ])
        if GoalManager_GoalIsActive name = (<goals> [ <i> ])
            return true
        endif
    endif
    i = (<i> + 1)
    repeat <array_size>
    return false
endscript

script game_progress_set_initial_story_mode_nodeflags 
    flags = [
        { NODEFLAG_GAMEMODE_MULTIPLAYER 0 }
        { NODEFLAG_GAMEMODE_STORY 1 }
        { NODEFLAG_PERMANENT_PEDS 1 }
        { NODEFLAG_CAT_NODES 0 }
        { NODEFLAG_FINAL_GOAL 0 }
        { NODEFLAG_Z_HO_DINO_BEFORE 1 }
        { NODEFLAG_Z_HO_DINO_BOARDS 1 }
        { NODEFLAG_Z_HO_DINO_BOARDS02 1 }
        { NODEFLAG_Z_HO_DINO_POOL_BEFORE 1 }
        { NODEFLAG_Z_HO_DINO_AFTER 0 }
        { NODEFLAG_Z_HO_DINO_BLDG_AFTER 0 }
        { NODEFLAG_Z_HO_DT_EVENT 1 }
        { NODEFLAG_Z_HO_DT_EVENT_AFTER 0 }
        { NODEFLAG_Z_HO_ElCAP_CLOSEDDOORS 1 }
        { NODEFLAG_Z_HO_ElCAP_OPENDOORS 0 }
        { NODEFLAG_Z_HO_TOWERWIRES 1 }
        { NODEFLAG_Z_HO_TOWERPIECE 1 }
        { NODEFLAG_Z_HO_TOWERSIGN 1 }
        { NODEFLAG_Z_HO_TOWERGLOW 1 }
        { NODEFLAG_Z_HO_RECORDARM 1 }
        { NODEFLAG_Z_HO_WALKOFFAME 1 }
        { NODEFLAG_Z_HO_CRANEPHASE1 1 }
        { NODEFLAG_Z_HO_CRANEPHASE2 0 }
        { NODEFLAG_Z_HO_CRANEPHASE3 0 }
        { NODEFLAG_Z_HO_CRANEPHASE4 0 }
        { NODEFLAG_Z_HO_PARKINGSIGN 1 }
        { NODEFLAG_Z_HO_CUTSCENELIGHTS 1 }
        { NODEFLAG_Z_HO_DINO_HEAD 0 }
        { NODEFLAG_Z_HO_GRAFFITI_01 0 }
        { NODEFLAG_Z_HO_GRAFFITI_02 0 }
        { NODEFLAG_Z_HO_GRAFFITI_03 0 }
        { NODEFLAG_Z_HO_GRAFFITI_04 0 }
        { NODEFLAG_Z_HO_GRAFFITI_05 0 }
        { NODEFLAG_Z_HO_ASSHOLE 0 }
        { NODEFLAG_Z_HO_SIGN_BLAST 0 }
        { NODEFLAG_Z_HO_HOLLYWOOD_SIGN 1 }
        { NODEFLAG_Z_BH_FOUNTAINPRE 1 }
        { NODEFLAG_Z_BH_FOUNTAINPOST 0 }
        { NODEFLAG_Z_BH_HOTELPOST 0 }
        { NODEFLAG_Z_BH_HOTELPRE 1 }
        { NODEFLAG_Z_BH_HOTELPRE_LOWERBREAK 1 }
        { NODEFLAG_Z_BH_HOTELLOWERBOUNCY_01 1 }
        { NODEFLAG_Z_BH_BHSRGATEPRE 1 }
        { NODEFLAG_Z_BH_BHSRGATEPOST 0 }
        { NODEFLAG_Z_BH_CITYHALLPRE 1 }
        { NODEFLAG_Z_BH_CITYHALLPOST 0 }
        { NODEFLAG_Z_BH_CITYHALLDURING 0 }
        { NODEFLAG_Z_BH_BHSM_TRANS_OPEN 0 }
        { NODEFLAG_Z_BH_BHSM_TRANS_LOCKED 1 }
        { NODEFLAG_Z_BH_BHSR_TRANS_OPEN 0 }
        { NODEFLAG_Z_BH_BHSR_TRANS_LOCKED 1 }
        { NODEFLAG_Z_BH_AWNINGPOST 0 }
        { NODEFLAG_Z_BH_AWNINGPRE 1 }
        { NODEFLAG_Z_BH_CITYHALLDURING 0 }
        { NODEFLAG_Z_BH_STAR_LEFT 1 }
        { NODEFLAG_Z_BH_STAR_RIGHT 1 }
        { NODEFLAG_Z_BH_CH_FLOOR_RIGHT 1 }
        { NODEFLAG_Z_BH_CH_FLOOR_LEFT 1 }
        { NODEFLAG_Z_BH_GASROOF 1 }
        { NODEFLAG_Z_BH_TONYPRO 0 }
        { NODEFLAG_Z_BHSMTRANSWARP 0 }
        { NODEFLAG_Z_BHSMMANUALPAD 1 }
        { NODEFLAG_Z_BHSM_DEAWONPOST 1 }
        { NODEFLAG_Z_BH_LADDER 0 }
        { NODEFLAG_Z_BH_GRAFFITI_01 0 }
        { NODEFLAG_Z_BH_GRAFFITI_02 0 }
        { NODEFLAG_Z_BH_GRAFFITI_03 0 }
        { NODEFLAG_Z_BH_GRAFFITI_04 0 }
        { NODEFLAG_Z_BH_GRAFFITI_05 0 }
        { NODEFLAG_Z_BH_SCENE4A 1 }
        { NODEFLAG_Z_BH_BUSHES 1 }
        { NODEFLAG_Z_BH_CITYHALLGLASS 1 }
        { NODEFLAG_Z_BH_RAILS 1 }
        { NODEFLAG_Z_DT_HO_BARRIER 0 }
        { NODEFLAG_Z_DT_GREEN_BEFORE 1 }
        { NODEFLAG_Z_DT_GREEN_ROOF_BEFORE 1 }
        { NODEFLAG_Z_DT_GREEN_RAILS_BEFORE 1 }
        { NODEFLAG_Z_DT_NATAS_BEFORE 1 }
        { NODEFLAG_Z_DT_FREEWAY_KILLED 1 }
        { NODEFLAG_Z_DT_FREEWAY_CREATED 0 }
        { NODEFLAG_Z_DT_FREEWAY_PRECREATED 0 }
        { NODEFLAG_Z_DT_FIREESCAPE_KILLED 1 }
        { NODEFLAG_Z_DT_TOWER_SHADOW_KILLED 1 }
        { NODEFLAG_Z_DT_EL_BARRIER 1 }
        { NODEFLAG_Z_DT_VS_DOOR_BEFORE 1 }
        { NODEFLAG_Z_DT_EL_TRANSITION_ARROW_GREEN 0 }
        { NODEFLAG_Z_DT_VS_TRANSITION_ARROW_GREEN 0 }
        { NODEFLAG_Z_DT_STREET 0 }
        { NODEFLAG_Z_DT_WAIT 1 }
        { NODEFLAG_Z_DT_INITIALIZEGRAFFITIAREA_BEFORE 0 }
        { NODEFLAG_Z_DT_GREEN_ROOF_RAILS_AFTER 0 }
        { NODEFLAG_Z_DT_GREEN_ROOF_RAILS_BEFORE 1 }
        { NODEFLAG_Z_DT_GREEN_AFTER 0 }
        { NODEFLAG_Z_DT_GRAFFITI_01 0 }
        { NODEFLAG_Z_DT_GRAFFITI_02 0 }
        { NODEFLAG_Z_DT_GRAFFITI_03 0 }
        { NODEFLAG_Z_DT_GRAFFITI_04 0 }
        { NODEFLAG_Z_DT_GRAFFITI_05 0 }
        { NODEFLAG_Z_DT_FREEWAY_QPS_KILLED 1 }
        { NODEFLAG_Z_DT_FREEWAY_DEF 1 }
        { NODEFLAG_Z_DT_BELL_DEF 1 }
        { NODEFLAG_Z_DT_PYR_DEF 1 }
        { NODEFLAG_Z_DT_STREET_DEF 1 }
        { NODEFLAG_Z_DT_SCAF_DEF 1 }
        { NODEFLAG_Z_DT_TOWER_DEF 1 }
        { NODEFLAG_Z_EL_SPEAR_BEFORE 1 }
        { NODEFLAG_Z_EL_SPEAR_AFTER 0 }
        { NODEFLAG_Z_EL_SPEAR_AFTER2 0 }
        { NODEFLAG_Z_EL_SPEAR_AFTER3 0 }
        { NODEFLAG_Z_EL_SPEAR_AFTER4 0 }
        { NODEFLAG_Z_EL_SPEAR_AFTER5 0 }
        { NODEFLAG_Z_EL_BEFORE 1 }
        { NODEFLAG_Z_EL_AFTER 0 }
        { NODEFLAG_Z_EL_ELLVEVENT 1 }
        { NODEFLAG_Z_EL_PERMANENT_PEDS 1 }
        { Nodeflag_Z_EL_StartSprinklers01 1 }
        { NODEFLAG_Z_EL_TUNNEL01 1 }
        { NODEFLAG_Z_EL_LIMO_DEF 1 }
        { NODEFLAG_Z_EL_COUCH_DEF 1 }
        { NODEFLAG_Z_EL_CARPARTS_DEF 1 }
        { NODEFLAG_Z_EL_SHACK_DEF 1 }
        { NODEFLAG_Z_EL_SIGN_DEF 1 }
        { NODEFLAG_Z_EL_MATTRESS_DEF 1 }
        { NODEFLAG_EL_TransitionMarker 1 }
        { NODEFLAG_Z_EL_CHOPPERCHASE 0 }
        { NODEFLAG_Z_EL_SPEAR_PIPECOVER 0 }
        { NODEFLAG_Z_SR_FINALPROS 0 }
        { NODEFLAG_Z_SR_FINALPROS_DEF 0 }
        { NODEFLAG_Z_SR_CREW_UNLOCKSR 1 }
        { NODEFLAG_Z_SR_CREW_SR5 0 }
        { NODEFLAG_Z_SR_CREW_SKITCH 0 }
        { NODEFLAG_Z_SR_CREW_SR6 0 }
        { NODEFLAG_Z_SR_CREW_DINOIGC 0 }
        { NODEFLAG_Z_SR_CREW_BUYDINO 0 }
        { NODEFLAG_Z_SR_RAMP_START 1 }
        { NODEFLAG_Z_SR_RAMP_COMPLETE 0 }
        { NODEFLAG_Z_SR_RAMP_DEF_FREEWAY 0 }
        { NODEFLAG_Z_SR_HO_DINO_DEF 1 }
        { NODEFLAG_Z_SR_HO_DINO 0 }
        { NODEFLAG_Z_SR_HO_ROPES_DEF 1 }
        { NODEFLAG_Z_SR_HO_ROPES 0 }
        { NODEFLAG_Z_SR_HO_CAPTOP 0 }
        { NODEFLAG_Z_SR_HO_FAME 0 }
        { NODEFLAG_Z_SR_HO_TOWER_DEF 1 }
        { NODEFLAG_Z_SR_HO_TOWER 0 }
        { NODEFLAG_Z_SR_EL_LIMO 0 }
        { NODEFLAG_Z_SR_EL_LIMO_DEF 1 }
        { NODEFLAG_Z_SR_EL_COUCH 0 }
        { NODEFLAG_Z_SR_EL_COUCH_DEF 1 }
        { NODEFLAG_Z_SR_EL_CARPARTS 0 }
        { NODEFLAG_Z_SR_EL_CARPARTS_DEF 1 }
        { NODEFLAG_Z_SR_EL_SHACK 0 }
        { NODEFLAG_Z_SR_EL_SHACK_DEF 1 }
        { NODEFLAG_Z_SR_EL_SIGN 0 }
        { NODEFLAG_Z_SR_EL_SIGN_DEF 1 }
        { NODEFLAG_Z_SR_EL_OR_CONTROL 0 }
        { NODEFLAG_Z_SR_EL_OR_CONTROL_DEF 1 }
        { NODEFLAG_Z_SR_BH_STAR 0 }
        { NODEFLAG_Z_SR_BH_STAR_DEF 1 }
        { NODEFLAG_Z_SR_BH_ARCH 0 }
        { NODEFLAG_Z_SR_BH_ARCH_DEF 1 }
        { NODEFLAG_Z_SR_BH_GATE 0 }
        { NODEFLAG_Z_SR_BH_GATE_DEF 1 }
        { NODEFLAG_Z_SR_BH_RUBBLE 0 }
        { NODEFLAG_Z_SR_BH_RUBBLE_DEF 1 }
        { NODEFLAG_Z_SR_BH_DOME 0 }
        { NODEFLAG_Z_SR_BH_DOME_DEF 1 }
        { NODEFLAG_Z_SR_BH_SM_STAIRS 0 }
        { NODEFLAG_Z_SR_BH_SM_STAIRS_DEF 1 }
        { NODEFLAG_Z_SR_DT_FREEWAY 0 }
        { NODEFLAG_Z_SR_DT_FREEWAY_DEF 1 }
        { NODEFLAG_Z_SR_DT_BELL 0 }
        { NODEFLAG_Z_SR_DT_BELL_DEF 1 }
        { NODEFLAG_Z_SR_DT_LV_SLOT 0 }
        { NODEFLAG_Z_SR_DT_LV_SLOT_DEF 1 }
        { NODEFLAG_Z_SR_DT_PYR 0 }
        { NODEFLAG_Z_SR_DT_PYR_DEF 1 }
        { NODEFLAG_Z_SR_DT_PYRTOWER 0 }
        { NODEFLAG_Z_SR_DT_PYRSCAF 0 }
        { NODEFLAG_Z_SR_DT_PYRSTREET 0 }
        { NODEFLAG_Z_SR_DT_STREET 0 }
        { NODEFLAG_Z_SR_DT_STREET_DEF 1 }
        { NODEFLAG_Z_SR_DT_SCAF 0 }
        { NODEFLAG_Z_SR_DT_SCAF_DEF 1 }
        { NODEFLAG_Z_SR_DT_TOWER 0 }
        { NODEFLAG_Z_SR_DT_TOWER_DEF 1 }
        { NODEFLAG_Z_SR_SM_SCOPE 0 }
        { NODEFLAG_Z_SR_SM_SCOPE_OBJ 0 }
        { NODEFLAG_Z_SR_SM_SCOPE_DEF 1 }
        { NODEFLAG_Z_SR_SM_COURT 0 }
        { NODEFLAG_Z_SR_SM_COURT_DEF 1 }
        { NODEFLAG_Z_SR_SM_FERRIS 0 }
        { NODEFLAG_Z_SR_SM_FERRIS_DEF 1 }
        { NODEFLAG_Z_SR_SM_PACPARK 0 }
        { NODEFLAG_Z_SR_SM_PACPARK_DEF 1 }
        { NODEFLAG_Z_SR_SNAKE 0 }
        { NODEFLAG_Z_SR_SNAKE_DEF 1 }
        { NODEFLAG_Z_SR_CRANE 0 }
        { NODEFLAG_Z_SR_CRANE_DEF 1 }
        { NODEFLAG_Z_SR_CRANE_TOP 0 }
        { NODEFLAG_Z_SR_CRANE_SNAKE 0 }
        { NODEFLAG_Z_SR_CRANE_SNAKE_DEF 0 }
        { NODEFLAG_Z_SR_HO_WASTE 0 }
        { NODEFLAG_Z_SR_HO_WASTE_DEF 1 }
        { NODEFLAG_Z_OR_FLOOR 0 }
        { NODEFLAG_Z_OR_BALLS 0 }
        { NODEFLAG_Z_OR_BALLS_DEF 1 }
        { NODEFLAG_Z_OR_BH_FOUNTAIN 0 }
        { NODEFLAG_Z_OR_BH_FOUNTAIN_DEF 1 }
        { NODEFLAG_Z_OR_DERRICK 0 }
        { NODEFLAG_Z_OR_PIPE 0 }
        { NODEFLAG_Z_OR_PIPE_DEF 1 }
        { NODEFLAG_Z_OR_SM_MONSTER 0 }
        { NODEFLAG_Z_OR_SM_MONSTER_DEF 1 }
        { NODEFLAG_Z_LV_HO_LIFT 0 }
        { NODEFLAG_Z_LV_VATOR 0 }
        { NODEFLAG_Z_LV_VATOR_DEF 1 }
        { NODEFLAG_Z_LV_CROWN 0 }
        { NODEFLAG_Z_SR_CROWNWASTE 0 }
        { NODEFLAG_Z_LV_SPOT 0 }
        { NODEFLAG_Z_LV_WHEEL 0 }
        { NODEFLAG_Z_LV_ESCALATOR 0 }
        { NODEFLAG_Z_LV_ESCALATOR_DEF 1 }
        { NODEFLAG_Z_LV_OR_SIDEWALL 0 }
        { NODEFLAG_Z_LV_OR_SIDEWALL_DEF 1 }
        { NODEFLAG_Z_SR_EL_MATTRESS 0 }
        { NODEFLAG_Z_SR_EL_MATTRESS_DEF 1 }
        { NODEFLAG_Z_SM_COURTHOUSEROOF_BEFORE 1 }
        { NODEFLAG_Z_SM_COURTHOUSEROOF_AFTER 0 }
        { NODEFLAG_Z_SM_PACIFICPARK_BEFORE 1 }
        { NODEFLAG_Z_SM_PACIFICPARK_AFTER 0 }
        { NODEFLAG_Z_SM_LARGESTAIRSET_BEFORE 1 }
        { NODEFLAG_Z_SM_LARGESTAIRSET_AFTER 0 }
        { NODEFLAG_Z_SM_TELESCOPE_BEFORE 1 }
        { NODEFLAG_Z_SM_TELESCOPE_AFTER 0 }
        { NODEFLAG_Z_SM_FERRISAFRAME_BEFORE 1 }
        { NODEFLAG_Z_SM_FERRISAFRAME_AFTER 0 }
        { NODEFLAG_Z_SM_MONSTERHEAD_BEFORE 1 }
        { NODEFLAG_Z_SM_MONSTERHEAD_AFTER 0 }
        { NODEFLAG_Z_SM_INITIALIZEALLGOALS_BEFORE 1 }
        { NODEFLAG_Z_SM_GRAFFITI_01 0 }
        { NODEFLAG_Z_SM_GRAFFITI_02 0 }
        { NODEFLAG_Z_SM_GRAFFITI_03 0 }
        { NODEFLAG_Z_SM_GRAFFITI_04 0 }
        { NODEFLAG_Z_SM_GRAFFITI_05 0 }
        { NODEFLAG_PROS_UNLOCKED_BEFORE 1 }
        { NODEFLAG_PROS_UNLOCKED_AFTER 0 }
        { NODEFLAG_SMOI_Boat_After 0 }
        { NODEFLAG_SMOI_Boat1_After 0 }
        { NODEFLAG_SMOI_Boat2_After 0 }
        { NODEFLAG_SMOI_Boat3_After 0 }
        { NODEFLAG_SMOI_Boat4_After 0 }
        { NODEFLAG_SMOI_Boat5_After 0 }
        { NODEFLAG_SMOI_Billboard_Before 0 }
        { NODEFLAG_OI_CornerCut_before 1 }
        { NODEFLAG_OI_GasVent_before 1 }
        { NODEFLAG_OI_Grate_before 1 }
        { NODEFLAG_OI_Spheres_before 1 }
        { NODEFLAG_OI_Floor_Before 1 }
        { NODEFLAG_OI_LongPipe_Before 1 }
        { NODEFLAG_OI_ShortPipe_Before 1 }
        { NODEFLAG_OI_Derrick_Before 1 }
        { NODEFLAG_OI_CornerCut_after 0 }
        { NODEFLAG_OI_Grate_after 0 }
        { NODEFLAG_OI_Derrick_After 0 }
        { NODEFLAG_OI_Walkways_Before 1 }
        { NODEFLAG_OI_Walkways_After 0 }
        { NODEFLAG_OI_Transition_Before 1 }
        { NODEFLAG_OI_Transition_After 0 }
        { NODEFLAG_OI_Water_Before 1 }
        { NODEFLAG_OI_Water_After 0 }
        { NODEFLAG_OI_Elevator_After 0 }
        { NODEFLAG_OI_Elevator_Before 1 }
        { NODEFLAG_Z_LV_Bar_Before 1 }
        { NODEFLAG_Z_LV_Arches_Before 1 }
        { NODEFLAG_Z_LV_Escalator_Before 1 }
        { NODEFLAG_Z_LV_Elevator_Before 1 }
        { NODEFLAG_Z_LV_TwoQPs_Before 1 }
        { NODEFLAG_Z_LV_CarDisplay_Before 1 }
        { NODEFLAG_Z_LV_CashHang_Before 1 }
        { NODEFLAG_Z_LV_Roulette_table_Before 1 }
        { NODEFLAG_Z_LV_PoolSpotLight_Before 1 }
        { NODEFLAG_Z_LV_ROULETTE_PRE 1 }
        { NODEFLAG_Z_LV_ROULETTE_POST 0 }
        { NODEFLAG_Z_LV_ESCALATORS_PRE 1 }
        { NODEFLAG_Z_LV_ESCALATORS_POST 0 }
        { NODEFLAG_Z_LV_SPIDER_PRE 1 }
        { NODEFLAG_Z_LV_SPIDER_POST 0 }
        { NODEFLAG_Z_LV_PoolSpotLight_Before 1 }
        { NODEFLAG_Z_LV_ELEVATOR_PRE 1 }
        { NODEFLAG_Z_LV_ELEVATOR_POST 0 }
    ]
    GetArraySize flags
    i = 0
    begin 
    ChangeNodeFlag (<flags> [ <i> ])
    i = (<i> + 1)
    repeat <array_size>
endscript

script game_progress_set_non_story_mode_nodeflags 
    game_progress_set_initial_story_mode_nodeflags
    flags = [
        { NODEFLAG_PERMANENT_PEDS 0 }
        { NODEFLAG_GAMEMODE_MULTIPLAYER 1 }
        { NODEFLAG_GAMEMODE_STORY 0 }
        { NODEFLAG_Z_HO_DINO_BEFORE 1 }
        { NODEFLAG_Z_HO_DINO_BOARDS 1 }
        { NODEFLAG_Z_HO_DINO_BOARDS02 1 }
        { NODEFLAG_Z_HO_DINO_POOL_BEFORE 1 }
        { NODEFLAG_Z_HO_DINO_AFTER 0 }
        { NODEFLAG_Z_HO_DINO_BLDG_AFTER 0 }
        { NODEFLAG_Z_HO_DT_EVENT 1 }
        { NODEFLAG_Z_HO_DT_EVENT_AFTER 0 }
        { NODEFLAG_Z_HO_ElCAP_CLOSEDDOORS 1 }
        { NODEFLAG_Z_HO_ElCAP_OPENDOORS 0 }
        { NODEFLAG_Z_HO_TOWERWIRES 1 }
        { NODEFLAG_Z_HO_TOWERPIECE 1 }
        { NODEFLAG_Z_HO_TOWERSIGN 1 }
        { NODEFLAG_Z_HO_TOWERGLOW 1 }
        { NODEFLAG_Z_HO_RECORDARM 1 }
        { NODEFLAG_Z_HO_WALKOFFAME 1 }
        { NODEFLAG_Z_HO_CRANEPHASE1 1 }
        { NODEFLAG_Z_HO_CRANEPHASE2 0 }
        { NODEFLAG_Z_HO_CRANEPHASE3 0 }
        { NODEFLAG_Z_HO_CRANEPHASE4 0 }
        { NODEFLAG_Z_HO_PARKINGSIGN 1 }
        { NODEFLAG_Z_HO_CUTSCENELIGHTS 1 }
        { NODEFLAG_Z_HO_DINO_HEAD 0 }
        { NODEFLAG_Z_HO_GRAFFITI_01 0 }
        { NODEFLAG_Z_HO_GRAFFITI_02 0 }
        { NODEFLAG_Z_HO_GRAFFITI_03 0 }
        { NODEFLAG_Z_HO_GRAFFITI_04 0 }
        { NODEFLAG_Z_HO_GRAFFITI_05 0 }
        { NODEFLAG_Z_HO_ASSHOLE 0 }
        { NODEFLAG_Z_HO_HOLLYWOOD_SIGN 1 }
        { NODEFLAG_Z_DT_HO_BARRIER 0 }
        { NODEFLAG_Z_DT_GREEN_BEFORE 0 }
        { NODEFLAG_Z_DT_GREEN_ROOF_BEFORE 0 }
        { NODEFLAG_Z_DT_GREEN_RAILS_BEFORE 1 }
        { NODEFLAG_Z_DT_NATAS_BEFORE 1 }
        { NODEFLAG_Z_DT_FREEWAY_KILLED 0 }
        { NODEFLAG_Z_DT_FREEWAY_CREATED 1 }
        { NODEFLAG_Z_DT_FREEWAY_PRECREATED 1 }
        { NODEFLAG_Z_DT_FIREESCAPE_KILLED 1 }
        { NODEFLAG_Z_DT_TOWER_SHADOW_KILLED 0 }
        { NODEFLAG_Z_DT_EL_BARRIER 1 }
        { NODEFLAG_Z_DT_VS_DOOR_BEFORE 1 }
        { NODEFLAG_Z_DT_EL_TRANSITION_ARROW_GREEN 0 }
        { NODEFLAG_Z_DT_VS_TRANSITION_ARROW_GREEN 0 }
        { NODEFLAG_Z_DT_STREET 0 }
        { NODEFLAG_Z_DT_WAIT 1 }
        { NODEFLAG_Z_DT_INITIALIZEGRAFFITIAREA_BEFORE 0 }
        { NODEFLAG_Z_DT_GREEN_ROOF_RAILS_AFTER 0 }
        { NODEFLAG_Z_DT_GREEN_ROOF_RAILS_BEFORE 1 }
        { NODEFLAG_Z_DT_GREEN_AFTER 1 }
        { NODEFLAG_Z_DT_GRAFFITI_01 0 }
        { NODEFLAG_Z_DT_GRAFFITI_02 0 }
        { NODEFLAG_Z_DT_GRAFFITI_03 0 }
        { NODEFLAG_Z_DT_GRAFFITI_04 0 }
        { NODEFLAG_Z_DT_GRAFFITI_05 0 }
        { NODEFLAG_Z_DT_FREEWAY_QPS_KILLED 1 }
        { NODEFLAG_Z_BH_FOUNTAINPRE 0 }
        { NODEFLAG_Z_BH_FOUNTAINPOST 1 }
        { NODEFLAG_Z_BH_HOTELPOST 1 }
        { NODEFLAG_Z_BH_HOTELPRE 0 }
        { NODEFLAG_Z_BH_HOTELPRE_LOWERBREAK 0 }
        { NODEFLAG_Z_BH_HOTELLOWERBOUNCY_01 0 }
        { NODEFLAG_Z_BH_BHSRGATEPRE 0 }
        { NODEFLAG_Z_BH_BHSRGATEPOST 1 }
        { NODEFLAG_Z_BH_CITYHALLPRE 0 }
        { NODEFLAG_Z_BH_CITYHALLPOST 1 }
        { NODEFLAG_Z_BH_CITYHALLDURING 1 }
        { NODEFLAG_Z_BH_BHSM_TRANS_OPEN 0 }
        { NODEFLAG_Z_BH_BHSM_TRANS_LOCKED 0 }
        { NODEFLAG_Z_BH_BHSR_TRANS_OPEN 0 }
        { NODEFLAG_Z_BH_BHSR_TRANS_LOCKED 0 }
        { NODEFLAG_Z_BH_AWNINGPOST 0 }
        { NODEFLAG_Z_BH_AWNINGPRE 1 }
        { NODEFLAG_Z_BH_STAR_LEFT 0 }
        { NODEFLAG_Z_BH_STAR_RIGHT 0 }
        { NODEFLAG_Z_BH_CH_FLOOR_RIGHT 0 }
        { NODEFLAG_Z_BH_CH_FLOOR_LEFT 0 }
        { NODEFLAG_Z_BH_GASROOF 1 }
        { NODEFLAG_Z_BH_TONYPRO 0 }
        { NODEFLAG_Z_BHSMTRANSWARP 0 }
        { NODEFLAG_Z_BHSMMANUALPAD 0 }
        { NODEFLAG_Z_BHSM_DEAWONPOST 0 }
        { NODEFLAG_Z_BH_LADDER 1 }
        { NODEFLAG_Z_BH_GRAFFITI_01 0 }
        { NODEFLAG_Z_BH_GRAFFITI_02 0 }
        { NODEFLAG_Z_BH_GRAFFITI_03 0 }
        { NODEFLAG_Z_BH_GRAFFITI_04 0 }
        { NODEFLAG_Z_BH_GRAFFITI_05 0 }
        { NODEFLAG_Z_BH_SCENE4A 0 }
        { NODEFLAG_Z_BH_BUSHES 1 }
        { NODEFLAG_Z_BH_CITYHALLGLASS 1 }
        { NODEFLAG_Z_BH_RAILS 0 }
        { NODEFLAG_Z_LV_Bar_Before 1 }
        { NODEFLAG_Z_LV_Arches_Before 1 }
        { NODEFLAG_Z_LV_Escalator_Before 1 }
        { NODEFLAG_Z_LV_Elevator_Before 1 }
        { NODEFLAG_Z_LV_TwoQPs_Before 1 }
        { NODEFLAG_Z_LV_CarDisplay_Before 1 }
        { NODEFLAG_Z_LV_CashHang_Before 1 }
        { NODEFLAG_Z_LV_Roulette_table_Before 1 }
        { NODEFLAG_Z_LV_PoolSpotLight_Before 1 }
        { NODEFLAG_Z_LV_ROULETTE_PRE 1 }
        { NODEFLAG_Z_LV_ROULETTE_POST 0 }
        { NODEFLAG_Z_LV_ESCALATORS_PRE 1 }
        { NODEFLAG_Z_LV_ESCALATORS_POST 0 }
        { NODEFLAG_Z_LV_SPIDER_PRE 1 }
        { NODEFLAG_Z_LV_SPIDER_POST 0 }
        { NODEFLAG_Z_LV_PoolSpotLight_Before 1 }
        { NODEFLAG_Z_LV_ELEVATOR_PRE 1 }
        { NODEFLAG_Z_LV_ELEVATOR_POST 0 }
        { NODEFLAG_OI_CornerCut_before 1 }
        { NODEFLAG_OI_GasVent_before 1 }
        { NODEFLAG_OI_Grate_before 0 }
        { NODEFLAG_OI_Spheres_before 1 }
        { NODEFLAG_OI_Floor_Before 1 }
        { NODEFLAG_OI_LongPipe_Before 1 }
        { NODEFLAG_OI_ShortPipe_Before 1 }
        { NODEFLAG_OI_Derrick_Before 0 }
        { NODEFLAG_OI_Derrick_After 1 }
        { NODEFLAG_OI_CornerCut_after 0 }
        { NODEFLAG_OI_Grate_after 1 }
        { NODEFLAG_OI_Walkways_Before 1 }
        { NODEFLAG_OI_Walkways_After 0 }
        { NODEFLAG_OI_Transition_Before 1 }
        { NODEFLAG_OI_Transition_After 0 }
        { NODEFLAG_OI_Water_Before 0 }
        { NODEFLAG_OI_Water_After 1 }
        { NODEFLAG_OI_Elevator_After 1 }
        { NODEFLAG_OI_Elevator_Before 0 }
        { NODEFLAG_SMOI_Billboard_Before 0 }
        { NODEFLAG_Z_SM_COURTHOUSEROOF_BEFORE 1 }
        { NODEFLAG_Z_SM_COURTHOUSEROOF_AFTER 0 }
        { NODEFLAG_Z_SM_PACIFICPARK_BEFORE 1 }
        { NODEFLAG_Z_SM_PACIFICPARK_AFTER 0 }
        { NODEFLAG_Z_SM_LARGESTAIRSET_BEFORE 1 }
        { NODEFLAG_Z_SM_LARGESTAIRSET_AFTER 0 }
        { NODEFLAG_Z_SM_TELESCOPE_BEFORE 1 }
        { NODEFLAG_Z_SM_TELESCOPE_AFTER 0 }
        { NODEFLAG_Z_SM_FERRISAFRAME_BEFORE 1 }
        { NODEFLAG_Z_SM_FERRISAFRAME_AFTER 0 }
        { NODEFLAG_Z_SM_MONSTERHEAD_BEFORE 1 }
        { NODEFLAG_Z_SM_MONSTERHEAD_AFTER 0 }
        { NODEFLAG_Z_SM_INITIALIZEALLGOALS_BEFORE 1 }
        { NODEFLAG_Z_SM_GRAFFITI_01 0 }
        { NODEFLAG_Z_SM_GRAFFITI_02 0 }
        { NODEFLAG_Z_SM_GRAFFITI_03 0 }
        { NODEFLAG_Z_SM_GRAFFITI_04 0 }
        { NODEFLAG_Z_SM_GRAFFITI_05 0 }
        { NODEFLAG_PROS_UNLOCKED_BEFORE 1 }
        { NODEFLAG_PROS_UNLOCKED_AFTER 0 }
        { NODEFLAG_OI_Water_Before 1 }
        { NODEFLAG_Z_SR_FINALPROS 0 }
        { NODEFLAG_Z_SR_FINALPROS_DEF 0 }
        { NODEFLAG_Z_SR_CREW_UNLOCKSR 0 }
        { NODEFLAG_Z_SR_CREW_SR5 0 }
        { NODEFLAG_Z_SR_CREW_SKITCH 0 }
        { NODEFLAG_Z_SR_CREW_SR6 0 }
        { NODEFLAG_Z_SR_CREW_DINOIGC 0 }
        { NODEFLAG_Z_SR_CREW_BUYDINO 0 }
        { NODEFLAG_Z_SR_RAMP_START 0 }
        { NODEFLAG_Z_SR_RAMP_COMPLETE 1 }
        { NODEFLAG_Z_SR_RAMP_DEF_FREEWAY 0 }
        { NODEFLAG_Z_SR_HO_DINO_DEF 1 }
        { NODEFLAG_Z_SR_HO_DINO 0 }
        { NODEFLAG_Z_SR_HO_ROPES_DEF 0 }
        { NODEFLAG_Z_SR_HO_ROPES 1 }
        { NODEFLAG_Z_SR_HO_CAPTOP 0 }
        { NODEFLAG_Z_SR_HO_FAME 1 }
        { NODEFLAG_Z_SR_HO_TOWER_DEF 0 }
        { NODEFLAG_Z_SR_HO_TOWER 1 }
        { NODEFLAG_Z_SR_EL_LIMO 1 }
        { NODEFLAG_Z_SR_EL_LIMO_DEF 0 }
        { NODEFLAG_Z_SR_EL_COUCH 1 }
        { NODEFLAG_Z_SR_EL_COUCH_DEF 0 }
        { NODEFLAG_Z_SR_EL_CARPARTS 1 }
        { NODEFLAG_Z_SR_EL_CARPARTS_DEF 0 }
        { NODEFLAG_Z_SR_EL_SHACK 1 }
        { NODEFLAG_Z_SR_EL_SHACK_DEF 0 }
        { NODEFLAG_Z_SR_EL_SIGN 1 }
        { NODEFLAG_Z_SR_EL_SIGN_DEF 0 }
        { NODEFLAG_Z_SR_EL_OR_CONTROL 1 }
        { NODEFLAG_Z_SR_EL_OR_CONTROL_DEF 0 }
        { NODEFLAG_Z_SR_BH_STAR 1 }
        { NODEFLAG_Z_SR_BH_STAR_DEF 0 }
        { NODEFLAG_Z_SR_BH_ARCH 1 }
        { NODEFLAG_Z_SR_BH_ARCH_DEF 0 }
        { NODEFLAG_Z_SR_BH_GATE 1 }
        { NODEFLAG_Z_SR_BH_GATE_DEF 0 }
        { NODEFLAG_Z_SR_BH_RUBBLE 1 }
        { NODEFLAG_Z_SR_BH_RUBBLE_DEF 0 }
        { NODEFLAG_Z_SR_BH_DOME 1 }
        { NODEFLAG_Z_SR_BH_DOME_DEF 0 }
        { NODEFLAG_Z_SR_BH_SM_STAIRS 1 }
        { NODEFLAG_Z_SR_BH_SM_STAIRS_DEF 0 }
        { NODEFLAG_Z_SR_DT_FREEWAY 1 }
        { NODEFLAG_Z_SR_DT_FREEWAY_DEF 0 }
        { NODEFLAG_Z_SR_DT_BELL 1 }
        { NODEFLAG_Z_SR_DT_BELL_DEF 0 }
        { NODEFLAG_Z_SR_DT_LV_SLOT 1 }
        { NODEFLAG_Z_SR_DT_LV_SLOT_DEF 0 }
        { NODEFLAG_Z_SR_DT_PYR 1 }
        { NODEFLAG_Z_SR_DT_PYR_DEF 0 }
        { NODEFLAG_Z_SR_DT_PYRTOWER 1 }
        { NODEFLAG_Z_SR_DT_PYRSCAF 1 }
        { NODEFLAG_Z_SR_DT_PYRSTREET 1 }
        { NODEFLAG_Z_SR_DT_STREET 1 }
        { NODEFLAG_Z_SR_DT_STREET_DEF 0 }
        { NODEFLAG_Z_SR_DT_SCAF 1 }
        { NODEFLAG_Z_SR_DT_SCAF_DEF 0 }
        { NODEFLAG_Z_SR_DT_TOWER 1 }
        { NODEFLAG_Z_SR_DT_TOWER_DEF 0 }
        { NODEFLAG_Z_SR_SM_SCOPE 1 }
        { NODEFLAG_Z_SR_SM_SCOPE_OBJ 0 }
        { NODEFLAG_Z_SR_SM_SCOPE_DEF 0 }
        { NODEFLAG_Z_SR_SM_COURT 1 }
        { NODEFLAG_Z_SR_SM_COURT_DEF 0 }
        { NODEFLAG_Z_SR_SM_FERRIS 1 }
        { NODEFLAG_Z_SR_SM_FERRIS_DEF 0 }
        { NODEFLAG_Z_SR_SM_PACPARK 1 }
        { NODEFLAG_Z_SR_SM_PACPARK_DEF 0 }
        { NODEFLAG_Z_SR_SNAKE 1 }
        { NODEFLAG_Z_SR_SNAKE_DEF 0 }
        { NODEFLAG_Z_SR_CRANE 1 }
        { NODEFLAG_Z_SR_CRANE_DEF 0 }
        { NODEFLAG_Z_SR_CRANE_TOP 0 }
        { NODEFLAG_Z_SR_CRANE_SNAKE 0 }
        { NODEFLAG_Z_SR_CRANE_SNAKE_DEF 0 }
        { NODEFLAG_Z_SR_HO_WASTE 1 }
        { NODEFLAG_Z_SR_HO_WASTE_DEF 0 }
        { NODEFLAG_Z_OR_FLOOR 1 }
        { NODEFLAG_Z_OR_BALLS 1 }
        { NODEFLAG_Z_OR_BALLS_DEF 0 }
        { NODEFLAG_Z_OR_BH_FOUNTAIN 1 }
        { NODEFLAG_Z_OR_BH_FOUNTAIN_DEF 0 }
        { NODEFLAG_Z_OR_DERRICK 0 }
        { NODEFLAG_Z_OR_PIPE 1 }
        { NODEFLAG_Z_OR_PIPE_DEF 0 }
        { NODEFLAG_Z_OR_SM_MONSTER 1 }
        { NODEFLAG_Z_OR_SM_MONSTER_DEF 0 }
        { NODEFLAG_Z_LV_HO_LIFT 1 }
        { NODEFLAG_Z_LV_VATOR 1 }
        { NODEFLAG_Z_LV_VATOR_DEF 0 }
        { NODEFLAG_Z_LV_CROWN 1 }
        { NODEFLAG_Z_SR_CROWNWASTE 1 }
        { NODEFLAG_Z_LV_SPOT 1 }
        { NODEFLAG_Z_LV_WHEEL 1 }
        { NODEFLAG_Z_LV_ESCALATOR 1 }
        { NODEFLAG_Z_LV_ESCALATOR_DEF 0 }
        { NODEFLAG_Z_LV_OR_SIDEWALL 1 }
        { NODEFLAG_Z_LV_OR_SIDEWALL_DEF 0 }
        { NODEFLAG_Z_SR_EL_MATTRESS 0 }
        { NODEFLAG_Z_SR_EL_MATTRESS_DEF 1 }
        { NODEFLAG_Z_EL_SPEAR_BEFORE 0 }
        { NODEFLAG_Z_EL_SPEAR_AFTER 1 }
        { NODEFLAG_Z_EL_SPEAR_AFTER2 1 }
        { NODEFLAG_Z_EL_SPEAR_AFTER3 0 }
        { NODEFLAG_Z_EL_SPEAR_AFTER4 0 }
        { NODEFLAG_Z_EL_SPEAR_AFTER5 0 }
        { NODEFLAG_Z_EL_BEFORE 0 }
        { NODEFLAG_Z_EL_AFTER 1 }
        { NODEFLAG_Z_EL_ELLVEVENT 0 }
        { NODEFLAG_Z_EL_PERMANENT_PEDS 1 }
        { Nodeflag_Z_EL_StartSprinklers01 0 }
        { NODEFLAG_Z_EL_TUNNEL01 0 }
        { NODEFLAG_Z_EL_LIMO_DEF 0 }
        { NODEFLAG_Z_EL_COUCH_DEF 0 }
        { NODEFLAG_Z_EL_CARPARTS_DEF 0 }
        { NODEFLAG_Z_EL_SHACK_DEF 0 }
        { NODEFLAG_Z_EL_SIGN_DEF 0 }
        { NODEFLAG_Z_EL_MATTRESS_DEF 0 }
        { NODEFLAG_EL_TransitionMarker 0 }
        { NODEFLAG_Z_EL_CHOPPERCHASE 0 }
    ]
    GetArraySize flags
    i = 0
    begin 
    ChangeNodeFlag (<flags> [ <i> ])
    i = (<i> + 1)
    repeat <array_size>
endscript
chapter_info_show_all_story_goals = 0
chapter_info_hide_unknown_goals = 0

script chapter_info_register_structure 
    CareerFunc func = RegisterAtomicStructure params = {
        [
            {
                name = change_your_hair
                atom_goal = Z_HO_Goal_Gaps15
                ui_params = {
                    view_goals_text = 'Geh zum Friseur.'
                }
            }
            {
                name = give_initial_cash
                atom_script = game_progress_add_cash
                ui_params = {
                    view_goals_text = 'Geh zum Friseur.'
                }
                atom_params = {
                    cash = 120
                }
            }
            {
                name = start_change_look
                atom_script = game_progress_start_goal
                ui_params = {
                    view_goals_text = 'Geh zum Friseur.'
                }
                atom_params = {
                    cd_only
                    name = Z_HO_Goal_Gaps15
                }
            }
            {
                name = change_your_clothes
                atom_goal = Z_HO_Goal_Gaps30
                ui_params = {
                    view_goals_text = 'Geh zum Klamottenladen.'
                }
                depends_on = [
                    {
                        atom = change_your_hair
                    }
                ]
            }
            {
                name = set_initial_states
                atom_script = chapter_1_startup
            }
            {
                name = scene2
                atom_cutscene = 'cutscenes\HO_2.cut'
                atom_params = { 
                achievement
                 }
                depends_on = [
                    {
                        atom = change_your_clothes
                    }
                ]
            }
            {
                name = save_prompt1
                atom_script = game_progress_save_prompt
                depends_on = [
                    {
                        atom = scene2
                    }
                ]
            }
            {
                name = learn_caveman
                ui_params = {
                    debug_menu_text = 'Lerne den Caveman.'
                    view_goals_text = 'Lerne von den Hollywood-Skatern.'
                }
                atom_goal = z_ho_goal_counter
                depends_on = [
                    {
                        atom = scene2
                    }
                ]
            }
            {
                name = get_sponsored
                ui_params = {
                    debug_menu_text = 'Gewinn Sponsoren.'
                    view_goals_text = 'Geh zum Skateshop und gewinn eine Sponsoren-Challenge.'
                }
                atom_goal = z_ho_goal_gaps31
                depends_on = [
                    {
                        atom = learn_caveman
                    }
                ]
            }
            {
                name = Message_from_Mindy1
                atom_script = game_progress_send_pager_message
                ui_params = {
                    view_goals_text = 'Triff Mindy beim Skateshop.'
                }
                atom_params = {
                    send_delay = 0
                    text = {
                        from = 'Mindy'
                        message = 'Wenn das Handy-Symbol erscheint, drück (\b8) und wähle \'Nachrichten\'.\nTriff mich beim Skateshop. Sieh nach meinem \c7 rosa Stern \c0 im \c4 Kompass \c0 oben im Bild. Mit \b8 rufst du die \c4 Karte \c0 auf, die dir zeigt, wo du Geld verdienen, BMX fahren und Missionen finden kannst.'
                        priority_message
                    }
                }
                depends_on = [
                    {
                        atom = get_sponsored
                    }
                ]
            }
            {
                name = kickflip_whofleck
                ui_params = {
                    debug_menu_text = 'Mach einen Kickflip an Whofleck.'
                    view_goals_text = 'Kickflip an Ben Whofleck'
                }
                atom_goal = z_ho_goal_gaps2
                depends_on = [
                    {
                        atom = get_sponsored
                    }
                ]
            }
            {
                name = learn_revert
                ui_params = {
                    debug_menu_text = 'Lerne den Revert.'
                    view_goals_text = 'Triff Duane beim Dog and Cello.'
                }
                atom_goal = z_ho_goal_counter4
                depends_on = [
                    {
                        atom = kickflip_whofleck
                    }
                ]
            }
            {
                name = beat_skater
                atom_goal = z_ho_goal_gaps5
                ui_params = {
                    debug_menu_text = 'Schlage den Skater'
                    view_goals_text = 'Mach den Skater-Punk fertig.'
                }
                depends_on = [
                    {
                        atom = learn_revert
                    }
                ]
            }
            {
                name = scene3
                ui_params = {
                    view_goals_text = 'Fahr nach Beverly Hills.'
                }
                atom_cutscene = 'cutscenes\HO_3.cut'
                depends_on = [
                    {
                        atom = beat_skater
                    }
                ]
            }
            {
                name = give_stuff_cash
                atom_script = game_progress_add_cash
                ui_params = {
                    view_goals_text = 'Fahr nach Beverly Hills.'
                }
                atom_params = {
                    cash = 20
                }
                depends_on = [
                    {
                        atom = scene3
                    }
                ]
            }
            {
                name = save_prompt3
                ui_params = {
                    view_goals_text = 'Stoppe die Wolle-Demo!'
                }
                atom_script = game_progress_save_prompt
                depends_on = [
                    {
                        atom = give_stuff_cash
                    }
                ]
            }
            {
                name = unlock_bh
                atom_goal = z_ho_goal_HIghCombo
                ui_params = {
                    debug_menu_text = 'Dino-Ziel'
                    view_goals_text = 'Stoppe die Wolle-Demo!'
                }
                depends_on = [
                    {
                        atom = scene3
                    }
                ]
            }
            {
                name = story_unlock_bh
                atom_script = game_progress_unlock_level
                atom_params = {
                    level = Load_Z_BH
                }
                ui_params = {
                    debug_menu_text = 'BH freischalten'
                    debug_require_level = Load_Z_HO
                }
                depends_on = [
                    {
                        atom = unlock_bh
                    }
                ]
            }
            {
                name = dino_levelevent_igc
                atom_script = game_progress_process_igc
                atom_params = {
                    scene = M_ZHOHIGHCOMBO3_SUCCESS_igc_scene
                    pak = 'M_ZHOHIGHCOMBO3_SUCCESS'
                    folder = 'missions/worldzones/M_ZHOHIGHCOMBO3/M_ZHOHIGHCOMBO3_SUCCESS'
                }
                depends_on = [
                    {
                        atom = story_unlock_bh
                    }
                ]
            }
            {
                name = dino_levelevent
                atom_cutscene = 'cutscenes\HO_LevelEvent_Dino.cut'
                depends_on = [
                    {
                        atom = dino_levelevent_igc
                    }
                ]
            }
            {
                name = mindy_meet_at_ranch
                atom_script = game_progress_process_igc
                atom_params = {
                    scene = igc_scene_mindy_post_dino
                    pak = 'Z_HO_Post_Dino'
                    folder = 'pak/igc/z_ho_post_dino'
                }
                depends_on = [
                    {
                        atom = dino_levelevent
                    }
                ]
            }
            {
                name = save_prompt4
                atom_script = game_progress_save_prompt
                depends_on = [
                    {
                        atom = mindy_meet_at_ranch
                    }
                ]
            }
            {
                name = send_text_Sirius1
                atom_script = game_progress_play_audio_clip
                atom_params = {
                    wav = sirius1
                }
                depends_on = [
                    {
                        atom = mindy_meet_at_ranch
                    }
                    {
                        level_is = Load_Z_BH
                    }
                ]
            }
            {
                name = scene4
                atom_cutscene = 'cutscenes\BH_4.cut'
                depends_on = [
                    {
                        flag = STORY_MODE_TRIGGER1
                    }
                    {
                        flag = LEVEL_VISITED_STORY
                        level = Load_Z_BH
                    }
                ]
            }
            {
                name = Go_To_BH
                atom_monitor
                ui_params = {
                    view_goals_text = 'Finde Mindy in Beverly Hills.'
                }
                depends_on = [
                    {
                        atom = story_unlock_bh
                        state = complete
                    }
                    {
                        atom = scene4
                        state = locked
                    }
                ]
            }
            {
                name = bh_intro_igc
                atom_script = game_progress_process_igc
                atom_params = {
                    scene = igc_scene_BH_MindySkateRanch_Intro
                    pak = 'Z_BH_Intro'
                    folder = 'pak/igc/z_bh_intro'
                    heap = bottomupheap
                }
                depends_on = [
                    {
                        atom = scene4
                    }
                ]
            }
            {
                name = bh_intro_cleanup
                atom_script = game_progress_change_nodeflags
                atom_params = {
                    nodeflags = [
                        { NODEFLAG_Z_BH_SCENE4A 0 }
                    ]
                }
                depends_on = [
                    {
                        atom = bh_intro_igc
                    }
                ]
            }
            {
                name = learn_group1
                atom_goals = [
                    z_bh_goal_counter3
                    z_bh_goal_counter
                    z_bh_goal_gaps
                    z_bh_goal_counter5
                    z_bh_goal_counter13
                ]
                ui_params = {
                    debug_menu_text = 'Learn goals, group 1'
                    view_goals_text = 'Lern ein paar Grundlagen!'
                }
                depends_on = [
                    {
                        atom = bh_intro_igc
                    }
                ]
            }
            {
                name = Mindy_text_learn_complete
                atom_script = game_progress_send_pager_message
                atom_params = {
                    send_delay = 0
                    text = {
                        from = 'Mindy'
                        message = 'Die Skills hattest du schnell drauf. Du könntest ein paar Sponsoren-Challenges machen, bevor du Boone, Dave und Murphy in Beverly Hills suchst. Verdien dir so viele Stats wie möglich, wenn du hier in L.A. klarkommen willst.'
                    }
                }
                depends_on = [
                    {
                        atom = learn_group1
                    }
                ]
            }
            {
                name = boone_spine_transfer
                ui_params = {
                    debug_menu_text = 'Boone-Ziel'
                }
                atom_goal = z_bh_goal_gaps22
                depends_on = [
                    {
                        atom = learn_group1
                    }
                ]
            }
            {
                name = dave_wallplant
                atom_goal = z_bh_goal_gaps24
                ui_params = {
                    debug_menu_text = 'Dave-Ziel'
                }
                depends_on = [
                    {
                        atom = learn_group1
                    }
                ]
            }
            {
                name = murphy_wallflip
                atom_goal = z_bh_goal_gaps23
                ui_params = {
                    debug_menu_text = 'Murphy-Ziel'
                }
                depends_on = [
                    {
                        atom = learn_group1
                    }
                ]
            }
            {
                name = story_unlock_sr
                atom_script = game_progress_unlock_level
                atom_params = {
                    level = Load_Z_SR
                    nodeflags = [
                        { NODEFLAG_Z_BH_BHSRGATEPRE 0 }
                        { NODEFLAG_Z_BH_BHSRGATEPOST 1 }
                        { NODEFLAG_Z_BH_BHSR_TRANS_OPEN 1 }
                    ]
                }
                ui_params = {
                    view_goals_text = 'Fahr rauf zur Skate-Ranch.'
                    debug_menu_text = 'SR freischalten'
                }
                depends_on = [
                    {
                        depend_func = count
                        count = [
                            1
                            2
                            3
                        ]
                        atoms = [
                            murphy_wallflip
                            dave_wallplant
                            boone_spine_transfer
                        ]
                    }
                ]
            }
            {
                name = Impress_friends_notification
                atom_monitor
                ui_params = {
                    view_goals_text = 'Beeindrucke Mindys Freunde.'
                }
                depends_on = [
                    {
                        atom = learn_group1
                        state = complete
                    }
                    {
                        atom = story_unlock_sr
                        state = locked
                    }
                ]
            }
            {
                name = lock_remaining_bh_goals
                atom_script = game_progress_process_goal_lock
                atom_params = {
                    lock = 1
                    goals = [
                        z_bh_goal_gaps22
                        z_bh_goal_gaps23
                        z_bh_goal_gaps24
                    ]
                }
                depends_on = [
                    {
                        atom = story_unlock_sr
                    }
                ]
            }
            {
                name = bh_ranch_igc_setup
                atom_script = game_progress_change_nodeflags
                atom_params = {
                    nodeflags = [
                        { NODEFLAG_Z_BH_SCENE4A 1 }
                    ]
                }
                depends_on = [
                    {
                        atom = lock_remaining_bh_goals
                    }
                ]
            }
            {
                name = bh_ranch_igc
                atom_script = game_progress_process_igc
                ui_params = {
                    view_goals_text = 'Fahr rauf zur Skate-Ranch.'
                }
                atom_params = {
                    scene = igc_scene_BH_Crew_goes_to_Ranch_Intro
                    pak = 'Z_BH_Ranch'
                    folder = 'pak/igc/z_bh_ranch'
                    heap = bottomupheap
                }
                depends_on = [
                    {
                        atom = bh_ranch_igc_setup
                    }
                ]
            }
            {
                name = bh_ranch_igc_cleanup
                ui_params = {
                    view_goals_text = 'Fahr rauf zur Skate-Ranch.'
                }
                atom_script = game_progress_change_nodeflags
                atom_params = {
                    nodeflags = [
                        { NODEFLAG_Z_BH_SCENE4A 0 }
                    ]
                }
                depends_on = [
                    {
                        atom = bh_ranch_igc
                    }
                ]
            }
            {
                name = save_prompt5
                ui_params = {
                    view_goals_text = 'Fahr rauf zur Skate-Ranch.'
                }
                atom_script = game_progress_save_prompt
                depends_on = [
                    {
                        atom = bh_ranch_igc_cleanup
                    }
                ]
            }
            {
                name = scene5
                atom_cutscene = 'cutscenes\SR_5.cut'
                atom_params = { 
                achievement
                 }
                ui_params = {
                    view_goals_text = 'Fahr rauf zur Skate-Ranch.'
                }
                depends_on = [
                    {
                        atom = bh_ranch_igc_cleanup
                    }
                    {
                        flag = LEVEL_VISITED_STORY
                        level = Load_Z_SR
                    }
                ]
            }
            {
                name = Skate_Ranch_notification
                atom_monitor
                ui_params = {
                    view_goals_text = 'Fahr rauf zur Skate-Ranch.'
                }
                depends_on = [
                    {
                        atom = bh_ranch_igc
                        state = complete
                    }
                    {
                        atom = scene5
                        state = locked
                    }
                ]
            }
            {
                name = sr_ranch_crew_node1
                atom_script = game_progress_change_nodeflags
                ui_params = {
                    debug_menu_text = 'sr_ranch_crew_node1'
                }
                atom_params = {
                    nodeflags = [
                        { NODEFLAG_Z_SR_CREW_UNLOCKSR 0 }
                        { NODEFLAG_Z_SR_CREW_BUYDINO 0 }
                        { NODEFLAG_Z_SR_CREW_SKITCH 0 }
                        { NODEFLAG_Z_SR_CREW_SR5 1 }
                        { NODEFLAG_Z_SR_CREW_SR6 0 }
                        { NODEFLAG_Z_SR_CREW_DINOIGC 0 }
                    ]
                }
                depends_on = [
                    {
                        atom = scene5
                    }
                ]
            }
            {
                name = skitch_dog
                ui_params = {
                    debug_menu_text = 'Skitche an Sanchez.'
                    view_goals_text = 'Skitche am Hund bis nach Hollywood.'
                }
                atom_goal = Z_SR_GOAL_GAPS
                depends_on = [
                    {
                        atom = scene5
                    }
                ]
            }
            {
                name = sr_ranch_crew_node2
                atom_script = game_progress_change_nodeflags
                ui_params = {
                    debug_menu_text = 'sr_ranch_crew_node2'
                    view_goals_text = 'Skitche am Hund bis nach Hollywood.'
                }
                atom_params = {
                    nodeflags = [
                        { NODEFLAG_Z_SR_CREW_UNLOCKSR 0 }
                        { NODEFLAG_Z_SR_CREW_BUYDINO 0 }
                        { NODEFLAG_Z_SR_CREW_SKITCH 1 }
                        { NODEFLAG_Z_SR_CREW_SR5 0 }
                        { NODEFLAG_Z_SR_CREW_SR6 0 }
                        { NODEFLAG_Z_SR_CREW_DINOIGC 0 }
                    ]
                }
                depends_on = [
                    {
                        atom = skitch_dog
                    }
                ]
            }
            {
                name = scene6a
                atom_cutscene = 'cutscenes\SR_6a.cut'
                atom_params = {
                    unload = 1
                    reload = 0
                }
                depends_on = [
                    {
                        atom = skitch_dog
                    }
                ]
            }
            {
                name = scene6
                atom_cutscene = 'cutscenes\SR_6.cut'
                atom_params = {
                    unload = 0
                    reload = 1
                }
                depends_on = [
                    {
                        atom = scene6a
                    }
                ]
            }
            {
                name = skitch_sanchez_notification
                atom_monitor
                ui_params = {
                    view_goals_text = 'Skitche an Sanchez bis nach Hollywood.'
                }
                depends_on = [
                    {
                        atom = scene5
                        state = complete
                    }
                    {
                        atom = scene6
                        state = locked
                    }
                ]
            }
            {
                name = sr_ranch_crew_node3
                atom_script = game_progress_change_nodeflags
                ui_params = {
                    debug_menu_text = 'sr_ranch_crew_node3'
                }
                atom_params = {
                    nodeflags = [
                        { NODEFLAG_Z_SR_CREW_UNLOCKSR 0 }
                        { NODEFLAG_Z_SR_CREW_BUYDINO 0 }
                        { NODEFLAG_Z_SR_CREW_SKITCH 0 }
                        { NODEFLAG_Z_SR_CREW_SR5 0 }
                        { NODEFLAG_Z_SR_CREW_SR6 1 }
                        { NODEFLAG_Z_SR_CREW_DINOIGC 0 }
                    ]
                }
                depends_on = [
                    {
                        atom = scene6
                    }
                ]
            }
            {
                name = save_prompt6
                atom_script = game_progress_save_prompt
                depends_on = [
                    {
                        atom = scene6
                    }
                ]
            }
            {
                name = learn_bert
                ui_params = {
                    debug_menu_text = 'Lerne den Bert-Trick.'
                    view_goals_text = 'Lerne den Bert Slide von Iggy.'
                }
                atom_goal = Z_SR_Goal_Gaps2
                depends_on = [
                    {
                        atom = scene6
                    }
                ]
            }
            {
                name = murphy_get_dino
                ui_params = {
                    debug_menu_text = 'Murphy Dino IGC'
                    view_goals_text = 'Kaufe den T-Rex in Hollywood.'
                }
                atom_script = game_progress_process_igc
                atom_params = {
                    scene = igc_scene_Murphy_Gets_Dino
                    pak = 'Z_SR_Get_Dino'
                    folder = 'pak/igc/z_sr_get_dino'
                }
                depends_on = [
                    {
                        atom = learn_bert
                    }
                ]
            }
            {
                name = learn_bert_notification
                atom_monitor
                ui_params = {
                    view_goals_text = 'Lerne von Iggy den Bert Slide.'
                }
                depends_on = [
                    {
                        atom = scene6
                        state = complete
                    }
                    {
                        atom = murphy_get_dino
                        state = locked
                    }
                ]
            }
            {
                name = sr_ranch_crew_node4
                atom_script = game_progress_change_nodeflags
                ui_params = {
                    debug_menu_text = 'sr_ranch_crew_node4'
                }
                atom_params = {
                    nodeflags = [
                        { NODEFLAG_Z_SR_CREW_UNLOCKSR 0 }
                        { NODEFLAG_Z_SR_CREW_BUYDINO 0 }
                        { NODEFLAG_Z_SR_CREW_SKITCH 0 }
                        { NODEFLAG_Z_SR_CREW_SR5 0 }
                        { NODEFLAG_Z_SR_CREW_SR6 0 }
                        { NODEFLAG_Z_SR_CREW_DINOIGC 1 }
                    ]
                }
                depends_on = [
                    {
                        atom = murphy_get_dino
                    }
                ]
            }
            {
                name = buy_dino_head
                atom_goal = Z_HO_GOAL_GAPS23
                ui_params = {
                    debug_menu_text = 'Kauf den Dino-Kopf.'
                    view_goals_text = 'Kauf den T-Rex in Hollywood.'
                }
                depends_on = [
                    {
                        atom = murphy_get_dino
                    }
                ]
            }
            {
                name = buy_dino_notification
                atom_monitor
                ui_params = {
                    view_goals_text = 'Kauf den T-Rex in Hollywood.'
                }
                depends_on = [
                    {
                        atom = murphy_get_dino
                        state = complete
                    }
                    {
                        atom = buy_dino_head
                        state = locked
                    }
                ]
            }
            {
                name = sr_ranch_crew_node5
                atom_script = game_progress_change_nodeflags
                ui_params = {
                    debug_menu_text = 'sr_ranch_crew_node5'
                }
                atom_params = {
                    nodeflags = [
                        { NODEFLAG_Z_SR_CREW_UNLOCKSR 0 }
                        { NODEFLAG_Z_SR_CREW_BUYDINO 1 }
                        { NODEFLAG_Z_SR_CREW_SKITCH 0 }
                        { NODEFLAG_Z_SR_CREW_SR5 0 }
                        { NODEFLAG_Z_SR_CREW_SR6 0 }
                        { NODEFLAG_Z_SR_CREW_DINOIGC 0 }
                    ]
                }
                depends_on = [
                    {
                        atom = buy_dino_head
                    }
                ]
            }
            {
                name = Mindy_text_dino
                atom_script = game_progress_send_pager_message
                ui_params = {
                    view_goals_text = 'Fahr zurück zur Skate-Ranch.'
                }
                atom_params = {
                    send_delay = 0
                    text = {
                        from = 'Mindy'
                        message = 'Fahr zurück zur Skate-Ranch. Der große Kran wird gerade bei Iggy aufgestellt.'
                    }
                }
                depends_on = [
                    {
                        atom = buy_dino_head
                    }
                ]
            }
            {
                name = ERECT_CRANE
                ui_params = {
                    debug_menu_text = 'STELL DEN KRAN AUF'
                    view_goals_text = 'Fahr zurück zur Skate-Ranch.'
                }
                atom_script = game_progress_change_nodeflags
                atom_params = {
                    nodeflags = [
                        { NODEFLAG_Z_SR_CRANE 1 }
                        { NODEFLAG_Z_SR_CRANE_DEF 0 }
                        { NODEFLAG_Z_SR_CRANE_TOP 1 }
                        { NODEFLAG_Z_SR_CRANE_SNAKE 1 }
                    ]
                }
                depends_on = [
                    {
                        atom = Mindy_text_dino
                    }
                ]
            }
            {
                name = SR_LevelEvent
                atom_cutscene = 'cutscenes\SR_LevelEvent.cut'
                depends_on = [
                    {
                        atom = buy_dino_head
                    }
                    {
                        level_is = Load_Z_SR
                    }
                ]
            }
            {
                name = murphy_mindy_dino_drop
                ui_params = {
                    debug_menu_text = 'Dino Drop IGC'
                }
                atom_script = game_progress_process_igc
                atom_params = {
                    scene = igc_scene_Dino_Drop
                    pak = 'Z_SR_Dino_Drop'
                    folder = 'pak/igc/z_sr_dino_drop'
                }
                depends_on = [
                    {
                        atom = SR_LevelEvent
                    }
                ]
            }
            {
                name = go_back_to_ranch_notification
                atom_monitor
                ui_params = {
                    view_goals_text = 'Fahr zurück zur Skate-Ranch.'
                }
                depends_on = [
                    {
                        atom = buy_dino_head
                        state = complete
                    }
                    {
                        atom = murphy_mindy_dino_drop
                        state = locked
                    }
                ]
            }
            {
                name = save_prompt7
                ui_params = {
                    view_goals_text = 'Besorg das 69er Schild in Beverly Hills.'
                }
                atom_script = game_progress_save_prompt
                depends_on = [
                    {
                        atom = murphy_mindy_dino_drop
                    }
                ]
            }
            {
                name = sr_ranch_crew_node6
                atom_script = game_progress_change_nodeflags
                ui_params = {
                    debug_menu_text = 'sr_ranch_crew_node6'
                    view_goals_text = 'Besorg das 69er Schild in Beverly Hills.'
                }
                atom_params = {
                    nodeflags = [
                        { NODEFLAG_Z_SR_CREW_UNLOCKSR 0 }
                        { NODEFLAG_Z_SR_CREW_BUYDINO 0 }
                        { NODEFLAG_Z_SR_CREW_SKITCH 0 }
                        { NODEFLAG_Z_SR_CREW_SR5 0 }
                        { NODEFLAG_Z_SR_CREW_SR6 0 }
                        { NODEFLAG_Z_SR_CREW_DINOIGC 0 }
                    ]
                }
                depends_on = [
                    {
                        atom = murphy_mindy_dino_drop
                    }
                    {
                        level_is = Load_Z_BH
                    }
                ]
            }
            {
                name = Gas_station_sign
                atom_goal = Z_BH_GOAL_GAPS5
                ui_params = {
                    debug_menu_text = 'Tankstellen-Schild'
                    view_goals_text = 'Besorg das 69er Schild in Beverly Hills.'
                }
                depends_on = [
                    {
                        atom = murphy_mindy_dino_drop
                    }
                ]
            }
            {
                name = BH_smallEvent
                atom_cutscene = 'cutscenes\BH_SmallEvent.cut'
                depends_on = [
                    {
                        atom = Gas_station_sign
                    }
                ]
            }
            {
                name = Get_the_69_sign_notification
                atom_monitor
                ui_params = {
                    view_goals_text = 'Besorg das 69er Schild in Beverly Hills.'
                }
                depends_on = [
                    {
                        atom = murphy_mindy_dino_drop
                        state = complete
                    }
                    {
                        atom = BH_smallEvent
                        state = locked
                    }
                ]
            }
            {
                name = bh_gassign_igc_setup
                atom_script = game_progress_change_nodeflags
                atom_params = {
                    nodeflags = [
                        { NODEFLAG_Z_BH_SCENE4A 1 }
                    ]
                }
                depends_on = [
                    {
                        atom = BH_smallEvent
                    }
                ]
            }
            {
                name = bh_gassign_igc
                ui_params = {
                    debug_menu_text = 'Gas Station Post IGC'
                }
                atom_script = game_progress_process_igc
                atom_params = {
                    scene = igc_scene_BH_Post_gas_sign
                    pak = 'Z_BH_Gassign'
                    folder = 'pak/igc/z_bh_gassign'
                    heap = bottomupheap
                }
                depends_on = [
                    {
                        atom = bh_gassign_igc_setup
                    }
                ]
            }
            {
                name = bh_gassign_igc_cleanup
                atom_script = game_progress_change_nodeflags
                atom_params = {
                    nodeflags = [
                        { NODEFLAG_Z_BH_SCENE4A 0 }
                    ]
                }
                depends_on = [
                    {
                        atom = bh_gassign_igc
                    }
                ]
            }
            {
                name = save_prompt8
                ui_params = {
                    view_goals_text = 'Besorg Teile für die Skate-Ranch!'
                }
                atom_script = game_progress_save_prompt
                depends_on = [
                    {
                        atom = bh_gassign_igc_cleanup
                    }
                ]
            }
            {
                name = get_group1
                atom_goals = [
                    Z_HO_GOAL_GAPS7
                    Z_HO_GOAL_GAPS17
                    Z_HO_GOAL_GAPS20
                    Z_HO_GOAL_GAPS13
                    Z_BH_GOAL_GAPS3
                    Z_BH_GOAL_TETRIS
                    Z_HO_GOAL_GAPS19
                    Z_BH_GOAL_GAPS14
                ]
                ui_params = {
                    debug_menu_text = 'Get goals, group 1'
                    view_goals_text = 'Besorg Teile in Beverly Hills und Hollywood.'
                }
                depends_on = [
                    {
                        atom = bh_gassign_igc
                    }
                ]
            }
            {
                name = dt_levelevent_igc
                atom_script = game_progress_process_igc
                atom_params = {
                    scene = igc_scene_M_ZHOGAPS13_Success
                    pak = 'M_ZHOGAPS13_SUCCESS'
                    folder = 'missions/worldzones/M_ZHOGAPS13/M_ZHOGAPS13_SUCCESS'
                }
                depends_on = [
                    {
                        goal = Z_HO_GOAL_GAPS13
                    }
                ]
            }
            {
                name = dt_levelevent
                atom_cutscene = 'cutscenes\HO_LevelEvent_Rocket.cut'
                depends_on = [
                    {
                        atom = dt_levelevent_igc
                    }
                ]
            }
            {
                name = Get_pieces_in_BN_HO_notification
                atom_monitor
                ui_params = {
                    view_goals_text = 'Besorg Teile in Beverly Hills und Hollywood.'
                }
                depends_on = [
                    {
                        atom = BH_smallEvent
                        state = complete
                    }
                    {
                        atom = dt_levelevent
                        state = locked
                    }
                ]
            }
            {
                name = story_unlock_dt
                atom_script = game_progress_unlock_level
                atom_params = {
                    level = Load_Z_DT
                }
                ui_params = {
                    debug_menu_text = 'DT freischalten'
                }
                depends_on = [
                    {
                        atom = dt_levelevent
                    }
                ]
            }
            {
                name = Mindy_Chinese
                ui_params = {
                    debug_menu_text = 'Mindy schickt dich zu Meister Zen.'
                }
                atom_script = game_progress_process_igc
                atom_params = {
                    scene = M_ZHOChinese_SUCCESS_igc_scene
                    pak = 'M_ZHOChinese_SUCCESS'
                    folder = 'missions/worldzones/M_ZHOChinese/M_ZHOChinese_SUCCESS'
                }
                depends_on = [
                    {
                        atom = dt_levelevent
                    }
                ]
            }
            {
                name = save_prompt9
                atom_script = game_progress_save_prompt
                depends_on = [
                    {
                        atom = Mindy_Chinese
                    }
                ]
            }
            {
                name = get_group2
                atom_goals = [
                    Z_DT_GOAL_GAPS4
                    Z_DT_GOAL_GAPS13
                    Z_DT_GOAL_GAPS10
                    Z_DT_GOAL_COUNTER5
                    Z_DT_GOAL_COUNTER3
                ]
                ui_params = {
                    debug_menu_text = 'Get DT goals, group 2'
                }
                depends_on = [
                    {
                        atom = story_unlock_dt
                    }
                ]
            }
            {
                name = send_text_Sirius2
                atom_script = game_progress_play_audio_clip
                atom_params = {
                    wav = sirius2
                }
                depends_on = [
                    {
                        depend_func = count
                        count = [
                            5
                            9
                            14
                        ]
                        goals = [
                            Z_HO_GOAL_GAPS7
                            Z_HO_GOAL_GAPS17
                            Z_HO_GOAL_GAPS20
                            Z_HO_GOAL_GAPS13
                            Z_BH_GOAL_GAPS3
                            Z_BH_GOAL_TETRIS
                            Z_BH_GOAL_GAPS5
                            Z_HO_GOAL_GAPS19
                            Z_BH_GOAL_GAPS14
                            Z_DT_GOAL_GAPS4
                            Z_DT_GOAL_GAPS13
                            Z_DT_GOAL_GAPS10
                            Z_DT_GOAL_COUNTER5
                            Z_DT_GOAL_COUNTER3
                        ]
                    }
                ]
            }
            {
                name = freeway_stall
                atom_goal = Z_DT_GOAL_COUNTER
                ui_params = {
                    debug_menu_text = 'Freeway Stall'
                    view_goals_text = 'Lerne von Meister Zen.'
                }
                depends_on = [
                    {
                        depend_func = count
                        count = [
                            5
                            9
                            14
                        ]
                        goals = [
                            Z_HO_GOAL_GAPS7
                            Z_HO_GOAL_GAPS17
                            Z_HO_GOAL_GAPS20
                            Z_HO_GOAL_GAPS13
                            Z_BH_GOAL_GAPS3
                            Z_BH_GOAL_TETRIS
                            Z_BH_GOAL_GAPS5
                            Z_HO_GOAL_GAPS19
                            Z_BH_GOAL_GAPS14
                            Z_DT_GOAL_GAPS4
                            Z_DT_GOAL_GAPS13
                            Z_DT_GOAL_GAPS10
                            Z_DT_GOAL_COUNTER5
                            Z_DT_GOAL_COUNTER3
                        ]
                    }
                ]
            }
            {
                name = Downtown_pieces_notification
                atom_monitor
                ui_params = {
                    view_goals_text = 'Besorg Teile in Downtown, Beverly Hills und Hollywood.'
                }
                depends_on = [
                    {
                        atom = dt_levelevent
                        state = complete
                    }
                    {
                        atom = freeway_stall
                        state = locked
                    }
                ]
            }
            {
                name = dt_levelevent2
                atom_cutscene = 'cutscenes\DT_LevelEvent_Freeway.cut'
                depends_on = [
                    {
                        atom = freeway_stall
                    }
                ]
            }
            {
                name = save_prompt10
                atom_script = game_progress_save_prompt
                ui_params = {
                    view_goals_text = 'Lerne von Meister Zen.'
                }
                depends_on = [
                    {
                        atom = dt_levelevent2
                    }
                ]
            }
            {
                name = learn_focus
                atom_goal = Z_DT_GOAL_GAPS
                ui_params = {
                    debug_menu_text = 'Lern den Fokus.'
                    view_goals_text = 'Lerne von Meister Zen.'
                }
                depends_on = [
                    {
                        atom = dt_levelevent2
                    }
                ]
            }
            {
                name = Master_Zen_notification
                atom_monitor
                ui_params = {
                    view_goals_text = 'Lerne von Meister Zen.'
                }
                depends_on = [
                    {
                        atom = freeway_stall
                        state = complete
                    }
                    {
                        atom = learn_focus
                        state = locked
                    }
                ]
            }
            {
                name = story_unlock_sv
                atom_script = game_progress_unlock_level
                atom_params = {
                    level = Load_Z_SV
                    nodeflags = [
                        { NODEFLAG_Z_DT_VS_DOOR_BEFORE 0 }
                    ]
                }
                ui_params = {
                    debug_menu_text = 'SV freischalten'
                    view_goals_text = 'Rede mit dem AM-JAM-Organisator.'
                }
                depends_on = [
                    {
                        atom = learn_focus
                    }
                ]
            }
            {
                name = take_out_skaters
                atom_goal = Z_SV_GOAL_HIGHCOMBO
                ui_params = {
                    view_goals_text = 'Tritt dem AM-JAM-Wettbewerb bei.'
                }
                depends_on = [
                    {
                        atom = story_unlock_sv
                    }
                ]
            }
            {
                name = get_cash_for_amjam
                atom_goal = z_sv_goal_gaps68
                ui_params = {
                    view_goals_text = 'Verdien Geld und mach Sponsoren-Challenges.'
                }
                depends_on = [
                    {
                        atom = take_out_skaters
                    }
                ]
            }
            {
                name = win_amjam
                ui_params = {
                    debug_menu_text = 'AM-JAM'
                    view_goals_text = 'Gewinn den Tony Hawk-AM-JAM!'
                }
                atom_goal = z_sv_goal_gaps69
                depends_on = [
                    {
                        atom = get_cash_for_amjam
                    }
                ]
            }
            {
                name = activate_win_amjam
                ui_params = {
                    view_goals_text = 'Gewinn den Tony Hawk-AM-JAM!'
                }
                atom_script = game_progress_start_goal
                atom_params = {
                    name = z_sv_goal_gaps69
                }
                depends_on = [
                    {
                        atom = get_cash_for_amjam
                    }
                ]
            }
            {
                name = amjam_reward
                atom_script = game_progress_add_cash
                ui_params = {
                    view_goals_text = 'Fahr zurück zur Skate-Ranch.'
                }
                atom_params = {
                    cash = 125
                }
                depends_on = [
                    {
                        atom = win_amjam
                    }
                ]
            }
            {
                name = sr_ranch_crew_node7
                atom_script = game_progress_change_nodeflags
                ui_params = {
                    debug_menu_text = 'sr_ranch_crew_node7'
                    view_goals_text = 'Fahr zurück zur Skate-Ranch.'
                }
                atom_params = {
                    nodeflags = [
                        { NODEFLAG_Z_SR_CREW_UNLOCKSR 0 }
                        { NODEFLAG_Z_SR_CREW_BUYDINO 0 }
                        { NODEFLAG_Z_SR_CREW_SKITCH 0 }
                        { NODEFLAG_Z_SR_CREW_SR5 0 }
                        { NODEFLAG_Z_SR_CREW_SR6 0 }
                        { NODEFLAG_Z_SR_CREW_DINOIGC 0 }
                    ]
                }
                depends_on = [
                    {
                        atom = win_amjam
                    }
                ]
            }
            {
                name = scene7
                atom_cutscene = 'cutscenes\VP_7.cut'
                atom_params = { 
                achievement
                 }
                ui_params = {
                    view_goals_text = 'Fahr zurück zur Skate-Ranch.'
                }
                depends_on = [
                    {
                        atom = amjam_reward
                    }
                ]
            }
            {
                name = save_prompt12
                atom_script = NullScript
                depends_on = [
                    {
                        atom = scene7
                    }
                ]
            }
            {
                name = send_text_get_to_sr
                atom_script = game_progress_send_pager_message
                atom_params = {
                    send_delay = 0
                    text = {
                        from = 'Mindy'
                        message = 'Triff mich bei der Ranch. Ach, und gute Arbeit beim AM-JAM!'
                        priority_message
                    }
                }
                depends_on = [
                    {
                        atom = scene7
                    }
                ]
            }
            {
                name = send_text_Sirius3
                atom_script = game_progress_play_audio_clip
                atom_params = {
                    wav = sirius3
                }
                depends_on = [
                    {
                        atom = scene7
                    }
                    {
                        level_is = Load_Z_DT
                    }
                ]
            }
            {
                name = scene8
                atom_cutscene = 'cutscenes\SR_8.cut'
                depends_on = [
                    {
                        atom = scene7
                    }
                    {
                        level_is = Load_Z_SR
                    }
                ]
            }
            {
                name = Back_to_ranch_post_amjam__notification
                atom_monitor
                ui_params = {
                    view_goals_text = 'Fahr zurück zur Skate-Ranch.'
                }
                depends_on = [
                    {
                        atom = scene7
                        state = complete
                    }
                    {
                        atom = scene8
                        state = locked
                    }
                ]
            }
            {
                name = save_prompt13
                atom_script = game_progress_save_prompt
                depends_on = [
                    {
                        atom = scene8
                    }
                ]
            }
            {
                name = earn_respect
                atom_goal = Z_BH_GOAL_TRICKTHEOBJECTS
                ui_params = {
                    debug_menu_text = 'Verdien dir Respekt'
                    view_goals_text = 'Fahr nach Beverly Hills. Finde den Skateclub.'
                }
                depends_on = [
                    {
                        atom = scene8
                    }
                ]
            }
            {
                name = learn_flatland
                ui_params = {
                    view_goals_text = 'Misch dich unter die Skate-Club-Jungs.'
                }
                atom_goal = Z_BH_GOAL_TETRIS2
                depends_on = [
                    {
                        atom = earn_respect
                    }
                ]
            }
            {
                name = get_walls
                ui_params = {
                    view_goals_text = 'Misch dich unter die Skate-Club-Jungs.'
                }
                atom_goal = Z_BH_GOAL_GAPS11
                depends_on = [
                    {
                        atom = learn_flatland
                    }
                ]
            }
            {
                name = levelevent_hotel
                ui_params = {
                    view_goals_text = 'Misch dich unter die Skate-Club-Jungs.'
                }
                atom_cutscene = 'cutscenes\BH_LevelEvent.cut'
                depends_on = [
                    {
                        atom = get_walls
                    }
                ]
            }
            {
                name = fight_daewon
                atom_goal = Z_BH_GOAL_GAPS8
                ui_params = {
                    debug_menu_text = 'Bekämpfe Daewon'
                    view_goals_text = 'Fahr zur Parkgarage in BH.'
                }
                depends_on = [
                    {
                        atom = levelevent_hotel
                    }
                ]
            }
            {
                name = story_unlock_sm
                atom_script = game_progress_unlock_level
                atom_params = {
                    level = Load_Z_SM
                    nodeflags = [
                        { NODEFLAG_Z_BHSMTRANSWARP 1 }
                        { NODEFLAG_Z_BHSM_DEAWONPOST 0 }
                    ]
                }
                ui_params = {
                    debug_menu_text = 'SM freischalten'
                    view_goals_text = 'Finde Tony Alva in Santa Monica.'
                }
                depends_on = [
                    {
                        atom = fight_daewon
                    }
                ]
            }
            {
                name = save_prompt14
                ui_params = {
                    view_goals_text = 'Finde Tony Alva in Santa Monica.'
                }
                atom_script = game_progress_save_prompt
                depends_on = [
                    {
                        atom = story_unlock_sm
                    }
                ]
            }
            {
                name = misc_goals1
                ui_params = {
                    view_goals_text = 'Finde Alva und besorg Teile für die Ranch.'
                }
                atom_goals = [
                    Z_SM_GOAL_GAPS1
                    Z_SM_GOAL_GAPS7
                    Z_SM_GOAL_GAPS16
                    Z_SM_GOAl_GAPS19
                    Z_SM_GOAL_GAPS14
                    Z_SM_GOAL_TETRIS1
                    Z_SM_GOAL_GAPS25
                ]
                depends_on = [
                    {
                        atom = story_unlock_sm
                    }
                ]
            }
            {
                name = Courthouse_Roof
                atom_goal = z_sm_goal_gaps2
                ui_params = {
                    debug_menu_text = 'Dach des Gerichtsgebäudes'
                    view_goals_text = 'Finde Alva und besorg Teile für die Ranch.'
                }
                depends_on = [
                    {
                        depend_func = all
                        goals = [ 
                        Z_SM_GOAL_GAPS1
                         ]
                    }
                ]
            }
            {
                name = prove_yourself_to_alva
                atom_goal = Z_SM_GOAL_GAPS11
                ui_params = {
                    debug_menu_text = 'Beweise dich vor Alva.'
                    view_goals_text = 'Beweise dich vor Tony Alva.'
                }
                depends_on = [
                    {
                        depend_func = count
                        count = 3
                        goals = [
                            Z_SM_GOAL_GAPS1
                            Z_SM_GOAL_GAPS7
                            Z_SM_GOAL_GAPS16
                        ]
                    }
                    {
                        depend_func = count
                        count = [
                            2
                            3
                            4
                        ]
                        goals = [
                            Z_SM_GOAl_GAPS19
                            z_sm_goal_gaps2
                            Z_SM_GOAL_GAPS14
                            Z_SM_GOAL_TETRIS1
                        ]
                    }
                ]
            }
            {
                name = scene9
                atom_cutscene = 'cutscenes\SM_9.cut'
                atom_params = { 
                achievement
                 }
                depends_on = [
                    {
                        atom = prove_yourself_to_alva
                    }
                ]
            }
            {
                name = intro_for_A_frame
                atom_goal = Z_SM_GOAL_GAPS26
                depends_on = [
                    {
                        atom = scene9
                    }
                ]
            }
            {
                name = start_intro_for_A_frame
                atom_script = game_progress_start_goal
                atom_params = {
                    name = Z_SM_GOAL_GAPS26
                }
                ui_params = {
                    view_goals_text = 'Triff Alva am Riesenrad.'
                }
                depends_on = [
                    {
                        atom = scene9
                    }
                ]
            }
            {
                name = get_A_frame
                atom_goal = Z_SM_GOAL_GAPS17
                ui_params = {
                    debug_menu_text = 'SM Get A Frame'
                    view_goals_text = 'Besorg dir das Alien-Kostüm und erschreck den Jahrmarkt-Typen.'
                }
                depends_on = [
                    {
                        atom = start_intro_for_A_frame
                    }
                ]
            }
            {
                name = freak_out_carnie
                atom_goal = Z_SM_GOAL_COUNTER4
                ui_params = {
                    view_goals_text = 'Mach deine Tricks, um dem Jahrmarkt-Typen Angst einzujagen.'
                }
                depends_on = [
                    {
                        atom = get_A_frame
                    }
                ]
            }
            {
                name = levelevent_ferris
                atom_cutscene = 'cutscenes\SM_LevelEvent.cut'
                depends_on = [
                    {
                        atom = freak_out_carnie
                    }
                ]
            }
            {
                name = Alva_shows_you_the_boat
                ui_params = {
                    debug_menu_text = 'IGC - Alva zeigt dir das Boot'
                    view_goals_text = 'Bezahl den Typen auf dem Boot.'
                }
                atom_script = game_progress_process_igc
                atom_params = {
                    scene = z_sm_postferris_igc_scene_start
                    pak = 'Z_SM_postferris'
                    folder = 'pak/igc/z_sm_postferris'
                }
                depends_on = [
                    {
                        atom = levelevent_ferris
                    }
                ]
            }
            {
                name = pay_boatguy
                atom_goal = Z_SM_GOAL_GAPS27
                ui_params = {
                    debug_menu_text = 'Bezahle den Schiffskapitän.'
                    view_goals_text = 'Bezahl den Schiffskapitän.'
                }
                depends_on = [
                    {
                        atom = Alva_shows_you_the_boat
                    }
                ]
            }
            {
                name = story_unlock_oi
                atom_script = game_progress_unlock_level
                atom_params = {
                    level = Load_Z_OI
                }
                ui_params = {
                    debug_menu_text = 'OI freischalten'
                    view_goals_text = 'Geh in Santa Monica aufs Boot.'
                }
                depends_on = [
                    {
                        atom = pay_boatguy
                    }
                ]
            }
            {
                name = favors_for_mega
                atom_goal = Z_OI_GOAL_GAPS3
                ui_params = {
                    view_goals_text = 'Tu Mega ein paar Gefallen.'
                }
                depends_on = [
                    {
                        atom = story_unlock_oi
                    }
                ]
            }
            {name = save_prompt15
                atom_script = game_progress_save_prompt
                ui_params = {
                    view_goals_text = 'Tu Mega ein paar Gefallen.'
                }
                depends_on = [
                    {
                        atom = favors_for_mega
                    }
                ]
            }
            {
                name = favors_for_mega2
                atom_goal = Z_OI_GOAL_GAPS13
                ui_params = {
                    view_goals_text = 'Tu Mega ein paar Gefallen.'
                }
                depends_on = [
                    {
                        atom = favors_for_mega
                    }
                ]
            }
            {
                name = get_group3
                atom_goals = [
                    Z_OI_GOAL_COUNTER
                    Z_OI_GOAL_GAPS7
                    Z_OI_GOAL_GAPS2
                    Z_OI_GOAL_GAPS5
                ]
                ui_params = {
                    debug_menu_text = 'Get goals, group 3'
                    view_goals_text = 'Besorg Teile von der Bohrinsel für die Ranch!'
                }
                depends_on = [
                    {
                        atom = favors_for_mega2
                    }
                ]
            }
            {
                name = scene10
                atom_cutscene = 'cutscenes\OR_10A.cut'
                atom_params = { 
                achievement
                 }
                ui_params = {
                    view_goals_text = 'Besorg die Bohrinselteile!'
                }
                depends_on = [
                    {
                        depend_func = count
                        count = [
                            2
                            3
                            4
                        ]
                        goals = [
                            Z_OI_GOAL_COUNTER
                            Z_OI_GOAL_GAPS7
                            Z_OI_GOAL_GAPS2
                            Z_OI_GOAL_GAPS5
                        ]
                    }
                ]
            }
            {
                name = turn_boat_off
                ui_params = {
                    view_goals_text = 'Besorg die Bohrinselteile!'
                }
                atom_script = game_progress_change_nodeflags
                atom_params = {
                    nodeflags = [
                        { NODEFLAG_SMOI_Boat5_After 0 }
                    ]
                }
                depends_on = [
                    {
                        atom = scene10
                    }
                ]
            }
            {
                name = save_prompt16
                ui_params = {
                    view_goals_text = 'Besorg die Bohrinselteile!'
                }
                atom_script = game_progress_save_prompt
                depends_on = [
                    {
                        atom = turn_boat_off
                    }
                ]
            }
            {
                name = get_off_or
                atom_goal = Z_OI_GOAL_GAPS11
                ui_params = {
                    debug_menu_text = 'Finde einen Weg von der Bohrinsel!'
                    view_goals_text = 'Finde einen Weg von der Bohrinsel.'
                }
                depends_on = [
                    {
                        atom = scene10
                    }
                ]
            }
            {
                name = send_text_help_mega1
                ui_params = {
                    view_goals_text = 'Hilf Mega auf der Skate-Ranch.'
                }
                atom_script = game_progress_send_pager_message
                atom_params = {
                    send_delay = 0
                    text = {
                        from = 'Mega'
                        message = 'Du bewegst besser deinen Hintern wieder rüber zur Ranch! Dieser Kran, mit dem ich den Snake Run ausgrabe, taugt weniger als ein Igel, der im Berufsverkehr über die Autobahn läuft. '
                        priority_message
                    }
                }
                depends_on = [
                    {
                        atom = get_off_or
                    }
                ]
            }
            {
                name = climb_up_crane
                ui_params = {
                    debug_menu_text = 'Hilf Mega auf der Skate-Ranch.'
                    view_goals_text = 'Hilf Mega auf der Skate-Ranch.'
                }
                atom_goal = Z_SR_GOAL_GAPS6
                depends_on = [
                    {
                        atom = get_off_or
                    }
                ]
            }
            {
                name = sr_ranch_crew_node8
                ui_params = {
                    d debug_menu_text = 'sr_ranch_crew_node8'
                    view_goals_text = 'Hilf Mega auf der Skate-Ranch.'
                }
                atom_script = game_progress_change_nodeflags
                atom_params = {
                    nodeflags = [
                        { NODEFLAG_Z_SR_CREW_UNLOCKSR 0 }
                        { NODEFLAG_Z_SR_CREW_BUYDINO 0 }
                        { NODEFLAG_Z_SR_CREW_SKITCH 0 }
                        { NODEFLAG_Z_SR_CREW_SR5 1 }
                        { NODEFLAG_Z_SR_CREW_SR6 0 }
                        { NODEFLAG_Z_SR_CREW_DINOIGC 0 }
                    ]
                }
                depends_on = [
                    {
                        atom = climb_up_crane
                    }
                ]
            }
            {
                name = mindy_boone_igc
                ui_params = {
                    debug_menu_text = 'Mindy Get Call'
                    view_goals_text = 'Fahr zum Belmont-Tunnel in Downtown.'
                }
                atom_script = game_progress_process_igc
                atom_params = {
                    scene = igc_scene_mindy_Gets_Boone_Call
                    pak = 'Z_SR_MINDY_CALL'
                    folder = 'pak/igc/Z_SR_mindy_call'
                }
                depends_on = [
                    {
                        atom = climb_up_crane
                    }
                ]
            }
            {
                name = sr_ranch_crew_node9
                ui_params = {
                    debug_menu_text = 'sr_ranch_crew_node9'
                    view_goals_text = 'Hilf Mega auf der Skate-Ranch.'
                }
                atom_script = game_progress_change_nodeflags
                atom_params = {
                    nodeflags = [
                        { NODEFLAG_Z_SR_CREW_UNLOCKSR 0 }
                        { NODEFLAG_Z_SR_CREW_BUYDINO 0 }
                        { NODEFLAG_Z_SR_CREW_SKITCH 0 }
                        { NODEFLAG_Z_SR_CREW_SR5 0 }
                        { NODEFLAG_Z_SR_CREW_SR6 0 }
                        { NODEFLAG_Z_SR_CREW_DINOIGC 0 }
                    ]
                }
                depends_on = [
                    {
                        atom = mindy_boone_igc
                    }
                ]
            }
            {
                name = locking_capitol_records
                ui_params = {
                    view_goals_text = 'Fahr zum Belmont-Tunnel in Downtown.'
                }
                atom_script = game_progress_process_goal_lock
                atom_params = {
                    lock = 1
                    goals = [ 
                    Z_HO_GOAL_GAPS17
                     ]
                }
                depends_on = [
                    {
                        atom = mindy_boone_igc
                    }
                ]
            }
            {
                name = save_prompt17
                ui_params = {
                    view_goals_text = 'Fahr zum Belmont-Tunnel in Downtown.'
                }
                atom_script = game_progress_save_prompt
                depends_on = [
                    {
                        atom = mindy_boone_igc
                    }
                ]
            }
            {
                name = cholos_block_tunnel_nodeflag
                ui_params = {
                    view_goals_text = 'Fahr zum Belmont-Tunnel in Downtown.'
                }
                atom_script = game_progress_change_nodeflags
                atom_params = {
                    nodeflags = [
                        { NODEFLAG_Z_DT_INITIALIZEGRAFFITIAREA_BEFORE 1 }
                    ]
                }
                depends_on = [
                    {
                        atom = mindy_boone_igc
                    }
                ]
            }
            {
                name = choloz_block_tunnel
                ui_params = {
                    debug_menu_text = 'choloz block tunel'
                    view_goals_text = 'Fahr zum Belmont-Tunnel in Downtown.'
                }
                atom_goal = Z_DT_GOAL_GAPS30
                depends_on = [
                    {
                        atom = mindy_boone_igc
                    }
                ]
            }
            {
                name = sr_ranch_crew_node10
                atom_script = game_progress_change_nodeflags
                ui_params = {
                    view_goals_text = 'Fahr zum Belmont-Tunnel in Downtown.'
                    debug_menu_text = 'sr_ranch_crew_node10'
                }
                atom_params = {
                    nodeflags = [
                        { NODEFLAG_Z_SR_CREW_UNLOCKSR 0 }
                        { NODEFLAG_Z_SR_CREW_BUYDINO 0 }
                        { NODEFLAG_Z_SR_CREW_SKITCH 0 }
                        { NODEFLAG_Z_SR_CREW_SR5 0 }
                        { NODEFLAG_Z_SR_CREW_SR6 0 }
                        { NODEFLAG_Z_SR_CREW_DINOIGC 0 }
                        { NODEFLAG_Z_DT_INITIALIZEGRAFFITIAREA_BEFORE 0 }
                    ]
                }
                depends_on = [
                    {
                        atom = choloz_block_tunnel
                    }
                ]
            }
            {
                name = cas_clothing
                atom_goal = Z_DT_GOAL_GAPS22
                ui_params = {
                    debug_menu_text = 'CAS Cholos'
                    view_goals_text = 'Hol dir ein Tattoo in Santa Monica und fahr dann nach Downtown.'
                }
                depends_on = [
                    {
                        atom = choloz_block_tunnel
                    }
                ]
            }
            {
                name = save_prompt18
                ui_params = {
                    view_goals_text = 'Lass dir in Santa Monica das Widowz-Tattoo verpassen.'
                }
                atom_script = game_progress_save_prompt
                depends_on = [
                    {
                        atom = cas_clothing
                    }
                ]
            }
            {
                name = choloz_build_tag_igc
                ui_params = {
                    debug_menu_text = 'Cholos-Tag'
                    view_goals_text = 'Markier die City-Spots mit 4 City-Styles!'
                }
                atom_script = game_progress_process_igc
                atom_params = {
                    scene = igc_scene_choloz_build_tag
                    pak = 'Z_DT_Choloz_Tag'
                    folder = 'pak/igc/Z_DT_Choloz_Tag'
                    extra_storage_heap = GoalHeap
                }
                depends_on = [
                    {
                        atom = cas_clothing
                    }
                ]
            }
            {
                name = tag_cholos
                atom_goal = Z_DT_GOAL_GAPS23
                ui_params = {
                    debug_menu_text = 'Tag-Cholos'
                    view_goals_text = 'Tagge alle Spots in L.A., erstell das \'All-City Tag\'.'
                }
                depends_on = [
                    {
                        atom = choloz_build_tag_igc
                    }
                ]
            }
            {
                name = BMX_cholo
                atom_goal = Z_DT_GOAL_GAPS26
                ui_params = {
                    debug_menu_text = 'BMX Cholo'
                    view_goals_text = 'Finde die BMX Black Widowz in Downtown.'
                }
                depends_on = [
                    {
                        atom = tag_cholos
                    }
                ]
            }
            {
                name = story_unlock_el
                atom_script = game_progress_unlock_level
                atom_params = {
                    level = Load_Z_EL
                    nodeflags = [
                        { NODEFLAG_Z_DT_EL_BARRIER 0 }
                    ]
                }
                ui_params = {
                    debug_menu_text = 'EL freischalten'
                    view_goals_text = 'Fahr nach Ost-L.A.'
                }
                depends_on = [
                    {
                        atom = BMX_cholo
                    }
                ]
            }
            {
                name = save_prompt19
                ui_params = {
                    view_goals_text = 'Fahr nach Ost-L.A.'
                }
                atom_script = game_progress_save_prompt
                depends_on = [
                    {
                        atom = story_unlock_el
                    }
                ]
            }
            {
                name = save_boone
                ui_params = {
                    view_goals_text = 'Rette Boone in L.A.-Ost'
                }
                atom_goal = Z_EL_GOAL_GAPS
                depends_on = [
                    {
                        atom = story_unlock_el
                    }
                ]
            }
            {
                name = level_event_spear
                atom_cutscene = 'cutscenes\EL_LevelEvent.cut'
                ui_params = {
                    view_goals_text = 'Rette Boone aus dem Tunnel.'
                }
                depends_on = [
                    {
                        atom = save_boone
                    }
                ]
            }
            {
                name = wack_tunnel
                ui_params = {
                    view_goals_text = 'Rette Boone aus dem Tunnel.'
                }
                atom_goal = Z_EL_GOAL_GAPS2
                depends_on = [
                    {
                        atom = level_event_spear
                    }
                ]
            }
            {
                name = unlocking_capitol_records
                atom_script = game_progress_process_goal_lock
                ui_params = {
                    debug_menu_text = 'Get goals, group 4'
                    view_goals_text = 'Besorg im Osten von L.A. Teile für die Ranch '
                }
                atom_params = {
                    lock = 0
                    goals = [ 
                    Z_HO_GOAL_GAPS17
                     ]
                }
                depends_on = [
                    {
                        atom = wack_tunnel
                    }
                ]
            }
            {
                name = get_group4
                atom_goals = [
                    Z_EL_GOAL_GAPS8
                    Z_EL_GOAL_GAPS10
                    Z_EL_GOAL_GAPS3
                ]
                ui_params = {
                    debug_menu_text = 'Get goals, group 4'
                    view_goals_text = 'Besorg im Osten von L.A. Teile für die Ranch '
                }
                depends_on = [
                    {
                        atom = wack_tunnel
                    }
                ]
            }
            {
                name = send_text_help_mega2
                atom_script = game_progress_send_pager_message
                ui_params = {
                    view_goals_text = 'Hilf Mega auf der Ranch!'
                }
                atom_params = {
                    send_delay = 0
                    text = {
                        from = 'Mega'
                        message = 'Mega hat Mega-Ärger am Hals. Ich werde angegriffen! Irgendso ein Wahnsinniger versucht, meinen Kran zu steuern! Komm zur Ranch und schaff seinen Hintern von meiner Bohrinsel!'
                        priority_message
                    }
                }
                depends_on = [
                    {
                        depend_func = count
                        count = [
                            1
                            2
                            3
                        ]
                        goals = [
                            Z_EL_GOAL_GAPS8
                            Z_EL_GOAL_GAPS10
                            Z_EL_GOAL_GAPS3
                        ]
                    }
                ]
            }
            {
                name = shoot_workers
                atom_goal = Z_SR_GOAL_GAPS5
                ui_params = {
                    debug_menu_text = 'Wirf den Arbeiter vom Kran.'
                    view_goals_text = 'Fahr zur Ranch und hilf Mega!'
                }
                depends_on = [
                    {
                        depend_func = count
                        count = [
                            1
                            2
                            3
                        ]
                        goals = [
                            Z_EL_GOAL_GAPS8
                            Z_EL_GOAL_GAPS10
                            Z_EL_GOAL_GAPS3
                        ]
                    }
                ]
            }
            {
                name = scene10B
                atom_cutscene = 'cutscenes\HO_10B.cut'
                ui_params = {
                    view_goals_text = 'Bring das Paket zu Joey B.'
                }
                depends_on = [
                    {
                        atom = shoot_workers
                    }
                ]
            }
            {
                name = save_prompt20
                atom_script = game_progress_save_prompt
                ui_params = {
                    view_goals_text = 'Stoppe die Ausgrabungen auf der Ranch.'
                }
                depends_on = [
                    {
                        atom = scene10B
                    }
                ]
            }
            {
                name = send_text_get_to_sr2
                atom_script = game_progress_send_pager_message
                ui_params = {
                    view_goals_text = 'Stoppe die Ausgrabungen auf der Ranch.'
                }
                atom_params = {
                    send_delay = 0
                    text = {
                        from = 'Mega'
                        message = 'Hey, komm zurück zur Ranch. Die ersten Leute sind schon da.'
                    }
                }
                depends_on = [
                    {
                        atom = scene10B
                    }
                ]
            }
            {
                name = scene11a
                atom_cutscene = 'cutscenes\BH_11a.cut'
                ui_params = {
                    view_goals_text = 'Stoppe die Ausgrabungen auf der Ranch.'
                }
                atom_params = {
                    unload = 1
                    reload = 0
                    intro_restart_node = Z_BH_TRG_G_Counter_RestartNode
                }
                depends_on = [
                    {
                        atom = scene10B
                    }
                    {
                        level_is = Load_Z_BH
                    }
                ]
            }
            {
                name = scene11
                ui_params = {
                    view_goals_text = 'Stoppe die Ausgrabungen auf der Ranch.'
                }
                atom_cutscene = 'cutscenes\BH_11.cut'
                atom_params = {
                    unload = 0
                    reload = 1
                    achievement
                }
                depends_on = [
                    {
                        atom = scene11a
                    }
                    {
                        level_is = Load_Z_BH
                    }
                ]
            }
            {
                name = REMOVE_CRANE_CLEANUP
                atom_script = game_progress_change_nodeflags
                ui_params = {
                    view_goals_text = 'Stoppe die Ausgrabungen auf der Ranch.'
                    debug_menu_text = 'KRAN ENTFERNEN'
                }
                atom_params = {
                    nodeflags = [
                        { NODEFLAG_Z_SR_CRANE 0 }
                        { NODEFLAG_Z_SR_CRANE_DEF 1 }
                        { NODEFLAG_Z_SR_CRANE_TOP 0 }
                        { NODEFLAG_Z_SR_CRANE_SNAKE 0 }
                        { NODEFLAG_Z_SR_SNAKE 1 }
                        { NODEFLAG_Z_SR_SNAKE_DEF 0 }
                    ]
                }
                depends_on = [
                    {
                        atom = scene11
                    }
                ]
            }
            {
                name = locking_shark_head
                ui_params = {
                    view_goals_text = 'Stoppe die Ausgrabungen auf der Ranch.'
                }
                atom_script = chapter_info_lock_sr
                depends_on = [
                    {
                        atom = scene11
                    }
                ]
            }
            {
                name = make_video_igc_setup
                atom_script = game_progress_change_nodeflags
                ui_params = {
                    view_goals_text = 'Beeindrucke Tony Hawk in Beverly Hills.'
                }
                atom_params = {
                    nodeflags = [
                        { NODEFLAG_Z_BH_SCENE4A 1 }
                    ]
                }
                depends_on = [
                    {
                        atom = scene11
                    }
                ]
            }
            {
                name = make_video_igc
                ui_params = {
                    debug_menu_text = 'Dreh ein Video'
                    view_goals_text = 'Beeindrucke Tony Hawk in Beverly Hills.'
                }
                atom_script = game_progress_process_igc
                atom_params = {
                    scene = igc_scene_Make_Video
                    pak = 'Z_BH_Video'
                    folder = 'pak/igc/Z_BH_Video'
                    extra_storage_heap = GoalHeap
                }
                depends_on = [
                    {
                        atom = make_video_igc_setup
                    }
                ]
            }
            {
                name = make_video_igc_cleanup
                atom_script = game_progress_change_nodeflags
                atom_params = {
                    nodeflags = [
                        { NODEFLAG_Z_BH_SCENE4A 0 }
                    ]
                }
                depends_on = [
                    {
                        atom = make_video_igc
                    }
                ]
            }
            {
                name = save_prompt21
                atom_script = game_progress_save_prompt
                ui_params = {
                    view_goals_text = 'Beeindrucke Tony Hawk in Beverly Hills.'
                }
                depends_on = [
                    {
                        atom = make_video_igc_cleanup
                    }
                ]
            }
            {
                name = find_tony
                atom_goal = Z_BH_GOAL_GAPS29
                ui_params = {
                    debug_menu_text = 'Finde Tony.'
                    view_goals_text = 'Beeindrucke Tony Hawk in Beverly Hills.'
                }
                depends_on = [
                    {
                        atom = make_video_igc_cleanup
                    }
                ]
            }
            {
                name = send_text_Sirius4
                atom_script = game_progress_play_audio_clip
                ui_params = {
                    view_goals_text = 'Beeindrucke genügend Profis in L.A.'
                }
                atom_params = {
                    wav = sirius4
                }
                depends_on = [
                    {
                        atom = find_tony
                    }
                ]
            }
            {
                name = find_pros
                ui_params = {
                    debug_menu_text = 'Finde Profis.'
                    view_goals_text = 'Beeindrucke genügend Profis in L.A.'
                }
                atom_goals = [
                    Z_BH_GOAL_GAPS26
                    Z_SV_GOAL_GAPS
                    Z_SV_GOAL_COUNTER
                    Z_DT_GOAL_GAPS17
                    Z_DT_GOAL_GAPS14
                    Z_DT_GOAL_COUNTER4
                    Z_SM_GOAL_GAPS20
                    Z_SM_GOAL_TETRIS2
                    Z_EL_GOAL_GAPS12
                ]
                depends_on = [
                    {
                        atom = find_tony
                    }
                ]
            }
            {
                name = change_SM_Ramps_nodeflags
                ui_params = {
                    view_goals_text = 'Beeindrucke genügend Profis in L.A.'
                }
                atom_script = game_progress_change_nodeflags
                atom_params = {
                    nodeflags = [
                        { NODEFLAG_PROS_UNLOCKED_BEFORE 0 }
                        { NODEFLAG_PROS_UNLOCKED_AFTER 1 }
                    ]
                }
                depends_on = [
                    {
                        atom = find_tony
                    }
                ]
            }
            {
                name = find_reynolds
                atom_goal = Z_HO_GOAL_SKATETHELINE
                ui_params = {
                    debug_menu_text = 'Finde Reynolds.'
                    view_goals_text = 'Finde und beeindrucke die Profis in L.A.'
                }
                depends_on = [
                    {
                        atom = find_tony
                    }
                ]
            }
            {
                name = wasteland_sign
                atom_script = game_progress_send_pager_message
                ui_params = {
                    view_goals_text = 'Finde und beeindrucke die Profis in L.A.'
                }
                atom_params = {
                    send_delay = 0
                    text = {
                        from = 'Murphy'
                        message = 'Danke, dass du das Hollywood-Schild besorgt hast. Wir haben es für die Ranch ein bisschen modifiziert.'
                    }
                }
                depends_on = [
                    {
                        atom = find_reynolds
                    }
                ]
            }
            {
                name = change_waste_nodeflags
                ui_params = {
                    view_goals_text = 'Finde und beeindrucke die Profis in L.A.'
                }
                atom_script = game_progress_change_nodeflags
                atom_params = {
                    nodeflags = [
                        { NODEFLAG_Z_SR_HO_WASTE 1 }
                        { NODEFLAG_Z_SR_HO_WASTE_DEF 0 }
                    ]
                }
                depends_on = [
                    {
                        atom = wasteland_sign
                    }
                ]
            }
            {
                name = find_rodney
                atom_goal = Z_HO_GOAL_COUNTER25
                ui_params = {
                    debug_menu_text = 'Finde Rodney!'
                    view_goals_text = 'Finde und beeindrucke die Profis in L.A.'
                }
                depends_on = [
                    {
                        atom = find_tony
                    }
                ]
            }
            {
                name = Rodney_CAT
                ui_params = {
                    view_goals_text = 'Finde und beeindrucke die Profis in L.A.'
                }
                atom_goals = [ 
                Z_HO_GOAL_COUNTER26
                 ]
                depends_on = [
                    {
                        atom = find_rodney
                    }
                ]
            }
            {
                name = Murphy_Texts_Bam
                atom_script = game_progress_send_pager_message
                ui_params = {
                    view_goals_text = 'Beeindrucke Bam in Ost-L.A.'
                }
                atom_params = {
                    send_delay = 0
                    text = {
                        from = 'Murphy'
                        message = 'Hey, ich hab eben Bam Margera in Ost-L.A. beim Skatepark gesehen. Such ihn, er wäre so super im Video.'
                        priority_message
                    }
                }
                depends_on = [
                    {
                        depend_func = count
                        count = [
                            4
                            8
                            11
                        ]
                        goals = [
                            Z_BH_GOAL_GAPS26
                            Z_HO_GOAL_SKATETHELINE
                            Z_HO_GOAL_COUNTER26
                            Z_SV_GOAL_GAPS
                            Z_SV_GOAL_COUNTER
                            Z_DT_GOAL_GAPS17
                            Z_DT_GOAL_GAPS14
                            Z_DT_GOAL_COUNTER4
                            Z_SM_GOAL_GAPS20
                            Z_SM_GOAL_TETRIS2
                            Z_EL_GOAL_GAPS12
                        ]
                    }
                ]
            }
            {
                name = find_bam
                atom_goal = Z_EL_GOAL_GAPS4
                ui_params = {
                    debug_menu_text = 'Finde Bam.'
                    view_goals_text = 'Beeindrucke Bam in Ost-L.A.'
                }
                depends_on = [
                    {
                        depend_func = count
                        count = [
                            4
                            8
                            11
                        ]
                        goals = [
                            Z_BH_GOAL_GAPS26
                            Z_HO_GOAL_SKATETHELINE
                            Z_HO_GOAL_COUNTER26
                            Z_SV_GOAL_GAPS
                            Z_SV_GOAL_COUNTER
                            Z_DT_GOAL_GAPS17
                            Z_DT_GOAL_GAPS14
                            Z_DT_GOAL_COUNTER4
                            Z_SM_GOAL_GAPS20
                            Z_SM_GOAL_TETRIS2
                            Z_EL_GOAL_GAPS12
                        ]
                    }
                ]
            }
            {
                name = scene12
                atom_cutscene = 'cutscenes\EL_12.cut'
                atom_params = { 
                achievement
                 }
                ui_params = {
                    view_goals_text = 'Fahr durch Ost-L.A. zum Kasino!'
                }
                depends_on = [
                    {
                        atom = find_bam
                    }
                ]
            }
            {
                name = save_prompt24
                ui_params = {
                    view_goals_text = 'Fahr durch Ost-L.A. zum Kasino!'
                }
                atom_script = game_progress_save_prompt
                depends_on = [
                    {
                        atom = scene12
                    }
                ]
            }
            {
                name = taco_truck
                atom_goal = Z_EL_GOAL_GAPS17
                ui_params = {
                    debug_menu_text = 'Taco-Truck'
                    view_goals_text = 'Bezahl das Taco-Truck-Mädel.'
                }
                depends_on = [
                    {
                        atom = scene12
                    }
                ]
            }
            {
                name = story_unlock_lv
                atom_script = game_progress_unlock_level
                atom_params = {
                    level = Load_Z_LV
                    nodeflags = [
                        { NODEFLAG_Z_EL_ELLVEVENT 0 }
                    ]
                }
                ui_params = {
                    debug_menu_text = 'LV freischalten'
                }
                depends_on = [
                    {
                        atom = taco_truck
                    }
                ]
            }
            {
                name = video_goal1
                atom_goal = Z_LV_GOAL_COUNTER3
                depends_on = [
                    {
                        atom = story_unlock_lv
                    }
                ]
            }
            {
                name = video_goal2
                atom_goal = Z_LV_GOAL_GAPS8
                depends_on = [
                    {
                        atom = story_unlock_lv
                    }
                ]
            }
            {
                name = get_group5
                atom_goals = [
                    Z_LV_GOAL_GAPS3
                    Z_LV_GOAL_COUNTER2
                    Z_LV_GOAL_GAPS5
                    Z_LV_GOAL_GAPS
                    Z_LV_GOAL_GAPS7
                ]
                ui_params = {
                    debug_menu_text = 'Get goals, group 5'
                }
                depends_on = [
                    {
                        atom = story_unlock_lv
                    }
                ]
            }
            {
                name = casino_igc
                atom_script = game_progress_process_igc
                ui_params = {
                    debug_menu_text = 'IGC Casino'
                    view_goals_text = 'Häng die Cops ab und fahr zurück zur Ranch.'
                }
                atom_params = {
                    scene = igc_scene_lv_Casino
                    pak = 'Z_LV_Casino'
                    folder = 'pak/igc/z_lv_casino'
                }
                depends_on = [
                    {
                        depend_func = count
                        count = [
                            4
                            5
                            7
                        ]
                        goals = [
                            Z_LV_GOAL_GAPS3
                            Z_LV_GOAL_COUNTER2
                            Z_LV_GOAL_GAPS5
                            Z_LV_GOAL_GAPS
                            Z_LV_GOAL_GAPS7
                            Z_LV_GOAL_COUNTER3
                            Z_LV_GOAL_GAPS8
                        ]
                    }
                ]
            }
            {
                name = Go_to_Casino_notification
                atom_monitor
                ui_params = {
                    view_goals_text = 'Mach mit Iggy das Kasino unsicher!'
                }
                depends_on = [
                    {
                        atom = taco_truck
                        state = complete
                    }
                    {
                        atom = casino_igc
                        state = locked
                    }
                ]
            }
            {
                name = save_prompt25
                ui_params = { 
                 }
                atom_script = game_progress_save_prompt
                depends_on = [
                    {
                        atom = casino_igc
                    }
                ]
            }
            {
                name = chopper_chase_to_ranch
                atom_goal = Z_EL_Goal_Gaps100
                ui_params = {
                    debug_menu_text = 'Chopper-Jagd'
                }
                depends_on = [
                    {
                        atom = casino_igc
                    }
                ]
            }
            {
                name = scene13a
                atom_cutscene = 'cutscenes\SR_13A.cut'
                atom_params = {
                    unload = 1
                    reload = 0
                }
                ui_params = {
                    view_goals_text = 'Party auf der neuen Ranch!'
                }
                depends_on = [
                    {
                        atom = chopper_chase_to_ranch
                    }
                    {
                        level_is = Load_Z_SR
                    }
                ]
            }
            {
                name = Ditch_Cops_notification
                atom_monitor
                ui_params = {
                    view_goals_text = 'Häng die Cops ab und fahr zurück zur Ranch.'
                }
                depends_on = [
                    {
                        atom = casino_igc
                        state = complete
                    }
                    {
                        atom = scene13a
                        state = locked
                    }
                ]
            }
            {
                name = scene13b
                ui_params = {
                    view_goals_text = 'Party auf der neuen Ranch!'
                }
                atom_cutscene = 'cutscenes\SR_13.cut'
                atom_params = {
                    unload = 0
                    reload = 1
                    achievement
                }
                depends_on = [
                    {
                        atom = scene13a
                    }
                ]
            }
            {
                name = sr_ranch_crew_node11
                atom_script = game_progress_change_nodeflags
                ui_params = {
                    debug_menu_text = 'sr_ranch_crew_node11'
                    view_goals_text = 'Party auf der neuen Ranch!'
                }
                atom_params = {
                    nodeflags = [
                        { NODEFLAG_Z_SR_CREW_UNLOCKSR 0 }
                        { NODEFLAG_Z_SR_CREW_BUYDINO 1 }
                        { NODEFLAG_Z_SR_CREW_SKITCH 0 }
                        { NODEFLAG_Z_SR_CREW_SR5 0 }
                        { NODEFLAG_Z_SR_CREW_SR6 0 }
                        { NODEFLAG_Z_SR_CREW_DINOIGC 0 }
                    ]
                }
                depends_on = [
                    {
                        atom = scene13b
                    }
                ]
            }
            {
                name = unlocking_shark_head
                ui_params = {
                    view_goals_text = 'Party auf der neuen Ranch!'
                }
                atom_script = chapter_info_unlock_sr
                depends_on = [
                    {
                        atom = scene13b
                    }
                ]
            }
            {
                name = save_prompt26
                ui_params = {
                    view_goals_text = 'Party auf der neuen Ranch!'
                }
                atom_script = game_progress_save_prompt
                depends_on = [
                    {
                        atom = scene13b
                    }
                ]
            }
            {
                name = set_game_complete
                ui_params = {
                    view_goals_text = 'Party auf der neuen Ranch!'
                }
                atom_script = game_progress_set_completion_flag
                atom_params = { Game no_update_on_exit }
                depends_on = [
                    {
                        atom = save_prompt26
                    }
                ]
            }
            {
                name = finale_igc
                ui_params = {
                    debug_menu_text = 'IGC_Finale!'
                    view_goals_text = 'Party auf der neuen Ranch!'
                }
                atom_script = game_progress_process_igc
                atom_params = {
                    scene = igc_scene_Z_SR_Finale
                    pak = 'Z_SR_FINALE'
                    folder = 'pak/igc/z_sr_finale'
                    extra_storage_heap = GoalHeap
                }
                depends_on = [
                    {
                        flag = CAREER_SEEN_GAME_COMPLETE_MESSAGE
                    }
                ]
            }
            {
                name = set_goals_complete
                ui_params = {
                    view_goals_text = 'Party auf der neuen Ranch!'
                }
                atom_script = game_progress_set_completion_flag
                atom_params = { goals no_update_on_exit }
                depends_on = [
                    {
                        all_progression_goals
                        depend_func = count
                        count = [ 94 95 96 ]
                    }
                ]
            }
            {
                name = set_piece_goals_complete
                ui_params = {
                    view_goals_text = 'Party auf der neuen Ranch!'
                }
                atom_script = game_progress_set_completion_flag
                atom_params = { pieces no_update_on_exit }
                depends_on = [
                    {
                        park_piece_goals
                        depend_func = percent
                        percent = 100
                    }
                ]
            }
            {
                name = set_100_percent
                atom_script = NullScript
                atom_params = { achievement }
                depends_on = [
                    {
                        flags = [
                            CAREER_GOALS_COMPLETE
                            CLASSIC_GOALS_COMPLETE
                            GOT_ALL_GAPS
                        ]
                    }
                ]
            }
        ]
    }
endscript

script chapter_1_startup 
    if NOT cd
        SetGlobalFlag flag = CAREER_STARTED
        if IsTrue entered_from_autolaunch
            CareerFunc func = SetAppropriateNodeFlags
        endif
    endif
    ChangeNodeFlag NODEFLAG_PERMANENT_PEDS 1
    if NOT skater ::walking
        MakeSkaterGoto SkaterInit params = { walk }
    endif
    skater ::EnableAbility lip
    skater ::EnableAbility doubletapgrab
    skater ::EnableAbility doubletapflip
    skater ::EnableAbility tripletapflip
    skater ::EnableAbility extragrind
    skater ::EnableAbility NoComply
    skater ::EnableAbility pressure
    skater ::EnableAbility Nollie
    skater ::EnableAbility tag
    skater ::EnableAbility boardsmack
    skater ::EnableAbility boardthrow
endscript

script chapter_info_lock_sr 
    game_progress_process_goal_lock \{lock = 1 goals = [ Z_SM_GOAl_GAPS19 ]}
    SetGlobalFlag \{ flag = CAREER_SR_TEMP_LOCKED }
endscript

script chapter_info_unlock_sr 
    game_progress_process_goal_lock \{lock = 0 goals = [ Z_SM_GOAl_GAPS19 ]}
    UnsetGlobalFlag \{ flag = CAREER_SR_TEMP_LOCKED }
endscript
