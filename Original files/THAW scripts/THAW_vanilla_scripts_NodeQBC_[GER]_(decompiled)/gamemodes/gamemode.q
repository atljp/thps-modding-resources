mode_info = [
    { name = 'Skate for Fun' checksum = freeskate definition = mode_freeskate }
    { name = 'Skate for Fun (2 Spieler)' checksum = freeskate2p definition = mode_freeskate2p }
    { name = 'Einzelsession' checksum = singlesession definition = mode_singlesession }
    { name = 'Trick-Turnier' checksum = trickattack definition = mode_trickattack }
    { name = 'Schnitzeljagd' checksum = scavengerhunt definition = mode_scavengerhunt }
    { name = 'Punkte-Challenge' checksum = scorechallenge definition = mode_scorechallenge }
    { name = 'Kombo-Mambo' checksum = combomambo definition = mode_combomambo }
    { name = 'Graffiti' checksum = graffiti definition = mode_graffiti }
    { name = 'Slap!' checksum = slap definition = mode_slap }
    { name = 'Lord of the Board' checksum = king definition = mode_king }
    { name = 'Goldkessel' checksum = gold definition = mode_gold }
    { name = 'Loser' checksum = horse definition = mode_horse }
    { name = 'Loser' checksum = nethorse definition = mode_nethorse }
    { name = 'Karriere' checksum = career definition = mode_career }
    { name = 'Netz' checksum = net definition = mode_net }
    { name = 'Lobby' checksum = netlobby definition = mode_netlobby }
    { name = 'Trick-Turnier' checksum = nettrickattack definition = mode_nettrickattack }
    { name = 'Schnitzeljagd' checksum = netscavengerhunt definition = mode_netscavengerhunt }
    { name = 'Elimiskate' checksum = netelimiskate definition = mode_netelimiskate }
    { name = 'Punkte-Challenge' checksum = netscorechallenge definition = mode_netscorechallenge }
    { name = 'Kombo-Mambo' checksum = netcombomambo definition = mode_netcombomambo }
    { name = 'Graffiti' checksum = netgraffiti definition = mode_netgraffiti }
    { name = 'Ziel-Turnier' checksum = netgoalattack definition = mode_netgoalattack }
    { name = 'Slap!' checksum = netslap definition = mode_netslap }
    { name = 'Lord of the Board' checksum = netking definition = mode_netking }
    { name = 'Goldkessel' checksum = netgold definition = mode_netgold }
    { name = 'Capture the Flag' checksum = netctf definition = mode_netctf }
    { name = 'Parkeditor' checksum = ParkEditor definition = mode_parkeditor }
    { name = 'Feuergefecht' checksum = firefight definition = mode_firefight }
    { name = 'Feuergefecht' checksum = netfirefight definition = mode_netfirefight }
    { name = 'Klassik-Modus' checksum = classic definition = mode_classic }
    { name = 'Koop-Modus' checksum = coop definition = mode_coop }
    { name = 'Mach-dir-den-Trick' checksum = CAT definition = mode_cat }
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
    is_score_challenge = 0
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
    is_classic = 0
    is_coop = 0
    is_cat = 0
    score_mode = points_scoring
    target_tags = tags_10
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
    is_classic = 0
    is_coop = 0
    is_cat = 0
    score_mode = points_scoring
    target_tags = tags_10
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
    is_classic = 0
    is_coop = 0
    is_cat = 0
    score_mode = points_scoring
    target_tags = tags_10
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
    is_classic = 0
    is_coop = 0
    is_cat = 0
    score_mode = points_scoring
    target_tags = tags_10
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
    is_classic = 0
    is_coop = 0
    is_cat = 0
    score_mode = points_scoring
    target_tags = tags_10
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
    is_classic = 0
    is_coop = 0
    is_cat = 0
    score_mode = points_scoring
    target_tags = tags_10
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
    is_classic = 0
    is_coop = 0
    is_cat = 0
    score_mode = points_scoring
    target_tags = tags_10
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
    score_mode = points_scoring
    target_tags = tags_10
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
    score_mode = points_scoring
    target_tags = tags_10
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
        { type = target_score Score = 10000 }
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
    is_classic = 0
    is_coop = 0
    is_cat = 0
    score_mode = points_scoring
    target_tags = tags_10
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
        { type = target_score Score = 10000 }
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
    is_classic = 0
    is_coop = 0
    is_cat = 0
    score_mode = points_scoring
    target_tags = tags_10
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
    is_classic = 0
    is_coop = 0
    is_cat = 0
    score_mode = points_scoring
    target_tags = tags_10
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
    is_classic = 0
    is_coop = 0
    is_cat = 0
    score_mode = points_scoring
    target_tags = tags_10
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
    is_classic = 0
    is_coop = 0
    is_cat = 0
    team_graffiti_mode = graffiti_individual_scoring
    score_mode = points_scoring
    target_tags = tags_10
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
    is_classic = 0
    is_coop = 0
    is_cat = 0
    team_graffiti_mode = graffiti_team_scoring
    score_mode = points_scoring
    target_tags = tags_10
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
    is_classic = 0
    is_coop = 0
    is_cat = 0
    score_mode = points_scoring
    target_tags = tags_10
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
    is_classic = 0
    is_coop = 0
    is_cat = 0
    score_mode = points_scoring
    target_tags = tags_10
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
    is_classic = 0
    is_coop = 0
    is_cat = 0
    goals_mode = goals_classic
    score_mode = points_scoring
    target_tags = tags_10
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
    is_classic = 0
    is_coop = 0
    is_cat = 0
    score_mode = points_scoring
    target_tags = tags_10
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
    is_classic = 0
    is_coop = 0
    is_cat = 0
    score_mode = points_scoring
    target_tags = tags_10
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
    is_classic = 0
    is_coop = 0
    is_cat = 0
    score_mode = points_scoring
    target_tags = tags_10
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
    is_classic = 0
    is_coop = 0
    is_cat = 0
    score_mode = points_scoring
    target_tags = tags_10
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
        { type = target_score Score = 10000 }
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
    is_classic = 0
    is_coop = 0
    is_cat = 0
    score_mode = points_scoring
    target_tags = tags_10
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
        { type = target_score Score = 120000 }
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
    is_classic = 0
    is_coop = 0
    is_cat = 0
    score_mode = points_scoring
    target_tags = tags_10
}
mode_netgold = {
    name = netgold
    initial_players = 1
    max_players = 8
    time_limit_type = config
    default_time_limit = 120
    victory_condition_type = config
    score_frozen = 0
    accumulate_score = 1
    track_trick_score = 1
    degrade_score = 0
    is_lobby = 0
    screenmode = single
    victory_conditions = [
        { type = highest_score }
    ]
    should_run_intro_camera = 0
    should_run_intro_camera_noncd = 0
    show_rangold_screen = 1
    stop_at_zero = 0
    is_career = 0
    is_singlesession = 0
    is_parkeditor = 0
    should_modulate_color = 0
    is_horse = 0
    is_king = 0
    is_gold = 1
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
    is_classic = 0
    is_coop = 0
    is_cat = 0
    score_mode = points_scoring
    target_tags = tags_10
}
mode_gold = {
    name = gold
    initial_players = 2
    max_players = 2
    time_limit_type = config
    default_time_limit = 120
    victory_condition_type = config
    score_frozen = 0
    accumulate_score = 1
    track_trick_score = 1
    degrade_score = 0
    is_lobby = 0
    screenmode = splitscreen
    victory_conditions = [
        { type = highest_score }
    ]
    should_run_intro_camera = 0
    should_run_intro_camera_noncd = 0
    show_rangold_screen = 1
    stop_at_zero = 0
    is_career = 0
    is_singlesession = 0
    is_parkeditor = 0
    should_modulate_color = 0
    is_horse = 0
    is_king = 0
    is_gold = 1
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
    is_classic = 0
    is_coop = 0
    is_cat = 0
    score_mode = points_scoring
    target_tags = tags_10
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
    is_classic = 0
    is_coop = 0
    is_cat = 0
    score_mode = points_scoring
    target_tags = tags_10
}
targetScoreArray = [
    { type = target_score Score = 10000 }
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
    is_classic = 0
    is_coop = 0
    is_cat = 0
    score_mode = points_scoring
    target_tags = tags_10
}
mode_parkeditor = {
    name = ParkEditor
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
    is_classic = 0
    is_coop = 0
    is_cat = 0
    score_mode = points_scoring
    target_tags = tags_10
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
    is_classic = 0
    is_coop = 0
    is_cat = 0
    score_mode = points_scoring
    target_tags = tags_10
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
    is_classic = 0
    is_coop = 0
    is_cat = 0
    score_mode = points_scoring
    target_tags = tags_10
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
    is_classic = 1
    is_coop = 0
    is_cat = 0
    score_mode = points_scoring
    target_tags = tags_10
}
mode_coop = {
    name = classic
    initial_players = 2
    max_players = 2
    time_limit_type = fixed
    default_time_limit = 120
    victory_condition_type = fixed
    score_frozen = 0
    accumulate_score = 1
    track_trick_score = 1
    degrade_score = 1
    is_lobby = 0
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
    is_classic = 1
    is_coop = 1
    is_cat = 0
    score_mode = points_scoring
    target_tags = tags_10
}
mode_cat = {
    name = CAT
    initial_players = 1
    max_players = 1
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
    is_score_challenge = 0
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
    is_classic = 0
    is_coop = 0
    is_cat = 1
    score_mode = points_scoring
    target_tags = tags_10
}

script force_close_rankings 
    printf '************************* FORCE CLOSING RANKINGS ******************************'
    speech_box_exit
    restore_start_key_binding
    printf '************************* SetButtonEventMappings unblock_menu_input'
    SetButtonEventMappings unblock_menu_input
    if ObjectExists id = rankings_list_anchor
        printf '************************* RunScriptOnScreenElement id=current_menu_anchor menu_offscreen'
        RunScriptOnScreenElement id = current_menu_anchor menu_offscreen
        if GameIsOver
            printf '************************* GameIsOver'
            if NOT GotParam dont_retry
                printf '************************* do_backend_retry'
                do_backend_retry
            endif
        endif
    endif
endscript

script close_rankings 
    printf '************************* CLOSING RANKINGS ******************************'
    speech_box_exit
    restore_start_key_binding
    if ObjectExists id = current_menu_anchor
        printf '************************* close_rankings 3'
        DestroyScreenElement id = current_menu_anchor
        SetScreenElementProps id = root_window tags = { menu_state = Off }
    endif
    wait 1 frame
    if GameModeEquals is_singlesession
        printf '************************* close_rankings create_pause_menu'
        create_pause_menu no_exit
    else
        if NOT GameModeEquals is_lobby
            if InSplitScreenGame
                printf '************************* close_rankings create_end_run_menu'
                create_end_run_menu
            else
                printf '************************* close_rankings do_backend_retry'
                do_backend_retry
            endif
        endif
    endif
endscript

script wait_then_force_close_rankings 
    wait \{ 5 seconds }
    force_close_rankings
    do_backend_retry
endscript

script wait_then_create_rankings 
    printf \{ 'function:gamemode.q::wait_then_create_rankings' }
    begin 
    if CalculateFinalScores
        break 
    endif
    wait \{ 1 gameframe }
    repeat 
    create_rankings <...> 
    report_stats \{ final }
endscript

script create_rankings score_title_text = 'PKT.'
    printf 'function:gamemode.q::create_rankings score_title_text=SCORE'
    if OnServer
        MarkGameOver
    endif
    if ScreenElementExists id = ped_speech_dialog
        DestroyScreenElement id = ped_speech_dialog
    endif
    printf 'create_rankings'
    GoalManager_DeactivateAllGoals force_all
    GoalManager_UninitializeAllGoals
    GoalManager_SetCanStartGoal 0
    if InNetGame
        if NOT IsObserving
            skater ::add_skater_to_world
            ExitSurveyorMode
        endif
    endif
    if IsXbox
        if InNetGame
            xboxlive_menu_friends_close
        endif
    endif
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    if ObjectExists id = edit_tricks_sub_menu_anchor
        DestroyScreenElement id = edit_tricks_sub_menu_anchor
    endif
    if ObjectExists id = dialog_box_anchor
        close_rankings
        return 
    endif
    if ObjectExists id = quit_dialog_anchor
        close_rankings
        return 
    endif
    if ObjectExists id = grunge_anchor
        DestroyScreenElement id = grunge_anchor
    endif
    if ObjectExists id = box_icon
        DestroyScreenElement id = box_icon
    endif
    if ObjectExists id = box_icon_2
        DestroyScreenElement id = box_icon_2
    endif
    if ScreenElementExists id = top_bar_anchor
        DestroyScreenElement id = top_bar_anchor
    endif
    if ScreenElementExists id = submenu_title_anchor
        DestroyScreenElement id = submenu_title_anchor
    endif
    pause_trick_text
    exit_pause_menu
    if InSplitScreenGame
        pausegame
        pause_trick_text
        pause_menu_gradient on
    endif
    printf '****************** CREATING RANKINGS!!!! ********************'
    if IsAutoServing
        SpawnScriptLater wait_then_force_close_rankings
    endif
    Theme_GetHighlightedTextColor return_value = on_rgba
    Theme_GetUnhighlightedTextColor return_value = off_rgba
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = rankings_anchor
        Pos = (320.0, 340.0)
        dims = (640.0, 480.0)
    }
    AssignAlias id = rankings_anchor alias = current_menu_anchor
    CreateScreenElement {
        type = ContainerElement
        parent = rankings_anchor
        id = player_list_anchor
        Pos = (320.0, 240.0)
        dims = (640.0, 480.0)
    }
    CreateScreenElement {
        type = SpriteElement
        parent = rankings_anchor
        z_priority = 10
        texture = PA_goals
        Pos = (74.0, 100.0)
        Scale = 1.300
        rot_angle = -6
        just = [ center center ]
        rgba = [ 127 102 0 108 ]
    }
    if NetSessionFunc obj = match func = isranked
        if isPC
            CreateScreenElement {
                type = vmenu
                parent = player_list_anchor
                id = player_list_menu
                font = small
                just = [ left top ]
                Pos = (105.0, 100.0)
                internal_just = [ left top ]
                event_handlers = [
                    { pad_choose close_rankings }
                ]
            }
        else
            CreateScreenElement {
                type = vmenu
                parent = player_list_anchor
                id = player_list_menu
                font = small
                just = [ left top ]
                Pos = (105.0, 100.0)
                internal_just = [ left top ]
                event_handlers = [
                    { pad_choose quit_network_game }
                ]
            }
        endif
    else
        CreateScreenElement {
            type = vmenu
            parent = player_list_anchor
            id = player_list_menu
            font = small
            just = [ left top ]
            Pos = (105.0, 100.0)
            internal_just = [ left top ]
            event_handlers = [
                { pad_choose close_rankings }
            ]
        }
    endif
    CreateScreenElement {
        type = ContainerElement
        parent = player_list_menu
        dims = (256.0, 21.0)
        not_focusable
    }
    CreateScreenElement {
        type = TextElement
        parent = <id>
        font = testtitle
        text = 'RANGLISTE'
        Pos = (75.0, -12.0)
        just = [ center top ]
        Scale = 1.300
        rgba = [ 26 44 110 120 ]
        not_focusable
    }
    CreateScreenElement {
        type = SpriteElement
        parent = player_list_anchor
        texture = black
        Pos = (94.0, 88.0)
        rgba = [ 0 0 0 120 ]
        Scale = (116.08000183105469, 7.199999809265137)
        just = [ left top ]
        z_priority = -1
    }
    CreateScreenElement {
        type = SpriteElement
        parent = player_list_anchor
        texture = black
        Pos = (94.0, 118.0)
        rgba = <on_rgba>
        Scale = (116.08000183105469, 0.699999988079071)
        just = [ left top ]
        z_priority = 2
    }
    CreateScreenElement {
        type = SpriteElement
        parent = player_list_anchor
        texture = black
        Pos = (111.0, 88.0)
        rgba = <on_rgba>
        Scale = (112.08000183105469, 0.6000000238418579)
        just = [ left top ]
        z_priority = 2
    }
    CreateScreenElement {
        type = ContainerElement
        parent = rankings_anchor
        id = rankings_list_anchor
        dims = (640.0, 480.0)
        Pos = (320.0, 240.0)
    }
    CreateScreenElement {
        type = vmenu
        parent = rankings_list_anchor
        id = rankings_list_menu
        just = [ left top ]
        Pos = (375.0, 100.0)
        internal_just = [ left top ]
    }
    CreateScreenElement {
        type = ContainerElement
        parent = rankings_list_menu
        dims = (205.0, 21.0)
        not_focusable
    }
    CreateScreenElement {
        type = TextElement
        parent = <id>
        font = dialog
        text = <score_title_text>
        Pos = (85.0, -5.0)
        just = [ center top ]
        rgba = <on_rgba>
        not_focusable
    }
    kill_start_key_binding
    FillRankingScreen
    CreateScreenElement {
        type = ContainerElement
        parent = rankings_anchor
        id = rankings_done_anchor
        dims = (640.0, 480.0)
        Pos = (320.0, 240.0)
    }
    SetScreenElementLock id = player_list_menu on
    GetStackedScreenElementPos y id = player_list_menu Offset = (210.0, -130.0)
    SetScreenElementLock id = player_list_menu Off
    <anchor_offset> = ((0.0, 0.5) * ((<Pos> - (320.0, 240.0)).(0.0, 1.0)))
    DoScreenElementMorph id = rankings_anchor time = 0 Pos = ((320.0, 240.0) - <anchor_offset>)
    SetScreenElementLock id = player_list_menu on
    GetStackedScreenElementPos y id = player_list_menu Offset = (210.0, 10.0)
    SetScreenElementLock id = player_list_menu Off
    if IsXenon
        if NOT InSplitScreenGame
            if NetSessionFunc obj = match func = isranked
                create_helper_text {
                    helper_text_elements = [
                        { text = '\b1 = Spielerkarte' }
                        { text = '\m0 = Spiel verlassen' }
                    ]
                    helper_pos = ((318.0, 426.0) + <anchor_offset>)
                }
            else
                create_helper_text {
                    helper_text_elements = [
                        { text = '\b1 = Spielerkarte' }
                        { text = '\m0 = Fortfahren' }
                    ]
                    helper_pos = ((318.0, 426.0) + <anchor_offset>)
                }
            endif
        else
            create_helper_text {
                helper_text_elements = [
                    { text = '\m0 = Fortfahren' }
                ]
                helper_pos = ((318.0, 426.0) + <anchor_offset>)
            }
        endif
    else
        create_speech_box text = 'Weiter mit \m0' Pos = (320.0, 465.0) pad_choose_script = close_rankings
    endif
    RunScriptOnScreenElement id = current_menu_anchor dialog_box_delay_input params = { delay_input_time = 2000 }
    RunScriptOnScreenElement id = current_menu_anchor menu_onscreen
endscript

script player_menu_add_item font = small
    printf 'player_menu_add_item 2'
    Theme_GetHighlightedTextColor return_value = on_rgba
    SetScreenElementLock id = <parent> Off
    if GotParam team_score
        <text_just> = [ RIGHT top ]
        <text_pos> = (230.0, 0.0)
        <container_dims> = (256.0, 24.0)
        <end_cap_scale> = (1.0, 5.0)
    else
        <text_just> = [ left top ]
        <text_pos> = (0.0, 0.0)
        <container_dims> = (256.0, 21.0)
        <end_cap_scale> = (1.0, 5.25)
    endif
    if IsXenon
        if (GotParam local_player)
            CreateScreenElement {
                type = ContainerElement
                parent = player_list_menu
                dims = (256.0, 21.0)
                not_focusable
            }
        else
            if GotParam team_score
                CreateScreenElement {
                    type = ContainerElement
                    parent = player_list_menu
                    dims = (256.0, 21.0)
                    not_focusable
                }
            else
                if NOT InSplitScreenGame
                    if NetSessionFunc obj = match func = isranked
                        CreateScreenElement {
                            type = ContainerElement
                            parent = player_list_menu
                            dims = (256.0, 21.0)
                            event_handlers = [
                                { pad_choose quit_network_game }
                                {pad_square show_gamer_card params = { player_xuid = <player_xuid> }}
                            ]
                        }
                    else
                        CreateScreenElement {
                            type = ContainerElement
                            parent = player_list_menu
                            dims = (256.0, 21.0)
                            event_handlers = [
                                { pad_choose close_rankings }
                                {pad_square show_gamer_card params = { player_xuid = <player_xuid> }}
                            ]
                        }
                    endif
                else
                    CreateScreenElement {
                        type = ContainerElement
                        parent = player_list_menu
                        dims = (256.0, 21.0)
                        not_focusable
                    }
                endif
            endif
        endif
    else
        CreateScreenElement {
            type = ContainerElement
            parent = player_list_menu
            dims = (256.0, 21.0)
            not_focusable
        }
    endif
    <container_id> = <id>
    CreateScreenElement {
        type = SpriteElement
        parent = <container_id>
        local_id = bG
        texture = black
        Pos = (-10.0, 0.0)
        rgba = [ 0 0 0 60 ]
        Scale = (116.08000183105469, 6.099999904632568)
        just = [ left top ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <container_id>
        texture = white2
        Pos = (-10.0, 20.0)
        rgba = [ 128 128 128 128 ]
        z_priority = 10
        Scale = (57.5, 0.20000000298023224)
        just = [ left top ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <container_id>
        texture = black
        Pos = (-10.0, 0.0)
        rgba = [ 0 0 0 128 ]
        Scale = (1.0, 6.0)
        z_priority = 11
        just = [ left top ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <container_id>
        texture = black
        Pos = (450.0, 0.0)
        rgba = [ 0 0 0 128 ]
        Scale = (1.0, 6.0)
        z_priority = 11
        just = [ left top ]
    }
    CreateScreenElement {
        type = TextElement
        parent = <container_id>
        local_id = name
        z_priority = 10
        font = <font>
        text = <text>
        Pos = <text_pos>
        just = <text_just>
        rgba = [ 128 128 128 128 ]
    }
    if GotParam team_score
        CreateScreenElement {
            type = SpriteElement
            parent = <container_id>
            texture = white2
            Pos = (-10.0, 20.0)
            rgba = <on_rgba>
            Scale = (57.5, 0.20000000298023224)
            just = [ left top ]
            z_priority = 11
        }
    endif
    SetScreenElementProps {
        id = <container_id>
        replace_handlers
        event_handlers = [
            { focus player_rankings_focus }
            { unfocus player_rankings_unfocus }
        ]
    }
    SetScreenElementLock id = <parent> on
    FireEvent type = focus target = player_list_menu
endscript

script player_rankings_focus 
    obj_getid
    SetScreenElementProps id = {<ObjID> child = name}rgba = [ 128 64 64 128 ]
    SetScreenElementProps id = {<ObjID> child = bG}rgba = [ 0 0 0 0 ]
    DoScreenElementMorph id = {<ObjID> child = bG}alpha = 1
endscript

script player_rankings_unfocus 
    obj_getid
    SetScreenElementProps id = {<ObjID> child = name}rgba = [ 128 128 128 128 ]
    SetScreenElementProps id = {<ObjID> child = bG}rgba = [ 0 0 0 60 ]
    DoScreenElementMorph id = {<ObjID> child = bG}alpha = 0
endscript

script score_menu_add_item 
    if GotParam team_score
        <container_dims> = (205.0, 24.0)
    else
        <container_dims> = (205.0, 21.0)
    endif
    if IsXenon
        CreateScreenElement {
            type = ContainerElement
            parent = <parent>
            dims = <container_dims>
        }
    else
        CreateScreenElement {
            type = ContainerElement
            parent = <parent>
            dims = <container_dims>
            not_focusable
        }
    endif
    <container_id> = <id>
    CreateScreenElement {
        type = TextElement
        parent = <container_id>
        z_priority = 10
        font = dialog
        text = <text>
        Pos = (85.0, 0.0)
        rgba = [ 128 128 128 128 ]
        just = [ center top ]
    }
endscript
