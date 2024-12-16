

script cas_add_item 
    
    if GotParam play_deck_sound
        StopSound ThisMenuSelectSound
        PlaySound SK6_Menu_Select vol = 100 id = ThisMenuSelectSound
    endif
    edit_skater_update_selected_cas_item
    cas_handle_disqualifications part = <part> desc_id = <desc_id>
    GetCurrentSkaterProfileIndex
    if ((LevelIs load_cas)|| (LevelIs Load_MainMenu))
        player = 0
    else
        player = <currentSkaterProfileIndex>
    endif
    <update_head> = 0
    if ChecksumEquals a = <part> b = skater_m_head
        <update_head> = 1
    endif
    if ChecksumEquals a = <part> b = skater_f_head
        <update_head> = 1
    endif
    if (<update_head>)
        clear_face_texture_from_profile
        EditPlayerAppearance profile = <currentSkaterProfileIndex> target = ClearPart targetParams = { part = headtop_bone_group }
        EditPlayerAppearance profile = <currentSkaterProfileIndex> target = ClearPart targetParams = { part = head_bone_group }
        EditPlayerAppearance profile = <currentSkaterProfileIndex> target = ClearPart targetParams = { part = nose_bone_group }
        EditPlayerAppearance profile = <currentSkaterProfileIndex> target = ClearPart targetParams = { part = Jaw_bone_group }
    endif
    EditPlayerAppearance profile = <currentSkaterProfileIndex> target = SetPart targetParams = {part = <part> desc_id = <desc_id>}
    if NOT ChecksumEquals a = <part> b = deck_graphic
        if NOT ChecksumEquals a = <part> b = griptape
            no_board = no_board
            update_options_menu
        endif
    endif
    RefreshSkaterModel skater = <player> profile = <currentSkaterProfileIndex> no_board = <no_board>
    if IsTrue cas_debug
        DumpHeaps
    endif
endscript


script cas_apply_sex apply_male = 1
    GetCurrentSkaterProfileIndex
    GetSkaterProfileInfo player = <currentSkaterProfileIndex>
    if (<is_male> = 1)
        <success> = 1
    else
        <success> = 0
    endif
    if (<success> = <apply_male>)
        
    else
        if (<apply_male> = 1)
            SetPlayerAppearance player = <currentSkaterProfileIndex> appearance_structure = appearance_custom_skater_male_06
            SetSkaterProfileProperty player = <currentSkaterProfileIndex> is_male 1
        else
            SetPlayerAppearance player = <currentSkaterProfileIndex> appearance_structure = appearance_custom_skater_female
            SetSkaterProfileProperty player = <currentSkaterProfileIndex> is_male 0
        endif
        RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex>
    endif
endscript

