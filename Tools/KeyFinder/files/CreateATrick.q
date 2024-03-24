
MAX_CREATED_TRICKS = 11
CAT_BLEND = 0.1500
cat_done = 1
demo_flipped_cat_skater = 0
Default_CAT_other_info = {name = '' full = 0 can_spin = 1}
Default_CAT_rotation_info = [
    {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
    {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
    {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
    {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
    {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
    {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
]
Default_CAT_animation_info = [
    {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 1 hold = 0 backwards = 0}
    {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 2 hold = 0 backwards = 0}
    {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 3 hold = 0 backwards = 0}
    {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 4 hold = 0 backwards = 0}
    {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 5 hold = 0 backwards = 0}
    {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 6 hold = 0 backwards = 0}
]

script get_new_cat_values 
    
    name = ''
    full = 1
    can_spin = 1
    rotation_info = (Default_CAT_rotation_info)
    animation_info = (Default_CAT_animation_info)
    return <...> 
endscript


script CreateATrick 
    
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
        cat_skater ::obj_enableanimblending enabled = 1
        cat_skater ::obj_setorientation y = 0
    else
        ClearTricksFrom Jumptricks Jumptricks0 Jumptricks
        KillExtraTricks
        bailon
        if GotParam FromGroundGone
            seteventhandler Ex = Ollied scr = TrickOllie
        else
            ClearException Ollied
        endif
    endif
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
        obj_spawnscript spawned_trick_anim params = {animation_info = <animation_info>
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
    obj_spawnscript waitforbailoff params = { time = <bailtime> }
    if NOT GotParam demo_loop
        obj_spawnscript cat_update_trick_string params = {name = <name> bailtime = <bailtime> can_spin = <can_spin>}
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
    
    change cat_done = 1
    if GotParam demo_loop
        if (demo_flipped_cat_skater = 1)
            Obj_Flip
            change demo_flipped_cat_skater = 0
        endif
        return 
    endif
    goto Airborne
endscript


script spawn_rotation_script axis = x
    GetCurrentSkaterProfileIndex
    CAT_SetTotalY 0 skater = <currentSkaterProfileIndex>
    CAT_SetTotalX 0 skater = <currentSkaterProfileIndex>
    CAT_SetTotalZ 0 skater = <currentSkaterProfileIndex>
    if (<axis> = x)
        obj_spawnscript RotateOnAxis pausewithobject params = {axis = <axis>
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
        obj_spawnscript RotateOnAxis pausewithobject params = {axis = <axis>
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
                obj_spawnscript spawned_cat_sound_script params = {start = <start> stream = <stream>}
            endif
            anims_played_this_trick = (<anims_played_this_trick> + 1)
            GetCurrentSkaterProfileIndex
            CAT_GetNumAnims skater = <currentSkaterProfileIndex>
            
            if (<anims_played_this_trick> = <num_animations_on>)
                obj_spawnscript are_cat_anims_done params = {no_wait flip_skater = <flip_skater> demo_loop = <demo_loop>}
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
                from_seconds = (<from> * (<total_length> / 2.0)* 60)
                to_seconds = (<percent> * (<total_length> / 2.0)* 60)
                in_ratio = (<Length> / <total_length>)
                out_ratio = (1.0 - <in_ratio>)
                if ((<in_ratio> = 0)|| (<out_ratio> = 0))
                    
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
                    
                    TurnOnSpecialItem specialitem_details = <specialitem_details>
                endif
                if NOT GotParam demo_loop
                    if GotParam SpecialSounds
                        obj_spawnscript <SpecialSounds>
                    endif
                    if GotParam stream
                        obj_playstream <stream> vol = 250
                    endif
                endif
                if NOT (<Speed> = 0)
                    if NOT (<have_played_real_anim> = 0)
                        Obj_PlayAnim {anim = <anim> Speed = <Speed> from = <from_seconds>}
                    else
                        Obj_PlayAnim {anim = <anim> Speed = <Speed> from = <from_seconds> blendperiodpercent = 0}
                    endif
                endif
                if NOT IsArray <Trick>
                    out_params = (<Trick>.params)
                else
                    out_params = ((<Trick> [ 0 ]).params)
                endif
                if NOT (<Speed> = 0)
                    Obj_WaitAnimFinished
                endif
                if NOT (<idletime> = 0)
                    Obj_PlayAnim anim = <idle> Cycle xblendperiodpercent = 0
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
                        
                        return 
                    endif
                endif
                percent = ((<animation_info> [ <index> ]).percent)
                if (<percent> > 1)
                    percent = 1
                endif
                GetAnimLength anim = <anim>
                from_seconds = (<from> * <Length> * 60)
                to_seconds = (<percent> * <Length> * 60)
                total_percent = (<percent> - <from>)
                if NOT (<dur> = 0)
                    Speed = (((<Length> * <total_percent>))/ <dur>)
                else
                    Speed = 1
                endif
                if (0 > <Speed>)
                    Speed = (<Speed> * -1)
                endif
                if (<backwards> = 1)
                    temp = <to_seconds>
                    to_seconds = <from_seconds>
                    from_seconds = <temp>
                endif
                if NOT (<start> = 0)
                    wait <start> seconds
                endif
                if GotParam specialitem_details
                    
                    TurnOnSpecialItem specialitem_details = <specialitem_details>
                endif
                if NOT GotParam demo_loop
                    if GotParam SpecialSounds
                        obj_spawnscript <SpecialSounds>
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
                    Obj_PlayAnim {anim = <anim> Speed = <Speed> blendperiodpercent = <blendperiodpercent> from = <from_seconds> to = <to_seconds>}
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
            
            if NOT (<anims_played_this_trick> = <num_animations_on>)
                if NOT GotParam speed2
                    if NOT (<Speed> = 0)
                        Obj_WaitAnimFinished
                    endif
                else
                    if NOT (<speed2> = 0)
                        Obj_WaitAnimFinished
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
    obj_spawnscript are_cat_anims_done params = {flip_skater = <flip_skater> demo_loop = <demo_loop>}
    
endscript


script are_cat_anims_done 
    if NOT GotParam no_wait
        Obj_WaitAnimFinished
    endif
    TurnOffSpecialItem
    if GotParam flip_skater
        if NOT GotParam demo_loop
            rotate y = 180
        else
        endif
    endif
    GetCurrentSkaterProfileIndex
    CAT_SetAnimsDone 1 skater = <currentSkaterProfileIndex>
endscript


script trick_got_idle 
    if IsArray <Trick>
        if StructureContains structure = ((<Trick> [ 0 ]).params)idle
            got_idle = 1
        else
            got_idle = 0
        endif
    else
        if StructureContains structure = (<Trick>.params)idle
            got_idle = 1
        else
            got_idle = 0
        endif
    endif
    return got_idle = <got_idle>
endscript


script CATReleased_SquareOrCircle from = 0
    
    if (<Speed> = 0)
        return 
    endif
    if GotParam OutAnim
        
        Obj_PlayAnim anim = <OutAnim> blendperiodpercent = <Blend> Speed = <Speed> from = <from> to = <to>
    else
        if GotParam BackwardsAnim
            
            Obj_PlayAnim anim = <BackwardsAnim> backwards blendperiodpercent = <Blend> Speed = <Speed> from = <from> to = <to>
        else
            if animequals AirWalk
                
                Obj_PlayAnim anim = <anim> from = current to = 0 blendperiodpercent = <Blend> Speed = <Speed>
            else
                
                Obj_PlayAnim anim = <anim> backwards Speed = <Speed> from = <from> to = <to> blendperiodpercent = <Blend>
            endif
        endif
    endif
endscript


script spawned_cat_sound_script 
    if NOT (<start> = 0)
        wait <start> seconds
    endif
    if GotParam stream
        obj_playstream <stream> vol = 250
    endif
endscript


script waitforbailoff 
    time_passed = 0.0
    bail_point = (<time> * 0.2000)
    time = (<time> - <bail_point>)
    GetCurrentSkaterProfileIndex
    CAT_GetHoldTime skater = <currentSkaterProfileIndex>
    
    begin 
    if ((<time_passed> > (<time> + <cat_hold_time>))|| (<time_passed> = (<time> + <cat_hold_time>)))
        break 
    endif
    WaitOneGameFrame
    time_passed = (<time_passed> + (1.0 / 60.0))
    CAT_GetHoldTime skater = <currentSkaterProfileIndex>
    repeat 
    
    CAT_SetBailDone 1 skater = <currentSkaterProfileIndex>
endscript


script cat_update_trick_string 
    if (<name> = '')
        name = 'Created Trick'
    endif
    SetTrickName <name>
    cat_get_score_from_bailtime bailtime = <bailtime> can_spin = <can_spin>
    SetTrickScore <Score>
    display CAT
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


script set_new_rot_values trick_index = 0
    
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
    
    GetCreateATrickAnimations trick_index = <trick_index>
    SetArrayElement arrayName = animation_info index = <anim_index> newValue = {on = <on> Trick = <Trick> dur = <dur> percent = <percent> Blend = <Blend> from = <from> trickType = <trickType> idletime = <idletime> start = <start> order = <order> hold = <hold> backwards = <backwards>}
    SetCreateATrickAnimations {
        trick_index = <trick_index>
        animation_info = <animation_info>
    }
endscript


script set_new_CAT_param_values 
    
    other_params = {name = <name> can_spin = <can_spin> full = <full>}
    SetCreateATrickOtherParams {trick_index = <trick_index>
        other_params = <other_params>
    }
endscript


script get_CAT_param_values trick_index = 0
    
    if GetCreateATrickParams { trick_index = <trick_index> }
        name = (<other_params>.name)
        can_spin = (<other_params>.can_spin)
        full = (<other_params>.full)
        return <...> 
    endif
endscript


script get_CAT_rot_values trick_index = 0 rot_index = 0
    
    if GetCreateATrickRotations { trick_index = <trick_index> }
        return (<rotation_info> [ <rot_index> ])
    endif
endscript


script get_CAT_anim_values trick_index = 0 anim_index = 0
    
    if GetCreateATrickAnimations { trick_index = <trick_index> }
        return (<animation_info> [ <anim_index> ])
    endif
endscript


script get_CAT_other_param_values 
    
    if GetCreateATrickOtherParams { trick_index = <trick_index> }
        name = (<other_params>.name)
        can_spin = (<other_params>.can_spin)
        full = (<other_params>.full)
        return <...> 
    endif
endscript


script print_out_cat index = 0
    get_CAT_param_values trick_index = <index>
    
endscript

Premade_CATS = [
    {name = 'Gavin Flip'
        can_spin = 0
        full = 1
        rotation_info = [
            {on = 1 axis = z Deg = 360 dur = 1.0 start = 0.2000 deg_dir = 0}
            {on = 1 axis = x Deg = 180 dur = 0.7000 start = 0.2000 deg_dir = 1}
            {on = 1 axis = x Deg = 180 dur = 0.7000 start = 0.6000 deg_dir = 0}
            {on = 1 axis = y Deg = 540 dur = 0.6000 start = 0.9000 deg_dir = 1}
            {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
            {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
        ]
        animation_info = [
            {on = 1 Trick = CATTrick_other07 dur = 0.5000 Blend = CAT_BLEND from = 0.2100 percent = 1 trickType = 3 idletime = 0 start = 0 order = 2 hold = 0 backwards = 0}
            {on = 1 Trick = Trick_Stalefish dur = 0.6000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0.4000 start = 0 order = 1 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 3 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 4 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 5 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 6 hold = 0 backwards = 0}
        ]
    }
    {name = 'McTwisted'
        can_spin = 0
        full = 1
        rotation_info = [
            {on = 1 Deg = 540 axis = y dur = 1.0 start = 0.2000 deg_dir = 0}
            {on = 1 Deg = 180 axis = z dur = 0.7000 start = 0.2000 deg_dir = 0}
            {on = 1 Deg = 180 axis = z dur = 0.7000 start = 0.5000 deg_dir = 1}
            {on = 2 Deg = 360 axis = y dur = 1.0 start = 0.0 deg_dir = 1}
            {on = 2 Deg = 360 axis = y dur = 1.0 start = 0.0 deg_dir = 1}
            {on = 2 Deg = 360 axis = y dur = 1.0 start = 0.0 deg_dir = 1}
        ]
        animation_info = [
            {on = 1 Trick = Trick_Seatbelt dur = 0.4000 percent = 1.0 Blend = CAT_BLEND from = 0 trickType = 1 idletime = 0.7000 start = 0 order = 1 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 2 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 3 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 4 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 5 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 6 hold = 0 backwards = 0}
        ]
    }
    {name = 'The Triple Deke'
        can_spin = 0
        full = 1
        rotation_info = [
            {on = 1 axis = y Deg = 180 dur = 0.4000 start = 0.0 deg_dir = 0}
            {on = 1 axis = y Deg = 360 dur = 0.4000 start = 0.2000 deg_dir = 1}
            {on = 1 axis = y Deg = 360 dur = 0.4000 start = 0.4000 deg_dir = 0}
            {on = 1 axis = y Deg = 180 dur = 0.4000 start = 0.6000 deg_dir = 1}
            {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
            {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
        ]
        animation_info = [
            {on = 1 Trick = Trick_Shifty360ShovitBSShifty dur = 1.300 Blend = CAT_BLEND from = 0 percent = 1 trickType = 2 idletime = 0 start = 0 order = 1 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 2 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 3 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 4 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 5 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 6 hold = 0 backwards = 0}
        ]
    }
    {name = 'Martial Kick'
        can_spin = 0
        full = 1
        rotation_info = [
            {on = 1 axis = y Deg = 360 dur = 1.200 start = 0.2000 deg_dir = 1}
            {on = 2 axis = z Deg = 180 dur = 0.5000 start = 0.8000 deg_dir = 0}
            {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
            {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
            {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
            {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
        ]
        animation_info = [
            {on = 1 Trick = Trick_FSFlipOneFootTailGrab dur = 0.7000 Blend = CAT_BLEND from = 0 percent = 0.5000 trickType = 2 idletime = 0 start = 0 order = 1 hold = 0 backwards = 0}
            {on = 1 Trick = Trick_Benihana dur = 0.7000 Blend = CAT_BLEND from = 0.5000 percent = 1 trickType = 1 idletime = 0 start = 0 order = 2 hold = 0 backwards = 1}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 3 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 4 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 5 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 6 hold = 0 backwards = 0}
        ]
    }
    {name = '720 Double Heelstale'
        can_spin = 1
        full = 1
        rotation_info = [
            {on = 1 axis = y Deg = 720 dur = 1.0 start = 0.0 deg_dir = 1}
            {on = 2 axis = x Deg = 180 dur = 0.5000 start = 1.0 deg_dir = 0}
            {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
            {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
            {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
            {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
        ]
        animation_info = [
            {on = 1 Trick = Extra_DBackfootKickflip dur = 0.4000 Blend = CAT_BLEND from = 0.0 percent = 0.5900 trickType = 0 idletime = 0 start = 0 order = 1 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 2 hold = 0 backwards = 0}
            {on = 1 Trick = Trick_Stalefish dur = 1 Blend = CAT_BLEND from = 0.5000 percent = 1 trickType = 1 idletime = 0 start = 0 order = 3 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 4 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 5 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 6 hold = 0 backwards = 0}
        ]
    }
    {name = '360 BodyVarial Kickflip'
        can_spin = 0
        full = 1
        rotation_info = [
            {on = 1 axis = y Deg = 360 dur = 0.6000 start = 0.0 deg_dir = 1}
            {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
            {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
            {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
            {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
            {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
        ]
        animation_info = [
            {on = 1 Trick = Extra_VarialKickflip dur = 0.6000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 0 idletime = 0 start = 0 order = 1 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 2 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 3 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 4 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 5 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 6 hold = 0 backwards = 0}
        ]
    }
    {name = 'Tweak out'
        can_spin = 1
        full = 1
        rotation_info = [
            {on = 1 axis = z Deg = 360 dur = 1.300 start = 0.0 deg_dir = 0}
            {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
            {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
            {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
            {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
            {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
        ]
        animation_info = [
            {on = 1 Trick = Trick_Japan dur = 1.0 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0.1000 start = 0 order = 1 hold = 1 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 2 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 3 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 4 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 5 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 6 hold = 0 backwards = 0}
        ]
    }
    {name = 'Hot Board Flips'
        can_spin = 1
        full = 1
        rotation_info = [
            {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
            {on = 1 axis = y Deg = 360 dur = 1.300 start = 0.0 deg_dir = 0}
            {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
            {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
            {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
            {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
        ]
        animation_info = [
            {on = 1 Trick = Trick_Fingerflip dur = 0.7000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 0 idletime = 0 start = 0 order = 1 hold = 1 backwards = 1}
            {on = 1 Trick = Trick_Fingerflip dur = 0.6000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 0 idletime = 0 start = 0 order = 2 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 3 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 4 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 5 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 6 hold = 0 backwards = 0}
        ]
    }
    {name = 'All City'
        can_spin = 0
        full = 1
        rotation_info = [
            {on = 1 axis = y Deg = 180 dur = 0.7000 start = 0.0 deg_dir = 1}
            {on = 2 axis = y Deg = 360 dur = 0.6000 start = 0.9000 deg_dir = 1}
            {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
            {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
            {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
            {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
        ]
        animation_info = [
            {on = 1 Trick = Trick_VarialHeelflip dur = 0.7000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 0 idletime = 0 start = 0 order = 1 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 2 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 3 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 4 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 5 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 6 hold = 0 backwards = 0}
        ]
    }
    {name = 'Dookie Flip'
        can_spin = 0
        full = 1
        rotation_info = [
            {on = 1 axis = y Deg = 360 dur = 0.7000 start = 0.0 deg_dir = 1}
            {on = 2 axis = y Deg = 180 dur = 0.8000 start = 0.0 deg_dir = 1}
            {on = 2 axis = z Deg = 360 dur = 0.6000 start = 0.6000 deg_dir = 1}
            {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
            {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
            {on = 2 axis = y Deg = 360 dur = 1.0 start = 0.0 deg_dir = 1}
        ]
        animation_info = [
            {on = 1 Trick = Extra_DBackfootKickflip dur = 0.7000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 0 idletime = 0.0 start = 0 order = 1 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 2 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 3 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 4 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 5 hold = 0 backwards = 0}
            {on = 2 Trick = Trick_Indy dur = 0.5000 Blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 6 hold = 0 backwards = 0}
        ]
    }
]
