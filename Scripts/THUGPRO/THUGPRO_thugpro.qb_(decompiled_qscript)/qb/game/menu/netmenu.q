SCRIPT set_join_mode 
	StopServerList 
	SetJoinMode <...> 
ENDSCRIPT

SCRIPT chosen_leave_server 
	ClearOmnigons 
	change check_for_unplugged_controllers = 0 
	printf "****************** DEACTIVATING GOALS!!!! ********************" 
	GoalManager_DeactivateAllGoals force_all 
	GoalManager_UninitializeAllGoals 
	GoalManager_RemoveAllGoals 
	ParkEditorCommand command = DestroyGeneratedPark instant 
	LeaveServer 
	SetNetworkMode 
ENDSCRIPT


