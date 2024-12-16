goal_trickspot_genericParams = { goal_text = "generic trickspot text" view_goals_text = "Trickspot goal" init = goal_trickspot_init uninit = goal_uninit active = goal_trickspot_active activate = goal_trickspot_activate success = goal_trickspot_success fail = goal_trickspot_fail expire = goal_trickspot_expire deactivate = goal_trickspot_deactivate trigger_obj_id = TRG_G_TS_Pro restart_node = TRG_G_TS_RestartNode start_pad_id = G_TS_StartPad goal_flags = [ got_1 got_2 got_3 ] record_type = score } SCRIPT goal_trickspot_init goal_init goal_id = <goal_id> ENDSCRIPT
SCRIPT goal_trickspot_active IF GoalManager_AllFlagsSet name = <goal_id> GoalManager_WinGoal name = <goal_id> ENDIF ENDSCRIPT
SCRIPT goal_trickspot_activate goal_start goal_id = <goal_id> ENDSCRIPT
SCRIPT goal_trickspot_deactivate goal_deactivate goal_id = <goal_id> GoalManager_ResetGoalTrigger name = <goal_id> ENDSCRIPT
SCRIPT goal_trickspot_success goal_success goal_id = <goal_id> ENDSCRIPT
SCRIPT goal_trickspot_fail goal_fail goal_id = <goal_id> ENDSCRIPT
SCRIPT goal_trickspot_expire goal_expire goal_id = <goal_id> GoalManager_LoseGoal name = <goal_id> ENDSCRIPT

