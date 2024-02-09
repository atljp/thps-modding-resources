goal_piece_goals_trickobj_infos = [
    {
        nodeflag = NODEFLAG_Z_SR_HO_DINO
        goal_objects = [
            { cluster_id = HO_Dino flag = got_1 }
        ]
        goal_flags = [ got_1 ]
        trick_object_prefix = 'Z_SR_g_ho_dino_flash'
        required_score = 600
        shot_text = [ 'Merk dir diesen T-Rex. ' 'Lande eine fette Kombo darauf in Gedenken an den armen Demonstranten.' ]
        trigger_obj_id = Z_SR_TRG_Ped_Dino
        restart_node = Z_SR_TRG_Restart_Dino
        igc_name = 'dino'
    }
    {
        nodeflag = NODEFLAG_Z_SR_HO_TOWER
        goal_objects = [
            { cluster_id = HO_tower flag = got_1 }
        ]
        goal_flags = [ got_1 ]
        trick_object_prefix = 'Z_SR_g_ho_tower_flash'
        required_score = 800
        shot_text = [ 'Genau so einen Turm hatte ich im Sinn.' 'Guck, ob du an diesen Rohren eine fette Kombo hinlegen kannst!' ]
        trigger_obj_id = Z_SR_TRG_Ped_HO_tower
        restart_node = Z_SR_TRG_Restart_HO_tower
        igc_name = 'tower'
    }
    {
        nodeflag = NODEFLAG_Z_SR_HO_ROPES
        goal_objects = [
            { cluster_id = HO_ropes flag = got_1 }
        ]
        goal_flags = [ got_1 ]
        trick_object_prefix = 'Z_SR_g_ho_ropes_flash'
        required_score = 1000
        shot_text = [ 'Ha, ha, Ben Whoflecks Premiere war ein Reinfall.' 'Lande eine fette Kombo auf den Samtseilen.' ]
        trigger_obj_id = Z_SR_TRG_Ped_ropes
        restart_node = Z_SR_TRG_Restart_ropes
        igc_name = 'ropes'
    }
    {
        nodeflag = NODEFLAG_Z_SR_HO_FAME
        goal_objects = [
            { cluster_id = HO_fame flag = got_1 }
            { cluster_id = HO_fame2 flag = got_2 }
            { cluster_id = HO_fame3 flag = got_3 }
        ]
        goal_flags = [ got_1 got_2 got_3 ]
        trick_object_prefix = 'Z_SR_g_ho_fame_flash_'
        required_score = 400
        shot_text = [ 'Ich wusste, wir kriegen unseren eigenen Stern auf dem Walk of Fame.' 'Triff alle in einer Kombo und du bist der Boss!' ]
        trigger_obj_id = Z_SR_TRG_Ped_fame
        restart_node = Z_SR_TRG_Restart_fame
        igc_name = 'fame'
    }
    {
        nodeflag = NODEFLAG_Z_SR_EL_LIMO
        goal_objects = [
            { cluster_id = EL_limo flag = got_1 }
        ]
        goal_flags = [ got_1 ]
        trick_object_prefix = 'Z_SR_g_el_limo_flash'
        required_score = 5200
        shot_text = [ 'Murphy hat uns diese schicke Limo besorgt.' 'Mach eine Kombo-Challenge an der Bail Bonds-Limo.' ]
        trigger_obj_id = Z_SR_TRG_Ped_EL_limo
        restart_node = Z_SR_TRG_Restart_EL_limo
        igc_name = 'limo'
    }
    {
        nodeflag = NODEFLAG_Z_SR_EL_COUCH
        goal_objects = [
            { cluster_id = EL_couch flag = got_1 }
        ]
        goal_flags = [ got_1 ]
        trick_object_prefix = 'Z_SR_g_el_couch_flash'
        required_score = 4800
        shot_text = [ 'Boone pennt schon auf der Couch, seit du ihn gerettet hast.' 'Mach eine Kombo darüber.' ]
        trigger_obj_id = Z_SR_TRG_Ped_EL_couch
        restart_node = Z_SR_TRG_Restart_EL_couch
        igc_name = 'couch'
    }
    {
        nodeflag = NODEFLAG_Z_SR_EL_CARPARTS
        goal_objects = [
            { cluster_id = EL_carparts flag = got_1 }
        ]
        goal_flags = [ got_1 ]
        trick_object_prefix = 'Z_SR_g_el_carparts_flash'
        required_score = 24000
        shot_text = [ 'Diese Autoteile, die du besorgt hast, geben ein prima Grind-Rail ab.' 'Mach eine fette Kombo an diesem Ding.' ]
        trigger_obj_id = Z_SR_TRG_Ped_EL_carparts
        restart_node = Z_SR_TRG_Restart_EL_carparts
        igc_name = 'carparts'
    }
    {
        nodeflag = NODEFLAG_Z_SR_EL_SHACK
        goal_objects = [
            { cluster_id = EL_shack flag = got_1 }
        ]
        goal_flags = [ got_1 ]
        trick_object_prefix = 'Z_SR_g_el_shack_flash'
        required_score = 25000
        shot_text = [ 'Iggy wird ausflippen, dass du ihm eine Werkzeugscheune besorgt hast.' 'Mach fette Punkte daran.' ]
        trigger_obj_id = Z_SR_TRG_Ped_EL_shack
        restart_node = Z_SR_TRG_Restart_EL_shack
        igc_name = 'shack'
    }
    {
        nodeflag = NODEFLAG_Z_SR_EL_SIGN
        goal_objects = [
            { cluster_id = EL_sign flag = got_1 }
        ]
        goal_flags = [ got_1 ]
        trick_object_prefix = 'Z_SR_g_el_sign_flash'
        required_score = 26400
        shot_text = [ 'Dieses Schild lag in Ost L.A. im Weg rum. Mal sehen, ob man hier besser daran skaten kann.' 'Lande eine fette Kombo.' ]
        trigger_obj_id = Z_SR_TRG_Ped_EL_sign
        restart_node = Z_SR_TRG_Restart_EL_sign
        igc_name = 'sign'
    }
    {
        nodeflag = NODEFLAG_Z_SR_EL_OR_CONTROL
        goal_objects = [
            { cluster_id = OR_control flag = got_1 }
        ]
        goal_flags = [ got_1 ]
        trick_object_prefix = 'Z_SR_g_or_control_flash'
        required_score = 28000
        shot_text = [ 'Das ist eine Schalttafel der Bohrinsel.' 'Glaubst du, du kannst einen fetten Score rausfahren?' ]
        trigger_obj_id = Z_SR_TRG_Ped_OR_control
        restart_node = Z_SR_TRG_Restart_OR_control
        igc_name = 'control'
    }
    {
        nodeflag = NODEFLAG_Z_SR_BH_STAR
        goal_objects = [
            { cluster_id = g_bh_star_flash_00 flag = got_1 }
        ]
        goal_flags = [ got_1 ]
        trick_object_prefix = 'Z_SR_g_bh_star_flash'
        required_score = 2100
        shot_text = [ 'Guck mal, was wir mit dem kaputten Boden aus Beverly Hills gemacht haben.' 'Ich wette, du schaffst keine fette Kombo da oben.' ]
        trigger_obj_id = Z_SR_TRG_Ped_star
        restart_node = Z_SR_TRG_Restart_BH_star
        igc_name = 'star'
    }
    {
        nodeflag = NODEFLAG_Z_SR_BH_ARCH
        goal_objects = [
            { cluster_id = BH_arch flag = got_1 }
        ]
        goal_flags = [ got_1 ]
        trick_object_prefix = 'Z_SR_g_bh_arch_flash_'
        required_score = 2400
        shot_text = [ 'Für das Teil haben wir uns 200 Säcke Beton geliehen.' 'Mach eine fette Kombo daran!' ]
        trigger_obj_id = Z_SR_TRG_Ped_BH_arch
        restart_node = Z_SR_TRG_Restart_BH_arch
        igc_name = 'arch'
    }
    {
        nodeflag = NODEFLAG_Z_SR_BH_GATE
        goal_objects = [
            { cluster_id = BH_gate flag = got_1 }
        ]
        goal_flags = [ got_1 ]
        trick_object_prefix = 'Z_SR_g_bh_gate_flash_'
        required_score = 1600
        shot_text = [ 'Guck dir dieses fette Roll-In an!' 'Versuch eine fette Kombo!' ]
        trigger_obj_id = Z_SR_TRG_Ped_gate
        restart_node = Z_SR_TRG_Restart_gate
        igc_name = 'gate'
    }
    {
        nodeflag = NODEFLAG_Z_SR_BH_RUBBLE
        goal_objects = [
            { cluster_id = BH_rubble flag = got_1 }
        ]
        goal_flags = [ got_1 ]
        trick_object_prefix = 'Z_SR_g_bh_rubble_flash'
        required_score = 1950
        shot_text = [ 'Sie haben einen Platz für diese Gebäudeteile gesucht. Ich hab ihnen die Ranch vorgeschlagen.' 'Ich weiß nicht mal, ob man daran skaten kann, aber versuch mal eine fette Kombo.' ]
        trigger_obj_id = Z_SR_TRG_Ped_rubble
        restart_node = Z_SR_TRG_Restart_rubble
        igc_name = 'rubble'
    }
    {
        nodeflag = NODEFLAG_Z_SR_BH_DOME
        goal_objects = [
            { cluster_id = BH_dome flag = got_1 }
        ]
        goal_flags = [ got_1 ]
        trick_object_prefix = 'Z_SR_g_bh_dome_flash'
        required_score = 2300
        shot_text = [ 'Die grüne Kuppel befördert dich ganz schön hoch hinaus. Darum wollte Boone die sich auch unter den Nagel reißen.' 'Mach eine Monsterkombo daran.' ]
        trigger_obj_id = Z_SR_TRG_Ped_dome
        restart_node = Z_SR_TRG_Restart_dome
        igc_name = 'dome'
    }
    {
        nodeflag = NODEFLAG_Z_SR_BH_SM_STAIRS
        goal_objects = [
            { cluster_id = SM_stairs flag = got_1 }
            { cluster_id = g_sm_stairs_flash_00 flag = got_1 }
        ]
        goal_flags = [ got_1 ]
        trick_object_prefix = 'Z_SR_g_sm_stairs_flash'
        required_score = 5800
        shot_text = [ 'Dank Joey B. haben wir echt die ganze Treppe zur Ranch geschleppt.' 'Du fängst an. Mach eine fette Kombo.' ]
        trigger_obj_id = Z_SR_TRG_Ped_SM_stairs
        restart_node = Z_SR_TRG_Restart_SM_stairs
        igc_name = 'stairs'
    }
    {
        nodeflag = NODEFLAG_Z_SR_DT_FREEWAY
        goal_objects = [
            { cluster_id = DT_freeway flag = got_1 }
        ]
        goal_flags = [ got_1 ]
        trick_object_prefix = 'Z_SR_g_dt_freeway_flash'
        required_score = 21000
        shot_text = [ 'Der Unfall, den du auf dem Freeway verursacht hast, war ganz schön schlimm. Aber du hast ein schönes Teil für die Ranch!' 'Verwende das Freeway-Schild, um eine fette Kombo zu landen.' ]
        trigger_obj_id = Z_SR_TRG_Ped_DT_freeway
        restart_node = Z_SR_TRG_Restart_DT_freeway
        igc_name = 'freeway'
    }
    {
        nodeflag = NODEFLAG_Z_SR_DT_BELL
        goal_objects = [
            { cluster_id = obj_DT_bell flag = got_1 }
        ]
        goal_flags = [ got_1 ]
        trick_object_prefix = 'Z_SR_g_dt_bell_flash'
        required_score = 31500
        shot_text = [ 'Diese Glocke macht einen Ton, wenn du durchskatest.' 'Skate am Geländer und lande eine fette Kombo.' ]
        trigger_obj_id = Z_SR_TRG_Ped_DT_bell
        restart_node = Z_SR_TRG_Restart_DT_bell
        igc_name = 'bell'
    }
    {
        nodeflag = NODEFLAG_Z_SR_DT_LV_SLOT
        goal_objects = [
            { cluster_id = LV_slot flag = got_1 }
        ]
        goal_flags = [ got_1 ]
        trick_object_prefix = 'Z_SR_g_lv_slot_flash'
        required_score = 110000
        shot_text = [ 'Wenn du dich gut fühlst, komm hier rauf und skate am Spielautomat.' 'Grinde um den goldenen Ring und lande eine fette Kombo.' ]
        trigger_obj_id = Z_SR_TRG_Ped_LV_slot
        restart_node = Z_SR_TRG_Restart_LV_slot
        igc_name = 'slot'
    }
    {
        nodeflag = NODEFLAG_Z_SR_DT_PYR
        goal_objects = [
            { cluster_id = DT_pyr flag = got_1 }
        ]
        goal_flags = [ got_1 ]
        trick_object_prefix = 'Z_SR_g_dt_pyr_flash'
        required_score = 29000
        shot_text = [ 'Mega hat hier alles mit Strom versorgt, ich weiß nicht mal, ob man überhaupt noch daran skaten kann.' 'Mach einen Fokus-Kombotest für mich.' ]
        trigger_obj_id = Z_SR_TRG_Ped_DT_pyr
        restart_node = Z_SR_TRG_Restart_DT_pyr
        igc_name = 'pyr'
    }
    {
        nodeflag = NODEFLAG_Z_SR_DT_STREET
        goal_objects = [
            { cluster_id = DT_street flag = got_1 }
        ]
        goal_flags = [ got_1 ]
        trick_object_prefix = 'Z_SR_g_dt_street_flash'
        required_score = 20000
        shot_text = [ 'Dass wir dem Arbeiter geholfen haben, hat uns ein ganz nettes Teil eingebracht.' 'Für Geheimnisse musst du an diesem Teil und an den anderen in diesem Bereich hoch punkten.' ]
        trigger_obj_id = Z_SR_TRG_Ped_DT_street
        restart_node = Z_SR_TRG_Restart_DT_street
        igc_name = 'street'
    }
    {
        nodeflag = NODEFLAG_Z_SR_DT_SCAF
        goal_objects = [
            { cluster_id = DT_scaf flag = got_1 }
        ]
        goal_flags = [ got_1 ]
        trick_object_prefix = 'Z_SR_g_dt_scaf_flash'
        required_score = 23000
        shot_text = [ 'Die Feuerleiter macht das Skaten auf der Ranch nicht sicherer.' 'Mach eine fette Kombo an diesem Ding.' ]
        trigger_obj_id = Z_SR_TRG_Ped_DT_scaf
        restart_node = Z_SR_TRG_Restart_DT_scaf
        igc_name = 'scaf'
    }
    {
        nodeflag = NODEFLAG_Z_SR_DT_TOWER
        goal_objects = [
            { cluster_id = DT_tower flag = got_1 }
        ]
        goal_flags = [ got_1 ]
        trick_object_prefix = 'Z_SR_g_dt_tower_flash'
        required_score = 24000
        shot_text = [ 'Keine Skate-Ranch ohne einen großen chinesischen Turm.' 'Mach eine fette Kombo an dem großen Baumstamm da oben.' ]
        trigger_obj_id = Z_SR_TRG_Ped_DT_tower
        restart_node = Z_SR_TRG_Restart_DT_tower
        igc_name = 'dttower'
    }
    {
        nodeflag = NODEFLAG_Z_SR_SM_COURT
        goal_objects = [
            { cluster_id = SM_court flag = got_1 }
        ]
        goal_flags = [ got_1 ]
        trick_object_prefix = 'Z_SR_g_sm_court_flash'
        required_score = 5100
        shot_text = [ 'Wir haben aus diesem Dach aus Santa Monica eine große Vert-Wand gebaut.' 'Du kannst auf alle möglichen Arten an diesem Ding skaten. Sieh zu, dass du viele Punkte machst.' ]
        trigger_obj_id = Z_SR_TRG_Ped_SM_court
        restart_node = Z_SR_TRG_Restart_SM_court
        igc_name = 'court'
    }
    {
        nodeflag = NODEFLAG_Z_SR_SM_FERRIS
        goal_objects = [
            { cluster_id = SM_ferris flag = got_1 }
        ]
        goal_flags = [ got_1 ]
        trick_object_prefix = 'Z_SR_g_sm_ferris_flash'
        required_score = 4800
        shot_text = [ 'Das ist alles, was vom Riesenrad übrig ist, das Alva und du zerstört habt.' 'Mach dicke Punkte an den Pier-Schildern.' ]
        trigger_obj_id = Z_SR_TRG_Ped_SM_ferris
        restart_node = Z_SR_TRG_Restart_SM_ferris
        igc_name = 'ferris'
    }
    {
        nodeflag = NODEFLAG_Z_SR_SM_PACPARK
        goal_objects = [
            { cluster_id = SM_pacpark flag = got_1 }
        ]
        goal_flags = [ got_1 ]
        trick_object_prefix = 'Z_SR_g_sm_pacpark_flash'
        required_score = 5500
        shot_text = [ 'Erinnerst du dich an das Schild vom Santa Monica Pier?' 'Du solltest in der Lage sein, da rüber zu grinden und locker ein paar Punkte rauszuholen.' ]
        trigger_obj_id = Z_SR_TRG_Ped_SM_pacpark
        restart_node = Z_SR_TRG_Restart_SM_pacpark
        igc_name = 'pacpark'
    }
    {
        nodeflag = NODEFLAG_Z_SR_SM_SCOPE
        goal_objects = [
            { cluster_id = SM_scope flag = got_1 }
        ]
        goal_flags = [ got_1 ]
        trick_object_prefix = 'Z_SR_g_sm_scope_flash'
        required_score = 5000
        shot_text = [ 'Der modifizierte Teleskop-Ballonwerfer ist da oben.' 'Grinde über diesen Turm und mach eine fette Kombo.' ]
        trigger_obj_id = Z_SR_TRG_Ped_SM_scope
        restart_node = Z_SR_TRG_Restart_SM_scope
        igc_name = 'scope'
    }
    {
        nodeflag = NODEFLAG_Z_OR_FLOOR
        goal_objects = [
            { cluster_id = OR_floor flag = got_1 }
        ]
        goal_flags = [ got_1 ]
        trick_object_prefix = 'Z_SR_g_or_floor_flash'
        required_score = 55000
        shot_text = [ 'Hier haben wir den Bohrinselboden platziert.' 'Mach eine fette Kombo daran.' ]
        trigger_obj_id = Z_SR_TRG_Ped_OR_floor
        restart_node = Z_SR_TRG_Restart_OR_floor
        igc_name = 'floor'
    }
    {
        nodeflag = NODEFLAG_Z_OR_BALLS
        goal_objects = [
            { cluster_id = OR_balls flag = got_1 }
        ]
        goal_flags = [ got_1 ]
        trick_object_prefix = 'Z_SR_g_or_balls_flash'
        required_score = 47000
        shot_text = [ 'Mach fette Punkte an diesen riesigen Behältern.' 'Hinterlass dein Tag!' ]
        trigger_obj_id = Z_SR_TRG_Ped_OR_balls
        restart_node = Z_SR_TRG_Restart_OR_balls
        igc_name = 'balls'
    }
    {
        nodeflag = NODEFLAG_Z_OR_BH_FOUNTAIN
        goal_objects = [
            { cluster_id = BH_fountain flag = got_1 }
        ]
        goal_flags = [ got_1 ]
        trick_object_prefix = 'Z_SR_g_or_bh_fountain_flash_'
        required_score = 1700
        shot_text = [ 'Hey, sieh dir mal diese tiefe Grube an. Ich hab das Mädel, das du aus Beverly Hills mitgebracht hast, da reingeworfen.' 'Zeig mal, ob du eine fette Kombo daran schaffst.' ]
        trigger_obj_id = Z_SR_TRG_Ped_fountain
        restart_node = Z_SR_TRG_Restart_fountain
        igc_name = 'fountain'
    }
    {
        nodeflag = NODEFLAG_Z_OR_DERRICK
        goal_objects = [
            { cluster_id = OR_derrick flag = got_1 }
        ]
        goal_flags = [ got_1 ]
        trick_object_prefix = 'Z_SR_g_or_derrick_flash'
        required_score = 57000
        shot_text = [ 'Es ist nicht viel, nur das USGAS-Schild - kam kostenlos mit der Bohrinsel da drüben.' 'Versuch\'s einfach und guck, wie viele Punkte du schaffst.' ]
        trigger_obj_id = Z_SR_TRG_Ped_OR_derrick
        restart_node = Z_SR_TRG_Restart_OR_derrick
        igc_name = 'derrick'
    }
    {
        nodeflag = NODEFLAG_Z_OR_PIPE
        goal_objects = [
            { cluster_id = OR_pipe flag = got_1 }
        ]
        goal_flags = [ got_1 ]
        trick_object_prefix = 'Z_SR_g_or_pipe_flash'
        required_score = 46000
        shot_text = [ 'Wir haben das Rohr in dieses Loch gelegt.' 'Grinde daran und mach fette Punkte.' ]
        trigger_obj_id = Z_SR_TRG_Ped_OR_pipe
        restart_node = Z_SR_TRG_Restart_OR_pipe
        igc_name = 'pipe'
    }
    {
        nodeflag = NODEFLAG_Z_LV_HO_LIFT
        goal_objects = [
            { cluster_id = HO_lift flag = got_1 }
        ]
        goal_flags = [ got_1 ]
        trick_object_prefix = 'Z_SR_g_HO_lift_flash'
        required_score = 400
        shot_text = [ 'Mach jede Menge Punkte an dieser Quarterpipe.' ]
        trigger_obj_id = Z_SR_TRG_Ped_HO_lift
        restart_node = Z_SR_TRG_Restart_HO_lift
        igc_name = 'lift'
    }
    {
        nodeflag = NODEFLAG_Z_LV_CROWN
        goal_objects = [
            { cluster_id = g_lv_crown_flash_00 flag = got_1 }
        ]
        goal_flags = [ got_1 ]
        trick_object_prefix = 'Z_SR_g_LV_crown_flash'
        required_score = 350000
        shot_text = [ 'Diese Rails befördern dich jenseits der Ranch.' 'Grinde an einem Booster-Rail und mach fette Punkte.' ]
        trigger_obj_id = Z_SR_TRG_Ped_LV_crown
        restart_node = Z_SR_TRG_Restart_LV_crown
        igc_name = 'crown'
    }
    {
        nodeflag = NODEFLAG_Z_LV_SPOT
        goal_objects = [
            { cluster_id = LV_spot flag = got_1 }
        ]
        goal_flags = [ got_1 ]
        trick_object_prefix = 'Z_SR_g_LV_spot_flash'
        required_score = 175000
        shot_text = [ 'Das bringt den Ort zum Leuchten.' 'Lande eine fette Kombo von dieser Bank.' ]
        trigger_obj_id = Z_SR_TRG_Ped_LV_spot
        restart_node = Z_SR_TRG_Restart_LV_spot
        igc_name = 'spot'
    }
    {
        nodeflag = NODEFLAG_Z_LV_WHEEL
        goal_objects = [
            { cluster_id = LV_wheel flag = got_1 }
        ]
        goal_flags = [ got_1 ]
        trick_object_prefix = 'Z_SR_g_LV_wheel_flash'
        required_score = 180000
        shot_text = [ 'Mach eine fette Kombo am Roulette-Rad.' ]
        trigger_obj_id = Z_SR_TRG_Ped_LV_wheel
        restart_node = Z_SR_TRG_Restart_LV_wheel
        igc_name = 'wheel'
    }
    {
        nodeflag = NODEFLAG_Z_LV_ESCALATOR
        goal_objects = [
            { cluster_id = LV_escalator flag = got_1 }
        ]
        goal_flags = [ got_1 ]
        trick_object_prefix = 'Z_SR_g_LV_escalator_flash'
        required_score = 240000
        shot_text = [ 'Skate an diesen Rollentreppen - ein Wallride rauf auf die Plattform wäre super!' 'Lande eine fette Kombo und sag mir, was du denkst.' ]
        trigger_obj_id = Z_SR_TRG_Ped_LV_escalator
        restart_node = Z_SR_TRG_Restart_LV_escalator
        igc_name = 'escalator'
    }
    {
        nodeflag = NODEFLAG_Z_LV_OR_SIDEWALL
        goal_objects = [
            { cluster_id = OR_sidewall flag = got_1 }
        ]
        goal_flags = [ got_1 ]
        trick_object_prefix = 'Z_SR_g_OR_sidewall_flash'
        required_score = 42000
        shot_text = [ 'Dieser Teil der Bohrinsel gibt eine nette Schanze zur Plattform ab.' 'Mach hier eine Fokus-Testkombo.' ]
        trigger_obj_id = Z_SR_TRG_Ped_OR_sidewall
        restart_node = Z_SR_TRG_Restart_OR_sidewall
        igc_name = 'sidewall'
    }
]

script goal_piece_goals_add_next_goal 
    Block \{ untilevent = goal_cam_anim_done }
    wait \{ 2 gameframes }
    CareerFunc \{func = SetLastPieceGoalIndexUnlocked params = { nodeflag = None }}
    PushMemProfile \{ 'Goals script' }
    goal_piece_goals_add_goals zone = <zone>
    PopMemProfile
    if GotParam \{ goal_piece_goal_id }
        GoalManager_InitializeGoal name = <goal_piece_goal_id>
        printf \{ 'skate ranch piece goal added and initialized' }
    endif
endscript

script goal_piece_goals_add_goals 
    printf 'goal_piece_goals_add_goals'
    GetArraySize goal_piece_goals_trickobj_infos
    <index> = 0
    <continue> = 0
    if NOT cd
        begin 
        if NOT IsInNodeArray (goal_piece_goals_trickobj_infos [ <index> ].trigger_obj_id)
            scriptassert 'trigger_obj_id %t not in nodearray' t = (goal_piece_goals_trickobj_infos [ <index> ].trigger_obj_id)
        endif
        if NOT IsInNodeArray (goal_piece_goals_trickobj_infos [ <index> ].restart_node)
            scriptassert 'restart_node %r not in nodearray' r = (goal_piece_goals_trickobj_infos [ <index> ].restart_node)
        endif
        if NOT NodeFlagExists (goal_piece_goals_trickobj_infos [ <index> ].nodeflag)
            scriptassert 'node flag %r does not exist' r = (goal_piece_goals_trickobj_infos [ <index> ].nodeflag)
        endif
        <index> = (<index> + 1)
        repeat <array_size>
        <index> = 0
    endif
    CareerFunc func = GetLastPieceGoalNodeflagUnlocked
    if NOT ChecksumEquals a = <nodeflag> b = None
        if NodeFlagExists <nodeflag>
            if GetNodeFlag <nodeflag>
                if NOT CareerFunc func = GetPieceGoalCompleted params = { nodeflag = <nodeflag> }
                    begin 
                    if ChecksumEquals a = <nodeflag> b = (goal_piece_goals_trickobj_infos [ <index> ].nodeflag)
                        <continue> = 1
                        break 
                    endif
                    <index> = (<index> + 1)
                    repeat <array_size>
                endif
            endif
        endif
    endif
    if (<continue> = 0)
        <index> = 0
        begin 
        if NodeFlagExists (goal_piece_goals_trickobj_infos [ <index> ].nodeflag)
            if GetNodeFlag (goal_piece_goals_trickobj_infos [ <index> ].nodeflag)
                if NOT CareerFunc func = GetPieceGoalCompleted params = {nodeflag = (goal_piece_goals_trickobj_infos [ <index> ].nodeflag)}
                    <continue> = 1
                    break 
                endif
            endif
        endif
        <index> = (<index> + 1)
        repeat <array_size>
    endif
    if (<continue> = 0)
        printf 'no available piece, returning'
        return 
    endif
    if NOT IsInNodeArray (goal_piece_goals_trickobj_infos [ <index> ].trigger_obj_id)
        printf 'trigger_obj_id : %t not in nodearray' t = (goal_piece_goals_trickobj_infos [ <index> ].trigger_obj_id)
        return 
    endif
    if NOT IsInNodeArray (goal_piece_goals_trickobj_infos [ <index> ].restart_node)
        printf 'restart_node : %r not in nodearray' r = (goal_piece_goals_trickobj_infos [ <index> ].restart_node)
        return 
    endif
    <version> = (777 - <index>)
    FormatText checksumname = goal_id '%z_goal_TRICKTHEOBJECTS%v' z = <zone> v = <version>
    goal_piece_goals_check_duplicate_goal goal_id = <goal_id>
    if NOT ((goal_piece_goals_trickobj_infos [ <index> ].required_score)= 0)
        <required_score> = (goal_piece_goals_trickobj_infos [ <index> ].required_score)
    endif
    if StructureContains structure = (goal_piece_goals_trickobj_infos [ <index> ])shot_info
        <shot_info> = (goal_piece_goals_trickobj_infos [ <index> ].shot_info)
    endif
    goal_piece_goals_edit_IGCs {
        ped_name = (goal_piece_goals_trickobj_infos [ <index> ].trigger_obj_id)
        restart_name = (goal_piece_goals_trickobj_infos [ <index> ].restart_node)
        shot_text = (goal_piece_goals_trickobj_infos [ <index> ].shot_text)
        shot_info = <shot_info>
        igc_name = (goal_piece_goals_trickobj_infos [ <index> ].igc_name)
    }
    FormatText textname = goal_text 'Mach %a Punkte am neuen Teil!' a = <required_score>
    AddGoal_TrickTheObjects {
        zone = <zone>
        version = <version>
        goal_text = <goal_text>
        goal_description = <goal_text>
        view_goals_text = <goal_text>
        goal_flags = (goal_piece_goals_trickobj_infos [ <index> ].goal_flags)
        trigger_obj_id = (goal_piece_goals_trickobj_infos [ <index> ].trigger_obj_id)
        restart_node = (goal_piece_goals_trickobj_infos [ <index> ].restart_node)
        time = 60
        show_goal_timer
        can_retry_goal
        intro_scene = goal_piece_goals_intro_IGC
        success_scene = goal_piece_goals_success_IGC
        fail_scene = goal_piece_goals_fail_IGC
        goal_objects = (goal_piece_goals_trickobj_infos [ <index> ].goal_objects)
        trick_object_prefix = (goal_piece_goals_trickobj_infos [ <index> ].trick_object_prefix)
        trick_object_light_group = outdoor
        required_score = <required_score>
        test_skateranch_piece_goal
        ped_floater = bonus_goals_ped_floater
        ped_floater_text = 'Gib dir mal das neue Teil!'
        goal_success_script = goal_piece_goals_success
        goal_success_params = {nodeflag = (goal_piece_goals_trickobj_infos [ <index> ].nodeflag)}
    }
    return goal_piece_goal_id = <goal_id>
endscript

script goal_piece_goals_check_duplicate_goal 
    if GoalManager_GoalExists name = <goal_id>
        GoalManager_UninitializeGoal name = <goal_id>
        GoalManager_RemoveGoal name = <goal_id>
    endif
endscript

script goal_piece_goals_success 
    CareerFunc func = SetPieceGoalCompleted params = {nodeflag = <nodeflag> new_state = 1}
endscript
goal_piece_goals_intro_IGC = {}
goal_piece_goals_success_IGC = {}
goal_piece_goals_fail_IGC = {}

script goal_piece_goals_edit_IGCs 
    GetNode <ped_name>
    <ped_node> = <node>
    GetNode <restart_name>
    <restart_node> = <node>
    <cam_info> = {
        pos0 = ((<restart_node>.Pos)+ (0.0, 80.0, 0.0))
        pos1 = ((<ped_node>.Pos)+ (0.0, 80.0, 0.0))
        target0 = ((<ped_node>.Pos)+ (0.0, 50.0, 0.0))
        target1 = ((<restart_node>.Pos)+ (0.0, 50.0, 0.0))
    }
    if GotParam shot_info
        GetArraySize shot_info
        <shot_params> = []
        <index> = 0
        begin 
        <tmp_array> = [
            {
                camera = (<shot_info> [ <index> ].camera)
                text = (<shot_info> [ <index> ].text)
                frames = 600
                skippable = 1
            }
        ]
        <shot_params> = (<shot_params> + <tmp_array>)
        <index> = (<index> + 1)
        repeat <array_size>
    else
        <cam_actor_pos_index> = 0
        GetArraySize shot_text
        <shot_params> = []
        <index> = 0
        begin 
        FormatText checksumname = Pos 'pos%i' i = <cam_actor_pos_index>
        FormatText checksumname = target 'target%i' i = <cam_actor_pos_index>
        <tmp_array> = [
            {
                camera = {
                    Pos = (<cam_info>.<Pos>)
                    lookatpos = (<cam_info>.<target>)
                    FOV = 72.0
                    LockTo = world
                    Quat = (0.0, 0.0, 0.0)
                }
                text = (<shot_text> [ <index> ])
                frames = 600
                skippable = 1
            }
        ]
        <shot_params> = (<shot_params> + <tmp_array>)
        <cam_actor_pos_index> = (1 - <cam_actor_pos_index>)
        <index> = (<index> + 1)
        repeat <array_size>
    endif
    change goal_piece_goals_intro_IGC = {
        name = <igc_name>
        template = igc_template_conversation2
        scene_setup = {
            transition = igc_transition_fade
            Actors = [
                {template = ped_m_actor ActorName = <ped_name> use_fam = 1}
                { template = skater_actor }
            ]
            actor_positions = [
                {ActorNum = 1
                    node = <ped_name>
                }
                {ActorNum = 2
                    node = <restart_name>
                }
            ]
        }
        shot_params = <shot_params>
    }
    if NOT GotParam success_text
        <success_text> = 'Genial! Dieses Ding können wir super in unserem Park gebrauchen!'
    endif
    FormatText textname = igc_success_name '%s_success' s = <igc_name>
    change goal_piece_goals_success_IGC = {
        name = <igc_success_name>
        template = igc_template_conversation2
        scene_setup = {
            transition = igc_transition_fade
            Actors = [
                {template = ped_m_actor ActorName = <ped_name> use_fam = 1}
                { template = skater_actor }
            ]
            actor_positions = [
                {ActorNum = 1
                    node = <ped_name>
                }
                {ActorNum = 2
                    node = <restart_name>
                }
            ]
        }
        shot_params = [
            {
                camera = {
                    Pos = (<cam_info>.pos0)
                    lookatpos = (<cam_info>.target0)
                    FOV = 72.0
                    LockTo = world
                    Quat = (0.0, 0.0, 0.0)
                }
                text = <success_text>
                frames = 300
                skippable = 1
            }
        ]
    }
    if NOT GotParam fail_text
        <fail_text> = 'Entweder ist dieses Teil nicht so toll oder du bist nicht so toll. Wohl eher Letzteres. Los, noch mal!'
    endif
    FormatText textname = igc_fail_name '%s_fail' s = <igc_name>
    change goal_piece_goals_fail_IGC = {
        name = <igc_fail_name>
        template = igc_template_conversation2
        scene_setup = {
            transition = igc_transition_fade
            Actors = [
                {template = ped_m_actor ActorName = <ped_name> use_fam = 1}
                { template = skater_actor }
            ]
            actor_positions = [
                {ActorNum = 1
                    node = <ped_name>
                }
                {ActorNum = 2
                    node = <restart_name>
                }
            ]
        }
        shot_params = [
            {
                camera = {
                    Pos = (<cam_info>.pos0)
                    lookatpos = (<cam_info>.target0)
                    FOV = 72.0
                    LockTo = world
                    Quat = (0.0, 0.0, 0.0)
                }
                text = <fail_text>
                frames = 300
                skippable = 1
            }
        ]
    }
endscript
