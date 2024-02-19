
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
                    view_goals_text = 'Id do fryzjera.'
                }
            }
            {
                name = give_initial_cash
                atom_script = game_progress_add_cash
                ui_params = {
                    view_goals_text = 'Id do fryzjera.'
                }
                atom_params = {
                    cash = 120
                }
            }
            {
                name = start_change_look
                atom_script = game_progress_start_goal
                ui_params = {
                    view_goals_text = 'Id do fryzjera.'
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
                    view_goals_text = 'Pójd do sklepu z ciuchami.'
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
                    debug_menu_text = 'Naucz siê Cavemana'
                    view_goals_text = 'Naucz siê od hollywoodzkich skejtów.'
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
                    debug_menu_text = 'Zdob¹d sponsora'
                    view_goals_text = 'Jed do skateshopu i wygraj wyzwanie sponsorów'
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
                    view_goals_text = 'Spotkaj siê z Mindy w skateshopie'
                }
                atom_params = {
                    send_delay = 0
                    text = {
                        from = 'Mindy'
                        message = 'Kiedy pojawia siê ikona telefonu zatrzymaj grê \b8 i wybierz wiadomoci tekstowe.\n\nSpotkaj siê ze mn¹ na zapleczu skateshopu. Szukaj \c7 ró¿owej gwiazdy \c0 na swoim \c4 kompasie \c0 u góry ekranu. \b8 wywo³uje \c4 mapê \c0, na której zaznaczone s¹ miejsca, w których mo¿esz zarobiæ szmal, pojedziæ na rowerze czy dostaæ zadanie.'
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
                    debug_menu_text = 'Skickflipuj Whoflecka'
                    view_goals_text = 'Skickflipuj Bena Whoflecka'
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
                    debug_menu_text = 'Naucz siê Reverta'
                    view_goals_text = 'Spotkaj siê z Duanem w Psie i Wiolonczeli.'
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
                    debug_menu_text = 'Pokonaj skejta'
                    view_goals_text = 'Pokonaj bezczelnego skejta.'
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
                    view_goals_text = 'Dostañ siê do Beverly Hills.'
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
                    view_goals_text = 'Dostañ siê do Beverly Hills.'
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
                    view_goals_text = 'Przerwij protest przeciwko we³nie!'
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
                    debug_menu_text = 'Zadanie z dinozaurem'
                    view_goals_text = 'Przerwij protest przeciwko we³nie!'
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
                    debug_menu_text = 'Odblokuj Beverly Hills'
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
                    view_goals_text = 'Znajd Mindy w Beverly Hills'
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
                    debug_menu_text = 'Naucz siê zadañ, grupa 1'
                    view_goals_text = 'Opanuj podstawowe umiejêtnoci!'
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
                        message = 'Brawa za opanowanie tych umiejêtnoci. Pewnie bêdziesz chcia³ wzi¹æ udzia³ w kilku turniejach sponsorowanych, zanim poszukasz Boone\'a, Dave\'a i Murphy\'ego w Beverly Hills. Bêdziesz potrzebowa³ wiele dowiadczenia, ¿eby zawalczyæ tu w LA.'
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
                    debug_menu_text = 'Cel Boone'
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
                    debug_menu_text = 'Zadanie Dave\'a'
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
                    debug_menu_text = 'Cel Murphy\'ego'
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
                    view_goals_text = 'Dostañ siê do Orodka.'
                    debug_menu_text = 'Odblokuj Orodek'
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
                    view_goals_text = 'Zrób wra¿enie na przyjacio³ach Mindy.'
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
                    view_goals_text = 'Dostañ siê do Orodka.'
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
                    view_goals_text = 'Dostañ siê do Orodka.'
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
                    view_goals_text = 'Dostañ siê do Orodka.'
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
                    view_goals_text = 'Dostañ siê do Orodka.'
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
                    view_goals_text = 'Dostañ siê do Orodka.'
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
                    debug_menu_text = 'Uczep siê Sancheza'
                    view_goals_text = 'Odholuj psa do hollywood!'
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
                    view_goals_text = 'Odholuj psa do hollywood!'
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
                    view_goals_text = 'Uchwyæ siê Sancheza i przejed do Hollywood'
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
                    debug_menu_text = 'Naucz siê wykonywaæ Bert.'
                    view_goals_text = 'Naucz siê od Iggy\'ego robiæ Bert Slide'
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
                    debug_menu_text = 'IGC - Dinozaur Murphy\'ego'
                    view_goals_text = 'Kup Tyranozaura w Hollywood'
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
                    view_goals_text = 'Niech Iggy nauczy ciê robiæ Bert Slide'
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
                    debug_menu_text = 'Kup ³eb dinozaura'
                    view_goals_text = 'Kup T-Rexa w Hollywood.'
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
                    view_goals_text = 'Kup T-Rexa w Hollywood.'
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
                    view_goals_text = 'Wróæ do Orodka'
                }
                atom_params = {
                    send_delay = 0
                    text = {
                        from = 'Mindy'
                        message = 'Wracaj do orodka.  U Iggy\'ego buduj¹ wielki dwig.'
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
                    debug_menu_text = 'PODNIE DWIG'
                    view_goals_text = 'Wróæ do Orodka'
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
                    view_goals_text = 'Wróæ do Orodka'
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
                    view_goals_text = 'Zdob¹d znak 69 z Beverly Hills.'
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
                    view_goals_text = 'Zdob¹d znak 69 z Beverly Hills.'
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
                    debug_menu_text = 'Stacja benzynowa'
                    view_goals_text = 'Zdob¹d znak 69 z Beverly Hills.'
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
                    view_goals_text = 'Zdob¹d znak 69 z Beverly Hills.'
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
                    debug_menu_text = 'S³upek ze stacji benzynowej IGC'
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
                    view_goals_text = 'Zbierz czêci do Orodka!'
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
                    debug_menu_text = 'Grupo 1, dorwij cele'
                    view_goals_text = 'Zdob¹d elementy w Beverly Hills i Hollywood.'
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
                    view_goals_text = 'Zdob¹d elementy w Beverly Hills i Hollywood.'
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
                    debug_menu_text = 'Odblokuj DT'
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
                    debug_menu_text = 'Mindy wysy³a ciê do Mistrza Zen.'
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
                    debug_menu_text = 'Zdob¹d zadania ze ródmiecia, grupa 2'
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
                    debug_menu_text = 'Stójka na autostradzie'
                    view_goals_text = 'Naucz siê od mistrza Zen.'
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
                    view_goals_text = 'Zdob¹d kawa³ki w Centrum, Beverly Hills, Hollywood.'
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
                    view_goals_text = 'Naucz siê od mistrza Zen.'
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
                    debug_menu_text = 'Naucz siê skupiaæ'
                    view_goals_text = 'Naucz siê od mistrza Zen.'
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
                    view_goals_text = 'Naucz siê od mistrza Zen.'
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
                    debug_menu_text = 'Odblokuj SV'
                    view_goals_text = 'Pogadaj z organizatoerm AMJAM.'
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
                    view_goals_text = 'Dostañ siê na zawody AMJAM'
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
                    view_goals_text = 'Zarób kasê i we¿ udzia³ w wyzwaniach sponsorowanych.'
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
                    debug_menu_text = 'amjam'
                    view_goals_text = 'Wygraj Tony Hawk AMJAM!'
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
                    view_goals_text = 'Wygraj Tony Hawk AMJAM!'
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
                    view_goals_text = 'Wróæ do Orodka'
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
                    view_goals_text = 'Wróæ do Orodka'
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
                    view_goals_text = 'Wróæ do Orodka'
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
                        message = 'Spotkaj siê z mn¹ w Orodku.  A, no i wietna robota z tym AMJAMem!'
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
                    view_goals_text = 'Wróæ do Orodka'
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
                    debug_menu_text = 'Zas³u¿ na szacunek'
                    view_goals_text = 'Udaj siê do Beverly Hills i znajd Skateclub.'
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
                    view_goals_text = 'U³ó¿ siê z kolesiami ze skate clubu.'
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
                    view_goals_text = 'U³ó¿ siê z kolesiami ze skate clubu.'
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
                    view_goals_text = 'U³ó¿ siê z kolesiami ze skate clubu.'
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
                    debug_menu_text = 'Walcz z Daewonem'
                    view_goals_text = 'Udaj siê do gara¿u BH.'
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
                    debug_menu_text = 'Odblokuj SM'
                    view_goals_text = 'Znajd Tony\'ego Alvê w Santa Monica.'
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
                    view_goals_text = 'Znajd Tony\'ego Alvê w Santa Monica.'
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
                    view_goals_text = 'Odszukaj Alvê, zdob¹d czêci do Orodka.'
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
                    debug_menu_text = 'Dach s¹du'
                    view_goals_text = 'Odszukaj Alvê, zdob¹d czêci do Orodka.'
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
                    debug_menu_text = 'Poka¿ Alvie na co ciê staæ'
                    view_goals_text = 'Tony Alva chce zobaczyæ, na co ciê staæ.'
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
                    view_goals_text = 'Spotkaj siê z Alv¹ przy diabelskim m³ynie.'
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
                    debug_menu_text = 'Santa Monica - zdob¹d ramê'
                    view_goals_text = 'Zdob¹d kostium kosmity, przestrasz Carnie.'
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
                    view_goals_text = 'Zrób trik, ¿eby go wystraszyæ!'
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
                    debug_menu_text = 'IGC - Alva poka¿e ci ³ód'
                    view_goals_text = 'Zap³aæ kolesiowi na ³odzi'
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
                    debug_menu_text = 'Zap³aæ kapitanowi statku.'
                    view_goals_text = 'Zap³aæ kapitanowi statku'
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
                    debug_menu_text = 'Odblokuj OI'
                    view_goals_text = 'Dostañ siê na ³ód w Santa Monica'
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
                    view_goals_text = 'Zrób rzeczy, o które prosi Mega.'
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
                    view_goals_text = 'Zrób rzeczy, o które prosi Mega.'
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
                    view_goals_text = 'Zrób rzeczy, o które prosi Mega.'
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
                    debug_menu_text = 'Grupo 3, dorwij cele'
                    view_goals_text = 'Zdob¹d elementy platformy wiertniczej do Orodka!'
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
                    view_goals_text = 'Zdob¹d elementy rafinerii!'
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
                    view_goals_text = 'Zdob¹d elementy rafinerii!'
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
                    view_goals_text = 'Zdob¹d elementy rafinerii!'
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
                    debug_menu_text = 'Zmykaj z rafinerii'
                    view_goals_text = 'Znajd wyjcie z wie¿y wiertniczej'
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
                    view_goals_text = 'Pomó¿ Medze w Orodku'
                }
                atom_script = game_progress_send_pager_message
                atom_params = {
                    send_delay = 0
                    text = {
                        from = 'Mega'
                        message = 'Synu, zadek w troki i wita wio do Orodka! Ten dwig, którym wykopa³em ten slalom, jest kaputt. Bardziej kaputt, ni¿ szop przebiegaj¹cy przez autostradê w godzinach szczytu!'
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
                    debug_menu_text = 'Pomó¿ Medze w Orodku'
                    view_goals_text = 'Pomó¿ Medze w Orodku'
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
                    view_goals_text = 'Pomó¿ Medze w Orodku'
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
                    debug_menu_text = 'Wezwanie Mindy'
                    view_goals_text = 'Dostañ siê do tunelu Belmont w Centrum.'
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
                    view_goals_text = 'Pomó¿ Medze w Orodku'
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
                    view_goals_text = 'Dostañ siê do tunelu Belmont w Centrum.'
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
                    view_goals_text = 'Dostañ siê do tunelu Belmont w Centrum.'
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
                    view_goals_text = 'Dostañ siê do tunelu Belmont w Centrum.'
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
                    debug_menu_text = 'zablokuj tunel choloz'
                    view_goals_text = 'Dostañ siê do tunelu Belmont w Centrum.'
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
                    view_goals_text = 'Dostañ siê do tunelu Belmont w Centrum.'
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
                    view_goals_text = 'Zrób sobie tatua¿ w Santa Monica i jed do Centrum'
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
                    view_goals_text = 'Zdob¹d tatua¿ Widowz w Santa Monica'
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
                    debug_menu_text = 'Stwórz taga dla Cholozów'
                    view_goals_text = 'Porób tagi na miecie, poznaj wszystkie 4 style!'
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
                    debug_menu_text = 'Zataguj Cholosów'
                    view_goals_text = 'Otaguj wszystkie miejscówki w LA, stwórz tag ca³ego miasta.'
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
                    view_goals_text = 'Odszukaj na przedmieciu BMX Black Widowz'
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
                    debug_menu_text = 'Odblokuj EL'
                    view_goals_text = 'Udaj siê do wschodniego LA.'
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
                    view_goals_text = 'Udaj siê do wschodniego LA.'
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
                    view_goals_text = 'Uratuj Boone\'a we wschodnim LA'
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
                    view_goals_text = 'Wyci¹gnij Boone\'a z tunelu.'
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
                    view_goals_text = 'Wyci¹gnij Boone\'a z tunelu.'
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
                    debug_menu_text = 'Grupo 4, dorwij cele'
                    view_goals_text = 'Zbierz czêci do Orodka we wschodnim LA.'
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
                    debug_menu_text = 'Grupo 4, dorwij cele'
                    view_goals_text = 'Zbierz czêci do Orodka we wschodnim LA.'
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
                    view_goals_text = 'Mega musi wróciæ do Orodka!'
                }
                atom_params = {
                    send_delay = 0
                    text = {
                        from = 'Mega'
                        message = 'Hej, stary, Mega jest w MEGATARAPATACH! Atakuj¹ mnie! Jaki debil usi³uje porwaæ mój dwig! Udaj siê do Orodka i wybij mu to z g³owy!'
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
                    debug_menu_text = 'Zestrzel robotnika z dwigu'
                    view_goals_text = 'Jed do Orodka i pomó¿ Medze!'
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
                    view_goals_text = 'Dostarcz paczkê Joey\'owi B.'
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
                    view_goals_text = 'Przerwij wykopaliska w Orodku'
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
                    view_goals_text = 'Przerwij wykopaliska w Orodku'
                }
                atom_params = {
                    send_delay = 0
                    text = {
                        from = 'Mega'
                        message = 'Hej, wracaj do Orodka.  Ludzie zaczynaj¹ siê schodziæ.'
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
                    view_goals_text = 'Przerwij wykopaliska w Orodku'
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
                    view_goals_text = 'Przerwij wykopaliska w Orodku'
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
                    view_goals_text = 'Przerwij wykopaliska w Orodku'
                    debug_menu_text = 'USUÑ DWIG'
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
                    view_goals_text = 'Przerwij wykopaliska w Orodku'
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
                    view_goals_text = 'Zrób wra¿enie na Tony Hawku w Beverly Hills'
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
                    debug_menu_text = 'Nagraj film'
                    view_goals_text = 'Zrób wra¿enie na Tony Hawku w Beverly Hills'
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
                    view_goals_text = 'Zrób wra¿enie na Tony Hawku w Beverly Hills'
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
                    debug_menu_text = 'Znajd Tony\'ego'
                    view_goals_text = 'Zrób wra¿enie na Tony Hawku w Beverly Hills'
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
                    view_goals_text = 'Zrób wra¿enie na wystarczaj¹cej liczbie zawodowców w LA'
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
                    debug_menu_text = 'Znajd zawodowców'
                    view_goals_text = 'Zrób wra¿enie na wystarczaj¹cej liczbie zawodowców w LA'
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
                    view_goals_text = 'Zrób wra¿enie na wystarczaj¹cej liczbie zawodowców w LA'
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
                    debug_menu_text = 'Znajd Reynoldsa'
                    view_goals_text = 'Znajd i zrób wra¿enie na zawodowcach w LA.'
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
                    view_goals_text = 'Znajd i zrób wra¿enie na zawodowcach w LA.'
                }
                atom_params = {
                    send_delay = 0
                    text = {
                        from = 'Murphy'
                        message = 'Stary, dziêki za sko³owanie tego znaku z Hollywood. Trochê przy nim pomajstrowalimy tu w Orodku!'
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
                    view_goals_text = 'Znajd i zrób wra¿enie na zawodowcach w LA.'
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
                    debug_menu_text = 'Znajd Rodney\'a'
                    view_goals_text = 'Znajd i zrób wra¿enie na zawodowcach w LA.'
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
                    view_goals_text = 'Znajd i zrób wra¿enie na zawodowcach w LA.'
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
                    view_goals_text = 'Zrób wra¿enie na Bamie we wschodnim LA'
                }
                atom_params = {
                    send_delay = 0
                    text = {
                        from = 'Murphy'
                        message = 'Ziom, w³anie widzia³em Bama Margerê we wschodnim LA, w pobli¿u skateparku.  Znajd go. Bêdzie zajebicie, jeli wyst¹pi w naszym filmie.'
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
                    debug_menu_text = 'Znajd Bama'
                    view_goals_text = 'Zrób wra¿enie na Bamie we wschodnim LA'
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
                    view_goals_text = 'Przedostañ siê przez wschodnie LA do kasyna!'
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
                    view_goals_text = 'Przedostañ siê przez wschodnie LA do kasyna!'
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
                    debug_menu_text = 'Ciê¿arówka Taco'
                    view_goals_text = 'Zap³aæ lasce z ciê¿arówki Taco.'
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
                    debug_menu_text = 'Odblokuj LV'
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
                    debug_menu_text = 'Grupo 5, dorwij cele'
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
                    debug_menu_text = 'Kasyno IGC'
                    view_goals_text = 'Zgub gliny, wróæ do Orodka.'
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
                    view_goals_text = 'Rozwal kasyno wraz z Iggym!'
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
                    debug_menu_text = 'Sprawa Choppera'
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
                    view_goals_text = 'Impreza w nowym Orodku!'
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
                    view_goals_text = 'Zgub gliny, wróæ do Orodka.'
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
                    view_goals_text = 'Impreza w nowym Orodku!'
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
                    view_goals_text = 'Impreza w nowym Orodku!'
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
                    view_goals_text = 'Impreza w nowym Orodku!'
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
                    view_goals_text = 'Impreza w nowym Orodku!'
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
                    view_goals_text = 'Impreza w nowym Orodku!'
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
                    view_goals_text = 'Impreza w nowym Orodku!'
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
                    view_goals_text = 'Impreza w nowym Orodku!'
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
                    view_goals_text = 'Impreza w nowym Orodku!'
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
