

script sk6ed_setup_ammobox type = apple num = 5 inner_radius = 8 outer_radius = 15
    obj_getid
    <ped_id> = <ObjID>
    <pad_choose_script> = ped_speech_exit
    switch <type>
        case apple
        <accept_text> = 'Press \m5 to pick up Apples'
        case paintcan
        <accept_text> = 'Press \m5 to pick up PaintCans'
        case tomato
        <accept_text> = 'Press \m5 to pick up Tomatoes'
        default 
        <accept_text> = 'Press \m5 to pick up Ammo'
    endswitch
    <activation_script> = sk6ed_get_ammo
    <activation_script_params> = {type = <type> num = <num>}
    obj_setinnerradius <inner_radius>
    ClearEventHandler objectinradius
    ClearEventHandler objectoutofradius
    seteventhandler Ex = objectinradius scr = ped_speech_got_trigger params = <...> 
endscript


script sk6ed_setup_ammobox_Tomato 
    sk6ed_setup_ammobox type = tomato
endscript


script sk6ed_setup_ammobox_PaintCan 
    sk6ed_setup_ammobox type = paintcan
endscript


script sk6ed_get_ammo 
    give_skater_ammo type = <type> num = <num>
    if ScreenElementExists id = ped_speech_dialog
        DestroyScreenElement id = ped_speech_dialog
    endif
    UnpauseSkaters
endscript


script sk6ed_speed_booster_fastest 
    if NOT walking
        trigger_speed_boost multi = 1.500 max_speed = 1800
    endif
endscript


script sk6ed_speed_booster_faster 
    if NOT walking
        trigger_speed_boost multi = 1.300 max_speed = 1800
    endif
endscript


script sk6ed_speed_booster_midfaster 
    if NOT walking
        trigger_speed_boost multi = 1.400 max_speed = 1800
    endif
endscript


script sk6ed_ShatteringGlass 
    playsound HitGlassPane2x
    if GetTriggerNodeName
        Shatter {name = <nodeName>
            area = 5000
            texture_swap = ba_apm_brokenglass01
            variance = 1.0
            spread = 1.500
            life = 3
            Bounce = 0
            Scale = 0.4000
            vel_x = 0
            vel_y = 60
            vel_z = 0
        }
        Kill name = <nodeName>
    endif
endscript


script sk6ed_ShatteringBarrel 
    playsound HitGlassPane2x
    if GetTriggerNodeName
        Shatter {name = <nodeName>
            area = 5000
            texture_swap = tb_bo_barrel_shatter_01
            variance = 1.0
            spread = 1.500
            life = 3
            Bounce = 0
            Scale = 0.4000
            vel_x = 0
            vel_y = 60
            vel_z = 0
        }
        Kill name = <nodeName>
    endif
endscript


script sk6ed_ShatteringWood 
    playsound FenceBreak
    if GetTriggerNodeName
        Shatter {name = <nodeName>
            area = 5000
            texture_swap = jow_dj_crateshatter01
            variance = 1.0
            spread = 1.500
            life = 3
            Bounce = 0
            Scale = 0.4000
            vel_x = 0
            vel_y = 60
            vel_z = 0
        }
        Kill name = <nodeName>
    endif
endscript


script SK6Ed_WaterDeath 
    SK3_KillSkater_Water bail nodeName = TRG_G_TrickAttack_RestartNode
endscript


script SK6Ed_PungeeDeath 
    SK3_KillSkater_Pungee bail nodeName = TRG_G_TrickAttack_RestartNode
endscript


script sk6ed_add_fast_particlesys type = fire
    obj_getid
    switch <type>
        case fire
        CreateFastParticleSystem name = fire attachobjid = <ObjID> params_script = sk6ed_fire_fast_particle_params
    endswitch
endscript


script sk5ed_FireScript 
    SK3_KillSkater_Pungee bail Lava nodeName = TRG_G_TrickAttack_RestartNode
endscript


script sk5ed_WaterScript 
    SK3_KillSkater_Pungee bail Lava nodeName = TRG_G_TrickAttack_RestartNode
endscript


script TRG_Flag_BlueScript_Parked 
    Team_Flag blue
endscript


script TRG_Flag_GreenScript_Parked 
    Team_Flag green
endscript


script TRG_Flag_RedScript_Parked 
    Team_Flag red
endscript


script TRG_Flag_YellowScript_Parked 
    Team_Flag yellow
endscript

