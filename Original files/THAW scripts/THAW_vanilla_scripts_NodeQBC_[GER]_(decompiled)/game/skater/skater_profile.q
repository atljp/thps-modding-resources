custom_male_appearances = [
    { struct = appearance_custom_skater_male_01 name = 'Chris' voice = male1 }
    { struct = appearance_custom_skater_male_02 name = 'THUG2' voice = male1 }
    { struct = appearance_custom_skater_male_03 name = 'Rocker' voice = male1 }
    { struct = appearance_custom_skater_male_04 name = 'Skater 1' voice = male1 }
    { struct = appearance_custom_skater_male_05 name = 'Skater 2' voice = male1 }
    { struct = appearance_custom_skater_male_06 name = 'Skater 3' voice = male1 }
    { struct = appearance_custom_skater_male_07 name = 'Skater 4' voice = male1 }
    { struct = appearance_custom_skater_female name = 'Trisha' Female = 1 voice = Female2 }
]
appearance_custom_skater_male_06 = {
    bare_torso = { desc_id = None }
    sleeves = { desc_id = None }
    shoe_laces = { desc_id = None }
    skater_m_lower_legs = {
        desc_id = None
        h = 0
        s = 50
        v = 50
        use_default_hsv = 1
    }
    skater_f_lower_legs = { desc_id = None }
    Body = { desc_id = MaleBody }
    skater_m_head = {
        desc_id = Body_M_Head02
        h = 5
        s = 12
        v = 35
        use_default_hsv = 0
    }
    Hat = { desc_id = None }
    skater_m_torso = { desc_id = Shirt_M_Tanktop01 }
    skater_m_legs = { desc_id = Pants_M_Leather01 }
    skater_m_hands = { desc_id = Body_M_Hands }
    board = { desc_id = default }
    griptape = { desc_id = #"Generic 1" }
    accessory2 = { desc_id = Acc_Wristband_R }
    accessory1 = { desc_id = Acc_Wristband_L }
    shoes = { desc_id = Shoes_Boots01 }
    skater_m_jaw = { desc_id = None }
    socks = { desc_id = None }
    right_leg_tattoo = { desc_id = None }
    left_sleeve_tattoo = { desc_id = #"Sleeve 1" }
    left_bicep_tattoo = { desc_id = None }
    right_sleeve_tattoo = { desc_id = #"Sleeve 3" }
    right_bicep_tattoo = { desc_id = None }
    right_forearm_tattoo = { desc_id = None }
    left_forearm_tattoo = { desc_id = None }
    skater_m_hair = {
        desc_id = Hair_M_Buzzed01
        h = 35
        s = 29
        v = 12
        use_default_hsv = 0
    }
    left_leg_tattoo = { desc_id = None }
    front_logo = { desc_id = Zeke }
    back_logo = { desc_id = Ween }
}
appearance_custom_skater_male_07 = {
    bare_torso = { desc_id = None }
    sleeves = { desc_id = None }
    shoe_laces = { desc_id = None }
    skater_m_lower_legs = {
        desc_id = None
        h = 0
        s = 50
        v = 50
        use_default_hsv = 1
    }
    skater_f_lower_legs = { desc_id = None }
    Body = { desc_id = MaleBody }
    skater_m_head = { desc_id = Body_M_Head }
    skater_m_torso = {
        desc_id = Shirt_M_Sleeveless01
        h = 0
        s = 9
        v = 26
        use_default_hsv = 0
    }
    skater_m_legs = { desc_id = Pants_M_Jeans02 }
    skater_m_hands = { desc_id = Body_M_Hands }
    board = { desc_id = default }
    griptape = { desc_id = #"Generic 1" }
    accessory2 = { desc_id = None }
    accessory1 = { desc_id = None }
    shoes = { desc_id = Shoes_Skate01 }
    skater_m_jaw = { desc_id = None }
    socks = { desc_id = Socks_M_Low01 }
    right_leg_tattoo = { desc_id = None }
    left_sleeve_tattoo = { desc_id = None }
    left_bicep_tattoo = {
        desc_id = axe
        uv_u = 6.883
        uv_v = -45.06
        uv_scale = 200.0
        uv_rot = 0.0
        use_default_uv = 0
    }
    right_sleeve_tattoo = { desc_id = None }
    right_bicep_tattoo = { desc_id = None }
    right_forearm_tattoo = { desc_id = None }
    left_forearm_tattoo = { desc_id = None }
    skater_m_hair = {
        desc_id = Hair_M_Spiked01
        h = 150
        s = 0
        v = 16
        use_default_hsv = 0
    }
    left_leg_tattoo = { desc_id = None }
    Hat = {
        desc_id = Hat_Sportscap03
        h = 115
        s = 30
        v = 28
        use_default_hsv = 0
    }
    front_logo = {
        desc_id = Zeke
        uv_u = 0.0
        uv_v = 20.00
        uv_scale = 65.58
        uv_rot = 0.0
        use_default_uv = 0
    }
    Eyes = { desc_id = #"Blue eyes" }
}
sp_str_unassigned = "Nicht zugewiesen"
appearance_init_structure = {
    sleeves = { desc_id = None }
    shoe_laces = { desc_id = None }
    skater_m_lower_legs = { desc_id = None }
    skater_f_lower_legs = { desc_id = None }
    bare_torso = { desc_id = None }
}

script init_pro_skaters 
    ForEachIn \{ master_skater_list do = AddSkaterProfile }
    AddTemporaryProfile \{ name = au_5_temp_profile }
    AddTemporaryProfile \{ name = cas_preview_temp_profile }
endscript

script cas_post_load 
    set_default_temporary_profiles
endscript

script set_default_temporary_profiles 
endscript

script get_skater_index_from_name 
    GetArraySize \{ master_skater_list }
    <index> = 0
    begin 
    if (<name> = ((master_skater_list [ <index> ]).name))
        return skater_index = <index>
    endif
    <index> = (<index> + 1)
    repeat <array_size>
    script_assert 'Couldn\'t find profile with name %n in master_skater_list' n = <name>
endscript
master_skater_list = [
    {
        display_name = 'Klassischer Skater'
        select_icon = ss_custom
        first_name = 'Custom'
        file_name = 'Unimplemented'
        default_appearance = appearance_custom_skater_male
        name = custom_classic
        stance = regular
        pushstyle = never_mongo
        trickstyle = street
        has_custom_tag = 0
        tag_texture = 'tags\cas_01'
        sticker_texture = 'CAGR/Corporate/corp_1'
        skater_family = family_custom
        allow_face_texture
        is_pro = 0
        is_male = 1
        is_head_locked = 0
        is_locked = 0
        age = 16
        hometown = 'Los Angeles, CA'
        points_available = 0
        Air = 3
        run = 3
        ollie = 3
        Speed = 3
        spin = 3
        Switch = 3
        flip_speed = 3
        rail_balance = 3
        lip_balance = 3
        manual_balance = 3
        sponsors = [
        ]
        trick_mapping = {}
        cag_info = [
        ]
        default_trick_mapping = CustomTricks
        max_specials = 12
        specials = {
            [
                { trickslot = SpAir_R_D_Circle trickname = Trick_McTwist }
                { trickslot = SpAir_U_R_Square trickname = Trick_KickFlipUnderFlip }
                { trickslot = SpGrind_R_D_Triangle trickname = Trick_tailblockslide }
                { trickslot = SpMan_D_U_Triangle trickname = Trick_OneFootOneWheel }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
            ]
        }
        voice = male1
    }
    {
        display_name = 'Skater'
        select_icon = ss_custom
        first_name = 'Custom'
        file_name = 'Unimplemented'
        default_appearance = appearance_custom_skater_male_05
        name = custom_story
        stance = regular
        pushstyle = never_mongo
        trickstyle = street
        has_custom_tag = 0
        tag_texture = 'tags\cas_01'
        sticker_texture = 'CAGR/Corporate/corp_1'
        skater_family = family_custom
        is_pro = 0
        is_male = 1
        is_head_locked = 0
        is_locked = 0
        age = 16
        hometown = 'Los Angeles, CA'
        points_available = 0
        Air = 3
        run = 3
        ollie = 3
        Speed = 3
        spin = 3
        Switch = 3
        flip_speed = 3
        rail_balance = 3
        lip_balance = 3
        manual_balance = 3
        sponsors = [
        ]
        trick_mapping = {}
        cag_info = [
        ]
        default_trick_mapping = CustomTricks
        max_specials = 1
        specials = {
            [
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
            ]
        }
        voice = male1
    }
    {
        display_name = 'Tony Hawk'
        select_icon = ss_hawk
        first_name = 'Tony'
        last_name = 'Hawk'
        default_appearance = appearance_Hawk
        name = Hawk
        stance = goofy
        pushstyle = never_mongo
        tag_texture = 'tags\tag_hawk'
        skater_family = family_pro
        is_pro = 1
        is_head_locked = 1
        is_locked = 1
        is_male = 1
        points_available = 0
        Air = 11
        run = 6
        ollie = 7
        Speed = 10
        spin = 11
        Switch = 8
        flip_speed = 7
        rail_balance = 9
        lip_balance = 9
        manual_balance = 7
        sponsors = [
            birdhouse
            hawkshoes
            quiksilver
            hawkapp
            Tony
        ]
        trick_mapping = {}
        cag_info = [
        ]
        default_trick_mapping = HawkTricks
        max_specials = 12
        specials = {
            [
                { trickslot = SpAir_R_L_Circle trickname = Trick_360VarialMcTwist }
                { trickslot = SpAir_R_D_Circle trickname = Trick_Indy900 }
                { trickslot = SpAir_L_D_Circle trickname = Trick_EndlessHandflip }
                { trickslot = SpMan_U_D_Triangle trickname = Trick_SpaceWalkWave }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
            ]
        }
        lockout_flags = [ is_hawk ]
    }
    {
        display_name = 'Tony Alva'
        select_icon = ss_alva
        first_name = 'Tony'
        last_name = 'Alva'
        default_appearance = appearance_Alva
        name = alva
        stance = goofy
        pushstyle = never_mongo
        tag_texture = 'tags\tag_alva'
        skater_family = family_pro
        is_pro = 1
        is_head_locked = 1
        is_locked = 1
        is_male = 1
        points_available = 0
        Air = 11
        run = 6
        ollie = 7
        Speed = 10
        spin = 11
        Switch = 8
        flip_speed = 7
        rail_balance = 9
        lip_balance = 9
        manual_balance = 7
        sponsors = [
            birdhouse
            hawkshoes
            quiksilver
            hawkapp
            Tony
        ]
        trick_mapping = {}
        cag_info = [
        ]
        default_trick_mapping = AlvaTricks
        max_specials = 12
        specials = {
            [
                { trickslot = SpAir_R_L_Circle trickname = Trick_FSFlipOneFootTailGrab }
                { trickslot = SpAir_R_D_Circle trickname = Trick_OldSchoolKF }
                { trickslot = SpGrind_L_D_Triangle trickname = Trick_MoonwalkGrind }
                { trickslot = SpLip_U_D_Triangle trickname = Trick_AlvaCrail }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
            ]
        }
        lockout_flags = [ is_alva ]
    }
    {
        display_name = 'Bob Burnquist'
        select_icon = ss_burnquist
        first_name = 'Bob'
        last_name = 'Burnquist'
        default_appearance = appearance_Burnquist
        name = Burnquist
        stance = regular
        pushstyle = never_mongo
        tag_texture = 'tags\tag_burnquist'
        skater_family = family_pro
        is_pro = 1
        is_head_locked = 1
        is_locked = 1
        is_male = 1
        points_available = 0
        Air = 8
        run = 7
        ollie = 7
        Speed = 10
        spin = 9
        Switch = 11
        flip_speed = 8
        rail_balance = 9
        lip_balance = 9
        manual_balance = 7
        sponsors = [
            firm
            hurley
            Burnquist
            organics
            oakley
            ogio
        ]
        trick_mapping = {}
        cag_info = [
        ]
        default_trick_mapping = BurnquistTricks
        max_specials = 12
        specials = {
            [
                { trickslot = SpGrind_L_D_Triangle trickname = Trick_RocketTail }
                { trickslot = SpAir_U_D_Circle trickname = Trick_Shifty360ShovitBSShifty }
                { trickslot = SpAir_L_R_Circle trickname = Trick_SambaFlip }
                { trickslot = SpGrind_L_R_Triangle trickname = Trick_RockNRollSwitch }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
            ]
        }
        lockout_flags = [ is_burnquist ]
    }
    {
        display_name = 'Bam Margera'
        select_icon = ss_margera
        first_name = 'Bam'
        last_name = 'Margera'
        default_appearance = appearance_Margera
        name = margera
        stance = goofy
        pushstyle = never_mongo
        tag_texture = 'tags\tag_vallely'
        skater_family = family_pro
        is_pro = 1
        is_head_locked = 1
        is_locked = 1
        is_male = 1
        points_available = 0
        Air = 8
        run = 10
        ollie = 8
        Speed = 8
        spin = 8
        Switch = 9
        flip_speed = 8
        rail_balance = 9
        lip_balance = 9
        manual_balance = 8
        sponsors = [ element adio cky bam ]
        trick_mapping = {}
        cag_info = [
        ]
        default_trick_mapping = MargeraTricks
        max_specials = 12
        specials = {
            [
                { trickslot = SpAir_U_R_Circle trickname = Trick_BamBendAir }
                { trickslot = SpLip_D_U_Triangle trickname = Trick_BamLip }
                { trickslot = SpGrind_L_R_Triangle trickname = Trick_GrindNBarf }
                { trickslot = SpMan_D_R_Triangle trickname = Trick_CrossfootNollieFlip }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
            ]
        }
        lockout_flags = [ is_margera ]
        no_edit_groups = [ head_options ]
    }
    {
        display_name = 'Rodney Mullen'
        select_icon = ss_mullen
        first_name = 'Rodney'
        last_name = 'Mullen'
        default_appearance = appearance_Mullen
        name = Mullen
        stance = regular
        pushstyle = never_mongo
        tag_texture = 'tags\tag_mullen'
        skater_family = family_pro
        is_pro = 1
        is_head_locked = 1
        is_locked = 1
        is_male = 1
        points_available = 0
        Air = 7
        run = 7
        ollie = 8
        Speed = 6
        spin = 9
        Switch = 10
        flip_speed = 10
        rail_balance = 10
        lip_balance = 7
        manual_balance = 11
        sponsors = [ enjoi globe tensor rodney ]
        trick_mapping = {}
        cag_info = [
        ]
        default_trick_mapping = MullenTricks
        max_specials = 12
        specials = {
            [
                { trickslot = SpMan_R_L_Triangle trickname = Trick_CrossfootNollieFlip }
                { trickslot = SpGrind_R_D_Triangle trickname = Trick_RodneyGrind }
                { trickslot = SpAir_U_D_Square trickname = Trick_HalfCabUnderFlip }
                { trickslot = SpMan_L_R_Triangle trickname = Trick_PrimoSpin }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
            ]
        }
        lockout_flags = [ is_mullen ]
        no_edit_groups = [ head_options ]
    }
    {
        display_name = 'Andrew Reynolds'
        select_icon = ss_reynolds
        first_name = 'Andrew'
        last_name = 'Reynolds'
        default_appearance = appearance_Reynolds
        name = reynolds
        stance = goofy
        pushstyle = never_mongo
        tag_texture = 'tags\tag_reynolds'
        skater_family = family_pro
        is_pro = 1
        is_head_locked = 1
        is_locked = 1
        is_male = 1
        points_available = 0
        Air = 11
        run = 6
        ollie = 7
        Speed = 10
        spin = 11
        Switch = 8
        flip_speed = 7
        rail_balance = 9
        lip_balance = 9
        manual_balance = 7
        sponsors = [
            birdhouse
            hawkshoes
            quiksilver
            hawkapp
            Tony
        ]
        trick_mapping = {}
        cag_info = [
        ]
        default_trick_mapping = ReynoldsTricks
        max_specials = 12
        specials = {
            [
                { trickslot = SpAir_R_L_Circle trickname = Trick_FS540 }
                { trickslot = SpAir_R_D_Circle trickname = Trick_Gazelle }
                { trickslot = SpGrind_L_R_Triangle trickname = Trick_360ShovitNoseGrind }
                { trickslot = SpMan_U_D_Triangle trickname = Trick_MixItUp }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
            ]
        }
        lockout_flags = [ is_reynolds ]
    }
    {
        display_name = 'Paul Rodriguez'
        select_icon = ss_rodriguez
        first_name = 'Paul'
        last_name = 'Rodriguez'
        default_appearance = appearance_Rodriguez
        name = rodriguez
        stance = goofy
        pushstyle = never_mongo
        tag_texture = 'tags\tag_rodriguez'
        skater_family = family_pro
        is_pro = 1
        is_head_locked = 1
        is_locked = 1
        is_male = 1
        points_available = 0
        Air = 11
        run = 6
        ollie = 7
        Speed = 10
        spin = 11
        Switch = 8
        flip_speed = 7
        rail_balance = 9
        lip_balance = 9
        manual_balance = 7
        sponsors = [
            birdhouse
            hawkshoes
            quiksilver
            hawkapp
            Tony
        ]
        trick_mapping = {}
        cag_info = [
        ]
        default_trick_mapping = RodriguezTricks
        max_specials = 12
        specials = {
            [
                { trickslot = SpAir_R_L_Circle trickname = Trick_GhettoBird }
                { trickslot = SpGrind_R_D_Triangle trickname = Trick_FSNollie360FlipCrook }
                { trickslot = SpMan_D_R_Triangle trickname = Trick_OneFootOneWheel }
                { trickslot = SpMan_U_D_Triangle trickname = Trick_BluntBoard }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
            ]
        }
        lockout_flags = [ is_rodriguez ]
    }
    {
        display_name = 'Ryan Sheckler'
        select_icon = ss_sheckler
        first_name = 'Ryan'
        last_name = 'Sheckler'
        default_appearance = appearance_Sheckler
        name = sheckler
        stance = goofy
        pushstyle = never_mongo
        tag_texture = 'tags\tag_sheckler'
        skater_family = family_pro
        is_pro = 1
        is_head_locked = 1
        is_locked = 1
        is_male = 1
        points_available = 0
        Air = 11
        run = 6
        ollie = 7
        Speed = 10
        spin = 11
        Switch = 8
        flip_speed = 7
        rail_balance = 9
        lip_balance = 9
        manual_balance = 7
        sponsors = [
            birdhouse
            hawkshoes
            quiksilver
            hawkapp
            Tony
        ]
        trick_mapping = {}
        cag_info = [
        ]
        default_trick_mapping = ShecklerTricks
        max_specials = 12
        specials = {
            [
                { trickslot = SpAir_R_L_Circle trickname = Trick_BigSpinShifty }
                { trickslot = SpAir_L_R_Circle trickname = Trick_ShecklerGrab }
                { trickslot = SpMan_L_R_Triangle trickname = Trick_OvercrookToTail }
                { trickslot = SpGrind_U_D_Triangle trickname = Trick_HCNHDF }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
            ]
        }
        lockout_flags = [ is_sheckler ]
    }
    {
        display_name = 'Daewon Song'
        select_icon = ss_song
        first_name = 'Daewon'
        last_name = 'Song'
        default_appearance = appearance_Song
        name = song
        stance = goofy
        pushstyle = never_mongo
        tag_texture = 'tags\tag_song'
        skater_family = family_pro
        is_pro = 1
        is_head_locked = 1
        is_locked = 1
        is_male = 1
        points_available = 0
        Air = 11
        run = 6
        ollie = 7
        Speed = 10
        spin = 11
        Switch = 8
        flip_speed = 7
        rail_balance = 9
        lip_balance = 9
        manual_balance = 7
        sponsors = [
            birdhouse
            hawkshoes
            quiksilver
            hawkapp
            Tony
        ]
        trick_mapping = {}
        cag_info = [
        ]
        default_trick_mapping = SongTricks
        max_specials = 12
        specials = {
            [
                { trickslot = SpAir_L_R_Circle trickname = Trick_DaewonChop }
                { trickslot = SpAir_R_D_Circle trickname = Trick_SambaFlip }
                { trickslot = SpMan_L_D_Triangle trickname = Trick_KickflipSwitch }
                { trickslot = SpMan_U_D_Triangle trickname = Trick_OneFootOneWheel }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
            ]
        }
        lockout_flags = [ is_song ]
    }
    {
        display_name = 'Rick Thorne'
        select_icon = ss_thorne
        first_name = 'Rick'
        last_name = 'Thorne'
        default_appearance = appearance_Thorne
        name = thorne
        stance = goofy
        pushstyle = never_mongo
        tag_texture = 'tags\tag_thorne'
        skater_family = family_pro
        is_pro = 1
        is_head_locked = 1
        is_locked = 1
        is_male = 1
        points_available = 0
        Air = 11
        run = 6
        ollie = 7
        Speed = 10
        spin = 11
        Switch = 8
        flip_speed = 7
        rail_balance = 9
        lip_balance = 9
        manual_balance = 7
        sponsors = [
            birdhouse
            hawkshoes
            quiksilver
            hawkapp
            Tony
        ]
        trick_mapping = {}
        cag_info = [
        ]
        default_trick_mapping = ThorneTricks
        max_specials = 12
        specials = {
            [
                { trickslot = SpAir_L_R_Circle trickname = Trick_SitDownAir }
                { trickslot = SpAir_R_L_Circle trickname = Trick_540TailWhip }
                { trickslot = SpMan_L_R_Triangle trickname = Trick_Sproing }
                { trickslot = SpMan_R_L_Triangle trickname = Trick_HulaHoop }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
            ]
        }
        lockout_flags = [ is_thorne ]
    }
    {
        display_name = 'Tony Trujillo'
        select_icon = ss_trujillo
        first_name = 'Tony'
        last_name = 'Trujillo'
        default_appearance = appearance_Trujillo
        name = trujillo
        stance = goofy
        pushstyle = never_mongo
        tag_texture = 'tags\tag_trujillo'
        skater_family = family_pro
        is_pro = 1
        is_head_locked = 1
        is_locked = 1
        is_male = 1
        points_available = 0
        Air = 11
        run = 6
        ollie = 7
        Speed = 10
        spin = 11
        Switch = 8
        flip_speed = 7
        rail_balance = 9
        lip_balance = 9
        manual_balance = 7
        sponsors = [
            birdhouse
            hawkshoes
            quiksilver
            hawkapp
            Tony
        ]
        trick_mapping = {}
        cag_info = [
        ]
        default_trick_mapping = TrujilloTricks
        max_specials = 12
        specials = {
            [
                { trickslot = SpAir_U_R_Circle trickname = Trick_2KickMadonnaFlip }
                { trickslot = SpGrind_R_D_Triangle trickname = Trick_FSNollie360FlipCrook }
                { trickslot = SpMan_L_D_Triangle trickname = Trick_NoComplyLate360 }
                { trickslot = SpAir_U_L_Circle trickname = Trick_TrujilloGuitar }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
            ]
        }
        lockout_flags = [ is_trujillo ]
    }
    {
        display_name = 'Mike Vallely'
        select_icon = ss_vallely
        first_name = 'Mike'
        last_name = 'Vallely'
        default_appearance = appearance_Vallely
        name = Vallely
        stance = regular
        pushstyle = never_mongo
        tag_texture = 'tags\tag_vallely'
        skater_family = family_pro
        is_pro = 1
        is_head_locked = 1
        is_locked = 1
        is_male = 1
        points_available = 0
        Air = 8
        run = 11
        ollie = 9
        Speed = 10
        spin = 8
        Switch = 7
        flip_speed = 8
        rail_balance = 8
        lip_balance = 8
        manual_balance = 8
        sponsors = [ Vallely etnies mike ]
        trick_mapping = {}
        cag_info = [
        ]
        default_trick_mapping = VallelyTricks
        max_specials = 12
        specials = {
            [
                { trickslot = SpMan_D_U_Triangle trickname = Trick_MikeVHandflip }
                { trickslot = SpAir_D_R_Circle trickname = Trick_Flamingo }
                { trickslot = SpLip_U_R_Triangle trickname = Trick_Around }
                { trickslot = SpMan_R_L_Triangle trickname = Trick_Boomerang }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
            ]
        }
    }
    {
        display_name = 'Stevie Williams'
        select_icon = ss_williams
        first_name = 'Stevie'
        last_name = 'Williams'
        default_appearance = appearance_Williams
        name = williams
        stance = goofy
        pushstyle = never_mongo
        tag_texture = 'tags\tag_williams'
        skater_family = family_pro
        is_pro = 1
        is_head_locked = 1
        is_locked = 1
        is_male = 1
        points_available = 0
        Air = 11
        run = 6
        ollie = 7
        Speed = 10
        spin = 11
        Switch = 8
        flip_speed = 7
        rail_balance = 9
        lip_balance = 9
        manual_balance = 7
        sponsors = [
            birdhouse
            hawkshoes
            quiksilver
            hawkapp
            Tony
        ]
        trick_mapping = {}
        cag_info = [
        ]
        default_trick_mapping = WilliamsTricks
        max_specials = 12
        specials = {
            [
                { trickslot = SpGrind_R_L_Triangle trickname = Trick_360ShovitNoseGrind }
                { trickslot = SpAir_R_D_Circle trickname = Trick_540varielheelfliplien }
                { trickslot = SpMan_R_D_Triangle trickname = Trick_PrimoSlide }
                { trickslot = SpMan_U_D_Triangle trickname = Trick_ComboGrind }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
            ]
        }
        lockout_flags = [ is_williams ]
    }
    {
        display_name = 'Geheime Skater'
        select_icon = ss_ped
        first_name = 'Ped'
        last_name = 'Skater'
        default_appearance = appearance_custom_skater_male
        name = Ped_skater
        stance = goofy
        pushstyle = never_mongo
        tag_texture = 'tags\tag_hawk'
        skater_family = family_pro
        is_pro = 1
        is_head_locked = 1
        is_locked = 1
        is_male = 1
        points_available = 0
        Air = 11
        run = 6
        ollie = 7
        Speed = 10
        spin = 11
        Switch = 8
        flip_speed = 7
        rail_balance = 9
        lip_balance = 9
        manual_balance = 7
        sponsors = [
            birdhouse
            hawkshoes
            quiksilver
            hawkapp
            Tony
        ]
        trick_mapping = {}
        cag_info = [
        ]
        default_trick_mapping = WilliamsTricks
        max_specials = 12
        specials = {
            [
                { trickslot = SpAir_R_L_Circle trickname = Trick_360VarialMcTwist }
                { trickslot = SpAir_R_D_Circle trickname = Trick_Indy900 }
                { trickslot = SpAir_L_D_Circle trickname = Trick_EndlessHandflip }
                { trickslot = SpMan_U_D_Triangle trickname = Trick_OneFootOneWheel }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
                { trickslot = Unassigned trickname = Unassigned }
            ]
        }
        lockout_flags = [ is_Jimbo ]
    }
]
default_classic_stats = {
    Air = 7
    run = 7
    ollie = 7
    Speed = 7
    spin = 7
    Switch = 7
    flip_speed = 7
    rail_balance = 7
    lip_balance = 7
    manual_balance = 7
    points_available = 0
}
default_classic_stats_collectors = {
    Air = 6
    run = 6
    ollie = 6
    Speed = 6
    spin = 6
    Switch = 6
    flip_speed = 6
    rail_balance = 6
    lip_balance = 6
    manual_balance = 6
    points_available = 0
}
default_graphic_layer_info = [
    {
        texture_id = corp_1
        texture_name = 'corp_1'
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 32
        pos_y = 32
        rot = 0
        Scale = 1.0
        flip_h = 0
        flip_v = 0
        hsva = [ 0 0 60 128 ]
        layer_id = 0
    }
    {
        texture_id = None
        texture_name = ''
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 32
        pos_y = 32
        rot = 0
        Scale = 1
        flip_h = 0
        flip_v = 0
        hsva = [ 0 0 60 128 ]
        layer_id = 1
    }
    {
        texture_id = None
        texture_name = ''
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 32
        pos_y = 32
        rot = 0
        Scale = 1
        flip_h = 0
        flip_v = 0
        hsva = [ 0 0 60 128 ]
        layer_id = 2
    }
    {
        texture_id = None
        texture_name = ''
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 32
        pos_y = 32
        rot = 0
        Scale = 1
        flip_h = 0
        flip_v = 0
        hsva = [ 0 0 60 128 ]
        layer_id = 3
    }
    {
        texture_id = None
        texture_name = ''
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 32
        pos_y = 32
        rot = 0
        Scale = 1
        flip_h = 0
        flip_v = 0
        hsva = [ 0 0 60 128 ]
        layer_id = 4
    }
    {
        texture_id = None
        texture_name = ''
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 32
        pos_y = 32
        rot = 0
        Scale = 1
        flip_h = 0
        flip_v = 0
        hsva = [ 0 0 60 128 ]
        layer_id = 5
    }
    {
        texture_id = None
        texture_name = ''
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 32
        pos_y = 32
        rot = 0
        Scale = 1
        flip_h = 0
        flip_v = 0
        hsva = [ 0 0 60 128 ]
        layer_id = 6
    }
    {
        texture_id = None
        texture_name = ''
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 32
        pos_y = 32
        rot = 0
        Scale = 1
        flip_h = 0
        flip_v = 0
        hsva = [ 0 0 60 128 ]
        layer_id = 7
    }
    {
        texture_id = None
        texture_name = ''
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 32
        pos_y = 32
        rot = 0
        Scale = 1
        flip_h = 0
        flip_v = 0
        hsva = [ 0 0 60 128 ]
        layer_id = 8
    }
    {
        texture_id = None
        texture_name = ''
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 32
        pos_y = 32
        rot = 0
        Scale = 1
        flip_h = 0
        flip_v = 0
        hsva = [ 0 0 60 128 ]
        layer_id = 9
    }
]
switcheroo_temp_array = [
    {
        texture_id = corp_1
        texture_name = 'corp_1'
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 32
        pos_y = 32
        rot = 0
        Scale = 1.0
        flip_h = 0
        flip_v = 0
        hsva = [ 0 0 60 128 ]
        layer_id = 0
    }
    {
        texture_id = None
        texture_name = ''
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 32
        pos_y = 32
        rot = 0
        Scale = 1
        flip_h = 0
        flip_v = 0
        hsva = [ 0 0 60 128 ]
        layer_id = 1
    }
    {
        texture_id = None
        texture_name = ''
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 32
        pos_y = 32
        rot = 0
        Scale = 1
        flip_h = 0
        flip_v = 0
        hsva = [ 0 0 60 128 ]
        layer_id = 2
    }
    {
        texture_id = None
        texture_name = ''
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 32
        pos_y = 32
        rot = 0
        Scale = 1
        flip_h = 0
        flip_v = 0
        hsva = [ 0 0 60 128 ]
        layer_id = 3
    }
    {
        texture_id = None
        texture_name = ''
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 32
        pos_y = 32
        rot = 0
        Scale = 1
        flip_h = 0
        flip_v = 0
        hsva = [ 0 0 60 128 ]
        layer_id = 4
    }
    {
        texture_id = None
        texture_name = ''
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 32
        pos_y = 32
        rot = 0
        Scale = 1
        flip_h = 0
        flip_v = 0
        hsva = [ 0 0 60 128 ]
        layer_id = 5
    }
    {
        texture_id = None
        texture_name = ''
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 32
        pos_y = 32
        rot = 0
        Scale = 1
        flip_h = 0
        flip_v = 0
        hsva = [ 0 0 60 128 ]
        layer_id = 6
    }
    {
        texture_id = None
        texture_name = ''
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 32
        pos_y = 32
        rot = 0
        Scale = 1
        flip_h = 0
        flip_v = 0
        hsva = [ 0 0 60 128 ]
        layer_id = 7
    }
    {
        texture_id = None
        texture_name = ''
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 32
        pos_y = 32
        rot = 0
        Scale = 1
        flip_h = 0
        flip_v = 0
        hsva = [ 0 0 60 128 ]
        layer_id = 8
    }
    {
        texture_id = None
        texture_name = ''
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 32
        pos_y = 32
        rot = 0
        Scale = 1
        flip_h = 0
        flip_v = 0
        hsva = [ 0 0 60 128 ]
        layer_id = 9
    }
]

script current_player_profile_changed 
    if NOT (<lastSkaterProfileIndex> = <currentSkaterProfileIndex>)
        printf \{ 'saving skater profile' }
        SetSkaterProfileCagInfo player = <lastSkaterProfileIndex> params = edit_graphic_layer_infos
    endif
    printf 'Changing Active Profile to %d' d = <currentSkaterProfileIndex>
    change edit_graphic_layer_infos = <cag_info>
endscript

script save_player_profile_caginfo \{ skater = 0 }
    printf \{ 'saving skater profile' }
    GetCurrentSkaterProfileIndex
    SetSkaterProfileCagInfo player = <currentSkaterProfileIndex> params = edit_graphic_layer_infos
endscript

script get_player_profile_caginfo 
    GetCurrentSkaterProfileIndex
    GetSkaterProfileInfo player = <currentSkaterProfileIndex>
    if NOT IsPs2
        if GotParam LoadDefault
            <local_array> = switcheroo_temp_array
            <index> = 0
            begin 
            SetArrayElement arrayName = local_array index = <index> newValue = (edit_graphic_layer_infos [ <index> ])
            <index> = (<index> + 1)
            repeat 10
            change edit_graphic_layer_infos = (default_graphic_layer_info)
        else
            if GotParam LoadBackDefault
                change edit_graphic_layer_infos = (switcheroo_temp_array)
                edit_graphic_print_layers
            else
                change edit_graphic_layer_infos = <cag_info>
            endif
        endif
    else
        change edit_graphic_layer_infos = <cag_info>
    endif
    if (<currentSkaterProfileIndex> = 0)
        if (<is_pro> = 0)
            if IsXenon
                MemPushContext bottomupheap
            else
                if IsNGC
                    MemPushContext bottomupheap
                else
                    MemPushContext unloadableanim
                endif
            endif
            edit_graphic_apply_graphic_from_save
            MemPopContext
        endif
    endif
endscript
