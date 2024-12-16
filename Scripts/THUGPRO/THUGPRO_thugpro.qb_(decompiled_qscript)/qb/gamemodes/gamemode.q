
mode_info = [ 
	{ 
		name = "Free Skate" 
		checksum = freeskate 
		definition = "mode_freeskate" 
	} 
	{ 
		name = "2 Player Free Skate" 
		checksum = freeskate2p 
		definition = "mode_freeskate2p" 
	} 
	{ 
		name = "Single Session" 
		checksum = singlesession 
		definition = "mode_singlesession" 
	} 
	{ 
		name = "Trick Attack" 
		checksum = trickattack 
		definition = "mode_trickattack" 
	} 
	{ 
		name = "Scavenger Hunt" 
		checksum = scavengerhunt 
		definition = "mode_scavengerhunt" 
	} 
	{ 
		name = "Score Challenge" 
		checksum = scorechallenge 
		definition = "mode_scorechallenge" 
	} 
	{ 
		name = "Combo Mambo" 
		checksum = combomambo 
		definition = "mode_combomambo" 
	} 
	{ 
		name = "Graffiti" 
		checksum = graffiti 
		definition = "mode_graffiti" 
	} 
	{ 
		name = "Slap!" 
		checksum = slap 
		definition = "mode_slap" 
	} 
	{ 
		name = "King of the Hill" 
		checksum = king 
		definition = "mode_king" 
	} 
	{ 
		name = "Pot of Gold" 
		checksum = gold 
		definition = "mode_gold" 
	} 
	{ 
		name = "Horse" 
		checksum = horse 
		definition = "mode_horse" 
	} 
	{ 
		name = "Horse" 
		checksum = nethorse 
		definition = "mode_nethorse" 
	} 
	{ 
		name = "Career" 
		checksum = career 
		definition = "mode_career" 
	} 
	{ 
		name = "Net" 
		checksum = net 
		definition = "mode_net" 
	} 
	{ 
		name = "Lobby" 
		checksum = netlobby 
		definition = "mode_netlobby" 
	} 
	{ 
		name = "Trick Attack" 
		checksum = nettrickattack 
		definition = "mode_nettrickattack" 
	} 
	{ 
		name = "Scavenger Hunt" 
		checksum = netscavengerhunt 
		definition = "mode_netscavengerhunt" 
	} 
	{ 
		name = "Elimiskate" 
		checksum = netelimiskate 
		definition = "mode_netelimiskate" 
	} 
	{ 
		name = "Score Challenge" 
		checksum = netscorechallenge 
		definition = "mode_netscorechallenge" 
	} 
	{ 
		name = "Combo Mambo" 
		checksum = netcombomambo 
		definition = "mode_netcombomambo" 
	} 
	{ 
		name = "Graffiti" 
		checksum = netgraffiti 
		definition = "mode_netgraffiti" 
	} 
	{ 
		name = "Goal Attack" 
		checksum = netgoalattack 
		definition = "mode_netgoalattack" 
	} 
	{ 
		name = "Slap!" 
		checksum = netslap 
		definition = "mode_netslap" 
	} 
	{ 
		name = "King of the Hill" 
		checksum = netking 
		definition = "mode_netking" 
	} 
	{ 
		name = "Pot of Gold" 
		checksum = netgold 
		definition = "mode_netgold" 
	} 
	{ 
		name = "Capture the Flag" 
		checksum = netctf 
		definition = "mode_netctf" 
	} 
	{ 
		name = "Park Editor" 
		checksum = parkeditor 
		definition = "mode_parkeditor" 
	} 
	{ 
		name = "Create Goals" 
		checksum = creategoals 
		definition = "mode_creategoals" 
	} 
	{ 
		name = "FireFight" 
		checksum = firefight 
		definition = "mode_firefight" 
	} 
	{ 
		name = "FireFight" 
		checksum = netfirefight 
		definition = "mode_netfirefight" 
	} 
	{ 
		name = "Classic Mode" 
		checksum = classic 
		definition = "mode_classic" 
	} 
	{ 
		name = "Race" 
		checksum = netrace 
		definition = "mode_netrace" 
	} 
] 
mode_freeskate = { 
	name = freeskate 
	initial_players = 1 
	max_players = 2 
	time_limit_type = fixed 
	default_time_limit = 0 
	victory_condition_type = fixed 
	score_frozen = 0 
	accumulate_score = 0 
	track_trick_score = 1 
	degrade_score = 0 
	is_lobby = 0 
	screenmode = single 
	should_run_intro_camera = 1 
	should_run_intro_camera_noncd = 1 
	show_ranking_screen = 0 
	stop_at_zero = 0 
	is_career = 0 
	is_singlesession = 0 
	is_parkeditor = 0 
	should_modulate_color = 0 
	is_horse = 0 
	is_king = 0 
	is_gold = 0 
	is_trick_attack = 0 
	is_elimiskate = 0 
	is_combo_mambo = 0 
	is_goal_attack = 0 
	is_ctf = 0 
	is_firefight = 0 
	is_score_challenge = 0 
	show_leader_messages = 0 
	timer_beeps = 0 
	num_teams = 0 
	is_net = 0 
	is_freeskate = 1 
	is_creategoals = 0 
	is_classic = 0 
	should_elimination_skater = 0 
	show_waiting_message = 1 
	should_end_run_quickly = 0 
} 
mode_freeskate2p = { 
	name = freeskate 
	initial_players = 2 
	max_players = 2 
	time_limit_type = fixed 
	default_time_limit = 0 
	victory_condition_type = fixed 
	score_frozen = 0 
	accumulate_score = 0 
	track_trick_score = 1 
	degrade_score = 0 
	is_lobby = 1 
	screenmode = splitscreen 
	should_run_intro_camera = 1 
	should_run_intro_camera_noncd = 1 
	show_ranking_screen = 0 
	stop_at_zero = 0 
	is_career = 0 
	is_singlesession = 0 
	is_parkeditor = 0 
	should_modulate_color = 0 
	is_horse = 0 
	is_king = 0 
	is_gold = 0 
	is_trick_attack = 0 
	is_elimiskate = 0 
	is_score_challenge = 0 
	is_combo_mambo = 0 
	is_goal_attack = 0 
	is_ctf = 0 
	is_firefight = 0 
	show_leader_messages = 0 
	timer_beeps = 0 
	num_teams = 0 
	is_net = 0 
	is_freeskate = 1 
	is_creategoals = 0 
	is_classic = 0 
	should_elimination_skater = 0 
	show_waiting_message = 0 
} 
mode_singlesession = { 
	name = singlesession 
	initial_players = 1 
	max_players = 1 
	time_limit_type = fixed 
	default_time_limit = 120 
	victory_condition_type = fixed 
	score_frozen = 0 
	accumulate_score = 1 
	track_trick_score = 1 
	degrade_score = 1 
	is_lobby = 0 
	screenmode = single 
	should_run_intro_camera = 0 
	should_run_intro_camera_noncd = 0 
	show_ranking_screen = 0 
	stop_at_zero = 0 
	is_career = 0 
	is_singlesession = 1 
	is_parkeditor = 0 
	should_modulate_color = 0 
	is_horse = 0 
	is_king = 0 
	is_gold = 0 
	is_trick_attack = 0 
	is_elimiskate = 0 
	is_score_challenge = 0 
	is_combo_mambo = 0 
	is_goal_attack = 0 
	is_ctf = 0 
	is_firefight = 0 
	show_leader_messages = 0 
	timer_beeps = 1 
	num_teams = 0 
	is_net = 0 
	is_freeskate = 0 
	is_creategoals = 0 
	is_classic = 0 
	should_elimination_skater = 0 
	show_waiting_message = 1 
	should_end_run_quickly = 0 
} 
mode_career = { 
	name = career 
	initial_players = 1 
	max_players = 1 
	time_limit_type = fixed 
	default_time_limit = 120 
	victory_condition_type = fixed 
	score_frozen = 0 
	accumulate_score = 1 
	track_trick_score = 1 
	degrade_score = 1 
	is_lobby = 0 
	screenmode = single 
	should_run_intro_camera = 1 
	should_run_intro_camera_noncd = 1 
	show_ranking_screen = 0 
	stop_at_zero = 0 
	is_career = 1 
	is_singlesession = 0 
	is_parkeditor = 0 
	should_modulate_color = 0 
	is_horse = 0 
	is_king = 0 
	is_gold = 0 
	is_trick_attack = 0 
	is_elimiskate = 0 
	is_score_challenge = 0 
	is_combo_mambo = 0 
	is_goal_attack = 0 
	is_ctf = 0 
	is_firefight = 0 
	show_leader_messages = 0 
	timer_beeps = 1 
	num_teams = 0 
	is_net = 0 
	is_freeskate = 0 
	is_creategoals = 0 
	is_classic = 0 
	should_elimination_skater = 0 
	show_waiting_message = 1 
	should_end_run_quickly = 0 
} 
mode_creategoals = { 
	name = creategoals 
	initial_players = 1 
	max_players = 1 
	time_limit_type = fixed 
	default_time_limit = 120 
	victory_condition_type = fixed 
	score_frozen = 0 
	accumulate_score = 1 
	track_trick_score = 1 
	degrade_score = 1 
	is_lobby = 0 
	screenmode = single 
	should_run_intro_camera = 1 
	should_run_intro_camera_noncd = 1 
	show_ranking_screen = 0 
	stop_at_zero = 0 
	is_career = 0 
	is_singlesession = 0 
	is_parkeditor = 0 
	should_modulate_color = 0 
	is_horse = 0 
	is_king = 0 
	is_gold = 0 
	is_trick_attack = 0 
	is_elimiskate = 0 
	is_score_challenge = 0 
	is_combo_mambo = 0 
	is_goal_attack = 0 
	is_ctf = 0 
	is_firefight = 0 
	show_leader_messages = 0 
	timer_beeps = 1 
	num_teams = 0 
	is_net = 0 
	is_freeskate = 0 
	is_creategoals = 1 
	is_classic = 0 
	should_elimination_skater = 0 
	show_waiting_message = 1 
	should_end_run_quickly = 0 
} 
mode_net = { 
	name = net 
	initial_players = 1 
	max_players = 1 
	time_limit_type = fixed 
	default_time_limit = 120 
	victory_condition_type = fixed 
	score_frozen = 0 
	accumulate_score = 1 
	track_trick_score = 1 
	degrade_score = 1 
	is_lobby = 0 
	screenmode = single 
	should_run_intro_camera = 1 
	should_run_intro_camera_noncd = 1 
	show_ranking_screen = 0 
	stop_at_zero = 0 
	is_career = 0 
	is_singlesession = 0 
	is_parkeditor = 0 
	should_modulate_color = 0 
	is_horse = 0 
	is_king = 0 
	is_gold = 0 
	is_trick_attack = 0 
	is_elimiskate = 0 
	is_score_challenge = 0 
	is_combo_mambo = 0 
	is_goal_attack = 0 
	is_ctf = 0 
	is_firefight = 0 
	show_leader_messages = 0 
	timer_beeps = 1 
	num_teams = 0 
	is_net = 1 
	is_freeskate = 0 
	is_creategoals = 0 
	is_classic = 0 
	should_elimination_skater = 0 
	show_waiting_message = 1 
	should_end_run_quickly = 0 
} 
mode_trickattack = { 
	name = trickattack 
	initial_players = 2 
	max_players = 2 
	time_limit_type = config 
	default_time_limit = 120 
	victory_condition_type = config 
	score_frozen = 0 
	accumulate_score = 1 
	track_trick_score = 1 
	degrade_score = 1 
	is_lobby = 0 
	screenmode = splitscreen 
	victory_conditions = [ 
		{ type = highest_score } 
	] 
	should_run_intro_camera = 0 
	should_run_intro_camera_noncd = 0 
	show_ranking_screen = 1 
	stop_at_zero = 0 
	is_career = 0 
	is_singlesession = 0 
	is_parkeditor = 0 
	should_modulate_color = 0 
	is_horse = 0 
	is_king = 0 
	is_gold = 0 
	is_trick_attack = 1 
	is_elimiskate = 0 
	is_score_challenge = 0 
	is_combo_mambo = 0 
	is_goal_attack = 0 
	is_ctf = 0 
	is_firefight = 0 
	show_leader_messages = 0 
	timer_beeps = 1 
	num_teams = 0 
	is_net = 0 
	is_freeskate = 0 
	is_creategoals = 0 
	is_classic = 0 
	should_elimination_skater = 0 
	show_waiting_message = 1 
	should_end_run_quickly = 0 
} 
mode_nettrickattack = { 
	name = nettrickattack 
	initial_players = 1 
	max_players = 8 
	time_limit_type = config 
	default_time_limit = 90 
	victory_condition_type = config 
	score_frozen = 0 
	accumulate_score = 1 
	track_trick_score = 1 
	degrade_score = 1 
	is_lobby = 0 
	screenmode = single 
	victory_conditions = [ 
		{ type = highest_score } 
	] 
	should_run_intro_camera = 0 
	should_run_intro_camera_noncd = 0 
	show_ranking_screen = 1 
	stop_at_zero = 0 
	is_career = 0 
	is_singlesession = 0 
	is_parkeditor = 0 
	should_modulate_color = 0 
	is_horse = 0 
	is_king = 0 
	is_gold = 0 
	is_trick_attack = 1 
	is_elimiskate = 0 
	is_score_challenge = 0 
	is_combo_mambo = 0 
	is_goal_attack = 0 
	is_ctf = 0 
	is_firefight = 0 
	show_leader_messages = 1 
	timer_beeps = 1 
	num_teams = 0 
	is_net = 1 
	is_freeskate = 0 
	is_creategoals = 0 
	is_classic = 0 
	should_elimination_skater = 0 
	show_waiting_message = 1 
	should_end_run_quickly = 1 
} 
mode_elimiskate = { 
	name = elimiskate 
	initial_players = 2 
	max_players = 2 
	time_limit_type = config 
	default_time_limit = 120 
	victory_condition_type = config 
	score_frozen = 0 
	accumulate_score = 1 
	track_trick_score = 1 
	degrade_score = 1 
	is_lobby = 0 
	screenmode = splitscreen 
	victory_conditions = [ 
		{ type = elimination } 
	] 
	should_run_intro_camera = 0 
	should_run_intro_camera_noncd = 0 
	show_ranking_screen = 1 
	stop_at_zero = 0 
	round = 0 
	is_career = 0 
	is_singlesession = 0 
	is_parkeditor = 0 
	should_modulate_color = 0 
	is_horse = 0 
	is_king = 0 
	is_gold = 0 
	is_trick_attack = 0 
	is_elimiskate = 1 
	is_score_challenge = 0 
	is_combo_mambo = 0 
	is_goal_attack = 0 
	is_ctf = 0 
	is_firefight = 0 
	show_leader_messages = 0 
	timer_beeps = 1 
	num_teams = 0 
	is_net = 0 
	is_freeskate = 0 
	is_creategoals = 0 
	is_classic = 0 
	should_elimination_skater = 1 
	show_waiting_message = 1 
	should_end_run_quickly = 0 
} 
mode_netelimiskate = { 
	name = netelimiskate 
	initial_players = 1 
	max_players = 8 
	time_limit_type = config 
	default_time_limit = 90 
	victory_condition_type = config 
	score_frozen = 0 
	accumulate_score = 1 
	track_trick_score = 1 
	degrade_score = 1 
	is_lobby = 0 
	screenmode = single 
	victory_conditions = [ 
		{ type = elimination } 
	] 
	should_run_intro_camera = 0 
	should_run_intro_camera_noncd = 0 
	show_ranking_screen = 1 
	stop_at_zero = 0 
	round = 0 
	is_career = 0 
	is_singlesession = 0 
	is_parkeditor = 0 
	should_modulate_color = 0 
	is_horse = 0 
	is_king = 0 
	is_gold = 0 
	is_trickattack = 0 
	is_elimiskate = 1 
	is_score_challenge = 0 
	is_combo_mambo = 0 
	is_goal_attack = 0 
	is_ctf = 0 
	is_firefight = 0 
	show_leader_messages = 1 
	timer_beeps = 1 
	num_teams = 0 
	is_net = 1 
	is_freeskate = 0 
	is_creategoals = 0 
	is_classic = 0 
	should_elimination_skater = 1 
	show_waiting_message = 1 
	should_end_run_quickly = 0 
} 
mode_scorechallenge = { 
	name = scorechallenge 
	initial_players = 2 
	max_players = 2 
	time_limit_type = config 
	default_time_limit = 0 
	victory_condition_type = config 
	score_frozen = 0 
	accumulate_score = 1 
	track_trick_score = 1 
	degrade_score = 1 
	is_lobby = 0 
	screenmode = splitscreen 
	victory_conditions = [ 
		{ type = target_score score = 10000 } 
	] 
	should_run_intro_camera = 0 
	should_run_intro_camera_noncd = 0 
	show_ranking_screen = 1 
	stop_at_zero = 1 
	is_career = 0 
	is_singlesession = 0 
	is_parkeditor = 0 
	should_modulate_color = 0 
	is_horse = 0 
	is_king = 0 
	is_gold = 0 
	is_trick_attack = 0 
	is_elimiskate = 0 
	is_score_challenge = 1 
	is_combo_mambo = 0 
	is_goal_attack = 0 
	is_ctf = 0 
	is_firefight = 0 
	show_leader_messages = 0 
	timer_beeps = 1 
	num_teams = 0 
	is_net = 0 
	is_freeskate = 0 
	is_creategoals = 0 
	is_classic = 0 
	should_elimination_skater = 0 
	show_waiting_message = 0 
} 
mode_netscorechallenge = { 
	name = netscorechallenge 
	initial_players = 1 
	max_players = 8 
	time_limit_type = config 
	default_time_limit = 0 
	victory_condition_type = config 
	score_frozen = 0 
	accumulate_score = 1 
	track_trick_score = 1 
	degrade_score = 1 
	is_lobby = 0 
	screenmode = single 
	victory_conditions = [ 
		{ type = target_score score = 10000 } 
	] 
	should_run_intro_camera = 0 
	should_run_intro_camera_noncd = 0 
	show_ranking_screen = 1 
	stop_at_zero = 1 
	is_career = 0 
	is_singlesession = 0 
	is_parkeditor = 0 
	should_modulate_color = 0 
	is_horse = 0 
	is_king = 0 
	is_gold = 0 
	is_trick_attack = 0 
	is_elimiskate = 0 
	is_score_challenge = 1 
	is_combo_mambo = 0 
	is_goal_attack = 0 
	is_ctf = 0 
	is_firefight = 0 
	show_leader_messages = 1 
	timer_beeps = 1 
	num_teams = 0 
	is_net = 1 
	is_freeskate = 0 
	is_creategoals = 0 
	is_classic = 0 
	should_elimination_skater = 0 
	show_waiting_message = 0 
} 
mode_combomambo = { 
	name = combomambo 
	initial_players = 2 
	max_players = 2 
	time_limit_type = config 
	default_time_limit = 120 
	victory_condition_type = config 
	score_frozen = 0 
	accumulate_score = 0 
	track_best_combo = 1 
	track_trick_score = 1 
	degrade_score = 0 
	is_lobby = 0 
	screenmode = splitscreen 
	victory_conditions = [ 
		{ type = highest_score } 
	] 
	should_run_intro_camera = 0 
	should_run_intro_camera_noncd = 0 
	show_ranking_screen = 1 
	stop_at_zero = 1 
	is_career = 0 
	is_singlesession = 0 
	is_parkeditor = 0 
	should_modulate_color = 0 
	is_horse = 0 
	is_king = 0 
	is_gold = 0 
	is_trick_attack = 0 
	is_elimiskate = 0 
	is_score_challenge = 0 
	is_combo_mambo = 1 
	is_goal_attack = 0 
	is_ctf = 0 
	is_firefight = 0 
	show_leader_messages = 0 
	timer_beeps = 1 
	num_teams = 0 
	is_net = 0 
	is_freeskate = 0 
	is_creategoals = 0 
	is_classic = 0 
	should_elimination_skater = 0 
	show_waiting_message = 1 
	should_end_run_quickly = 0 
} 
mode_netcombomambo = { 
	name = netcombomambo 
	initial_players = 1 
	max_players = 8 
	time_limit_type = config 
	default_time_limit = 90 
	victory_condition_type = config 
	score_frozen = 0 
	accumulate_score = 0 
	track_best_combo = 1 
	track_trick_score = 1 
	degrade_score = 0 
	is_lobby = 0 
	screenmode = single 
	victory_conditions = [ 
		{ type = highest_score } 
	] 
	should_run_intro_camera = 0 
	should_run_intro_camera_noncd = 0 
	show_ranking_screen = 1 
	stop_at_zero = 1 
	is_career = 0 
	is_singlesession = 0 
	is_parkeditor = 0 
	should_modulate_color = 0 
	is_horse = 0 
	is_king = 0 
	is_gold = 0 
	is_trick_attack = 0 
	is_elimiskate = 0 
	is_score_challenge = 0 
	is_combo_mambo = 1 
	is_goal_attack = 0 
	is_ctf = 0 
	is_firefight = 0 
	show_leader_messages = 1 
	timer_beeps = 1 
	num_teams = 0 
	is_net = 1 
	is_freeskate = 0 
	is_creategoals = 0 
	is_classic = 0 
	should_elimination_skater = 0 
	show_waiting_message = 1 
	should_end_run_quickly = 1 
} 
mode_graffiti = { 
	name = graffiti 
	initial_players = 2 
	max_players = 2 
	time_limit_type = config 
	default_time_limit = 120 
	victory_condition_type = config 
	score_frozen = 0 
	accumulate_score = 1 
	track_trick_score = 1 
	degrade_score = 1 
	is_lobby = 0 
	screenmode = splitscreen 
	victory_conditions = [ 
		{ type = highest_score } 
	] 
	should_run_intro_camera = 0 
	should_run_intro_camera_noncd = 0 
	show_ranking_screen = 1 
	stop_at_zero = 0 
	is_career = 0 
	is_singlesession = 0 
	is_parkeditor = 0 
	should_modulate_color = 1 
	is_horse = 0 
	is_king = 0 
	is_gold = 0 
	is_trick_attack = 0 
	is_elimiskate = 0 
	is_score_challenge = 0 
	is_combo_mambo = 0 
	is_goal_attack = 0 
	is_ctf = 0 
	is_firefight = 0 
	show_leader_messages = 0 
	timer_beeps = 1 
	num_teams = 0 
	is_net = 0 
	is_freeskate = 0 
	is_creategoals = 0 
	is_classic = 0 
	should_elimination_skater = 0 
	show_waiting_message = 1 
	should_end_run_quickly = 0 
	team_graffiti_mode = graffiti_individual_scoring 
} 
mode_netgraffiti = { 
	name = netgraffiti 
	initial_players = 1 
	max_players = 8 
	time_limit_type = config 
	default_time_limit = 90 
	victory_condition_type = config 
	score_frozen = 0 
	accumulate_score = 1 
	track_trick_score = 1 
	degrade_score = 1 
	is_lobby = 0 
	screenmode = single 
	victory_conditions = [ 
		{ type = highest_score } 
	] 
	should_run_intro_camera = 0 
	should_run_intro_camera_noncd = 0 
	show_ranking_screen = 1 
	stop_at_zero = 0 
	is_career = 0 
	is_singlesession = 0 
	is_parkeditor = 0 
	should_modulate_color = 1 
	is_horse = 0 
	is_king = 0 
	is_gold = 0 
	is_trick_attack = 0 
	is_elimiskate = 0 
	is_score_challenge = 0 
	is_combo_mambo = 0 
	is_goal_attack = 0 
	is_ctf = 0 
	is_firefight = 0 
	show_leader_messages = 1 
	timer_beeps = 1 
	num_teams = 0 
	is_net = 1 
	is_freeskate = 0 
	is_creategoals = 0 
	is_classic = 0 
	should_elimination_skater = 0 
	show_waiting_message = 1 
	should_end_run_quickly = 1 
	team_graffiti_mode = graffiti_team_scoring 
} 
mode_scavengerhunt = { 
	name = scavengerhunt 
	initial_players = 2 
	max_players = 2 
	time_limit_type = config 
	default_time_limit = 120 
	victory_condition_type = config 
	score_frozen = 0 
	accumulate_score = 0 
	track_trick_score = 0 
	degrade_score = 0 
	is_lobby = 0 
	screenmode = splitscreen 
	victory_conditions = [ 
		{ type = collect_all_objects } 
	] 
	should_run_intro_camera = 0 
	should_run_intro_camera_noncd = 0 
	show_ranking_screen = 1 
	stop_at_zero = 0 
	is_career = 0 
	is_singlesession = 0 
	is_parkeditor = 0 
	should_modulate_color = 0 
	is_horse = 0 
	is_king = 0 
	is_gold = 0 
	is_trick_attack = 0 
	is_elimiskate = 0 
	is_scavenger_hunt = 1 
	is_score_challenge = 0 
	is_combo_mambo = 0 
	is_goal_attack = 0 
	is_ctf = 0 
	is_firefight = 0 
	show_leader_messages = 0 
	timer_beeps = 1 
	num_teams = 0 
	is_net = 0 
	is_freeskate = 0 
	is_creategoals = 0 
	is_classic = 0 
	should_elimination_skater = 0 
	show_waiting_message = 1 
	should_end_run_quickly = 0 
} 
mode_netscavengerhunt = { 
	name = netscavengerhunt 
	initial_players = 1 
	max_players = 8 
	time_limit_type = config 
	default_time_limit = 90 
	victory_condition_type = config 
	score_frozen = 0 
	accumulate_score = 0 
	track_trick_score = 0 
	degrade_score = 1 
	is_lobby = 0 
	screenmode = single 
	victory_conditions = [ 
		{ type = collect_all_objects } 
	] 
	should_run_intro_camera = 0 
	should_run_intro_camera_noncd = 0 
	show_ranking_screen = 1 
	stop_at_zero = 0 
	is_career = 0 
	is_singlesession = 0 
	is_parkeditor = 0 
	should_modulate_color = 0 
	is_horse = 0 
	is_king = 0 
	is_gold = 0 
	is_trick_attack = 0 
	is_elimiskate = 0 
	is_scavenger_hunt = 1 
	is_score_challenge = 0 
	is_combo_mambo = 0 
	is_goal_attack = 0 
	is_ctf = 0 
	is_firefight = 0 
	show_leader_messages = 1 
	timer_beeps = 1 
	num_teams = 0 
	is_net = 1 
	is_freeskate = 0 
	is_creategoals = 0 
	is_classic = 0 
	should_elimination_skater = 0 
	show_waiting_message = 1 
	should_end_run_quickly = 0 
} 
mode_netgoalattack = { 
	name = netgoalattack 
	initial_players = 1 
	max_players = 8 
	time_limit_type = config 
	default_time_limit = 0 
	victory_condition_type = config 
	score_frozen = 0 
	accumulate_score = 0 
	track_trick_score = 1 
	degrade_score = 0 
	is_lobby = 0 
	screenmode = single 
	victory_conditions = [ 
		{ type = complete_goals } 
	] 
	should_run_intro_camera = 0 
	should_run_intro_camera_noncd = 0 
	show_ranking_screen = 1 
	stop_at_zero = 0 
	is_career = 0 
	is_singlesession = 0 
	is_parkeditor = 0 
	should_modulate_color = 0 
	is_horse = 0 
	is_king = 0 
	is_gold = 0 
	is_trick_attack = 0 
	is_elimiskate = 0 
	is_score_challenge = 0 
	is_combo_mambo = 0 
	is_goal_attack = 1 
	is_ctf = 0 
	is_firefight = 0 
	show_leader_messages = 0 
	timer_beeps = 0 
	num_teams = 0 
	is_net = 1 
	is_freeskate = 0 
	is_creategoals = 0 
	is_classic = 0 
	should_elimination_skater = 0 
	show_waiting_message = 0 
	goals_mode = goals_classic 
} 
mode_slap = { 
	name = slap 
	initial_players = 2 
	max_players = 2 
	time_limit_type = config 
	default_time_limit = 120 
	victory_condition_type = config 
	score_frozen = 0 
	accumulate_score = 1 
	track_trick_score = 0 
	degrade_score = 0 
	is_lobby = 0 
	screenmode = splitscreen 
	victory_conditions = [ 
		{ type = highest_score } 
	] 
	should_run_intro_camera = 0 
	should_run_intro_camera_noncd = 0 
	show_ranking_screen = 1 
	stop_at_zero = 0 
	is_career = 0 
	is_singlesession = 0 
	is_parkeditor = 0 
	should_modulate_color = 0 
	is_horse = 0 
	is_king = 0 
	is_gold = 0 
	is_trick_attack = 0 
	is_elimiskate = 0 
	is_score_challenge = 0 
	is_combo_mambo = 0 
	is_goal_attack = 0 
	is_ctf = 0 
	is_firefight = 0 
	show_leader_messages = 0 
	timer_beeps = 1 
	num_teams = 0 
	is_net = 0 
	is_freeskate = 0 
	is_creategoals = 0 
	is_classic = 0 
	should_elimination_skater = 0 
	show_waiting_message = 1 
	should_end_run_quickly = 0 
} 
mode_netslap = { 
	name = netslap 
	initial_players = 1 
	max_players = 8 
	time_limit_type = config 
	default_time_limit = 90 
	victory_condition_type = config 
	score_frozen = 0 
	accumulate_score = 1 
	track_trick_score = 0 
	degrade_score = 0 
	is_lobby = 0 
	screenmode = single 
	victory_conditions = [ 
		{ type = highest_score } 
	] 
	should_run_intro_camera = 0 
	should_run_intro_camera_noncd = 0 
	show_ranking_screen = 1 
	stop_at_zero = 0 
	is_career = 0 
	is_singlesession = 0 
	is_parkeditor = 0 
	should_modulate_color = 0 
	is_horse = 0 
	is_king = 0 
	is_gold = 0 
	is_trick_attack = 0 
	is_elimiskate = 0 
	is_score_challenge = 0 
	is_combo_mambo = 0 
	is_goal_attack = 0 
	is_ctf = 0 
	is_firefight = 0 
	show_leader_messages = 1 
	timer_beeps = 1 
	num_teams = 0 
	is_net = 1 
	is_freeskate = 0 
	is_creategoals = 0 
	is_classic = 0 
	should_elimination_skater = 0 
	show_waiting_message = 1 
	should_end_run_quickly = 0 
} 
mode_firefight = { 
	name = firefight 
	initial_players = 2 
	max_players = 2 
	time_limit_type = config 
	default_time_limit = 0 
	victory_condition_type = config 
	score_frozen = 0 
	accumulate_score = 1 
	track_trick_score = 0 
	degrade_score = 0 
	is_lobby = 0 
	screenmode = splitscreen 
	victory_conditions = [ 
		{ type = last_man_standing } 
	] 
	should_run_intro_camera = 0 
	should_run_intro_camera_noncd = 0 
	show_ranking_screen = 1 
	stop_at_zero = 0 
	is_career = 0 
	is_singlesession = 0 
	is_parkeditor = 0 
	should_modulate_color = 0 
	is_horse = 0 
	is_king = 0 
	is_gold = 0 
	is_trick_attack = 0 
	is_elimiskate = 0 
	is_score_challenge = 0 
	is_combo_mambo = 0 
	is_goal_attack = 0 
	is_ctf = 0 
	is_firefight = 1 
	show_leader_messages = 0 
	timer_beeps = 1 
	num_teams = 0 
	is_net = 0 
	is_freeskate = 0 
	is_creategoals = 0 
	is_classic = 0 
	should_elimination_skater = 1 
	show_waiting_message = 0 
} 
mode_netfirefight = { 
	name = netfirefight 
	initial_players = 1 
	max_players = 8 
	time_limit_type = config 
	default_time_limit = 0 
	victory_condition_type = config 
	score_frozen = 0 
	accumulate_score = 1 
	track_trick_score = 0 
	degrade_score = 0 
	is_lobby = 0 
	screenmode = single 
	victory_conditions = [ 
		{ type = last_man_standing } 
	] 
	should_run_intro_camera = 0 
	should_run_intro_camera_noncd = 0 
	show_ranking_screen = 1 
	stop_at_zero = 0 
	is_career = 0 
	is_singlesession = 0 
	is_parkeditor = 0 
	should_modulate_color = 0 
	is_horse = 0 
	is_king = 0 
	is_gold = 0 
	is_trick_attack = 0 
	is_elimiskate = 0 
	is_score_challenge = 0 
	is_combo_mambo = 0 
	is_goal_attack = 0 
	is_ctf = 0 
	is_firefight = 1 
	show_leader_messages = 0 
	timer_beeps = 1 
	num_teams = 0 
	is_net = 1 
	is_freeskate = 0 
	is_creategoals = 0 
	is_classic = 0 
	should_elimination_skater = 1 
	show_waiting_message = 0 
} 
mode_netking = { 
	name = netking 
	initial_players = 1 
	max_players = 8 
	time_limit_type = config 
	default_time_limit = 0 
	victory_condition_type = config 
	score_frozen = 0 
	accumulate_score = 1 
	track_trick_score = 0 
	degrade_score = 0 
	is_lobby = 0 
	screenmode = single 
	victory_conditions = [ 
		{ type = target_score score = 10000 } 
	] 
	should_run_intro_camera = 0 
	should_run_intro_camera_noncd = 0 
	show_ranking_screen = 1 
	stop_at_zero = 0 
	is_career = 0 
	is_singlesession = 0 
	is_parkeditor = 0 
	should_modulate_color = 0 
	is_horse = 0 
	is_king = 1 
	is_gold = 0 
	is_trick_attack = 0 
	is_elimiskate = 0 
	is_score_challenge = 0 
	is_combo_mambo = 0 
	is_goal_attack = 0 
	is_ctf = 0 
	is_firefight = 0 
	show_leader_messages = 1 
	timer_beeps = 0 
	num_teams = 0 
	is_net = 1 
	is_freeskate = 0 
	is_creategoals = 0 
	is_classic = 0 
	should_elimination_skater = 0 
	show_waiting_message = 0 
} 
mode_king = { 
	name = king 
	initial_players = 2 
	max_players = 2 
	time_limit_type = config 
	default_time_limit = 0 
	victory_condition_type = config 
	score_frozen = 0 
	accumulate_score = 1 
	track_trick_score = 0 
	degrade_score = 0 
	is_lobby = 0 
	screenmode = splitscreen 
	victory_conditions = [ 
		{ type = target_score score = 120000 } 
	] 
	should_run_intro_camera = 0 
	should_run_intro_camera_noncd = 0 
	show_ranking_screen = 1 
	stop_at_zero = 0 
	is_career = 0 
	is_singlesession = 0 
	is_parkeditor = 0 
	should_modulate_color = 0 
	is_horse = 0 
	is_king = 1 
	is_gold = 0 
	is_trick_attack = 0 
	is_elimiskate = 0 
	is_score_challenge = 0 
	is_combo_mambo = 0 
	is_goal_attack = 0 
	is_ctf = 0 
	is_firefight = 0 
	show_leader_messages = 0 
	timer_beeps = 0 
	num_teams = 0 
	is_net = 0 
	is_freeskate = 0 
	is_creategoals = 0 
	is_classic = 0 
	should_elimination_skater = 0 
	show_waiting_message = 0 
} 
mode_netctf = { 
	name = netctf 
	initial_players = 1 
	max_players = 8 
	time_limit_type = config 
	default_time_limit = 120 
	victory_condition_type = config 
	score_frozen = 0 
	accumulate_score = 1 
	track_trick_score = 0 
	degrade_score = 0 
	is_lobby = 0 
	screenmode = single 
	victory_conditions = [ 
	] 
	should_run_intro_camera = 0 
	should_run_intro_camera_noncd = 0 
	show_ranking_screen = 1 
	stop_at_zero = 0 
	is_career = 0 
	is_singlesession = 0 
	is_parkeditor = 0 
	should_modulate_color = 0 
	is_horse = 0 
	is_king = 0 
	is_gold = 0 
	is_ctf = 1 
	is_firefight = 0 
	is_trick_attack = 0 
	is_elimiskate = 0 
	is_score_challenge = 0 
	is_combo_mambo = 0 
	is_goal_attack = 0 
	show_leader_messages = 1 
	timer_beeps = 1 
	num_teams = 0 
	is_net = 1 
	is_freeskate = 0 
	is_creategoals = 0 
	is_classic = 0 
	should_elimination_skater = 0 
	show_waiting_message = 1 
	should_end_run_quickly = 0 
} 
targetScoreArray = [ 
	{ type = target_score score = 10000 } 
] 
highestScoreArray = [ 
	{ type = highest_score } 
] 
mode_netlobby = { 
	name = netlobby 
	initial_players = 1 
	max_players = 8 
	time_limit_type = fixed 
	default_time_limit = 0 
	victory_condition_type = fixed 
	score_frozen = 0 
	accumulate_score = 0 
	track_trick_score = 1 
	degrade_score = 0 
	is_lobby = 1 
	screenmode = single 
	should_run_intro_camera = 0 
	should_run_intro_camera_noncd = 0 
	show_ranking_screen = 0 
	stop_at_zero = 0 
	is_career = 0 
	is_singlesession = 0 
	is_parkeditor = 0 
	should_modulate_color = 0 
	is_horse = 0 
	is_king = 0 
	is_gold = 0 
	is_trick_attack = 0 
	is_score_challenge = 0 
	is_combo_mambo = 0 
	is_goal_attack = 0 
	is_ctf = 0 
	is_firefight = 0 
	show_leader_messages = 0 
	timer_beeps = 0 
	num_teams = 0 
	is_freeskate = 0 
	is_net = 1 
	is_creategoals = 0 
	is_classic = 0 
	should_elimination_skater = 0 
	show_waiting_message = 0 
} 
mode_parkeditor = { 
	name = parkeditor 
	initial_players = 1 
	max_players = 0 
	time_limit_type = fixed 
	default_time_limit = 0 
	victory_condition_type = fixed 
	score_frozen = 0 
	accumulate_score = 0 
	track_trick_score = 1 
	degrade_score = 0 
	is_lobby = 0 
	screenmode = single 
	should_run_intro_camera = 0 
	should_run_intro_camera_noncd = 0 
	show_ranking_screen = 0 
	stop_at_zero = 0 
	is_career = 0 
	is_singlesession = 0 
	is_parkeditor = 1 
	should_modulate_color = 0 
	is_horse = 0 
	is_king = 0 
	is_gold = 0 
	is_trick_attack = 0 
	is_score_challenge = 0 
	is_combo_mambo = 0 
	is_goal_attack = 0 
	is_ctf = 0 
	is_firefight = 0 
	show_leader_messages = 0 
	timer_beeps = 0 
	num_teams = 0 
	is_freeskate = 0 
	is_net = 0 
	is_creategoals = 1 
	is_classic = 0 
	should_elimination_skater = 0 
	show_waiting_message = 1 
	should_end_run_quickly = 0 
} 
mode_horse = { 
	name = horse 
	initial_players = 2 
	max_players = 2 
	time_limit_type = config 
	default_time_limit = 10 
	victory_condition_type = fixed 
	score_frozen = 0 
	accumulate_score = 1 
	track_trick_score = 1 
	degrade_score = 0 
	is_lobby = 0 
	screenmode = horse 
	should_run_intro_camera = 0 
	should_run_intro_camera_noncd = 0 
	show_ranking_screen = 0 
	stop_at_zero = 0 
	is_career = 0 
	is_singlesession = 0 
	is_parkeditor = 0 
	should_modulate_color = 0 
	is_horse = 1 
	is_king = 0 
	is_gold = 0 
	is_trick_attack = 0 
	is_score_challenge = 0 
	is_combo_mambo = 0 
	is_goal_attack = 0 
	is_ctf = 0 
	is_firefight = 0 
	show_leader_messages = 0 
	timer_beeps = 0 
	num_teams = 0 
	is_freeskate = 0 
	is_net = 0 
	is_creategoals = 0 
	is_classic = 0 
	should_elimination_skater = 0 
	show_waiting_message = 1 
	should_end_run_quickly = 0 
} 
mode_nethorse = { 
	name = nethorse 
	initial_players = 1 
	max_players = 8 
	time_limit_type = config 
	default_time_limit = 10 
	victory_condition_type = fixed 
	score_frozen = 0 
	accumulate_score = 1 
	track_trick_score = 1 
	degrade_score = 0 
	is_lobby = 0 
	screenmode = horse 
	should_run_intro_camera = 0 
	should_run_intro_camera_noncd = 0 
	show_ranking_screen = 1 
	stop_at_zero = 0 
	is_career = 0 
	is_singlesession = 0 
	is_parkeditor = 0 
	should_modulate_color = 0 
	is_horse = 1 
	is_king = 0 
	is_gold = 0 
	is_trick_attack = 0 
	is_score_challenge = 0 
	is_combo_mambo = 0 
	is_goal_attack = 0 
	is_ctf = 0 
	is_firefight = 0 
	show_leader_messages = 0 
	timer_beeps = 0 
	num_teams = 0 
	is_freeskate = 0 
	is_net = 1 
	is_creategoals = 0 
	is_classic = 0 
	should_elimination_skater = 0 
	show_waiting_message = 1 
	should_end_run_quickly = 0 
} 
mode_classic = { 
	name = classic 
	initial_players = 1 
	max_players = 1 
	time_limit_type = fixed 
	default_time_limit = 120 
	victory_condition_type = fixed 
	score_frozen = 0 
	accumulate_score = 1 
	track_trick_score = 1 
	degrade_score = 1 
	is_lobby = 0 
	screenmode = single 
	should_run_intro_camera = 1 
	should_run_intro_camera_noncd = 1 
	show_ranking_screen = 0 
	stop_at_zero = 0 
	is_career = 0 
	is_singlesession = 0 
	is_parkeditor = 0 
	should_modulate_color = 0 
	is_horse = 0 
	is_king = 0 
	is_gold = 0 
	is_trick_attack = 0 
	is_score_challenge = 0 
	is_combo_mambo = 0 
	is_goal_attack = 0 
	is_ctf = 0 
	is_firefight = 0 
	show_leader_messages = 0 
	timer_beeps = 1 
	num_teams = 0 
	is_net = 0 
	is_freeskate = 0 
	is_creategoals = 0 
	is_classic = 1 
	should_elimination_skater = 0 
	show_waiting_message = 0 
} 
mode_netrace = { 
	name = netking 
	initial_players = 1 
	max_players = 8 
	time_limit_type = config 
	default_time_limit = 0 
	victory_condition_type = config 
	score_frozen = 0 
	accumulate_score = 1 
	track_trick_score = 0 
	degrade_score = 0 
	is_lobby = 0 
	screenmode = single 
	victory_conditions = [ 
		{ type = target_score score = 10000 } 
	] 
	should_run_intro_camera = 0 
	should_run_intro_camera_noncd = 0 
	show_ranking_screen = 1 
	stop_at_zero = 0 
	is_career = 0 
	is_singlesession = 0 
	is_parkeditor = 0 
	should_modulate_color = 0 
	is_horse = 0 
	is_king = 1 
	is_gold = 0 
	is_trick_attack = 0 
	is_elimiskate = 0 
	is_score_challenge = 0 
	is_combo_mambo = 0 
	is_goal_attack = 0 
	is_ctf = 0 
	is_firefight = 0 
	show_leader_messages = 1 
	timer_beeps = 0 
	num_teams = 0 
	is_net = 1 
	is_freeskate = 0 
	is_creategoals = 0 
	is_classic = 0 
	should_elimination_skater = 0 
	show_waiting_message = 0 
} 
SCRIPT force_close_rankings 
	printf "************************* FORCE CLOSING RANKINGS ******************************" 
	MORTEN_DUMP_OBSERVE_MODE_DATA 
	speech_box_exit 
	restore_start_key_binding 
	SetButtonEventMappings unblock_menu_input 
	IF ObjectExists id = rankings_list_anchor 
		RunScriptOnScreenElement id = current_menu_anchor menu_offscreen 
		IF GameIsOver 
			IF NOT GotParam dont_retry 
				do_backend_retry 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT close_rankings 
	printf "************************* CLOSING RANKINGS ******************************" 
	MORTEN_DUMP_OBSERVE_MODE_DATA 
	speech_box_exit 
	restore_start_key_binding 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
		SetScreenElementProps id = root_window tags = { menu_state = off } 
	ENDIF 
	wait 1 frame 
	IF GameModeEquals is_singlesession 
		create_pause_menu no_exit 
	ELSE 
		IF NOT GameModeEquals is_lobby 
			IF InSplitScreenGame 
				create_end_run_menu 
			ELSE 
				do_backend_retry 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT rankings_quick_restart 
	force_close_rankings 
	Change DontShowEnteringFreeskateMessage = 1 
	do_backend_retry start_new 
ENDSCRIPT

SCRIPT wait_then_force_close_rankings 
	wait 5 seconds 
	force_close_rankings 
	do_backend_retry 
ENDSCRIPT

SCRIPT wait_then_create_rankings 
	BEGIN 
		IF CalculateFinalScores 
			BREAK 
		ENDIF 
		wait 1 gameframe 
	REPEAT 
	IF InInternetMode 
		IF OnServer 
			IF InInternetMode 
				ReportStats final 
			ENDIF 
		ENDIF 
	ENDIF 
	dialog_box_exit_ranking anchor_id = quit_dialog_anchor 
	DestroyIfObjectExist id = level_select_menu 
	DestroyIfObjectExist id = level_select_panel_container 
	create_rankings <...> 
ENDSCRIPT

SCRIPT dialog_box_exit_ranking { anchor_id = dialog_box_anchor } 
	SetButtonEventMappings unblock_menu_input 
	IF ObjectExists id = <anchor_id> 
		DestroyScreenElement id = <anchor_id> 
	ENDIF 
	pause_menu_gradient off 
	restore_start_key_binding 
ENDSCRIPT

SCRIPT create_rankings score_title_text = "SCORE" 
	IF OnServer 
		MarkGameOver 
	ENDIF 
	IF ScreenElementExists id = ped_speech_dialog 
		DestroyScreenElement id = ped_speech_dialog 
	ENDIF 
	printf "create_rankings" 
	MORTEN_DUMP_OBSERVE_MODE_DATA 
	destroy_edit_theme_preveiw_specialmeter 
	destroy_edit_theme_preveiw_balancemeter 
	GoalManager_DeactivateAllGoals force_all 
	GoalManager_UninitializeAllGoals 
	GoalManager_SetCanStartGoal 0 
	HideClock 
	IF IsTrue JoinedGameInProgress 
		close_rankings 
		RETURN 
	ENDIF 
	IF IsTrue JoinedAsObserver 
		close_rankings 
		RETURN 
	ENDIF 
	IF IsTrue THUGPRO_ObserveOn 
		close_rankings 
		RETURN 
	ENDIF 
	IF InNetGame 
		kill_net_panel_messages 
		IF NOT IsObserving 
			Skater : add_skater_to_world 
			IF NOT IsTrue THUGPRO_ObserveOn 
				IF IsSurveying 
					ExitSurveyorMode 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	thugpro_observe_hud_set_visible 
	IF ObjectExists id = current_menu_anchor 
		DestroyScreenElement id = current_menu_anchor 
	ENDIF 
	IF ObjectExists id = edit_tricks_sub_menu_anchor 
		DestroyScreenElement id = edit_tricks_sub_menu_anchor 
	ENDIF 
	IF ObjectExists id = dialog_box_anchor 
		close_rankings 
		RETURN 
	ENDIF 
	IF ObjectExists id = quit_dialog_anchor 
		close_rankings 
		RETURN 
	ENDIF 
	IF ObjectExists id = grunge_anchor 
		DestroyScreenElement id = grunge_anchor 
	ENDIF 
	IF ObjectExists id = box_icon 
		DestroyScreenElement id = box_icon 
	ENDIF 
	IF ObjectExists id = box_icon_2 
		DestroyScreenElement id = box_icon_2 
	ENDIF 
	IF ScreenElementExists id = top_bar_anchor 
		DestroyScreenElement id = top_bar_anchor 
	ENDIF 
	IF ScreenElementExists id = submenu_title_anchor 
		DestroyScreenElement id = submenu_title_anchor 
	ENDIF 
	pause_trick_text 
	exit_pause_menu 
	IF ScreenElementExists id = observe_input_handler 
		DestroyScreenElement id = observe_input_handler 
	ENDIF 
	IF InSplitScreenGame 
		PauseGame 
		pause_trick_text 
		pause_menu_gradient on 
	ENDIF 
	printf "****************** CREATING RANKINGS!!!! ********************" 
	IF ( ( GetGlobalFlag flag = FLAG_AUTO_SERVER_MODE ) | ( GetGlobalFlag flag = FLAG_AUTO_LEVEL_MODE ) ) 
		SpawnScript AutoServer_Close_Rankings 
	ENDIF 
	Theme_GetHighlightedTextColor return_value = on_rgba 
	Theme_GetUnhighlightedTextColor return_value = off_rgba 
	SetScreenElementLock id = root_window off 
	CreateScreenElement { 
		type = ContainerElement 
		parent = root_window 
		id = rankings_anchor 
		pos = PAIR(320.00000000000, 340.00000000000) 
		dims = PAIR(640.00000000000, 480.00000000000) 
	} 
	AssignAlias id = rankings_anchor alias = current_menu_anchor 
	CreateScreenElement { 
		type = ContainerElement 
		parent = rankings_anchor 
		id = player_list_anchor 
		pos = PAIR(320.00000000000, 240.00000000000) 
		dims = PAIR(640.00000000000, 480.00000000000) 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = rankings_anchor 
		z_priority = 10 
		texture = ( ( THUGPRO_GlobalThemeInfo ) . MODEL_ICON_TEXTURE ) 
		pos = PAIR(100.00000000000, 100.00000000000) 
		scale = 0.30000001192 
		rot_angle = -6 
		just = [ center center ] 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
	} 
	CreateScreenElement { 
		type = VMenu 
		parent = player_list_anchor 
		id = player_list_menu 
		font = small 
		just = [ left top ] 
		pos = PAIR(105.00000000000, 100.00000000000) 
		internal_just = [ left top ] 
	} 
	CreateScreenElement { 
		type = ContainerElement 
		parent = player_list_menu 
		dims = PAIR(256.00000000000, 21.00000000000) 
		not_focusable 
	} 
	IF GetGlobalFlag flag = FLAG_AUTO_LEVEL_MODE 
		FormatText textName = ranking_text "        rankings (%a of %b)" a = ( AutoLevel_GamesPlayed + 1 ) b = ( AutoLevel_TotalGamesToPlay ) 
	ELSE 
		FormatText textName = ranking_text "rankings" 
	ENDIF 
	CreateScreenElement { 
		type = TextElement 
		parent = <id> 
		font = testtitle 
		text = <ranking_text> 
		pos = PAIR(75.00000000000, -12.00000000000) 
		just = [ center top ] 
		scale = 1.29999995232 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . MENU_TITLE_COLOR ) 
		z_priority = 11 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = player_list_anchor 
		texture = black 
		pos = PAIR(94.00000000000, 88.00000000000) 
		rgba = [ 0 0 0 120 ] 
		scale = PAIR(116.08000183105, 7.19999980927) 
		just = [ left top ] 
		z_priority = -1 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = player_list_anchor 
		texture = black 
		pos = PAIR(94.00000000000, 118.00000000000) 
		rgba = <on_rgba> 
		scale = PAIR(116.08000183105, 0.69999998808) 
		just = [ left top ] 
		z_priority = 2 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = player_list_anchor 
		texture = black 
		pos = PAIR(111.00000000000, 88.00000000000) 
		rgba = <on_rgba> 
		scale = PAIR(112.08000183105, 0.60000002384) 
		just = [ left top ] 
		z_priority = 2 
	} 
	CreateScreenElement { 
		type = ContainerElement 
		parent = rankings_anchor 
		id = rankings_list_anchor 
		dims = PAIR(640.00000000000, 480.00000000000) 
		pos = PAIR(320.00000000000, 240.00000000000) 
	} 
	CreateScreenElement { 
		type = VMenu 
		parent = rankings_list_anchor 
		id = rankings_list_menu 
		just = [ left top ] 
		pos = PAIR(375.00000000000, 100.00000000000) 
		internal_just = [ left top ] 
	} 
	CreateScreenElement { 
		type = ContainerElement 
		parent = rankings_list_menu 
		dims = PAIR(205.00000000000, 21.00000000000) 
		not_focusable 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = <id> 
		font = dialog 
		text = <score_title_text> 
		pos = PAIR(85.00000000000, -5.00000000000) 
		just = [ center top ] 
		rgba = ( ( THUGPRO_GlobalThemeInfo ) . HIGHLIGHTED_TEXT_COLOR ) 
		not_focusable 
	} 
	kill_start_key_binding 
	FillRankingScreen 
	CreateScreenElement { 
		type = ContainerElement 
		parent = rankings_anchor 
		id = rankings_done_anchor 
		dims = PAIR(640.00000000000, 480.00000000000) 
		pos = PAIR(320.00000000000, 240.00000000000) 
	} 
	SetScreenElementLock id = player_list_menu on 
	GetStackedScreenElementPos Y id = player_list_menu offset = PAIR(210.00000000000, 20.00000000000) 
	SetScreenElementLock id = player_list_menu off 
	DoScreenElementMorph id = rankings_anchor time = 0 pos = ( PAIR(320.00000000000, 200.00000000000) + PAIR(0.00000000000, -0.50000000000) * ( ( <pos> - PAIR(320.00000000000, 340.00000000000) ) . PAIR(0.00000000000, 1.00000000000) ) ) 
	SetScreenElementLock id = player_list_menu on 
	GetStackedScreenElementPos Y id = player_list_menu offset = PAIR(210.00000000000, 20.00000000000) 
	SetScreenElementLock id = player_list_menu off 
	dialog_text = "Unknown rankings dialog text" 
	dialog_choose_script = nullscript 
	dialog_option_script = nullscript 
	IF ( ( GetGlobalFlag flag = FLAG_AUTO_SERVER_MODE ) | ( GetGlobalFlag flag = FLAG_AUTO_LEVEL_MODE ) ) 
		create_speech_box { 
			text = "Waiting for auto server" 
			pos = PAIR(320.00000000000, 400.00000000000) 
			id = rankings_done_dialog_box 
		} 
	ELSE 
		IF ( ( GLOBAL_CtrlLayout ) = 0 ) 
			button_code_continue = "\\bm" 
			button_code_restart = "\\bo" 
		ELSE 
			button_code_continue = "\\m0" 
			button_code_restart = "\\b1" 
		ENDIF 
		IF IsHost 
			IF NOT GameModeEquals is_scavenger_hunt 
				allow_quick_restart = 1 
			ENDIF 
		ENDIF 
		IF GotParam allow_quick_restart 
			FormatText textName = dialog_text "Press %a to continue\\nor %b to restart" a = <button_code_continue> b = <button_code_restart> 
			create_speech_box { 
				text = <dialog_text> 
				pos = PAIR(320.00000000000, 400.00000000000) 
				id = rankings_done_dialog_box 
				pad_choose_script = close_rankings 
				pad_option_script = rankings_quick_restart 
			} 
		ELSE 
			FormatText textName = dialog_text "Press %a to continue" a = <button_code_continue> 
			create_speech_box { 
				text = <dialog_text> 
				pos = PAIR(320.00000000000, 400.00000000000) 
				id = rankings_done_dialog_box 
				pad_choose_script = close_rankings 
				pad_option_script = nullscript 
			} 
		ENDIF 
	ENDIF 
	RunScriptOnScreenElement id = current_menu_anchor dialog_box_delay_input params = { delay_input_time = 1000 } 
	RunScriptOnScreenElement id = current_menu_anchor menu_onscreen 
	KillSpawnedScript name = goal_success_messages 
	IF ScreenElementExists id = goal_complete_sprite 
		DestroyScreenElement id = goal_complete_sprite 
	ENDIF 
	IF ScreenElementExists id = goal_complete 
		DestroyScreenElement id = goal_complete 
	ENDIF 
	IF ScreenElementExists id = goal_complete_line2 
		DestroyScreenElement id = goal_complete_line2 
	ENDIF 
	IF ScreenElementExists id = goal_new_record 
		DestroyScreenElement id = goal_new_record 
	ENDIF 
	IF ScreenElementExists id = goal_current_reward 
		DestroyScreenElement id = goal_current_reward 
	ENDIF 
ENDSCRIPT

SCRIPT player_menu_add_item font = small 
	printf "player_menu_add_item" 
	Theme_GetHighlightedTextColor return_value = on_rgba 
	SetScreenElementLock id = <parent> off 
	IF GotParam team_score 
		<text_just> = [ right top ] 
		<text_pos> = PAIR(230.00000000000, 0.00000000000) 
		<container_dims> = PAIR(256.00000000000, 24.00000000000) 
		<end_cap_scale> = PAIR(1.00000000000, 5.00000000000) 
	ELSE 
		<text_just> = [ left top ] 
		<text_pos> = PAIR(0.00000000000, 0.00000000000) 
		<container_dims> = PAIR(256.00000000000, 21.00000000000) 
		<end_cap_scale> = PAIR(1.00000000000, 5.25000000000) 
	ENDIF 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <parent> 
		dims = <container_dims> 
		not_focusable 
	} 
	<container_id> = <id> 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <container_id> 
		texture = black 
		pos = PAIR(-10.00000000000, 0.00000000000) 
		rgba = [ 0 0 0 60 ] 
		scale = PAIR(116.08000183105, 6.09999990463) 
		just = [ left top ] 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <container_id> 
		texture = white2 
		pos = PAIR(-10.00000000000, 20.00000000000) 
		rgba = [ 128 128 128 128 ] 
		z_priority = 10 
		scale = PAIR(57.50000000000, 0.20000000298) 
		just = [ left top ] 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <container_id> 
		texture = black 
		pos = PAIR(-10.00000000000, 0.00000000000) 
		rgba = [ 0 0 0 128 ] 
		scale = PAIR(1.00000000000, 6.00000000000) 
		z_priority = 11 
		just = [ left top ] 
	} 
	CreateScreenElement { 
		type = SpriteElement 
		parent = <container_id> 
		texture = black 
		pos = PAIR(450.00000000000, 0.00000000000) 
		rgba = [ 0 0 0 128 ] 
		scale = PAIR(1.00000000000, 6.00000000000) 
		z_priority = 11 
		just = [ left top ] 
	} 
	CreateScreenElement { 
		type = TextElement 
		parent = <container_id> 
		z_priority = 10 
		font = <font> 
		text = <text> 
		pos = <text_pos> 
		just = <text_just> 
		rgba = [ 128 128 128 128 ] 
	} 
	IF GotParam team_score 
		CreateScreenElement { 
			type = SpriteElement 
			parent = <container_id> 
			texture = white2 
			pos = PAIR(-10.00000000000, 20.00000000000) 
			rgba = <on_rgba> 
			scale = PAIR(57.50000000000, 0.20000000298) 
			just = [ left top ] 
			z_priority = 11 
		} 
	ENDIF 
	SetScreenElementLock id = <parent> on 
ENDSCRIPT

SCRIPT score_menu_add_item 
	IF GotParam team_score 
		<container_dims> = PAIR(205.00000000000, 24.00000000000) 
	ELSE 
		<container_dims> = PAIR(205.00000000000, 21.00000000000) 
	ENDIF 
	CreateScreenElement { 
		type = ContainerElement 
		parent = <parent> 
		dims = <container_dims> 
		not_focusable 
	} 
	<container_id> = <id> 
	GetGameMode 
	IF ( ( <gamemode> = netking ) | ( <gamemode> = king ) 
		| ( <gamemode> = netctf ) | ( <gamemode> = ctf ) 
		| ( <gamemode> = netscavengerhunt ) | ( <gamemode> = scavengerhunt ) 
		| ( <gamemode> = netgoalattack ) | ( <gamemode> = goalattack ) 
		| ( <gamemode> = netslap ) | ( <gamemode> = slap ) 
		) 
		<points_string> = <text> 
	ELSE 
		get_points_string_with_commas score = <text> 
	ENDIF 
	IF ( <gamemode> = netgraffiti ) 
		GetNumTrickClusters 
		FormatText textName = points_string "%s / %n" s = <points_string> n = <NumTrickClusters> 
	ENDIF 
	CreateScreenElement { 
		type = TextElement 
		parent = <container_id> 
		z_priority = 10 
		font = dialog 
		text = <points_string> 
		pos = PAIR(85.00000000000, 0.00000000000) 
		rgba = [ 128 128 128 128 ] 
		just = [ center top ] 
	} 
ENDSCRIPT

Graffiti_Tag_style = 0 
Toggle_Graffiti_Tags = 1 
Toggle_Special_item = 1 
gamemode_color = "\\c4" 
GraffMode = 0 
score_mode = point_scoring 
should_randomize_skater_restarts = 1 
SCRIPT toggle_randomize_skater_restarts 
	GetTags 
	IF IsTrue should_randomize_skater_restarts 
		thugpro_menu_item_update_extra_text id = <id> off 
		Change should_randomize_skater_restarts = 0 
	ELSE 
		thugpro_menu_item_update_extra_text id = <id> on 
		Change should_randomize_skater_restarts = 1 
	ENDIF 
ENDSCRIPT

SCRIPT set_graff_mode_name 
	IF NOT ( GotParam id_checksum ) 
		RETURN 
	ENDIF 
	temp_array = mode_info 
	GetArraySize mode_info 
	LoopIndex = 0 
	temp_str = "" 
	BEGIN 
		IF ( ( ( mode_info [ <LoopIndex> ] ) . checksum ) = <id_checksum> ) 
			temp_index = <LoopIndex> 
			BREAK 
		ENDIF 
		<LoopIndex> = ( <LoopIndex> + 1 ) 
	REPEAT <array_size> 
	IF GotParam graff 
		IF ( <id_checksum> = netscorechallenge ) 
			<temp_str> = "Graff Challenge" 
		ELSE 
			IF ( <id_checksum> = netgold ) 
				<temp_str> = "Graff Pot O\'Gold" 
			ELSE 
				IF ( <id_checksum> = netelimiskate ) 
					<temp_str> = "ElimiGraff" 
				ELSE 
					IF ( <id_checksum> = netcombomambo ) 
						<temp_str> = "Combo Graff" 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ELSE 
		IF ( <id_checksum> = netscorechallenge ) 
			<temp_str> = "Score Challenge" 
		ELSE 
			IF ( <id_checksum> = netgold ) 
				<temp_str> = "Score Pot O\'Gold" 
			ELSE 
				IF ( <id_checksum> = netelimiskate ) 
					<temp_str> = "ElimiSkate" 
				ELSE 
					IF ( <id_checksum> = netcombomambo ) 
						<temp_str> = "Combo Mambo" 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
	temp_struct = { name = <temp_str> checksum = <id_checksum> definition = ( ( mode_info [ <temp_index> ] ) . definition ) } 
	SetArrayElement ArrayName = temp_array index = <temp_index> NewValue = <temp_struct> 
	mode_info = <temp_array> 
ENDSCRIPT

SCRIPT change_score_type 
	IF ( score_mode = point_scoring ) 
		SetScreenElementProps id = { MoreOptions_menu_score_type child = extra_text } text = "Tag Scoring" 
		Change score_mode = tag_scoring 
		SetPreferencesFromUI prefs = network field = "target_score" checksum = score_10 score = 10 string = "10 tags" 
	ELSE 
		IF ( score_mode = tag_scoring ) 
			SetScreenElementProps id = { MoreOptions_menu_score_type child = extra_text } text = "Point Scoring" 
			Change score_mode = point_scoring 
			SetPreferencesFromUI prefs = network field = "target_score" checksum = score_1000000 score = 1000000 string = "1,000,000 pts" 
		ENDIF 
	ENDIF 
	create_network_game_options_menu 
	FireEvent type = unfocus target = sub_vmenu 
	FireEvent type = focus target = sub_vmenu data = { child_id = MoreOptions_menu_score_type } 
ENDSCRIPT

SCRIPT get_points_string_with_commas 
	IF NOT GotParam score 
		RETURN 
	ENDIF 
	cstr = "" 
	FormatText textName = f_str "%s" s = <score> 
	StringToCharArray string = <f_str> 
	IF ( ( <char_array> [ 0 ] ) = "\\" ) 
		FormatText textName = c_str "%s" s = ( <char_array> [ 2 ] ) 
		<cstr> = <c_str> 
	ENDIF 
	get_clean_string string = <f_str> 
	StringToCharArray string = <clean_string> 
	GetArraySize <char_array> 
	rem = ( <array_size> - ( ( <array_size> / 3 ) * 3 ) ) 
	IF ( <rem> = 0 ) 
		<rem> = -1 
	ENDIF 
	idx = 0 
	str = "" 
	BEGIN 
		IF ( <rem> > 0 ) 
			FormatText textName = n_str "%s%t" s = ( <str> ) t = ( <char_array> [ <idx> ] ) 
			<str> = ( <n_str> ) 
			<rem> = ( <rem> - 1 ) 
			<idx> = ( <idx> + 1 ) 
		ELSE 
			IF ( <rem> = 0 ) 
				FormatText textName = n_str "%s,%t" s = ( <str> ) t = ( <char_array> [ <idx> ] ) 
			ELSE 
				FormatText textName = n_str "%s%t" s = ( <str> ) t = ( <char_array> [ <idx> ] ) 
			ENDIF 
			<str> = ( <n_str> ) 
			<rem> = 2 
			<idx> = ( <idx> + 1 ) 
		ENDIF 
	REPEAT <array_size> 
	IF NOT ( <cstr> = "" ) 
		FormatText textName = n_str "\\c%s%t" s = <cstr> t = <str> 
		<str> = ( <n_str> ) 
	ENDIF 
	RETURN points_string = <str> 
ENDSCRIPT


