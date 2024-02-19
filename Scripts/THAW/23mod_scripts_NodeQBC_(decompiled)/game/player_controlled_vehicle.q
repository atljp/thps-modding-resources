
script #"0x7f92814d" 
    ClearAllWalkingExceptions
    ClearExceptions
    seteventhandler Ex = #"0xc4a60423" scr = #"0xc4a60423"
    seteventhandler Ex = SkaterCollideBail scr = #"0xe9eca856"
    seteventhandler Ex = MadeOtherSkaterBail scr = #"0x639bd709"
    SetException Ex = RunHasEnded scr = EndOfRun
    SetException Ex = GoalHasEnded scr = Goal_EndOfRun
    Block
endscript

script ToggleUserControlledVehicleMode 
    if NOT skater ::driving
        if InNetGame
            obj_getid
            #"0x28eeb1de" skaterid = <ObjID> control_type = (<VehicleSetup>.control_type)
        endif
        skater ::BashOff
        skater ::nollieoff
        skater ::pressureoff
        skater ::LandSkaterTricks
        skater ::resetswitched
        skater ::ClearTrickQueues
        skater ::DestroyAllSpecialItems
        skater ::SparksOff
        skater ::VibrateOff
        skater ::stopbalancetrick
        skater ::KillExtraTricks
        skater ::SetExtraTricks NoTricks
        #"0xc76aff88" <...> 
        skater ::PausePhysics
        skater ::SkaterLoopingSound_TurnOff
        skater ::#"0x06e627aa"
        skater ::obj_shadowoff
        #"0x215e2399" 1
        skater ::setdriving
        Debounce x
        Debounce square
        MakeSkaterGoto #"0x7f92814d"
    else
        skater ::GetCameraId
        if NOT GameIsPaused
            <cameraid> ::UnPause
        endif
        SetActiveCamera id = <cameraid>
        PlayerVehicle ::Die
        PlayerVehicleCamera ::Die
        skater ::unsetdriving
        skater ::#"0x67f01b13"
        skater ::obj_shadowon ShadowType = #"0x76a54cd1"
        skater ::#"0x72aecfc0"
        #"0x215e2399" 0
        change #"0x908d0727" = 0
    endif
endscript

script #"0xc76aff88" 
    if GotParam exitable
        VehicleSetup = (<VehicleSetup> + { exitable })
    endif
    if GotParam edited_goal
        VehicleSetup = (<VehicleSetup> + { edited_goal })
    endif
    if NOT ObjectExists id = PlayerVehicle
        CreateCompositeObject {
            Components = [
                {
                    Component = skeleton
                    SkeletonName = car
                }
                {
                    Component = vehicle
                }
                {
                    Component = #"0x28c97f3c"
                }
                {
                    Component = sound
                }
                {
                    Component = Input
                    player = 0
                }
                {
                    Component = Model
                    usemodellights
                }
            ]
            params = {
                name = PlayerVehicle
                <VehicleSetup>
            }
        }
        CreateCompositeObject {
            Components = [
                {
                    Component = cameralookaround
                }
                {
                    Component = #"0x2c747d8a"
                    subject = PlayerVehicle
                    #"0xebf5da7d"
                }
                {
                    Component = camera
                }
                {
                    Component = Input
                    player = 0
                }
            ]
            params = { name = PlayerVehicleCamera }
        }
    endif
    PlayerVehicle ::Vehicle_MoveToRestart #"0x22d007e6"
    PlayerVehicleCamera ::VehicleCamera_Reset
    SetActiveCamera id = PlayerVehicleCamera
endscript

script nonlocalclientinvehicle 
    MangleChecksums a = <skaterid> b = #"0xd381edd9"
    #"0xd381edd9" = <mangled_id>
    if ObjectExists id = <#"0xd381edd9">
        <#"0xd381edd9"> ::gettags
        if NOT (<control_type> = <#"0x7e7e48b8">)
            remove_car_from_non_local_skater skaterid = <skaterid>
        endif
    endif
    if NOT ObjectExists id = <#"0xd381edd9">
        #"0xc332c9a5" skaterid = <skaterid> control_type = <control_type>
    endif
    GetVehicleSetup control_type = <control_type>
    if NOT StructureContains structure = <VehicleSetup> make_skater_visible
        <skaterid> ::hide
    else
        <skaterid> ::obj_shadowoff
        <skaterid> ::switchoffatomic board
    endif
endscript

script nonlocalclientexitvehicle 
    remove_car_from_non_local_skater skaterid = <skaterid>
    <skaterid> ::unhide
    <skaterid> ::obj_shadowon ShadowType = simple
    <skaterid> ::switchonatomic board
endscript

script #"0xc332c9a5" 
    MangleChecksums a = <skaterid> b = #"0xd381edd9"
    #"0xd381edd9" = <mangled_id>
    GetVehicleSetup control_type = <control_type>
    GetCurrentLevel
    #"0x6c7cdf9f" = (<VehicleSetup>.level)
    #"0xefea629a" = (<VehicleSetup>.#"0xcd81460f")
    if NOT ((<level> = <#"0x6c7cdf9f">)|| (<level> = <#"0xefea629a">))
        return 
    endif
    CreateCompositeObject {
        Components = [
            {
                Component = #"0x9649d4f9"
            }
            {
                Component = skeleton
                SkeletonName = car
            }
            {
                Component = lockobj
            }
            {
                Component = SetDisplayMatrix
            }
            {
                Component = Model
                Model = (<VehicleSetup>.Model)
                usemodellights
            }
            {
                Component = ModelLightUpdate
            }
        ]
        params = { name = <#"0xd381edd9"> }
    }
    <#"0xd381edd9"> ::obj_locktoobject id = <skaterid> ((0.0, 0.0, 0.0) - (<VehicleSetup>.skater_pos))
    <#"0xd381edd9"> ::settags #"0x7e7e48b8" = <control_type>
endscript

script remove_car_from_non_local_skater 
    MangleChecksums a = <skaterid> b = #"0xd381edd9"
    #"0xd381edd9" = <mangled_id>
    if ObjectExists id = <#"0xd381edd9">
        <#"0xd381edd9"> ::Die
    endif
endscript

script #"0xe9eca856" 
    PlayerVehicle ::#"0x4c73526b" <...> 
endscript
#"0xebf5da7d" = { #"0x9213625f" = 3.0 #"0x14849b6d" = 55 #"0xbd3d3ca9" = 240 Angle = 0 }

script #"0xc4a60423" 
    vibrate actuator = 1 percent = (50 + 50 * <strength>)duration = (0.1000 + 0.1000 * <strength>)
endscript
#"0x348b417c" = 3.500
#"0xda1f72ba" = 150
#"0xd55df129" = 100
#"0x9a945bb1" = 300
#"0x93d22253" = 2
#"0xd827c245" = 3
#"0x771922a6" = 3
#"0x3db3fa83" = 250
#"0x39e99fec" = 100
#"0x738500fd" = 300
#"0x14ddb3ef" = 2
#"0x4088e6ec" = 3
#"0xf3589cff" = {
    control_type = #"0x8be533a4"
    Model = 'veh\veh_limo\veh_limo.mdl'
    suspension_center_of_mass = 429496728
    mass = 2943
    moment_of_inertia = (6000000.0, 20000000.0, 6000000.0)
    body_restitution = 0.3000
    body_friction = 0.2000
    body_wipeout_friction = 0.4000
    body_spring = 1200
    collision_control = 0.2500
    max_steering_angle = 30
    constant_rotational_damping = 2000000
    quadratic_rotational_damping = 0.0001000
    in_air_slerp_strength = 5
    in_air_slerp_time_delay = 1
    in_air_slerp_velocity_cutoff = 350
    colliders = [ (39.0, 25.0, 212.0) (-39.0, 25.0, 212.0) (39.0, 25.0, -85.0) ]
    engine = {
        drive_torque = 400
        drag_torque = 800
        upshift_rpm = 5000
        differential_ratio = 5
        reverse_torque_ratio = 1
        gear_ratios = [ 4 3 0 ]
    }
    all_wheels = {
        Radius = 13
        moment = 3570
        spring_rate = 200
        damping_rate = 28
        static_friction = 2.0
        min_static_grip_velocity = 8
        max_static_grip_velocity = 12
        min_dynamic_grip_velocity = 30
        handbrake_torque = 3000
        brake_torque = 2000
    }
    wheels = [
        {
            max_draw_y_offset = -25.70
            steering = left
            drive = yes
            dynamic_friction = 2.800
            handbrake_throttle_friction = 3.500
            handbrake_locked_friction = 4.0
        }
        {
            max_draw_y_offset = -25.70
            steering = RIGHT
            drive = yes
            dynamic_friction = 2.800
            handbrake_throttle_friction = 3.500
            handbrake_locked_friction = 4.0
        }
        {
            max_draw_y_offset = 429496727
            steering = fixed
            drive = yes
            dynamic_friction = 3.500
            handbrake_throttle_friction = 3.0
            handbrake_locked_friction = 1.0
        }
        {
            max_draw_y_offset = 429496727
            steering = fixed
            drive = yes
            dynamic_friction = 3.500
            handbrake_throttle_friction = 3.0
            handbrake_locked_friction = 1.0
        }
    ]
}

script #"0xd82cfb77" 
    #"0xc76aff88" VehicleSetup = #"0xf3589cff"
    exit_pause_menu menu_id = #"0xb73b5702"
endscript
