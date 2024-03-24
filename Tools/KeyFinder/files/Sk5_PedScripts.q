

script ped_walker_hit_dead_end 
    Ped_StopMoving
    PlayAnimWithPartialAnimIfExists anim = Ped_M_LookAtWatch
    Obj_WaitAnimFinished
    Ped_GetCurrentNodeNames
    ped_standing_look_at_skater node_name = <node_to>
    Ped_Utils_GetAnimName type = WalkAnims
    PlayAnimWithPartialAnimIfExists anim = <AnimName> Cycle UseAnimTags
    getsingletag animtags
    if GotParam animtags
        ped_adjust_speed_to_match_anim <animtags>
    endif
    Ped_StartMoving
endscript


script ped_standing_idle 
    getsingletag should_look_at_skater
    getsingletag standing_anims
    if NOT GotParam standing_anims
        Ped_GetGender
        if (<gender> = Female)
            <standing_anims> = Female_goal_wait
        else
            <standing_anims> = generic_ped_anims_wait
        endif
    endif
    begin 
    if GotParam standing_anims
        GetArraySize <standing_anims>
        CreateIndexArray <array_size>
        PermuteArray newarrayname = random_index_array array = <index_array>
        begin 
        if GetNextArrayElement <random_index_array> index = <index>
            if NOT (<should_look_at_skater> = 0)
                ped_standing_look_at_skater
            endif
            ped_standing_play_anim_set (<standing_anims> [ <element> ])
        else
            RemoveParameter index
            break 
        endif
        wait 1 frame
        repeat 
        wait 30 frame
    endif
    repeat 
endscript


script ped_standing_look_at_skater 
    <time_to_rotate> = 1
    gettags
    obj_stoprotating
    if NOT ObjectExists id = skater
        return 
    endif
    if obj_angletonearestskatergreaterthan 15
        if GotParam turning_anims
            if StructureContains structure = <turning_anims> pre_rotate
                <pre_rotate> = (<turning_anims>.pre_rotate)
            endif
            if StructureContains structure = <turning_anims> rotate_anim
                <rotate_anim> = (<turning_anims>.rotate_anim)
            endif
            if StructureContains structure = <turning_anims> post_rotate
                <post_rotate> = (<turning_anims>.post_rotate)
            endif
        endif
        if NOT GotParam rotate_anim
            Ped_Utils_GetAnimName type = TurnAnims
            <rotate_anim> = <AnimName>
        endif
        if GotParam pre_rotate
            PlayAnimWithPartialAnimIfExists anim = <pre_rotate>
            Obj_WaitAnimFinished
        endif
        Obj_LookAtObject type = skater time = <time_to_rotate>
        PlayAnimWithPartialAnimIfExists anim = <rotate_anim>
        wait <time_to_rotate> seconds
        if GotParam post_rotate
            PlayAnimWithPartialAnimIfExists anim = <post_rotate>
            Obj_WaitAnimFinished
        endif
    endif
endscript


script ped_standing_play_anim_set 
    begin 
    if GetNextArrayElement <anims> index = <index>
        if StructureContains structure = <element> ped_speed
            obj_setpathvelocity (<element>.ped_speed)fps
        endif
        if StructureContains structure = <element> Speed
            <Speed> = (<element>.Speed)
        else
            if StructureContains structure = <element> random_speed_high
                if StructureContains structure = <element> random_speed_low
                    getrandomvalue {
                        name = Speed
                        resolution = 0.1000
                        a = (<element>.random_speed_low)
                        b = (<element>.random_speed_high)
                    }
                endif
            endif
        endif
        if StructureContains structure = <element> flip
            Obj_Flip
        endif
        if StructureContains structure = <element> anim
            PlayAnimWithPartialAnimIfExists <element> Speed = <Speed> UseAnimTags
            gettags
            if GotParam animtags
                ped_adjust_speed_to_match_anim <animtags>
            endif
            if StructureContains structure = <element> script_name
                ped_run_script <element>
            endif
        else
            if StructureContains structure = <element> script_name
                ped_run_script <element>
            else
                PlayAnimWithPartialAnimIfExists anim = <element> Speed = <Speed> UseAnimTags
                gettags
                if GotParam animtags
                    ped_adjust_speed_to_match_anim <animtags>
                endif
            endif
        endif
        Obj_WaitAnimFinished
    else
        return 
    endif
    wait 1 frame
    repeat 
endscript


script ped_run_script 
    <script_name> <script_params>
endscript


script ped_adjust_speed_to_match_anim 
    if GotParam MovementSpeed
        obj_setpathvelocity <MovementSpeed> ips
    endif
endscript

