MAX_CREATED_TRICKS = 11
CAT_BLEND = 0.1500
cat_done = 1
demo_flipped_cat_skater = 0
editing_cat = 0
Default_CAT_other_info = { name = '' full = 0 can_spin = 1 is_grind = 0 }
Default_CAT_rotation_info = [
    {
        on = 2
        axis = y
        Deg = 360
        dur = 1.0
        start = 0.0
        deg_dir = 1
    }
    {
        on = 2
        axis = y
        Deg = 360
        dur = 1.0
        start = 0.0
        deg_dir = 1
    }
    {
        on = 2
        axis = y
        Deg = 360
        dur = 1.0
        start = 0.0
        deg_dir = 1
    }
    {
        on = 2
        axis = y
        Deg = 360
        dur = 1.0
        start = 0.0
        deg_dir = 1
    }
    {
        on = 2
        axis = y
        Deg = 360
        dur = 1.0
        start = 0.0
        deg_dir = 1
    }
    {
        on = 2
        axis = y
        Deg = 360
        dur = 1.0
        start = 0.0
        deg_dir = 1
    }
]
Default_CAT_animation_info = [
    {
        on = 2
        Trick = Trick_Indy
        dur = 0.5000
        Blend = CAT_BLEND
        from = 0
        percent = 1
        trickType = 1
        idletime = 0
        start = 0
        order = 1
        hold = 0
        backwards = 0
    }
    {
        on = 2
        Trick = Trick_Indy
        dur = 0.5000
        Blend = CAT_BLEND
        from = 0
        percent = 1
        trickType = 1
        idletime = 0
        start = 0
        order = 2
        hold = 0
        backwards = 0
    }
    {
        on = 2
        Trick = Trick_Indy
        dur = 0.5000
        Blend = CAT_BLEND
        from = 0
        percent = 1
        trickType = 1
        idletime = 0
        start = 0
        order = 3
        hold = 0
        backwards = 0
    }
    {
        on = 2
        Trick = Trick_Indy
        dur = 0.5000
        Blend = CAT_BLEND
        from = 0
        percent = 1
        trickType = 1
        idletime = 0
        start = 0
        order = 4
        hold = 0
        backwards = 0
    }
    {
        on = 2
        Trick = Trick_Indy
        dur = 0.5000
        Blend = CAT_BLEND
        from = 0
        percent = 1
        trickType = 1
        idletime = 0
        start = 0
        order = 5
        hold = 0
        backwards = 0
    }
    {
        on = 2
        Trick = Trick_Indy
        dur = 0.5000
        Blend = CAT_BLEND
        from = 0
        percent = 1
        trickType = 1
        idletime = 0
        start = 0
        order = 6
        hold = 0
        backwards = 0
    }
]

script get_new_cat_values 
    printf \{ 'script get_new_cat_values' }
    name = ''
    full = 1
    can_spin = 1
    is_grind = 0
    rotation_info = (Default_CAT_rotation_info)
    animation_info = (Default_CAT_animation_info)
    return <...> 
endscript

script CreateATrick 
    printf 'CreateATrick'
    obj_getid
    if NOT (<ObjID> = cat_skater)
        if walking
            if Walk_Air
                if NOT IsBoardMissing
                    BeginWalkingGenericTrick
                else
                    return 
                endif
            else
                return 
            endif
        endif
    endif
    GetCurrentSkaterProfileIndex
    change cat_done = 0
    CAT_SetHoldTime 0.0 skater = <currentSkaterProfileIndex>
    CAT_SetAnimsDone 1 skater = <currentSkaterProfileIndex>
    CAT_SetRotsDone 1 skater = <currentSkaterProfileIndex>
    if NOT GotParam demo_loop
        OnExitRun created_trick_cleanup
    endif
    get_CAT_param_values skater = 0 trick_index = <trick_index>
    if GotParam demo_loop
        cat_skater ::obj_setorientation y = 0
    else
        ClearTricksFrom Jumptricks Jumptricks0 Jumptricks
        KillExtraTricks
        if NOT GotParam grind
            if NOT GotParam Manual
                bailon
            endif
        endif
        if GotParam FromGroundGone
            seteventhandler Ex = Ollied scr = TrickOllie
        else
            ClearException Ollied
        endif
        if GotParam grind
            setup_cat_grind name = <name>
        endif
        if GotParam Manual
            setup_cat_manual name = <name>
        endif
    endif
    begin 
    no_rotations = 1
    bailtime = 0
    animtime = 0
    GetArraySize <rotation_info>
    index = 0
    begin 
    if (((<rotation_info> [ <index> ]).on)= 1)
        no_rotations = 0
        CAT_SetRotsDone 0 skater = <currentSkaterProfileIndex>
        break 
    endif
    index = (<index> + 1)
    repeat <array_size>
    if (<can_spin> = 0)
        if NOT GotParam demo_loop
            nospin
        endif
    endif
    index = 0
    if (<no_rotations> = 0)
        begin 
        if (((<rotation_info> [ <index> ]).on)= 1)
            dur = ((<rotation_info> [ <index> ]).dur)
            start = ((<rotation_info> [ <index> ]).start)
            if ((<dur> + <start>)> <bailtime>)
                bailtime = (<dur> + <start>)
                last_rot = <index>
            endif
        endif
        index = (<index> + 1)
        repeat <array_size>
        index = 0
        begin 
        if (((<rotation_info> [ <index> ]).on)= 1)
            dur = ((<rotation_info> [ <index> ]).dur)
            start = ((<rotation_info> [ <index> ]).start)
            if (<index> = <last_rot>)
                last = 1
            endif
            spawn_rotation_script {axis = ((<rotation_info> [ <index> ]).axis)
                Deg = ((<rotation_info> [ <index> ]).Deg)
                dur = ((<rotation_info> [ <index> ]).dur)
                start = ((<rotation_info> [ <index> ]).start)
                off_x = ((<rotation_info> [ <index> ]).off_x)
                off_y = ((<rotation_info> [ <index> ]).off_y)
                off_z = ((<rotation_info> [ <index> ]).off_z)
                deg_dir = ((<rotation_info> [ <index> ]).deg_dir)
                last = <last>
                demo_loop = <demo_loop>
            }
        endif
        RemoveParameter last
        index = (<index> + 1)
        repeat <array_size>
    endif
    GetArraySize <animation_info>
    index = 0
    CAT_SetNumAnims 0 skater = <currentSkaterProfileIndex>
    begin 
    if (((<animation_info> [ <index> ]).on)= 1)
        GetCurrentSkaterProfileIndex
        CAT_GetNumAnims skater = <currentSkaterProfileIndex>
        CAT_SetNumAnims (<num_animations_on> + 1)skater = <currentSkaterProfileIndex>
    endif
    index = (<index> + 1)
    repeat <array_size>
    count = 1
    anim_order = [0 , 0 , 0 , 0 , 0 , 0]
    begin 
    index = 0
    begin 
    if (((<animation_info> [ <index> ]).order)= <count>)
        SetArrayElement arrayName = anim_order index = (<count> -1)newValue = <index>
        break 
    endif
    index = (<index> + 1)
    repeat <array_size>
    count = (<count> + 1)
    repeat <array_size>
    GetCurrentSkaterProfileIndex
    CAT_GetNumAnims skater = <currentSkaterProfileIndex>
    if (<num_animations_on> > 0)
        CAT_SetAnimsDone 0 skater = <currentSkaterProfileIndex>
        obj_spawnscriptlater spawned_trick_anim params = {animation_info = <animation_info>
            array_size = <array_size>
            anim_order = <anim_order>
            demo_loop = <demo_loop>
        }
    endif
    index = 0
    begin 
    if (((<animation_info> [ <index> ]).on)= 1)
        if NOT (((<animation_info> [ <index> ]).trickType)= 4)
            trick_got_idle Trick = ((<animation_info> [ <index> ]).Trick)
            if (<got_idle> = 1)
                animtime = (<animtime> + ((<animation_info> [ <index> ]).dur)+ ((<animation_info> [ <index> ]).idletime)+ ((<animation_info> [ <index> ]).start))
            else
                animtime = (<animtime> + ((<animation_info> [ <index> ]).dur)+ ((<animation_info> [ <index> ]).start))
            endif
        endif
    endif
    index = (<index> + 1)
    repeat <array_size>
    if (<animtime> > <bailtime>)
        bailtime = <animtime>
    endif
    CAT_SetBailDone 0 skater = <currentSkaterProfileIndex>
    obj_spawnscriptlater waitforbailoff params = { time = <bailtime> }
    if NOT GotParam demo_loop
        if NOT GotParam grind
            if NOT GotParam Manual
                obj_spawnscriptlater cat_update_trick_string params = {name = <name> bailtime = <bailtime> can_spin = <can_spin> is_grind = <is_grind>}
            endif
        endif
    endif
    begin 
    if GotParam FromGroundGone
        if airtimegreaterthan Skater_Late_Jump_Slop
            ClearException Ollied
            RemoveParameter FromGroundGone
        endif
    endif
    CAT_GetBailDone skater = <currentSkaterProfileIndex>
    if (<bailtimescriptdone> = 1)
        break 
    endif
    wait 1 gameframe
    repeat 
    if GotParam FromGroundGone
        ClearException Ollied
    endif
    if NOT GotParam demo_loop
        bailoff
        canspin
        DoNextTrick
    endif
    begin 
    CAT_GetAnimsDone skater = <currentSkaterProfileIndex>
    if (<cat_animations_done> = 1)
        break 
    endif
    wait 1 gameframe
    repeat 
    begin 
    CAT_GetRotsDone skater = <currentSkaterProfileIndex>
    if (<cat_rotations_done> = 1)
        break 
    endif
    wait 1 gameframe
    repeat 
    printf 'FINISHED CREATEATRICK'
    change cat_done = 1
    if GotParam demo_loop
        if (demo_flipped_cat_skater = 1)
            Obj_Flip
            change demo_flipped_cat_skater = 0
        endif
        return 
    endif
    if NOT GotParam grind
        if NOT GotParam Manual
            goto Airborne
        endif
    endif
    repeat 
endscript

script spawn_rotation_script axis = x
    GetCurrentSkaterProfileIndex
    CAT_SetTotalY 0 skater = <currentSkaterProfileIndex>
    CAT_SetTotalX 0 skater = <currentSkaterProfileIndex>
    CAT_SetTotalZ 0 skater = <currentSkaterProfileIndex>
    if (<axis> = x)
        obj_spawnscriptlater RotateOnAxis pausewithobject params = {axis = <axis>
            dur = <dur>
            start_val = <start>
            startangle = 0
            endangle = <Deg>
            off_x = <off_x>
            off_y = <off_y>
            off_z = <off_z>
            last = <last>
            deg_dir = <deg_dir>
            demo_loop = <demo_loop>
        }
    else
        startangle = 0
        endangle = <Deg>
        if NOT GotParam demo_loop
            if Flipped
                endangle = (-1 * <Deg>)
            endif
        endif
        obj_spawnscriptlater RotateOnAxis pausewithobject params = {axis = <axis>
            dur = <dur>
            start_val = <start>
            startangle = <startangle>
            endangle = <endangle>
            off_x = <off_x>
            off_y = <off_y>
            off_z = <off_z>
            last = <last>
            deg_dir = <deg_dir>
            demo_loop = <demo_loop>
        }
    endif
endscript

script RotateOnAxis {off_x = 0 off_y = 30 off_z = 0 axis = x}
    GetCurrentSkaterProfileIndex
    if GotParam start_val
        wait <start_val> seconds
    endif
    rotationoffset = (((1.0, 0.0, 0.0) * <off_x>)+ ((0.0, 1.0, 0.0) * <off_y>)+ ((0.0, 0.0, 1.0) * <off_z>))
    if (<deg_dir> = 1)
        endangle = (<endangle> * -1)
    endif
    if GotParam demo_loop
        dontpause = dontpause
    endif
    rotatedisplay {<axis>
        duration = <dur> seconds
        endangle = <endangle>
        sinepower = 1
        rotationoffset = <rotationoffset>
        holdonlastangle
        <dontpause>
    }
    CAT_GetTotalX skater = <currentSkaterProfileIndex>
    CAT_GetTotalY skater = <currentSkaterProfileIndex>
    CAT_GetTotalZ skater = <currentSkaterProfileIndex>
    switch <axis>
        case x
        total_X_angle = (<total_X_angle> + <endangle>)
        CAT_SetTotalX <total_X_angle> skater = <currentSkaterProfileIndex>
        case y
        total_Y_angle = (<total_Y_angle> + <endangle>)
        CAT_SetTotalY <total_Y_angle> skater = <currentSkaterProfileIndex>
        case z
        total_Z_angle = (<total_Z_angle> + <endangle>)
        CAT_SetTotalZ <total_Z_angle> skater = <currentSkaterProfileIndex>
        default 
        printf 'CAT: Bad Axis value'
        return 
    endswitch
    mod_x = (<total_X_angle> - (<total_X_angle> / 360)* 360)
    mod_y = (<total_Y_angle> - (<total_Y_angle> / 360)* 360)
    mod_z = (<total_Z_angle> - (<total_Z_angle> / 360)* 360)
    if NOT (<mod_y> = 0)
        flip_skater = 1
    else
        flip_skater = 0
    endif
    if NOT (<mod_x> = 0)
        if NOT (<mod_z> = 0)
            if (<flip_skater> = 1)
                flip_skater = 0
            else
                flip_skater = 1
            endif
        endif
    endif
    if (<flip_skater> = 1)
        CAT_SetFlipSkater 1 skater = <currentSkaterProfileIndex>
    else
        CAT_SetFlipSkater 0 skater = <currentSkaterProfileIndex>
    endif
    if GotParam last
        wait <dur> seconds
        if NOT GotParam demo_loop
            if (<flip_skater> = 1)
                CAT_SetFlipSkater 0 skater = <currentSkaterProfileIndex>
                rotate y = 180
            endif
            cancelrotatedisplay
        endif
        CAT_SetRotsDone 1 skater = <currentSkaterProfileIndex>
    endif
endscript

script spawned_trick_anim 
    index = 0
    tweak_grab = 99
    anims_played_this_trick = 0
    have_played_real_anim = 0
    GetCurrentSkaterProfileIndex
    begin 
    if (((<animation_info> [ <index> ]).on)= 1)
        if (((<animation_info> [ <index> ]).hold)= 1)
            tweak_grab = <index>
        endif
    endif
    index = (<index> + 1)
    repeat <array_size>
    index = 0
    count = 0
    begin 
    index = (<anim_order> [ <count> ])
    if (((<animation_info> [ <index> ]).on)= 1)
        Blend = ((<animation_info> [ <index> ]).Blend)
        from = ((<animation_info> [ <index> ]).from)
        dur = ((<animation_info> [ <index> ]).dur)
        start = ((<animation_info> [ <index> ]).start)
        trickType = ((<animation_info> [ <index> ]).trickType)
        Trick = ((<animation_info> [ <index> ]).Trick)
        idletime = ((<animation_info> [ <index> ]).idletime)
        <backwards> = ((<animation_info> [ <index> ]).backwards)
        trick_got_idle Trick = <Trick>
        if NOT IsArray <Trick>
            specialitem_details = (<Trick>.params.specialitem_details)
            SpecialSounds = (<Trick>.params.SpecialSounds)
            stream = (<Trick>.params.stream)
        else
            specialitem_details = ((<Trick> [ 0 ]).params.specialitem_details)
            SpecialSounds = ((<Trick> [ 0 ]).params.SpecialSounds)
            stream = ((<Trick> [ 0 ]).params.stream)
        endif
        TurnOffSpecialItem
        if (<trickType> = 4)
            if NOT GotParam demo_loop
                obj_spawnscriptlater spawned_cat_sound_script params = {start = <start> stream = <stream>}
            endif
            anims_played_this_trick = (<anims_played_this_trick> + 1)
            GetCurrentSkaterProfileIndex
            CAT_GetNumAnims skater = <currentSkaterProfileIndex>
            printf '	played %p / %o anims' p = <anims_played_this_trick> o = <num_animations_on>
            if (<anims_played_this_trick> = <num_animations_on>)
                obj_spawnscriptlater are_cat_anims_done params = {no_wait flip_skater = <flip_skater> demo_loop = <demo_loop>}
                return 
            endif
        else
            if (<got_idle> = 1)
                if NOT IsArray <Trick>
                    anim = (<Trick>.params.anim)
                    idle = (<Trick>.params.idle)
                    if StructureContains structure = (<Trick>.params)OutAnim
                        OutAnim = (<Trick>.params.OutAnim)
                    endif
                else
                    anim = ((<Trick> [ 0 ]).params.anim)
                    idle = ((<Trick> [ 0 ]).params.idle)
                    if StructureContains structure = ((<Trick> [ 0 ]).params)OutAnim
                        OutAnim = ((<Trick> [ 0 ]).params.OutAnim)
                    endif
                endif
                if GotParam OutAnim
                    GetAnimLength anim = <OutAnim>
                    out_length = <Length>
                endif
                GetAnimLength anim = <anim>
                if NOT GotParam out_length
                    out_length = <Length>
                endif
                total_length = (<Length> + <out_length>)
                percent = ((<animation_info> [ <index> ]).percent)
                if (<percent> > 1)
                    percent = 1
                endif
                from_seconds = <from>
                to_seconds = <percent>
                in_ratio = (<Length> / <total_length>)
                out_ratio = (1.0 - <in_ratio>)
                if ((<in_ratio> = 0)|| (<out_ratio> = 0))
                    printf 'CAT: bad ratio'
                    return 
                endif
                Speed = ((<Length> * (1.0 - <from>))/ (<in_ratio> * <dur>))
                speed2 = ((<out_length> * <percent>)/ (<out_ratio> * <dur>))
                if (0 > <to_seconds>)
                    to_seconds = 0
                endif
                blend_seconds = (<Blend> * <Speed>)
                if NOT (<start> = 0)
                    wait <start> seconds
                endif
                if GotParam specialitem_details
                    printf 'I have a special item'
                    TurnOnSpecialItem specialitem_details = <specialitem_details>
                endif
                if NOT GotParam demo_loop
                    if GotParam SpecialSounds
                        obj_spawnscriptlater <SpecialSounds>
                    endif
                    if GotParam stream
                        obj_playstream <stream> vol = 250
                    endif
                endif
                if NOT (<Speed> = 0)
                    if NOT (<have_played_real_anim> = 0)
                        Skater_Playanim {anim = <anim> Speed = <Speed> from = <from_seconds>}
                    else
                        Skater_Playanim {anim = <anim> Speed = <Speed> from = <from_seconds> blendperiodpercent = 0}
                    endif
                endif
                if NOT IsArray <Trick>
                    out_params = (<Trick>.params)
                else
                    out_params = ((<Trick> [ 0 ]).params)
                endif
                if NOT (<Speed> = 0)
                    Skater_WaitAnimFinished
                endif
                if NOT (<idletime> = 0)
                    Skater_Playanim anim = <idle> Cycle xblendperiodpercent = 0
                    wait <idletime> seconds
                    if (<index> = <tweak_grab>)
                        if NOT GotParam demo_loop
                            begin 
                            if Released Circle
                                if Released square
                                    break 
                                endif
                            endif
                            CAT_GetHoldTime skater = <currentSkaterProfileIndex>
                            CAT_SetHoldTime (<cat_hold_time> + (1.0 / 60.0))skater = <currentSkaterProfileIndex>
                            WaitOneGameFrame
                            tweaktrick GRABTWEAK_MEDIUM
                            repeat 
                            CAT_GetHoldTime skater = <currentSkaterProfileIndex>
                            printf '	cat_hold_time = %c' c = <cat_hold_time>
                        endif
                    endif
                endif
                CATReleased_SquareOrCircle <out_params> Speed = <speed2> to = <to_seconds> Blend = (100 * <Blend>)
            else
                if NOT IsArray <Trick>
                    anim = (<Trick>.params.anim)
                else
                    anim = ((<Trick> [ 0 ]).params.anim)
                endif
                if NOT GotParam anim
                    if StructureContains structure = (<Trick>.params)InitAnim
                        anim = (<Trick>.params.InitAnim)
                    else
                        printf 'back trick... no anim'
                        return 
                    endif
                endif
                percent = ((<animation_info> [ <index> ]).percent)
                if (<percent> > 1)
                    percent = 1
                endif
                GetAnimLength anim = <anim>
                from_seconds = <from>
                to_seconds = <percent>
                total_percent = (<percent> - <from>)
                if NOT (<dur> = 0)
                    Speed = (((<Length> * <total_percent>))/ <dur>)
                else
                    Speed = 1
                endif
                if (0 > <Speed>)
                    Speed = (<Speed> * -1)
                endif
                if (<backwards> = 0)
                    RemoveParameter backwards
                endif
                if NOT (<start> = 0)
                    wait <start> seconds
                endif
                if GotParam specialitem_details
                    printf 'I have a special item'
                    TurnOnSpecialItem specialitem_details = <specialitem_details>
                endif
                if NOT GotParam demo_loop
                    if GotParam SpecialSounds
                        obj_spawnscriptlater <SpecialSounds>
                    endif
                    if GotParam stream
                        obj_playstream <stream> vol = 250
                    endif
                endif
                if (<have_played_real_anim> = 0)
                    blendperiodpercent = 0
                else
                    blendperiodpercent = (<Blend> * 100)
                endif
                if NOT (<Speed> = 0)
                    Skater_Playanim {anim = <anim> Speed = <Speed> blendperiodpercent = <blendperiodpercent> from = <from_seconds> to = <to_seconds> backwards = <backwards>}
                endif
            endif
            if IsArray <Trick>
                trick_params = ((<Trick> [ 0 ]).params)
            else
                trick_params = (<Trick>.params)
            endif
            if StructureContains boardrotate structure = <trick_params>
                BlendperiodOut 0
                if NOT GotParam demo_loop
                    BoardRotateAfter
                endif
            endif
            if StructureContains RotateAfter structure = <trick_params>
                printf 'skater should flip'
                BlendperiodOut 0
                flip_skater = 1
            endif
            if StructureContains FlipAfter structure = <trick_params>
                BlendperiodOut 0
                if NOT GotParam demo_loop
                    flip
                else
                    Obj_Flip
                    if (demo_flipped_cat_skater = 0)
                        change demo_flipped_cat_skater = 1
                    else
                        change demo_flipped_cat_skater = 0
                    endif
                endif
            endif
            anims_played_this_trick = (<anims_played_this_trick> + 1)
            have_played_real_anim = 1
            GetCurrentSkaterProfileIndex
            CAT_GetNumAnims skater = <currentSkaterProfileIndex>
            printf '	played %p / %o anims' p = <anims_played_this_trick> o = <num_animations_on>
            if NOT (<anims_played_this_trick> = <num_animations_on>)
                if NOT GotParam speed2
                    if NOT (<Speed> = 0)
                        Skater_WaitAnimFinished
                    endif
                else
                    if NOT (<speed2> = 0)
                        Skater_WaitAnimFinished
                    endif
                endif
                if GotParam flip_skater
                    if NOT GotParam demo_loop
                        rotate y = 180
                    else
                        obj_setorientation y = 180
                    endif
                    RemoveParameter flip_skater
                endif
            endif
        endif
    endif
    RemoveParameter anim
    RemoveParameter OutAnim
    RemoveParameter out_length
    RemoveParameter in_ratio
    RemoveParameter out_ratio
    RemoveParameter percent
    RemoveParameter speed2
    RemoveParameter specialitem_details
    RemoveParameter SpecialSounds
    RemoveParameter stream
    count = (<count> + 1)
    repeat <array_size>
    obj_spawnscriptlater are_cat_anims_done params = {flip_skater = <flip_skater> demo_loop = <demo_loop>}
    printf '	finished CAT anim'
endscript

script are_cat_anims_done 
    if NOT GotParam \{ no_wait }
        Skater_WaitAnimFinished
    endif
    TurnOffSpecialItem
    if GotParam \{ flip_skater }
        if NOT GotParam \{ demo_loop }
            rotate \{ y = 180 }
        else
        endif
    endif
    GetCurrentSkaterProfileIndex
    CAT_SetAnimsDone 1 skater = <currentSkaterProfileIndex>
endscript

script trick_got_idle 
    if IsArray <Trick>
        if StructureContains structure = (<Trick> [ 0 ])params
            if StructureContains structure = ((<Trick> [ 0 ]).params)idle
                got_idle = 1
            else
                got_idle = 0
            endif
        else
            printstruct <...> 
            script_assert text = 'Parametr tick_got_idle uszed³ za trik pozbawiony globalnej struktury'
        endif
    else
        if StructureContains structure = <Trick> params
            if StructureContains structure = (<Trick>.params)idle
                got_idle = 1
            else
                got_idle = 0
            endif
        else
            printstruct <...> 
            script_assert text = 'Parametr tick_got_idle uszed³ za trik pozbawiony globalnej struktury'
        endif
    endif
    return got_idle = <got_idle>
endscript

script CATReleased_SquareOrCircle from = 0
    printf '		script CATReleased_SquareOrCircle'
    if (<Speed> = 0)
        return 
    endif
    if GotParam OutAnim
        printf '			OutAnim'
        Skater_Playanim anim = <OutAnim> blendperiodpercent = <Blend> Speed = <Speed> from = <from> to = <to>
    else
        if GotParam BackwardsAnim
            printf '			BackwardsAnim'
            Skater_Playanim anim = <BackwardsAnim> backwards blendperiodpercent = <Blend> Speed = <Speed> from = <from> to = <to>
        else
            if Skater_AnimEquals AirWalk
                printf '			Airwalk'
                Skater_Playanim anim = <anim> from = current to = 0 blendperiodpercent = <Blend> Speed = <Speed>
            else
                printf '			Other'
                Skater_Playanim anim = <anim> backwards Speed = <Speed> from = <from> to = <to> blendperiodpercent = <Blend>
            endif
        endif
    endif
endscript

script spawned_cat_sound_script 
    if NOT (<start> = 0)
        wait <start> seconds
    endif
    if GotParam \{ stream }
        obj_playstream <stream> vol = 250
    endif
endscript

script waitforbailoff 
    time_passed = 0.0
    bail_point = (<time> * 0.2000)
    time = (<time> - <bail_point>)
    GetCurrentSkaterProfileIndex
    CAT_GetHoldTime skater = <currentSkaterProfileIndex>
    printf '	cat_hold_time=%c time=%t bail_point=%b' c = <cat_hold_time> t = <time> b = <bail_point>
    begin 
    if ((<time_passed> > (<time> + <cat_hold_time>))|| (<time_passed> = (<time> + <cat_hold_time>)))
        break 
    endif
    WaitOneGameFrame
    skater ::getframelength
    time_passed = (<time_passed> + <frame_length>)
    CAT_GetHoldTime skater = <currentSkaterProfileIndex>
    repeat 
    printf '	time_passed = %t' t = <time_passed>
    CAT_SetBailDone 1 skater = <currentSkaterProfileIndex>
endscript

script cat_update_trick_string 
    if (<name> = '')
        name = 'Stworzony trik'
    endif
    SetTrickName <name>
    if (<is_grind> = 0)
        cat_get_score_from_bailtime bailtime = <bailtime> can_spin = <can_spin> is_grind = <is_grind>
    else
        Score = SPECIALGRIND_SCORE
    endif
    SetTrickScore <Score>
    display \{ CAT }
    LaunchSpecialMessage
endscript

script created_trick_cleanup 
    KillSpawnedScript name = CreateATrick
    change cat_done = 1
    KillSpawnedScript name = RotateOnAxis
    KillSpawnedScript name = spawned_trick_anim
    KillSpawnedScript name = spawned_cat_sound_script
    KillSpawnedScript name = waitforbailoff
    KillSpawnedScript name = cat_update_trick_string
    cancelrotatedisplay
    CAT_GetFlipSkater skater = <currentSkaterProfileIndex>
    if (<cat_flip_skater_180> = 1)
        CAT_SetFlipSkater 0 skater = <currentSkaterProfileIndex>
        rotate y = 180
    endif
    TurnOffSpecialItem
    canspin
    if ScreenElementExists id = timeline_anchor
        DestroyScreenElement id = timeline_anchor
    endif
endscript

script setup_cat_grind 
    if bailison
        setstate Air
        goto DoingTrickBail
    endif
    if backwards
        FlipAndRotate
        boardrotate
        Skater_Playanim anim = AirIdle BlendPeriod = 0
    endif
    LaunchStateChangeEvent state = Skater_OnRail
    obj_clearflag FLAG_SKATER_MANUALCHEESE
    obj_clearflag FLAG_SKATER_REVERTCHEESE
    vibrate actuator = 1 percent = 50 duration = 0.2500
    vibrate actuator = 0 percent = 50
    ClearExceptions
    SetException Ex = Ollied scr = ollie
    nollieoff
    pressureoff
    SetException Ex = OffRail scr = OffRail params = {KissedRail InitAnim = <InitAnim> InitSpeed = <InitSpeed> OutAnim = <OutAnim> boardrotate = <boardrotate> OutAnimBackwards = <OutAnimBackwards>}
    SetException Ex = Landed scr = Grind_to_Land
    SetException Ex = OffMeterTop scr = SkateInOrBail params = { <...> FallingLeft }
    SetException Ex = OffMeterBottom scr = SkateInOrBail params = { <...> FallingRight }
    SetException Ex = SkaterCollideBail scr = SkaterCollideBail
    seteventhandler Ex = MadeOtherSkaterBail scr = MadeOtherSkaterBail_Called
    OnExceptionRun Grind_Kissed
    ClearTrickQueue
    ClearManualTrick
    ClearExtraGrindTrick
    SetQueueTricks NoTricks
    SetManualTricks NoTricks
    setrailsound grind
    LaunchExtraMessage
    dobalancetrick ButtonA = RIGHT ButtonB = left type = grind DoFlipCheck
    getsingletag AcidDropCheese
    if GotParam AcidDropCheese
        if (<AcidDropCheese> > 0)
            printf 'ACID DROP CHEESE ================== %i' i = <AcidDropCheese>
            adjustbalance TimeAdd = 0 SpeedMult = 2 LeanMult = 3.200
            removetags tags = [ AcidDropCheese ]
        endif
    endif
    SetExtraTricks GrindRelease
    LaunchSpecialMessage text = 'Special Grind'
    SetException Ex = OffRail scr = OffRail params = {dont_wait = dont_wait InitAnim = <InitAnim> InitSpeed = <InitSpeed> OutAnim = <OutAnim> boardrotate = <boardrotate> OutAnimBackwards = <OutAnimBackwards>}
    if (<name> = '')
        name = 'Stworzony trik'
    endif
    setgrindtweak 36
    SetTrickName <name>
    SetTrickScore SPECIALGRIND_SCORE
    display CAT Blockspin NoSpecial
endscript

script setup_cat_manual 
    ClearExceptions
    if backwards
        FlipAndRotate
        boardrotate
        Skater_Playanim anim = AirIdle BlendPeriod = 0
    endif
    SetException Ex = Ollied scr = ollie
    SetException Ex = OffMeterTop scr = ManualBail params = { <...>  }
    SetException Ex = OffMeterBottom scr = ManualLand params = { <...>  }
    LaunchStateChangeEvent state = Skater_InManual
    ClearTrickQueue
    SetQueueTricks SkateToWalkTricks
    broadcastevent type = SkaterEnterSpecialTrick
    SetManualTricks NoTricks
    if NOT IsNGC
        vibrate actuator = 1 percent = 25
        OnExitRun KillManualVibration
    endif
    setrollingfriction default
    dobalancetrick ButtonA = up ButtonB = down type = Manual Tweak = 5
    LaunchSpecialMessage text = 'Specjalny manual'
    if (<name> = '')
        name = 'Stworzony trik'
    endif
    SetTrickName <name>
    SetTrickScore SPECIALGRIND_SCORE
    display CAT Blockspin
    if obj_flagset FLAG_SKATER_MANUALCHEESE
        GetManualCheese
        ManualCheese = (<ManualCheese> + 1)
        settags ManualCheese = <ManualCheese>
        printf '::::::::::::::::::::Cheese= %c' c = <ManualCheese>
        if (<ManualCheese> > 1)
            adjustbalance TimeAdd = 2 SpeedMult = 2 LeanMult = 1.200
        endif
    else
        obj_setflag FLAG_SKATER_MANUALCHEESE
        settags ManualCheese = 0
    endif
endscript

script set_new_rot_values \{ trick_index = 0 }
    printf \{ 'script set_new_rot_values' }
    GetCreateATrickRotations skater = 0 trick_index = <trick_index>
    SetArrayElement arrayName = rotation_info index = <rot_index> newValue = {on = <on> Deg = <Deg> axis = <axis> dur = <dur> start = <start> deg_dir = <deg_dir>}
    SetCreateATrickRotations {trick_index = <trick_index>
        rotation_info = <rotation_info>
    }
endscript

script quick_set_anim_values 
    set_new_anim_values {anim_index = <anim_index> on = <on> Trick = <Trick> anim = <anim> dur = <dur> percent = <percent> Blend = <Blend> from = <from> trickType = <trickType> idletime = <idletime> start = <start> order = <order> hold = <hold> backwards = <backwards>}
endscript

script set_new_anim_values trick_index = 0
    printf 'script set_new_anim_values'
    GetCreateATrickAnimations trick_index = <trick_index>
    SetArrayElement arrayName = animation_info index = <anim_index> newValue = {on = <on> Trick = <Trick> dur = <dur> percent = <percent> Blend = <Blend> from = <from> trickType = <trickType> idletime = <idletime> start = <start> order = <order> hold = <hold> backwards = <backwards>}
    SetCreateATrickAnimations {
        trick_index = <trick_index>
        animation_info = <animation_info>
    }
endscript

script set_new_CAT_param_values 
    printf \{ 'script set_new_CAT_param_values' }
    other_params = {name = <name> can_spin = <can_spin> full = <full> is_grind = <is_grind>}
    SetCreateATrickOtherParams {trick_index = <trick_index>
        other_params = <other_params>
    }
endscript

script get_CAT_param_values \{ trick_index = 0 }
    printf \{ 'script get_CAT_param_values' }
    if GetCreateATrickParams { trick_index = <trick_index> }
        name = (<other_params>.name)
        can_spin = (<other_params>.can_spin)
        full = (<other_params>.full)
        is_grind = (<other_params>.is_grind)
        return <...> 
    endif
endscript

script get_CAT_rot_values \{ trick_index = 0 rot_index = 0 }
    printf \{ 'script get_CAT_rot_values' }
    if GetCreateATrickRotations { trick_index = <trick_index> }
        return (<rotation_info> [ <rot_index> ])
    endif
endscript

script get_CAT_anim_values \{ trick_index = 0 anim_index = 0 }
    printf \{ 'script get_CAT_anim_values' }
    if GetCreateATrickAnimations { trick_index = <trick_index> }
        return (<animation_info> [ <anim_index> ])
    endif
endscript

script get_CAT_other_param_values 
    printf \{ 'script get_CAT_other_param_values' }
    if GetCreateATrickOtherParams { trick_index = <trick_index> }
        name = (<other_params>.name)
        can_spin = (<other_params>.can_spin)
        full = (<other_params>.full)
        is_grind = (<other_params>.is_grind)
        return <...> 
    endif
endscript

script print_out_cat \{ index = 0 }
    get_CAT_param_values trick_index = <index>
    printstruct <...> 
endscript

script cat_get_score_from_bailtime 
    if (<bailtime> > 1.500)
        Score = ((1333 * (<bailtime> -1.500))+ 6000)
    else
        if (<bailtime> > 0.4000)
            Score = ((5880 * (<bailtime> -0.5000)* (<bailtime> -0.5000))+ 120)
        else
            if (<bailtime> > 0.3000)
                Score = 100
            else
                Score = 0
            endif
        endif
    endif
    if ((0 > <Score>)|| (<Score> = 0))
        Score = 0
    else
        if (<can_spin> = 1)
            if (<bailtime> > 1.500)
                Score = (<Score> / 4)
            else
                if (<bailtime> > 0.4000)
                    Score = (<Score> / (2.500 * (<bailtime> -0.5000)+ 1.500))
                else
                    Score = 70
                endif
            endif
        endif
        CastToInteger Score
        mymod = (<Score> - (<Score> / 10)* 10)
        if NOT (<mymod> = 0)
            Score = (<Score> + (10 - <mymod>))
        endif
    endif
    if (<Score> > 8000)
        Score = 8000
    endif
    return Score = <Score>
endscript

script cat_launch_bo 
    change_gamemode_cat
    if ScreenElementExists \{ id = current_menu_anchor }
        DestroyScreenElement \{ id = current_menu_anchor }
    endif
    StopKeyboardHandler
    SpawnScriptLater \{noqbid change_level params = { level = Load_Z_HO }}
endscript
cat_pak_is_loaded = 0

script cat_load_pak 
    if (cat_pak_is_loaded = 0)
        change dont_create_speech_boxes = 1
        if AreNodeFlagsLocked
            node_flag_lock = 1
            SetNodeFlagLock Off
        endif
        ChangeNodeFlag NODEFLAG_CAT_NODES 0
        if GotParam node_flag_lock
            SetNodeFlagLock
        endif
        printf 'Loading CAT Pak file.....................................'
        LoadPak 'pak/cat_assets/cat_assets.pak' localized
        change cat_pak_is_loaded = 1
    endif
endscript

script cat_unload_pak 
    if (cat_pak_is_loaded = 1)
        change dont_create_speech_boxes = 0
        if AreNodeFlagsLocked
            node_flag_lock = 1
            SetNodeFlagLock Off
        endif
        ChangeNodeFlag NODEFLAG_CAT_NODES 1
        if GotParam node_flag_lock
            SetNodeFlagLock
        endif
        if NOT InFrontend
            if NOT IsTrue is_changing_levels
                GetCurrentZoneName
                goal_add_poi_floaters zone = <zone_name>
            endif
        endif
        printf 'Unloading CAT Pak file.....................................'
        BeginUnloadPak 'pak/cat_assets/cat_assets.pak' localized
        wait 2 frames
        EndUnloadPak 'pak/cat_assets/cat_assets.pak' localized
        change cat_pak_is_loaded = 0
    endif
endscript

script cat_unload_and_exit_pause 
    pause_menu_gradient Off
    exit_pause_menu
    kill_blur start = 0
    show_compass_anchor
    if GotParam trick_button_text
        PauseSkaters
        GoalManager_HidePedFloaters
        <button_text> = ['wietnie!' '£oo Hoo!' 'Cz³owiek Rozwa³ka!' 'Tak, maleñka!' 'S³odko!' 'Niele!' 'Gnarly!' 'Tajest!' 'Booyah!']
        GetArraySize button_text
        getrandomvalue name = button_text_index a = 0 b = (<array_size> - 1)integer
        create_snazzy_dialog_box {
            Title = 'Stworzony trik specjalny'
            text = <trick_button_text>
            text_dims = (400.0, 0.0)
            pad_back_script = null_script
            no_bg
            buttons = [
                {
                    text = (<button_text> [ <button_text_index> ])
                    pad_choose_script = cat_new_trick_box_exit
                }
            ]
        }
    else
        cat_unload_pak
    endif
endscript

script cat_new_trick_box_exit 
    Debounce \{ Circle time = 0.3000 }
    dialog_box_exit
    cat_unload_pak
    GoalManager_UnHidePedFloaters
    UnpauseSkaters
    cat_post_exit_next_dialog
endscript

script cat_post_exit_next_dialog 
    if ScreenElementExists id = root_window
        root_window ::gettags
        if GotParam next_dialog_text
            if NOT (<next_dialog_text> = '')
                SetScreenElementProps {
                    id = root_window
                    tags = { next_dialog_text = '' }
                }
                PauseSkaters
                GoalManager_HidePedFloaters
                create_snazzy_dialog_box {
                    Title = 'Wykonaj nowy trik'
                    text = <next_dialog_text>
                    text_dims = (400.0, 0.0)
                    pad_back_script = null_script
                    no_bg
                    buttons = [
                        {
                            text = 'OK'
                            pad_choose_script = cat_post_exit_next_dialog_exit
                        }
                    ]
                }
            endif
        endif
    endif
endscript

script cat_post_exit_next_dialog_exit 
    Debounce \{ Circle time = 0.3000 }
    dialog_box_exit
    GoalManager_UnHidePedFloaters
    UnpauseSkaters
endscript

script cat_exit_cleanup 
    change \{ in_cat_preview_mode = 0 }
    if GotParam \{ to_main_menu }
        if ObjectExists \{ id = current_menu_anchor }
            DestroyScreenElement \{ id = current_menu_anchor }
        endif
        if OnXbox
            DisplayLoadingScreen \{ 'loadscrn_generic' 17 }
        else
            create_big_black_hiding_box
        endif
        cat_unload_pak
        quit_network_game
    else
        if ScreenElementExists \{ id = current_menu_anchor }
            DestroyScreenElement \{ id = current_menu_anchor }
        endif
        spawnscriptnow noqbid cat_unload_and_exit_pause params = { trick_button_text = <trick_button_text> }
    endif
endscript

script spawn_add_premade_cats_to_skater 
    SpawnScriptLater \{add_premade_cats_to_skater params = {}}
endscript

script kill_load_premade_cats 
    KillSpawnedScript \{ name = add_premade_cats_to_skater }
endscript

script add_premade_cats_to_skater 
    load_default_premade_cat \{ index = 0 save_slot = 1 }
    load_default_premade_cat \{ index = 1 save_slot = 2 }
    load_default_premade_cat \{ index = 2 save_slot = 3 }
    load_default_premade_cat \{ index = 3 save_slot = 4 }
endscript

script load_default_premade_cat 
    printf 'load_default_premade_cat'
    if NOT GotParam index
        printf 'CAT: missing index param'
        return 
    endif
    if NOT GotParam save_slot
        printf 'CAT: missing save_slot param'
        return 
    endif
    SetCreateATrickParams {skater = 0
        trick_index = <save_slot>
        other_params = {name = ((Premade_CATS [ <index> ]).name)
            can_spin = ((Premade_CATS [ <index> ]).can_spin)
            is_grind = ((Premade_CATS [ <index> ]).is_grind)
            full = 1
        }
        rotation_info = ((Premade_CATS [ <index> ]).rotation_info)
        animation_info = ((Premade_CATS [ <index> ]).animation_info)
    }
endscript

script assign_cat_to_slot 
    if NOT GotParam save_slot
        printf 'CAT: missing save_slot param'
        return 
    endif
    get_CAT_param_values trick_index = 0
    SetCreateATrickParams {skater = 0
        trick_index = <save_slot>
        other_params = {name = <name>
            RotateAfter = <RotateAfter>
            can_spin = <can_spin>
            is_grind = <is_grind>
            full = 1
        }
        rotation_info = <rotation_info>
        animation_info = <animation_info>
    }
    if (loading_cat_from_edit_tricks = 1)
        create_edit_tricks_menu
    else
        back_to_options_menu_from_cat slot = <save_slot>
    endif
endscript

script auto_assign_cat_to_slot 
    if (editing_cat = 0)
        index = 1
        begin 
        get_CAT_other_param_values trick_index = <index>
        if (<full> = 0)
            save_slot = <index>
            break 
        endif
        index = (<index> + 1)
        repeat (MAX_CREATED_TRICKS -1)
    else
        save_slot = (editing_cat + 0)
        change editing_cat = 0
    endif
    if GotParam save_slot
        assign_cat_to_slot save_slot = <save_slot>
    else
        if (loading_cat_from_edit_tricks = 0)
            if ((IsXbox)|| (isPC))
                create_dialog_box {Title = 'Pe³ny'
                    text = 'Wszystkie sloty trików s¹ pe³ne. Co chcesz zrobiæ?'
                    just = [ center center ]
                    text_rgba = [ 88 105 112 128 ]
                    buttons = [{font = small text = 'Nadpisaæ stary trik' pad_choose_script = cat_assign_slot_menu}
                        {font = small text = 'Zapisz trik na twardym dysku' pad_choose_script = launch_save_cat_sequence}
                        {font = small text = 'Wyjd bez zapisywania triku' pad_choose_script = back_to_options_menu_from_cat}
                    ]
                }
            else
                create_dialog_box {Title = 'Pe³ny'
                    text = 'Wszystkie sloty trików s¹ pe³ne. Co chcesz zrobiæ?'
                    just = [ center center ]
                    text_rgba = [ 88 105 112 128 ]
                    buttons = [{font = small text = 'Nadpisaæ stary trik' pad_choose_script = cat_assign_slot_menu}
                        {font = small text = 'Zapisz trik' pad_choose_script = launch_save_cat_sequence}
                        {font = small text = 'Wyjd bez zapisywania triku' pad_choose_script = back_to_options_menu_from_cat}
                    ]
                }
            endif
        else
            create_dialog_box {Title = 'Pe³ny'
                text = 'Wszystkie sloty trików s¹ pe³ne. Co chcesz zrobiæ?'
                just = [ center center ]
                text_rgba = [ 88 105 112 128 ]
                buttons = [{font = small text = 'Nadpisaæ stary trik' pad_choose_script = cat_assign_slot_menu}
                    {font = small text = 'Wyjd bez wczytywania triku' pad_choose_script = create_edit_tricks_menu}
                ]
            }
        endif
    endif
endscript

script calculate_cat_score minus = 99
    if ((GotParam get_values)|| (GotParam get_time))
        get_CAT_param_values trick_index = 0
    endif
    bailtime = 0
    animtime = 0
    num_rots = 0
    num_anims = 0
    if NOT GotParam anims_only
        GetArraySize <rotation_info>
        index = 0
        begin 
        if (((<rotation_info> [ <index> ]).on)= 1)
            dur = ((<rotation_info> [ <index> ]).dur)
            start = ((<rotation_info> [ <index> ]).start)
            if ((<dur> + <start>)> <bailtime>)
                bailtime = (<dur> + <start>)
            endif
        endif
        if NOT (((<rotation_info> [ <index> ]).on)= 2)
            num_rots = (<num_rots> + 1)
        endif
        index = (<index> + 1)
        repeat <array_size>
    else
        if NOT GotParam no_hidden
            include_hidden = include_hidden
        endif
    endif
    GetArraySize <animation_info>
    index = 0
    begin 
    if NOT (<index> = <minus>)
        if NOT (((<animation_info> [ <index> ]).trickType)= 4)
            trick_got_idle Trick = ((<animation_info> [ <index> ]).Trick)
            if (((<animation_info> [ <index> ]).on)= 1)
                if (<got_idle> = 1)
                    animtime = (<animtime> + ((<animation_info> [ <index> ]).dur)+ ((<animation_info> [ <index> ]).idletime)+ ((<animation_info> [ <index> ]).start))
                else
                    animtime = (<animtime> + ((<animation_info> [ <index> ]).dur)+ ((<animation_info> [ <index> ]).start))
                endif
            endif
            if GotParam include_hidden
                if (((<animation_info> [ <index> ]).on)= 0)
                    if (<got_idle> = 1)
                        animtime = (<animtime> + ((<animation_info> [ <index> ]).dur)+ ((<animation_info> [ <index> ]).idletime)+ ((<animation_info> [ <index> ]).start))
                    else
                        animtime = (<animtime> + ((<animation_info> [ <index> ]).dur)+ ((<animation_info> [ <index> ]).start))
                    endif
                endif
            endif
            if NOT (((<animation_info> [ <index> ]).on)= 2)
                num_anims = (<num_anims> + 1)
            endif
        endif
    endif
    index = (<index> + 1)
    repeat <array_size>
    if (<animtime> > <bailtime>)
        bailtime = <animtime>
    endif
    if NOT GotParam get_time
        if (<is_grind> = 0)
            cat_get_score_from_bailtime bailtime = <bailtime> can_spin = <can_spin> is_grind = <is_grind>
        else
            Score = SPECIALGRIND_SCORE
        endif
        FormatText textname = score_text '%i' i = <Score>
        if ScreenElementExists id = cat_timeline_score
            SetScreenElementProps id = cat_timeline_score text = <score_text>
        endif
        if ScreenElementExists id = cat_rots_used
            FormatText textname = rot_text '%i' i = <num_rots>
            SetScreenElementProps id = cat_rots_used text = <rot_text>
            GetStackedScreenElementPos id = cat_rots_used x
            SetScreenElementProps id = cat_slash_rots Pos = <Pos>
        endif
        if ScreenElementExists id = cat_anims_used
            FormatText textname = anim_text '%i' i = <num_anims>
            SetScreenElementProps id = cat_anims_used text = <anim_text>
            GetStackedScreenElementPos id = cat_anims_used x
            SetScreenElementProps id = cat_slash_anims Pos = <Pos>
        endif
        if (<can_spin> = 1)
            spin_text = 'w³.'
        else
            spin_text = 'wy³.'
        endif
        if ScreenElementExists id = cat_timeline_spin
            SetScreenElementProps id = cat_timeline_spin text = <spin_text>
        endif
        if GotParam return_it
            return {Score = <Score> score_text = <score_text>}
        endif
    else
        return time = <bailtime>
    endif
endscript

script cat_assign_slot_menu 
    dialog_box_exit
    make_new_themed_option_menu Title = 'NADPISZ TRIK'
    if InFrontend
    endif
    if (loading_cat_from_edit_tricks = 0)
        SetScreenElementProps {
            id = options_menu
            event_handlers = [{ pad_back create_CAT_pause_menu }
            ]
        }
    else
        SetScreenElementProps {
            id = options_menu
            event_handlers = [{ pad_back create_edit_tricks_menu }
            ]
        }
    endif
    index = 1
    begin 
    get_CAT_other_param_values trick_index = <index>
    make_theme_menu_item text = <name> pad_choose_script = assign_cat_to_slot pad_choose_params = { save_slot = <index> }
    index = (<index> + 1)
    repeat (MAX_CREATED_TRICKS - 1)
    FireEvent type = focus target = current_menu_anchor
endscript
CATTrick_Handstand = {
    x
    params = { name = "HandStand" anim = HandstandHandFlip_Init idle = HandstandHandFlip_Range OutAnim = HandstandHandFlip_Out }
}
CATTrick_Casper = {
    x
    params = {
        name = "Casper"
        anim = Casper_Init
        idle = Casper_Range
        OutAnim = Casper_Out
        boardrotate
    }
}
CATTrick_AntiCasper = {
    x
    params = {
        name = "Anti Casper"
        anim = AntiCasper_Init
        idle = AntiCasper_Range
        OutAnim = AntiCasper_Out
        boardrotate
    }
}
CATTrick_Truckstand = {
    x
    params = { name = "Truckstand" anim = Truckstand_Init idle = Truckstand_Range OutAnim = Truckstand_Out }
}
CATTrick_SwitchFootPogo = {
    x
    params = { name = "Switch Foot Pogo" anim = TruckRun_Init idle = TruckRun OutAnim = TruckRun_Out }
}
CATTrick_Pogo = {
    x
    params = { name = "Pogo" anim = Pogo_Init idle = Pogo_Bounce OutAnim = Pogo_Out }
}
CATTrick_PrimoSpin = {
    x
    params = { name = "Primo Spin" anim = Special_Rodney_PrimoSpin_Init idle = Special_Rodney_PrimoSpin_Idle OutAnim = Special_Rodney_PrimoSpin_Out }
}
CATTrick_RunningMan = {
    x
    params = { name = "Running Manual" anim = Special_Eric_RnngMan_Init idle = Special_Eric_RnngMan_Idle ExtraTricks = FlatlandBranches }
}
CATTrick_Boomerang = {
    x
    params = { name = "Boomerang" anim = Special_MikeV_Boomerang ExtraTricks = FlatlandBranches }
}
CATTrick_SwitchFootPogoIdle = {
    x
    params = { name = "Pogo Idle" anim = TruckRun }
}
CATTrick_GuitarSlide = {
    x
    params = { name = "The Faction" anim = Guitar_Idle specialitem_details = Guitar_details stream = GuitarSlide }
}
CATTrick_AmericanHero = {
    x
    params = { name = "American Tribute" anim = AmericanHeroGrind_Idle specialitem_details = flag_Details }
}
CATSFX_StripClub = {
    x
    params = { sound name = "Party Girl" anim = AirIdleCAT stream = NO_Female1_Flash05 }
}
CATSFX_Burp = {
    x
    params = { sound name = "Chow Down" anim = AirIdleCAT stream = Burp01 }
}
CATSFX_Fart = {
    x
    params = { sound name = "Bad Burrito" anim = AirIdleCAT stream = Fart01 }
}
CATSFX_Flush = {
    x
    params = { sound name = "Give it Gas" anim = AirIdleCAT stream = AU_SFX_ToiletFlush }
}
CATSFX_Gator = {
    x
    params = { sound name = "Gators Attack" anim = AirIdleCAT stream = FL_AlligatorEatSkater }
}
CATSFX_Fire = {
    x
    params = { sound name = "Fire Fire Fire!" anim = AirIdleCAT stream = Spec_Muska01 }
}
CATSFX_Cops = {
    x
    params = { sound name = "Officer D." anim = AirIdleCAT stream = PoliceChirp01 }
}
CATSFX_Geek = {
    x
    params = { sound name = "Geek It" anim = AirIdleCAT stream = SK6_SE_Robot_Beep03 }
}
CATSFX_Dog = {
    x
    params = { sound name = "Sup Dawg" anim = AirIdleCAT stream = ST_DogBarks02 }
}
CATSFX_Seal = {
    x
    params = { sound name = "Big Block" anim = AirIdleCAT stream = Spec_JesseJ01 }
}
CATSFX_Crack = {
    x
    params = { sound name = "Spook Me" anim = AirIdleCAT stream = CAT_Spooky }
}
CATSFX_Funk = {
    x
    params = { sound name = "Da Funk" anim = AirIdleCAT stream = Spec_Muska02 }
}
CATSFX_Drum = {
    x
    params = { sound name = "Drum Line" anim = AirIdleCAT stream = CAT_Drum }
}
CATTrick_other03 = {
    x
    params = { name = "Boneless" anim = Boneless }
}
CATTrick_other04 = {
    x
    params = { name = "Cheer 1" anim = Cheer1 }
}
CATTrick_other05 = {
    x
    params = { name = "Cheer 2" anim = Cheer2 }
}
CATTrick_other06 = {
    x
    params = { name = "Sketchy" anim = SketchyLand }
}
CATTrick_other07 = {
    x
    params = { name = "Slap" anim = SlapAir }
}
CATTrick_other08 = {
    x
    params = { name = "Taunt 1" anim = Taunt1 }
}
CATTrick_other09 = {
    x
    params = { name = "Taunt 2" anim = Taunt2 }
}
CATTrick_other10 = {
    x
    params = { name = "Taunt 3" anim = Taunt3 }
}
CATTrick_other11 = {
    x
    params = { name = "Rail Flip" anim = RailFlip }
}
CATTrick_other12 = {
    x
    params = { name = "Casper Flip" anim = CasperFlip }
}
CATTrick_other13 = {
    x
    params = { name = "Half Cab Impossible" anim = HalfCabImpossible }
}
CATTrick_other14 = {
    x
    params = { name = "360 Fingerflip" anim = _360FlipNoseManual }
}
CATTrick_other15 = {
    x
    params = { name = "SpaceWalk" anim = Spacewalk }
}
CATTrick_other16 = {
    x
    params = { name = "Props" anim = prop }
}
CATTrick_other17 = {
    x
    params = { name = "Nollie" anim = Nollie }
}
CATTrick_other18 = {
    x
    params = { name = "Ollie" anim = ollie }
}
CATTrick_other19 = {
    x
    params = { name = "Drop It" anim = RunOutDropIdle }
}
Premade_CATS = [
    {
        name = 'Gavin Flip'
        can_spin = 0
        full = 1
        is_grind = 0
        rotation_info = [
            {
                on = 1
                axis = z
                Deg = 360
                dur = 1.0
                start = 0.2000
                deg_dir = 0
            }
            {
                on = 1
                axis = x
                Deg = 180
                dur = 0.7000
                start = 0.2000
                deg_dir = 1
            }
            {
                on = 1
                axis = x
                Deg = 180
                dur = 0.7000
                start = 0.6000
                deg_dir = 0
            }
            {
                on = 1
                axis = y
                Deg = 540
                dur = 0.6000
                start = 0.9000
                deg_dir = 1
            }
            {
                on = 2
                axis = y
                Deg = 360
                dur = 1.0
                start = 0.0
                deg_dir = 1
            }
            {
                on = 2
                axis = y
                Deg = 360
                dur = 1.0
                start = 0.0
                deg_dir = 1
            }
        ]
        animation_info = [
            {
                on = 1
                Trick = CATTrick_other07
                dur = 0.5000
                Blend = CAT_BLEND
                from = 0.2100
                percent = 1
                trickType = 3
                idletime = 0
                start = 0
                order = 2
                hold = 0
                backwards = 0
            }
            {
                on = 1
                Trick = Trick_Stalefish
                dur = 0.6000
                Blend = CAT_BLEND
                from = 0
                percent = 1
                trickType = 1
                idletime = 0.4000
                start = 0
                order = 1
                hold = 0
                backwards = 0
            }
            {
                on = 2
                Trick = Trick_Indy
                dur = 0.5000
                Blend = CAT_BLEND
                from = 0
                percent = 1
                trickType = 1
                idletime = 0
                start = 0
                order = 3
                hold = 0
                backwards = 0
            }
            {
                on = 2
                Trick = Trick_Indy
                dur = 0.5000
                Blend = CAT_BLEND
                from = 0
                percent = 1
                trickType = 1
                idletime = 0
                start = 0
                order = 4
                hold = 0
                backwards = 0
            }
            {
                on = 2
                Trick = Trick_Indy
                dur = 0.5000
                Blend = CAT_BLEND
                from = 0
                percent = 1
                trickType = 1
                idletime = 0
                start = 0
                order = 5
                hold = 0
                backwards = 0
            }
            {
                on = 2
                Trick = Trick_Indy
                dur = 0.5000
                Blend = CAT_BLEND
                from = 0
                percent = 1
                trickType = 1
                idletime = 0
                start = 0
                order = 6
                hold = 0
                backwards = 0
            }
        ]
    }
    {
        name = 'McTwisted'
        can_spin = 0
        full = 1
        is_grind = 0
        rotation_info = [
            {
                on = 1
                Deg = 540
                axis = y
                dur = 1.0
                start = 0.2000
                deg_dir = 0
            }
            {
                on = 1
                Deg = 180
                axis = z
                dur = 0.7000
                start = 0.2000
                deg_dir = 0
            }
            {
                on = 1
                Deg = 180
                axis = z
                dur = 0.7000
                start = 0.5000
                deg_dir = 1
            }
            {
                on = 2
                Deg = 360
                axis = y
                dur = 1.0
                start = 0.0
                deg_dir = 1
            }
            {
                on = 2
                Deg = 360
                axis = y
                dur = 1.0
                start = 0.0
                deg_dir = 1
            }
            {
                on = 2
                Deg = 360
                axis = y
                dur = 1.0
                start = 0.0
                deg_dir = 1
            }
        ]
        animation_info = [
            {
                on = 1
                Trick = Trick_Seatbelt
                dur = 0.4000
                percent = 1.0
                Blend = CAT_BLEND
                from = 0
                trickType = 1
                idletime = 0.7000
                start = 0
                order = 1
                hold = 0
                backwards = 0
            }
            {
                on = 2
                Trick = Trick_Indy
                dur = 0.5000
                Blend = CAT_BLEND
                from = 0
                percent = 1
                trickType = 1
                idletime = 0
                start = 0
                order = 2
                hold = 0
                backwards = 0
            }
            {
                on = 2
                Trick = Trick_Indy
                dur = 0.5000
                Blend = CAT_BLEND
                from = 0
                percent = 1
                trickType = 1
                idletime = 0
                start = 0
                order = 3
                hold = 0
                backwards = 0
            }
            {
                on = 2
                Trick = Trick_Indy
                dur = 0.5000
                Blend = CAT_BLEND
                from = 0
                percent = 1
                trickType = 1
                idletime = 0
                start = 0
                order = 4
                hold = 0
                backwards = 0
            }
            {
                on = 2
                Trick = Trick_Indy
                dur = 0.5000
                Blend = CAT_BLEND
                from = 0
                percent = 1
                trickType = 1
                idletime = 0
                start = 0
                order = 5
                hold = 0
                backwards = 0
            }
            {
                on = 2
                Trick = Trick_Indy
                dur = 0.5000
                Blend = CAT_BLEND
                from = 0
                percent = 1
                trickType = 1
                idletime = 0
                start = 0
                order = 6
                hold = 0
                backwards = 0
            }
        ]
    }
    {
        name = 'Na krawêdzi'
        can_spin = 0
        full = 1
        is_grind = 1
        rotation_info = [
            {
                on = 2
                Deg = 360
                axis = y
                dur = 1.0
                start = 0.0
                deg_dir = 1
            }
            {
                on = 2
                Deg = 360
                axis = y
                dur = 1.0
                start = 0.0
                deg_dir = 1
            }
            {
                on = 2
                Deg = 360
                axis = y
                dur = 1.0
                start = 0.0
                deg_dir = 1
            }
            {
                on = 2
                Deg = 360
                axis = y
                dur = 1.0
                start = 0.0
                deg_dir = 1
            }
            {
                on = 2
                Deg = 360
                axis = y
                dur = 1.0
                start = 0.0
                deg_dir = 1
            }
            {
                on = 2
                Deg = 360
                axis = y
                dur = 1.0
                start = 0.0
                deg_dir = 1
            }
        ]
        animation_info = [
            {
                on = 1
                Trick = CATTrick_other11
                dur = 0.5000
                Blend = CAT_BLEND
                from = 0
                percent = 0.5300
                trickType = 3
                idletime = 0
                start = 0
                order = 1
                hold = 0
                backwards = 0
            }
            {
                on = 1
                Trick = CATTrick_other11
                dur = 2.0
                Blend = CAT_BLEND
                from = 0.5000
                percent = 0.7800
                trickType = 3
                idletime = 0
                start = 0
                order = 2
                hold = 0
                backwards = 0
            }
            {
                on = 1
                Trick = CATTrick_other11
                dur = 0.5000
                Blend = CAT_BLEND
                from = 0.6000
                percent = 1
                trickType = 3
                idletime = 0
                start = 0
                order = 3
                hold = 0
                backwards = 1
            }
            {
                on = 2
                Trick = Trick_Indy
                dur = 0.5000
                Blend = CAT_BLEND
                from = 0
                percent = 1
                trickType = 1
                idletime = 0
                start = 0
                order = 4
                hold = 0
                backwards = 0
            }
            {
                on = 2
                Trick = Trick_Indy
                dur = 0.5000
                Blend = CAT_BLEND
                from = 0
                percent = 1
                trickType = 1
                idletime = 0
                start = 0
                order = 5
                hold = 0
                backwards = 0
            }
            {
                on = 2
                Trick = Trick_Indy
                dur = 0.5000
                Blend = CAT_BLEND
                from = 0
                percent = 1
                trickType = 1
                idletime = 0
                start = 0
                order = 6
                hold = 0
                backwards = 0
            }
        ]
    }
    {
        name = 'Kaemon lewo'
        can_spin = 0
        full = 1
        is_grind = 1
        rotation_info = [
            {
                on = 1
                Deg = 360
                axis = y
                dur = 0.7000
                start = 0.0
                deg_dir = 1
            }
            {
                on = 1
                Deg = 360
                axis = y
                dur = 0.7000
                start = 1.200
                deg_dir = 0
            }
            {
                on = 2
                Deg = 360
                axis = y
                dur = 1.0
                start = 0.0
                deg_dir = 1
            }
            {
                on = 2
                Deg = 360
                axis = y
                dur = 1.0
                start = 0.0
                deg_dir = 1
            }
            {
                on = 2
                Deg = 360
                axis = y
                dur = 1.0
                start = 0.0
                deg_dir = 1
            }
            {
                on = 2
                Deg = 360
                axis = y
                dur = 1.0
                start = 0.0
                deg_dir = 1
            }
        ]
        animation_info = [
            {
                on = 1
                Trick = CATTrick_Casper
                dur = 1.0
                Blend = CAT_BLEND
                from = 0
                percent = 1
                trickType = 3
                idletime = 0
                start = 0
                order = 1
                hold = 0
                backwards = 0
            }
            {
                on = 1
                Trick = CATTrick_AntiCasper
                dur = 1.0
                Blend = CAT_BLEND
                from = 0
                percent = 1
                trickType = 3
                idletime = 0
                start = 0
                order = 2
                hold = 0
                backwards = 0
            }
            {
                on = 2
                Trick = Trick_Indy
                dur = 0.5000
                Blend = CAT_BLEND
                from = 0
                percent = 1
                trickType = 1
                idletime = 0
                start = 0
                order = 3
                hold = 0
                backwards = 0
            }
            {
                on = 2
                Trick = Trick_Indy
                dur = 0.5000
                Blend = CAT_BLEND
                from = 0
                percent = 1
                trickType = 1
                idletime = 0
                start = 0
                order = 4
                hold = 0
                backwards = 0
            }
            {
                on = 2
                Trick = Trick_Indy
                dur = 0.5000
                Blend = CAT_BLEND
                from = 0
                percent = 1
                trickType = 1
                idletime = 0
                start = 0
                order = 5
                hold = 0
                backwards = 0
            }
            {
                on = 2
                Trick = Trick_Indy
                dur = 0.5000
                Blend = CAT_BLEND
                from = 0
                percent = 1
                trickType = 1
                idletime = 0
                start = 0
                order = 6
                hold = 0
                backwards = 0
            }
        ]
    }
]
