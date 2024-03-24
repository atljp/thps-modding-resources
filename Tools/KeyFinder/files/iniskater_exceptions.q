

script cas_handle_disqualifications 
    cas_disq_remove_logo part = <part> desc_id = <desc_id>
    cas_disq_resolve_bare_torso part = <part> desc_id = <desc_id>
    cas_disq_add_sleeves part = <part> desc_id = <desc_id>
    cas_disq_set_eye_color part = <part> desc_id = <desc_id>
    cas_disq_handle_remaining_problems part = <part> desc_id = <desc_id>
endscript


script cas_disq_add_sleeves 
    <just_changed_torso> = 0
    if (ChecksumEquals a = <part> b = skater_m_torso)
        <just_changed_torso> = 1
    endif
    if (ChecksumEquals a = <part> b = skater_f_torso)
        <just_changed_torso> = 1
    endif
    if (<just_changed_torso> = 1)
        GetActualCASOptionStruct part = <part> desc_id = <desc_id>
        EditPlayerAppearance {
            profile = <currentSkaterProfileIndex>
            target = setpart
            targetParams = {part = sleeves desc_id = None}
        }
    endif
endscript


script cas_disq_resolve_bare_torso 
    if ChecksumEquals a = <part> b = skater_m_torso
        GetCurrentSkaterProfileIndex
        GetActualCASOptionStruct part = <part> desc_id = <desc_id>
        if GotParam force_bare_torso
            EditPlayerAppearance {
                profile = <currentSkaterProfileIndex>
                target = setpart
                targetParams = {part = bare_torso desc_id = #"bare torso"}
            }
        else
            EditPlayerAppearance {
                profile = <currentSkaterProfileIndex>
                target = setpart
                targetParams = {part = bare_torso desc_id = None}
            }
        endif
    endif
endscript


script cas_disq_set_eye_color 
    if ((ChecksumEquals a = <part> b = skater_m_head)|| (ChecksumEquals a = <part> b = skater_f_head))
        GetActualCASOptionStruct part = <part> desc_id = <desc_id>
        if GotParam EyeColor
            GetCurrentSkaterProfileIndex
            EditPlayerAppearance {
                profile = <currentSkaterProfileIndex>
                target = setpart
                targetParams = {part = Eyes desc_id = ((Eyes [ <EyeColor> ]).desc_id)}
            }
        endif
    endif
endscript

incompatible_female_pants = [ Leather Jogger ]
incompatible_male_pants = [denim #"Denim Dirty" khaki #"Baggy Cargo" #"Baggy CargoCamo" #"Baggy Cargo 2" #"Hawk Joe Cargo"]

script cas_disq_handle_remaining_problems 
    if ((ChecksumEquals a = <part> b = skater_m_torso)|| (ChecksumEquals a = <part> b = skater_f_torso))
        GetActualCASOptionStruct part = <part> desc_id = <desc_id>
        if GotParam not_with_skeleton_arms
            GetCurrentSkaterProfileIndex
            if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = accessory3
                if ChecksumEquals a = <desc_id> b = Skeletonarms
                    EditPlayerAppearance {
                        profile = <currentSkaterProfileIndex>
                        target = setpart
                        targetParams = {part = accessory3 desc_id = None}
                    }
                endif
            endif
        endif
    else
        if ((ChecksumEquals a = <part> b = skater_m_legs)|| (ChecksumEquals a = <part> b = skater_f_legs))
            if ChecksumEquals a = <part> b = skater_m_legs
                <incompatible_array> = incompatible_male_pants
                <not_with_flag> = not_with_certain_male_pants
            else
                <incompatible_array> = incompatible_female_pants
                <not_with_flag> = not_with_certain_female_pants
            endif
            <wearing_incompatible_pants> = 0
            <index> = 0
            GetArraySize <incompatible_array>
            begin 
            if ChecksumEquals a = <desc_id> b = (<incompatible_array> [ <index> ])
                <wearing_incompatible_pants> = 1
                break 
            endif
            <index> = (<index> + 1)
            repeat <array_size>
            if (<wearing_incompatible_pants>)
                GetCurrentSkaterProfileIndex
                if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = shoes
                    GetActualCASOptionStruct part = shoes desc_id = <desc_id>
                    if GotParam <not_with_flag>
                        EditPlayerAppearance {
                            profile = <currentSkaterProfileIndex>
                            target = setpart
                            targetParams = {part = shoes desc_id = BareFeet}
                        }
                    endif
                endif
            endif
        endif
    endif
endscript


script cas_disq_remove_logo 
    GetActualCASOptionStruct part = <part> desc_id = <desc_id>
    GetCurrentSkaterProfileIndex
    if ((ChecksumEquals a = <part> b = skater_m_torso)|| (ChecksumEquals a = <part> b = skater_f_torso))
        if NOT GotParam supports_logo
            GetCurrentSkaterProfileIndex
            EditPlayerAppearance {
                profile = <currentSkaterProfileIndex>
                target = clearpart
                targetParams = { part = front_logo }
            }
            EditPlayerAppearance {
                profile = <currentSkaterProfileIndex>
                target = clearpart
                targetParams = { part = back_logo }
            }
        else
            if GotParam no_back_logo
                EditPlayerAppearance {
                    profile = <currentSkaterProfileIndex>
                    target = clearpart
                    targetParams = { part = back_logo }
                }
            endif
        endif
    endif
    if (ChecksumEquals a = <part> b = Hat)
        if NOT GotParam supports_logo
            EditPlayerAppearance {
                profile = <currentSkaterProfileIndex>
                target = clearpart
                targetParams = { part = hat_logo }
            }
        endif
    endif
endscript


script cas_temp_disq_remove_longsleeve_parts 
    if NOT GotParam open_skin
        clearpart part = chest_tattoo
    endif
    clearpart part = back_tattoo
    clearpart part = left_sleeve_tattoo
    clearpart part = left_bicep_tattoo
    clearpart part = left_forearm_tattoo
    clearpart part = right_sleeve_tattoo
    clearpart part = right_bicep_tattoo
    clearpart part = right_forearm_tattoo
    clearpart part = accessory1
    clearpart part = accessory2
    if GotParam hoody_up
        clearpart part = Hat
        clearpart part = skater_f_hat_hair
        clearpart part = skater_f_hair
        clearpart part = skater_m_hat_hair
        clearpart part = skater_m_hair
        clearpart part = elbowpads
    endif
    if GotParam hoody_down
        clearpart part = skater_f_backpack
        clearpart part = skater_m_backpack
        clearpart part = elbowpads
    endif
    if GotParam all_accessories
        clearpart part = accessory3
    endif
endscript


script cas_temp_disq_remove_accessories 
    clearpart part = accessory1
    clearpart part = accessory2
endscript


script cas_temp_disq_set_lower_legs 
    <should_force_lower_legs> = 0
    if gotpart part = skater_m_legs
        <should_force_lower_legs> = 1
        <leg_part> = skater_m_legs
        <lower_leg_part> = skater_m_lower_legs
    endif
    if gotpart part = skater_f_legs
        <should_force_lower_legs> = 1
        <leg_part> = skater_f_legs
        <lower_leg_part> = skater_f_lower_legs
    endif
    if (<should_force_lower_legs>)
        if partgotflag part = <leg_part> flag = force_lower_legs_none
            <lower_leg_desc> = None
        else
            if partgotflag part = <leg_part> flag = force_lower_legs_calves
                <lower_leg_desc> = calves
            else
                if partgotflag part = <leg_part> flag = force_lower_legs_full
                    <lower_leg_desc> = #"Full Legs"
                endif
            endif
        endif
        if GotParam lower_leg_desc
            setpart part = <lower_leg_part> desc_id = <lower_leg_desc>
        endif
    endif
endscript


script cas_temp_disq_force_big_kneepads 
    <should_force_big_kneepads> = 0
    if gotpart part = skater_m_legs
        if partgotflag part = skater_m_legs flag = force_big_kneepads
            <should_force_big_kneepads> = 1
        endif
    endif
    if gotpart part = skater_f_legs
        if partgotflag part = skater_f_legs flag = force_big_kneepads
            <should_force_big_kneepads> = 1
        endif
    endif
    if (<should_force_big_kneepads>)
        getpart part = kneepads
        GetActualCASOptionStruct part = kneepads desc_id = <desc_id>
        <use_default_hsv> = 1
        getpart part = kneepads
        if (<use_default_hsv> = 1)
            if GotParam default_h
                <use_default_hsv> = 0
                <h> = <default_h>
                <s> = <default_s>
                <v> = <default_v>
                if NOT GotParam default_s
                    script_assert 'missing default_s parameter'
                endif
                if NOT GotParam default_v
                    script_assert 'missing default_v parameter'
                endif
            endif
        endif
        setpart part = kneepads desc_id = #"Knee Pads Big" use_default_hsv = <use_default_hsv> h = <h> s = <s> v = <v>
    endif
endscript


script cas_temp_disq_force_big_elbowpads 
    <should_replace_elbowpads> = 0
    if gotpart part = skater_m_torso
        if partgotflag part = skater_m_torso flag = force_big_elbowpads
            <should_replace_elbowpads> = 1
        endif
    endif
    if gotpart part = skater_f_torso
        if partgotflag part = skater_f_torso flag = force_big_elbowpads
            <should_replace_elbowpads> = 1
        endif
    endif
    <index> = 1
    begin 
    FormatText checksumname = Accessory 'accessory%n' n = <index>
    if gotpart part = <Accessory>
        if partgotflag part = <Accessory> flag = force_big_elbowpads
            <should_replace_elbowpads> = 1
            break 
        endif
    endif
    <index> = (<index> + 1)
    repeat 3
    if (<should_replace_elbowpads>)
        getpart part = elbowpads
        if NOT GotParam desc_id
            script_assert 'GetPart didn\'t return an appropriate value'
        endif
        AppendSuffixToChecksum base = <desc_id> suffixstring = ' Big'
        GetActualCASOptionStruct part = elbowpads desc_id = <desc_id>
        <use_default_hsv> = 1
        getpart part = elbowpads
        if (<use_default_hsv> = 1)
            if GotParam default_h
                <use_default_hsv> = 0
                <h> = <default_h>
                <s> = <default_s>
                <v> = <default_v>
                if NOT GotParam default_s
                    script_assert 'missing default_s parameter'
                endif
                if NOT GotParam default_v
                    script_assert 'missing default_v parameter'
                endif
            endif
        endif
        setpart part = elbowpads desc_id = <appended_id> use_default_hsv = <use_default_hsv> h = <h> s = <s> v = <v>
    endif
endscript


script check_for_non_standard_parts 
    <clear_ok> = 1
    GetPlayerAppearancePart player = <player> part = <part>
    if GotParam desc_id
        GetArraySize skater_non_standard_parts
        <index> = 0
        begin 
        if ChecksumEquals a = <desc_id> b = (skater_non_standard_parts [ <index> ].desc_id)
            <clear_ok> = 0
            if GotParam side
                if StructureContains structure = (skater_non_standard_parts [ <index> ])side
                    if ChecksumEquals a = <side> b = (skater_non_standard_parts [ <index> ].side)
                        <clear_ok> = 0
                    else
                        <clear_ok> = 1
                    endif
                endif
            endif
            if NOT (<clear_ok>)
                break 
            endif
        endif
        <index> = (<index> + 1)
        repeat <array_size>
    endif
    return clear_ok = <clear_ok>
endscript


script currently_editing_female 
    GetCurrentSkaterProfileIndex
    GetSkaterSex player = <currentSkaterProfileIndex>
    return is_enabled = (<is_male> = 0)
endscript


script currently_editing_male 
    GetCurrentSkaterProfileIndex
    GetSkaterSex player = <currentSkaterProfileIndex>
    return is_enabled = (<is_male> = 1)
endscript


script get_lockout_parts 
    GetCurrentSkaterProfileIndex
    GetArraySize <parts>
    <index> = 0
    <found_parts> = []
    <found> = 0
    begin 
    if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = (<parts> [ <index> ])
        GetActualCASOptionStruct part = (<parts> [ <index> ])desc_id = <desc_id>
        if GotParam lockout_parts
            <found_parts> = (<found_parts> + <lockout_parts>)
            <found> = 1
        endif
    endif
    <index> = (<index> + 1)
    repeat <array_size>
    if (<found>)
        return lockout_parts = <found_parts>
    endif
endscript


script check_for_lockout_parts 
    <ret_val> = 1
    if ((GotParam parts)& (GotParam menu_parts))
        get_lockout_parts parts = <parts>
        if GotParam lockout_parts
            GetArraySize <lockout_parts>
            <num_lockout_parts> = <array_size>
            GetArraySize <menu_parts>
            <num_menu_parts> = <array_size>
            <index> = 0
            begin 
            if (<ret_val> = 0)
                break 
            endif
            <index2> = 0
            begin 
            if ChecksumEquals a = (<menu_parts> [ <index2> ])b = (<lockout_parts> [ <index> ])
                <ret_val> = 0
                break 
            endif
            <index2> = (<index2> + 1)
            repeat <num_menu_parts>
            <index> = (<index> + 1)
            repeat <num_lockout_parts>
        endif
    endif
    return is_enabled = <ret_val>
endscript


script check_if_group_editable 
    <retVal> = 1
    if GotParam not_with_scaling_cheats
        if GetGlobalFlag flag = CHEAT_GORILLA
            <retVal> = 0
        endif
        if GetGlobalFlag flag = CHEAT_KID
            <retVal> = 0
        endif
        if GetGlobalFlag flag = CHEAT_BIGHEAD
            <retVal> = 0
        endif
    endif
    return is_enabled = <retVal>
endscript


script check_if_part_editable 
    <retVal> = 0
    if GotParam part
        GetCurrentSkaterProfileIndex
        if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = <part>
            if (<desc_id> = None)
                <retVal> = 0
            else
                <retVal> = 1
            endif
        endif
    endif
    if (<retVal>)
        if GotParam extra_script
            <extra_script> <extra_script_params>
            <retVal> = <is_enabled>
        endif
    endif
    return is_enabled = <retVal>
endscript


script check_if_hands_selected parts = [ skater_m_hands skater_f_hands ]
    <retVal> = 0
    GetCurrentSkaterProfileIndex
    <index> = 0
    begin 
    if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = (<parts> [ <index> ])
        if (<desc_id> = Hands)
            <retVal> = 0
        else
            <retVal> = 1
        endif
    endif
    <index> = (<index> + 1)
    repeat 2
    return is_enabled = <retVal>
endscript


script check_if_parts_editable 
    <retVal> = 0
    if GotParam parts
        GetArraySize <parts>
        <index> = 0
        GetCurrentSkaterProfileIndex
        begin 
        if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = (<parts> [ <index> ])
            if (<desc_id> = None)
                <retVal> = 0
            else
                <retVal> = 1
                break 
            endif
        endif
        <index> = (<index> + 1)
        repeat <array_size>
    endif
    return is_enabled = <retVal>
endscript


script check_if_part_logoable 
    <retVal> = 0
    if GotParam extra_script
        <extra_script> <extra_script_params>
        if (<is_enabled> = 0)
            return is_enabled = <is_enabled>
        endif
    endif
    if GotParam parts
        GetArraySize <parts>
        <index> = 0
        begin 
        GetCurrentSkaterProfileIndex
        if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = (<parts> [ <index> ])
            GetActualCASOptionStruct part = (<parts> [ <index> ])desc_id = <desc_id>
            if GotParam supports_logo
                <retVal> = 1
                break 
            else
                <retVal> = 0
                break 
            endif
        endif
        <index> = (<index> + 1)
        repeat <array_size>
    endif
    return is_enabled = <retVal>
endscript


script check_if_part_back_logoable 
    if GotParam extra_script
        <extra_script> <extra_script_params>
        if (<is_enabled> = 0)
            return is_enabled = <is_enabled>
        endif
    endif
    check_if_part_logoable <...> 
    if (<is_enabled> = 1)
        if GotParam parts
            GetArraySize <parts>
            <index> = 0
            begin 
            GetCurrentSkaterProfileIndex
            if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = (<parts> [ <index> ])
                GetActualCASOptionStruct part = (<parts> [ <index> ])desc_id = <desc_id>
                if GotParam no_back_logo
                    return is_enabled = 0
                endif
            endif
            <index> = (<index> + 1)
            repeat <array_size>
        endif
    endif
    return is_enabled = <is_enabled>
endscript


script check_if_item_accessible 
    <retVal> = 1
    GetCurrentSkaterProfileIndex
    GetSkaterProfileInfo player = <currentSkaterProfileIndex>
    GetActualCASOptionStruct part = <part> desc_id = <desc_id>
    if GotParam lockout_flags
        GetArraySize <lockout_flags>
        <index> = 0
        begin 
        if GotParam (<lockout_flags> [ <index> ])
            <retVal> = 0
            break 
        endif
        <index> = (<index> + 1)
        repeat <array_size>
    endif
    return is_enabled = <retVal>
endscript


script check_if_part_colorable 
    <retVal> = 0
    if GotParam extra_script
        <extra_script> <extra_script_params>
        if (<is_enabled> = 0)
            return is_enabled = <is_enabled>
        endif
    endif
    if GotParam parts
        GetArraySize <parts>
        <index> = 0
        begin 
        GetCurrentSkaterProfileIndex
        if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = (<parts> [ <index> ])
            if (<desc_id> = None)
                <retVal> = 0
                break 
            else
                GetActualCASOptionStruct part = (<parts> [ <index> ])desc_id = <desc_id>
                if GotParam no_color
                    <retVal> = 0
                    break 
                else
                    <retVal> = 1
                    break 
                endif
            endif
        endif
        <index> = (<index> + 1)
        repeat <array_size>
    endif
    return is_enabled = <retVal>
endscript


script check_if_sleeve_colorable 
    check_if_part_colorable <...> 
    if (<is_enabled> = 0)
        return is_enabled = <is_enabled>
    endif
    if GotParam parts
        GetArraySize <parts>
        <index> = 0
        begin 
        GetCurrentSkaterProfileIndex
        if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = (<parts> [ <index> ])
            GetActualCASOptionStruct part = (<parts> [ <index> ])desc_id = <desc_id>
            if GotParam multicolor
                <retVal> = <multicolor>
                break 
            else
                <retVal> = 0
                break 
            endif
        endif
        <index> = (<index> + 1)
        repeat <array_size>
    endif
    return is_enabled = <retVal>
endscript

