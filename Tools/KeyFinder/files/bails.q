

script DoingTrickBail 
    
    goto YawBail
endscript


script YawBail 
    
    if IsSkaterOnVehicle
        goto vehicle_bail
    endif
    dir = forward
    GetActualSpin
    if (0 > <spin>)
        spin = (<spin> * -1)
    endif
    if landedfromvert
        spin = (<spin> + 180)
    endif
    begin 
    if (<spin> > 360)
        spin = (<spin> - 360)
    else
        break 
    endif
    repeat 
    if (45 > <spin>)
        dir = nose
    else
        if (<spin> > 135 & 225 > <spin>)
            dir = tail
        else
            if YawingLeft
                
                if Flipped
                    dir = face
                else
                    dir = back
                endif
            else
                
                if Flipped
                    dir = back
                else
                    dir = face
                endif
            endif
        endif
    endif
    switch <dir>
        case nose
        
        goto Bail_spin_FWD
        case tail
        
        goto Bail_Spin_BCK
        case back
        
        goto Bail_spin_CW
        case face
        
        goto Bail_spin_CCW
    endswitch
endscript


script Bail_spin_FWD 
    if landedfromvert
        
        if airtimelessthan 1.250 second
            
            GotoRandomScript [ Bail_Ramp_Ft ]
        else
            
            GotoRandomScript [ Bail_Ramp_Ft_Hd ]
        endif
    else
        if speedlessthan 500
            if airtimelessthan 1 second
                
                goto Runout
            endif
        endif
        if speedlessthan 600
            
            if airtimelessthan 1 second
                
                GotoRandomScript [ Bail_Spin_FWD_Regular ]
            else
                
                GotoRandomScript [ Bail_Spin_FWD_Hard ]
            endif
        else
            
            if airtimelessthan 1 second
                
                GotoRandomScript [ Bail_Spin_FWD_Fast ]
            else
                
                GotoRandomScript [ Bail_Spin_FWD_Hard ]
            endif
        endif
    endif
endscript


script Bail_Spin_BCK 
    if landedfromvert
        
        if airtimelessthan 1.250 second
            
            GotoRandomScript [ Bail_Ramp_Bk ]
        else
            
            GotoRandomScript [ Bail_Ramp_Bk_Hd ]
        endif
    else
        if speedlessthan 500
            if airtimelessthan 1 second
                
                goto Runout
            endif
        endif
        if speedlessthan 650
            
            if airtimelessthan 1 second
                
                GotoRandomScript [ Bail_Spin_BCK_Regular ]
            else
                
                GotoRandomScript [ Bail_Spin_BCK_Hard ]
            endif
        else
            
            if airtimelessthan 1 second
                
                GotoRandomScript [ Bail_Spin_BCK_Fast ]
            else
                
                GotoRandomScript [ Bail_Spin_BCK_Hard ]
            endif
        endif
    endif
endscript


script Bail_spin_CW 
    if landedfromvert
        
        if airtimelessthan 1.250 second
            
            GotoRandomScript [ Bail_Ramp_Lt Bail_Ramp_Ft_Med ]
        else
            
            GotoRandomScript [ Bail_Ramp_Lt_Med Bail_Ramp_Lt_Hd ]
        endif
    else
        if speedlessthan 500
            if airtimelessthan 1 second
                
                goto Runout
            endif
        endif
        if speedlessthan 600
            
            if airtimelessthan 1 second
                
                Random (@*4 goto Bail_Spin_CW_Hard_A @ goto Nutsac)
            else
                
                GotoRandomScript [ Bail_Spin_CW_Hard_B ]
            endif
        else
            
            if airtimelessthan 1 second
                
                Random (@*4 goto Bail_Spin_CW_Hard @ goto Nutsac)
            else
                
                GotoRandomScript [ Bail_Spin_CW_Hard_B ]
            endif
        endif
    endif
endscript


script Bail_spin_CCW 
    if landedfromvert
        
        if airtimelessthan 1.250 second
            
            GotoRandomScript [ Bail_Ramp_Ft Bail_Ramp_Rt Bail_Spin_BCK_Regular ]
        else
            
            GotoRandomScript [ Bail_Ramp_Ft_Hd Bail_Ramp_Rt_Hd ]
        endif
    else
        if speedlessthan 500
            if airtimelessthan 1 second
                
                goto Runout
            endif
        endif
        if speedlessthan 600
            
            if airtimelessthan 1 second
                
                Random (@*4 goto Bail_Spin_CCW_Hard @ goto Nutsac)
            else
                
                GotoRandomScript [ Bail_Spin_CCW_Hard_B ]
            endif
        else
            
            GotoRandomScript [ Bail_Spin_CCW_Hard_C ]
        endif
    endif
endscript


script PitchBail 
    if IsSkaterOnVehicle
        goto vehicle_bail
    endif
    tail_script = Bail_Pitch_Tail
    face_script = Bail_Pitch_Face
    back_script = Bail_Pitch_Back
    nose_script = Bail_Pitch_Nose
    if NOT InSplitScreenGame
        if GetGlobalFlag flag = TAP_BUTTONS_EXPLAINED
            if NOT GetGlobalFlag flag = RECOVERY_BUTTONS_EXPLAINED
                create_panel_message {text = 'Tip: press \ml in the air to level out'
                    id = skater_hint
                    style = skater_hint_style
                    Pos = (320.0, 170.0)
                    rgba = [ 32 75 102 100 ]
                }
                SetGlobalFlag flag = RECOVERY_BUTTONS_EXPLAINED
            endif
        endif
    endif
    turntofacevelocity
    GetLastGroundHeading
    GetHeading
    dif = (<heading> - <last_heading>)
    begin 
    if (<dif> > 180)
        dif = (360 - <dif>)
    else
        if (-180 > <dif>)
            dif = (360 + <dif>)
        else
            break 
        endif
    endif
    repeat 
    
    
    if Flipped
        if (0 > <dif>)
            
            flip
            flipped_skater = 1
        endif
    else
        if (<dif> > 0)
            
            flip
            flipped_skater = 1
        endif
    endif
    GetPitchBailDir
    switch <pitch_bail_dir>
        case nose
        pitch_script = <nose_script>
        case tail
        pitch_script = <tail_script>
        case left
        if Flipped
            pitch_script = <back_script>
        else
            pitch_script = <face_script>
        endif
        case RIGHT
        if Flipped
            pitch_script = <face_script>
        else
            pitch_script = <back_script>
        endif
        default 
        pitch_script = <face_script>
    endswitch
    if GotParam flipped_skater
        switch <pitch_script>
            case <back_script>
            pitch_script = <face_script>
            case <face_script>
            pitch_script = <back_script>
        endswitch
    endif
    if GotParam pitch_script
        MakeSkaterGoto <pitch_script>
    endif
endscript


script FiftyFiftyFall 
    
    switch <dir>
        case forward
        
        GotoRandomScript [ Bail_Falling_LT ]
        case backward
        
        GotoRandomScript [ Bail_Falling_RT ]
        default 
        
        GotoRandomScript [ Bail_Falling_FWD ]
    endswitch
endscript


script GrindFallLR 
    if obj_getcollision down distance = 0 height = 0 Length = 2.500 shift = 0.5000
        
        no_nutter = 1
    endif
    if ledge
        
        no_nutter = 1
    endif
    if GotParam no_nutter
        goto GrindBailFacingForwards params = { dir = <dir> }
    else
        Random (@ goto GrindBailFacingForwards params = { dir = <dir> }@*3 goto Nutter)
    endif
endscript


script GrindBailFacingForwards 
    
    switch <dir>
        case forward
        
        GotoRandomScript [ Bail_Falling_Slide_FWD_lt ]
        case backward
        
        GotoRandomScript [ Bail_Falling_Slide_FWD_rt ]
        default 
        
        GotoRandomScript [ Bail_Falling_Slide_FWD_lt ]
    endswitch
endscript


script BackwardsGrindBails 
    if obj_getcollision down distance = 0 height = 0 Length = 2.500 shift = 0.5000
        
        no_nutter = 1
    endif
    if ledge
        
        no_nutter = 1
    endif
    if GotParam no_nutter
        goto GrindBailFacingBackwards params = { dir = <dir> }
    else
        Random (@ goto GrindBailFacingBackwards params = { dir = <dir> }@*3 goto NutterBackwards)
    endif
endscript


script GrindBailFacingBackwards 
    
    switch <dir>
        case forward
        
        GotoRandomScript [ Bail_Falling_Slide_BCK_lt ]
        case backward
        
        GotoRandomScript [ Bail_Falling_Slide_BCK_rt ]
        default 
        
        GotoRandomScript [ Bail_Falling_Slide_BCK_lt ]
    endswitch
endscript


script Nutter 
    
    GotoRandomScript [ Bail_Nutter_FWD ]
endscript


script NutterBackwards 
    
    GotoRandomScript [ Bail_Nutter_BCK ]
endscript


script Runout 
    if speedlessthan 350
        
        GotoRandomScript [ RunOutQuick ]
    else
        
        Random (@*2 goto Bail_RunOut_New_A @ goto Bail_RunOut_Old)
    endif
endscript


script ManualBail 
    if speedlessthan 600
        goto ManualBailSlow
    else
        goto ManualBailFast
    endif
endscript


script NoseManualBail 
    if speedlessthan 550
        goto NoseManualBailSlow
    else
        goto NoseManualBailFast
    endif
endscript

FallForwardAnims = {
    AnimFall1 = Bail_Falling_Idle_FWD AnimFall2 = Bail_Falling_Hit_Med_FWD AnimFall2Hard = Bail_Falling_Hit_Hard_FWD AnimFallEnd = GetUp_HK_Bk
    xmove = 150 moveframes = 60
}
FallBackwardAnims = {
    AnimFall1 = Bail_Falling_Idle_BCK AnimFall2 = Bail_Falling_Hit_Med_BCK AnimFall2Hard = Bail_Falling_Hit_Hard_BCK AnimFallEnd = GetUp_HK_Bk
    xmove = 150 moveframes = 60
}
FallRightAnims = {
    AnimFall1 = Bail_Falling_Idle_RT AnimFall2 = Bail_Falling_Hit_Med AnimFall2Hard = Bail_Falling_Hit_Hard AnimFallEnd = GetUp_HK_Rt
    xmove = 150 moveframes = 60
}
FallLeftAnims = {
    AnimFall1 = Bail_Falling_Idle_LT AnimFall2 = Bail_Falling_Hit_Hard AnimFall2Hard = Bail_Falling_Hit_Hard AnimFallEnd = GetUp_HK_Lt
    xmove = -165 moveframes = 30
}
FallForwardRightAnims = {
    AnimFall1 = Bail_Falling_Slide_Idle_RTf AnimFall2 = Bail_Falling_Slide_HitM_RTf AnimFall2Hard = Bail_Falling_Slide_HitH_RTf AnimFallEnd = GetUp_HK_Lt
    xmove = 150 moveframes = 60
}
FallForwardLeftAnims = {
    AnimFall1 = Bail_Falling_Slide_Idle_LTf AnimFall2 = Bail_Falling_Slide_HitM_LTf AnimFall2Hard = Bail_Falling_Slide_HitH_LTf AnimFallEnd = GetUp_HK_Lt
    xmove = -150 moveframes = 60
}
FallBackwardLeftAnims = {
    AnimFall1 = Bail_Falling_Slide_Idle_LTb AnimFall2 = Bail_Falling_Slide_HitM_LTb AnimFall2Hard = Bail_Falling_Slide_HitH_LTb AnimFallEnd = GetUp_HK_Rt
    xmove = -150 moveframes = 60
}
FallBackwardRightAnims = {
    AnimFall1 = Bail_Falling_Slide_Idle_RTb AnimFall2 = Bail_Falling_Slide_HitM_RTb AnimFall2Hard = Bail_Falling_Slide_HitH_RTb AnimFallEnd = GetUp_HK_Rt
    xmove = 150 moveframes = 60
}
FallBackwardSlideAnims = {
    AnimFall1 = Bail_Falling_Slide_Idle_BCK AnimFall2 = Bail_Falling_Slide_HitM_BCK AnimFall2Hard = Bail_Falling_Slide_HitH_BCK AnimFallEnd = GetUp_HK_Ft
}
FallStandingAnims = {
    AnimFall1 = RunOut_Drop_Idle AnimFall2 = RunOut_Drop_Land_Med AnimFall2Hard = RunOut_Drop_Land_Med AnimFallEnd = GetUp_HK_Ft
    splatBloodFrame = 6
}
BAILSCRIPT = Kneeslide

script RunOutQuick 
    GeneralBail {anim1 = RunOutQuick intoairframe = 1 friction = 11 BoardAlwaysOn BashOff NoBlood
        BoardAlwaysOn
        sound = Bailrunoutflip NoScuff
        GroundGoneBail = GroundGoneBail
        FallBlendPeriod = 1
        FallStandingAnims
    }
endscript


script Bail_RunOut_Old 
    GeneralBail {anim1 = Bail_RunOut_Old intoairframe = 1 SmackAnim = Bail_Wall_FWD_Regular friction = 13 BoardAlwaysOn BashOff NoBlood
        BoardAlwaysOn
        sound = Bailrunoutflip NoScuff
        GroundGoneBail = GroundGoneBail
        FallBlendPeriod = 1
        FallStandingAnims
    }
endscript


script Bail_RunOut_New_A 
    GeneralBail {anim1 = Bail_RunOut_New_A intoairframe = 1 SmackAnim = Bail_Wall_FWD_Regular friction = 17 BoardAlwaysOn BashOff NoBlood
        BoardAlwaysOn
        sound = Bailrunoutflip NoScuff
        GroundGoneBail = GroundGoneBail
        FallBlendPeriod = 0.4000
        FallStandingAnims
    }
endscript


script RunOut_Drop_Land_Med 
    GeneralBail {anim1 = RunOut_Drop_Land_Med intoairframe = 1 SmackAnim = Bail_Wall_FWD_Low friction = 13 BoardAlwaysOn BashOff
        sound = bail_knee1 FoleySound BloodFrame = 6
        GroundGoneBail = GroundGoneBail
        FallBlendPeriod = 1
        FallStandingAnims
    }
endscript


script Bail_Ramp_Ft 
    GeneralBail {anim1 = Bail_Ramp_Ft NoBlending Endpose = GetUp_HK_Ft
        intoairframe = 1 friction = 11 SmackAnim = Bail_Wall_FWD_Regular
        BoardOffFrame = 10 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0
        sound = bail_knee1 FoleySound BloodFrame = 18
        GroundGoneBail = GroundGoneBail
        FallBlendPeriod = 1
        FallForwardAnims
    }
endscript


script Bail_Ramp_Ft_Med 
    GeneralBail {anim1 = Bail_Ramp_Ft_Med NoBlending Endpose = GetUp_HK_Ft
        intoairframe = 1 friction = 10 SmackAnim = Bail_Wall_FWD_Regular
        BoardOffFrame = 6 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0
        sound = bail_knee1 FoleySound BloodFrame = 13
        GroundGoneBail = GroundGoneBail
        FallBlendPeriod = 1
        FallForwardAnims
    }
endscript


script Bail_Ramp_Ft_Hd 
    GeneralBail {anim1 = Bail_Ramp_Ft_Hd NoBlending Endpose = GetUp_HK_Ft
        intoairframe = 1 friction = 6 SmackAnim = Bail_Wall_FWD_Regular
        BoardOffFrame = 8 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0
        sound = bail_knee1 FoleySound BloodFrame = 10
        GroundGoneBail = GroundGoneBail
        FallBlendPeriod = 0.7500
        FallForwardAnims
    }
endscript


script Bail_Ramp_Bk 
    GeneralBail {anim1 = Bail_Ramp_Bk NoBlending Endpose = GetUp_HK_Ft
        intoairframe = 1 friction = 17 SmackAnim = Bail_Wall_BCK_Regular
        BoardOffFrame = 3 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0
        sound = bail_knee1 FoleySound BloodFrame = 11
        GroundGoneBail = GroundGoneBail
        FallBlendPeriod = 1
        FallBackwardSlideAnims
    }
endscript


script Bail_Ramp_Bk_Hd 
    GeneralBail {anim1 = Bail_Ramp_Bk_Hd NoBlending Endpose = GetUp_HK_Rt
        intoairframe = 1 friction = 14 SmackAnim = Bail_Wall_BCK_Regular
        BoardOffFrame = 10 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0
        sound = bail_knee1 FoleySound BloodFrame = 12
        GroundGoneBail = GroundGoneBail
        FallBlendPeriod = 1.500
        FallBackwardSlideAnims
    }
endscript


script Bail_Ramp_Lt 
    GeneralBail {anim1 = Bail_Ramp_Lt NoBlending Endpose = GetUp_HK_Ft
        intoairframe = 1 friction = 16 SmackAnim = Bail_Wall_FWD_Regular
        BoardOffFrame = 10 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0
        sound = bail_knee1 FoleySound BloodFrame = 18
        GroundGoneBail = GroundGoneBail
        FallBlendPeriod = 1.0
        FallForwardAnims
    }
endscript


script Bail_Ramp_Lt_Med 
    GeneralBail {anim1 = Bail_Ramp_Lt_Med NoBlending Endpose = GetUp_HK_Lt
        intoairframe = 1 friction = 20 SmackAnim = Bail_Wall_FWD_Low
        BoardOffFrame = 10 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0
        sound = bail_knee1 FoleySound BloodFrame = 16
        GroundGoneBail = GroundGoneBail
        FallBlendPeriod = 1
        FallLeftAnims
    }
endscript


script Bail_Ramp_Lt_Hd 
    GeneralBail {anim1 = Bail_Ramp_Lt_Hd NoBlending Endpose = GetUp_HK_Lt
        intoairframe = 1 friction = 0
        SmackAnim = Bail_Wall_LT_Low
        BoardOffFrame = 5 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 10
        sound = bail_knee1 FoleySound BloodFrame = 19
        GroundGoneBail = GroundGoneBail
        FallBlendPeriod = 1.500
        FallLeftAnims
    }
endscript


script Bail_Ramp_Rt 
    GeneralBail {anim1 = Bail_Ramp_Rt NoBlending Endpose = GetUp_HK_Ft
        intoairframe = 1 friction = 20 SmackAnim = Bail_Wall_RT_Low
        BoardOffFrame = 10 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0
        sound = bail_knee1 FoleySound BloodFrame = 18
        GroundGoneBail = GroundGoneBail
        FallBlendPeriod = 1
        FallForwardAnims
    }
endscript


script Bail_Ramp_Rt_Med 
    GeneralBail {anim1 = Bail_Ramp_Rt_Med NoBlending Endpose = GetUp_HK_Bk
        intoairframe = 1 friction = 1 SmackAnim = Bail_Wall_RT_Low
        BoardOffFrame = 10 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0
        sound = bail_knee1 FoleySound BloodFrame = 18
        GroundGoneBail = GroundGoneBail
        FallBlendPeriod = 1
        FallBackwardAnims
    }
endscript


script Bail_Ramp_Rt_Hd 
    GeneralBail {anim1 = Bail_Ramp_Rt_Hd NoBlending Endpose = GetUp_HK_Ft
        intoairframe = 1 friction = 20 SmackAnim = Bail_Wall_RT_Low
        BoardOffFrame = 10 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0
        sound = bail_knee1 FoleySound BloodFrame = 18
        GroundGoneBail = GroundGoneBail
        FallBlendPeriod = 1
        FallBackwardSlideAnims
    }
endscript


script Bail_Spin_CW_Hard 
    GeneralBail {anim1 = Bail_Spin_CW_Hard NoBlending Endpose = GetUp_HK_Ft
        intoairframe = 1 friction = 20 SmackAnim = Bail_Wall_FWD_Low
        BoardOffFrame = 10 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0
        sound = bail_knee1 FoleySound BloodFrame = 18
        GroundGoneBail = GroundGoneBail
        FallBlendPeriod = 1.500
        FallBackwardSlideAnims
    }
endscript


script Bail_Spin_CCW_Hard 
    GeneralBail {anim1 = Bail_Spin_CCW_Hard NoBlending Endpose = GetUp_HK_Ft
        intoairframe = 1 friction = 20 SmackAnim = Bail_Wall_FWD_Low
        BoardOffFrame = 10 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0
        sound = bail_knee1 FoleySound BloodFrame = 20
        GroundGoneBail = GroundGoneBail
        FallBlendPeriod = 1.500
        FallForwardAnims
    }
endscript


script Bail_Spin_CW_Hard_A 
    GeneralBail {anim1 = Bail_Spin_CW_Hard_A NoBlending Endpose = GetUp_HK_Ft
        intoairframe = 1 friction = 23 SmackAnim = Bail_Wall_FWD_Low
        BoardOffFrame = 5 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0
        sound = bail_knee1 FoleySound BloodFrame = 12
        GroundGoneBail = GroundGoneBail
        FallBlendPeriod = 1.500
        FallBackwardSlideAnims
    }
endscript


script Bail_Spin_CCW_Hard_B 
    GeneralBail {anim1 = Bail_Spin_CCW_Hard_B NoBlending Endpose = GetUp_HK_Ft
        intoairframe = 1 friction = 20 SmackAnim = Bail_Wall_RT_Low
        BoardOffFrame = 10 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0
        sound = bail_knee1 FoleySound BloodFrame = 25
        GroundGoneBail = GroundGoneBail
        FallBlendPeriod = 1.500
        FallForwardAnims
    }
endscript


script Bail_Spin_CCW_Hard_C 
    GeneralBail {anim1 = Bail_Spin_CCW_Hard_C NoBlending Endpose = GetUp_HK_Ft
        intoairframe = 1 friction = 13.50 SmackAnim = Bail_Wall_LT_Low
        BoardOffFrame = 2 BoardVel = (-30.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0
        sound = bail_knee1 FoleySound BloodFrame = 25
        GroundGoneBail = GroundGoneBail
        FallBlendPeriod = 1
        FallBackwardSlideAnims
    }
endscript


script Bail_Spin_CW_Hard_B 
    GeneralBail {anim1 = Bail_Spin_CW_Hard_B NoBlending Endpose = GetUp_HK_Rt
        intoairframe = 1 HeavyFriction = 10 friction = 10 Friction2 = 17.50 SmackAnim = Bail_Wall_FWD_Low
        BoardOffFrame = 2 BoardVel = (-30.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0
        sound = bail_knee1 FoleySound BloodFrame = 20
        GroundGoneBail = GroundGoneBail
        FallBlendPeriod = 1.500
        FallRightAnims
    }
endscript


script Bail_Spin_FWD_Regular 
    GeneralBail {anim1 = Bail_Spin_FWD_Regular NoBlending Endpose = GetUp_Sit_Ft
        intoairframe = 1 friction = 14 SmackAnim = Bail_Wall_FWD_Low
        BoardOffFrame = 10 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0
        sound = bail_knee1 FoleySound BloodFrame = 13
        GroundGoneBail = GroundGoneBail
        FallBlendPeriod = 1
        FallForwardAnims
    }
endscript


script Bail_Spin_FWD_Hard 
    GeneralBail {anim1 = Bail_Spin_FWD_Hard NoBlending Endpose = GetUp_HK_Ft
        intoairframe = 1 friction = 18 SmackAnim = Bail_Wall_FWD_Low
        BoardOffFrame = 10 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0
        sound = bail_knee1 FoleySound BloodFrame = 24
        GroundGoneBail = GroundGoneBail
        FallBlendPeriod = 1
        FallForwardAnims
    }
endscript


script Bail_Spin_FWD_Fast 
    GeneralBail {anim1 = Bail_Spin_FWD_Fast NoBlending Endpose = GetUp_HK_Lt
        intoairframe = 1 friction = 14 SmackAnim = Bail_Wall_FWD_Low
        BoardOffFrame = 10 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0
        sound = bail_knee1 FoleySound BloodFrame = 12
        GroundGoneBail = GroundGoneBail
        FallBlendPeriod = 1
        FallForwardAnims
    }
endscript


script Bail_Spin_BCK_Regular 
    GeneralBail {anim1 = Bail_Spin_BCK_Regular NoBlending Endpose = GetUp_HK_Bk
        intoairframe = 1 friction = 12 SmackAnim = Bail_Wall_FWD_Low
        BoardOffFrame = 10 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0
        sound = bail_knee1 FoleySound BloodFrame = 5
        GroundGoneBail = GroundGoneBail
        FallBlendPeriod = 0.3000
        FallBackwardSlideAnims
    }
endscript


script Bail_Spin_BCK_Hard 
    GeneralBail {anim1 = Bail_Spin_BCK_Hard NoBlending Endpose = GetUp_HK_Ft
        intoairframe = 1 friction = 19 SmackAnim = Bail_Wall_FWD_Low
        BoardOffFrame = 10 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0
        sound = bail_knee1 FoleySound BloodFrame = 10
        GroundGoneBail = GroundGoneBail
        FallBlendPeriod = 1
        FallBackwardSlideAnims
    }
endscript


script Bail_Spin_BCK_Fast 
    GeneralBail {anim1 = Bail_Spin_BCK_Fast NoBlending Endpose = GetUp_HK_Ft
        intoairframe = 1 Friction2 = 10 friction = 28 SmackAnim = Bail_Wall_FWD_Low
        BoardOffFrame = 10 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = -10
        sound = bail_knee1 FoleySound BloodFrame = 56
        GroundGoneBail = GroundGoneBail
        FallBlendPeriod = 1
        FallBackwardSlideAnims
    }
endscript


script Bail_Pitch_Back 
    
    GeneralBail {anim1 = Bail_Pitch_Back Endpose = GetUp_HK_Lt
        intoairframe = 1 friction = 100 SmackAnim = Bail_Wall_BCK_Low
        sound = Bail04 FoleySound NoBlending
        BoardOffFrame = 1 BoardVel = (25.0, 150.0, 0.0) BoardRotVel = (0.5, 3.0, 2.0) BoardSkaterVel = 0 BloodFrame = 8
        GroundGoneBail = GroundGoneBail
        FallBackwardSlideAnims
        dont_face_vel = <dont_face_vel>
    }
endscript


script Bail_Pitch_Tail 
    
    GeneralBail {anim1 = Bail_Pitch_Tail Endpose = GetUp_HK_Lt
        intoairframe = 1 friction = 100 SmackAnim = Bail_Wall_BCK_Regular
        sound = Bail04 FoleySound NoBlending
        BoardOffFrame = 1 BoardVel = (25.0, 150.0, 0.0) BoardRotVel = (0.5, 3.0, 2.0) BoardSkaterVel = 0 BloodFrame = 6
        GroundGoneBail = GroundGoneBail
        FallBackwardSlideAnims
    }
endscript


script Bail_Pitch_Face 
    
    GeneralBail {anim1 = Bail_Pitch_Face Endpose = GetUp_HK_Lt
        intoairframe = 1 BloodFrame = 5 SmackAnim = Bail_Wall_FWD_Low
        BoardOffFrame = 0 BoardVel = (0.0, 100.0, -300.0) BoardRotVel = (0.0, 5.0, 0.0) BoardSkaterVel = 1
        sound = bail_knee1 FoleySound NoBlending
        GroundGoneBail = GroundGoneBail
        FallForwardAnims
        dont_face_vel = <dont_face_vel>
    }
endscript


script Bail_Pitch_Nose 
    
    GeneralBail {anim1 = Bail_Pitch_Nose NoBlending Endpose = GetUp_HK_Lt
        intoairframe = 20 friction = 100 SmackAnim = Bail_Wall_FWD_Low
        BoardOffFrame = 1 BoardVel = (-100.0, 50.0, -250.0) BoardRotVel = (10.0, 2.0, -2.0) BoardSkaterVel = 1
        sound = BoardBail01 FoleySound BloodFrame = 4 NoBlending
        GroundGoneBail = GroundGoneBail
        FallForwardAnims
    }
endscript


script Nutsac 
    GeneralBail {anim1 = Nutsac NoBlending Endpose = GetUp_HK_Lt
        intoairframe = 1 friction = 20 SmackAnim = Bail_Wall_RT_Low
        BoardOffFrame = 43 BoardVel = (0.0, 50.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 1
        sound = bail_knee1 FoleySound
        GroundGoneBail = GroundGoneBail
        FallBlendPeriod = 1
        FallForwardAnims
    }
endscript


script Bail_Falling_FWD 
    GeneralBail {anim1 = Bail_Falling_FWD Endpose = GetUp_HK_Lt
        intoairframe = 26 ForceFall friction = 0 BloodFrame = 50 SmackAnim = Bail_Wall_BCK_Low sound = Bail04
        BoardOffFrame = 1 BoardVel = (-50.0, 20.0, 0.0) BoardRotVel = (0.0, 1.0, -1.0) BoardSkaterVel = 1
        FoleySound FallBlendPeriod = 0 SplatFriction = 20
        GroundGoneBail = GroundGoneBail
        FallForwardAnims
    }
endscript


script Bail_Falling_BCK 
    GeneralBail {anim1 = Bail_Falling_BCK Endpose = GetUp_HK_Bk
        intoairframe = 33 ForceFall friction = 0 BloodFrame = 50 SmackAnim = Bail_Wall_BCK_Low sound = Bail04
        BoardOffFrame = 1 BoardVel = (-50.0, 20.0, 0.0) BoardRotVel = (0.0, 1.0, -1.0) BoardSkaterVel = 1
        FoleySound FallBlendPeriod = 0 SplatFriction = 20
        GroundGoneBail = GroundGoneBail
        FallBackwardAnims
    }
endscript


script Bail_Falling_RT 
    GeneralBail {anim1 = Bail_Falling_RT Endpose = GetUp_HK_Rt
        intoairframe = 36 ForceFall friction = 0 BloodFrame = 50 SmackAnim = Bail_Wall_RT_Low sound = Bail04
        BoardOffFrame = 1 BoardVel = (-50.0, 20.0, 0.0) BoardRotVel = (0.0, 1.0, -1.0) BoardSkaterVel = 1
        FoleySound FallBlendPeriod = 0 SplatFriction = 20
        GroundGoneBail = GroundGoneBail
        FallRightAnims
    }
endscript


script Bail_Falling_LT 
    GeneralBail {anim1 = Bail_Falling_LT Endpose = GetUp_HK_Lt
        intoairframe = 16 ForceFall friction = 0 BloodFrame = 7 SmackAnim = Bail_Wall_LT_Low sound = Bail04
        BoardOffFrame = 1 BoardVel = (-50.0, 20.0, 0.0) BoardRotVel = (0.0, 1.0, -1.0) BoardSkaterVel = 1
        FoleySound FallBlendPeriod = 0 SplatFriction = 20
        GroundGoneBail = GroundGoneBail
        FallLeftAnims
    }
endscript


script Bail_Falling_Slide_BCK 
    GeneralBail {anim1 = Bail_Falling_Slide_BCK Endpose = GetUp_HK_Ft
        intoairframe = 28 ForceFall friction = 0 BloodFrame = 50 SmackAnim = Bail_Wall_BCK_Low sound = Bail04
        BoardOffFrame = 3 BoardVel = (-50.0, 20.0, 0.0) BoardRotVel = (0.0, 1.0, -1.0) BoardSkaterVel = 1
        FoleySound FallBlendPeriod = 0 SplatFriction = 20
        GroundGoneBail = GroundGoneBail
        FallBackwardSlideAnims
    }
endscript


script Bail_Falling_Slide_BCK_lt 
    GeneralBail {anim1 = Bail_Falling_Slide_LTb Endpose = GetUp_HK_Rt
        intoairframe = 26 ForceFall friction = 0 BloodFrame = 50 SmackAnim = Bail_Wall_LT_Low sound = Bail04
        BoardOffFrame = 1 BoardVel = (-50.0, 20.0, 0.0) BoardRotVel = (0.0, 1.0, -1.0) BoardSkaterVel = 1
        FoleySound FallBlendPeriod = 0 SplatFriction = 20
        GroundGoneBail = GroundGoneBail
        FallBackwardLeftAnims
    }
endscript


script Bail_Falling_Slide_BCK_rt 
    GeneralBail {anim1 = Bail_Falling_Slide_RTb Endpose = GetUp_HK_Rt
        intoairframe = 34 ForceFall friction = 0 BloodFrame = 50 SmackAnim = Bail_Wall_RT_Low sound = Bail04
        BoardOffFrame = 1 BoardVel = (-50.0, 20.0, 0.0) BoardRotVel = (0.0, 1.0, -1.0) BoardSkaterVel = 1
        FoleySound FallBlendPeriod = 0 SplatFriction = 20
        GroundGoneBail = GroundGoneBail
        FallBackwardRightAnims
    }
endscript


script Bail_Falling_Slide_FWD_lt 
    GeneralBail {anim1 = Bail_Falling_Slide_LTf Endpose = GetUp_HK_Lt
        intoairframe = 26 ForceFall friction = 0 BloodFrame = 50 SmackAnim = Bail_Wall_LT_Low sound = Bail04
        BoardOffFrame = 1 BoardVel = (-50.0, 20.0, 0.0) BoardRotVel = (0.0, 1.0, -1.0) BoardSkaterVel = 1
        FoleySound FallBlendPeriod = 0 SplatFriction = 20
        GroundGoneBail = GroundGoneBail
        FallForwardLeftAnims
    }
endscript


script Bail_Falling_Slide_FWD_rt 
    GeneralBail {anim1 = Bail_Falling_Slide_RTf Endpose = GetUp_HK_Lt
        intoairframe = 26 ForceFall friction = 0 BloodFrame = 50 SmackAnim = Bail_Wall_RT_Low sound = Bail04
        BoardOffFrame = 1 BoardVel = (-50.0, 20.0, 0.0) BoardRotVel = (0.0, 1.0, -1.0) BoardSkaterVel = 1
        FoleySound FallBlendPeriod = 0 SplatFriction = 20
        GroundGoneBail = GroundGoneBail
        FallForwardRightAnims
    }
endscript


script Bail_Nutter_FWD 
    GeneralBail {anim1 = Bail_Nutter_FWD Endpose = GetUp_HK_Ft intoairframe = 47 friction = 0 SmackAnim = Bail_Wall_FWD_Regular sound = Bail04
        BoardOffFrame = 5 BoardVel = (20.0, 0.0, 0.0) BoardRotVel = (0.0, 1.0, 1.0) BoardSkaterVel = 1
        FoleySound BonkSound
        GroundGoneBail = GroundGoneBail
        Nutter
    }
endscript


script Bail_Nutter_BCK 
    GeneralBail {anim1 = Bail_Nutter_BCK Endpose = GetUp_HK_Ft intoairframe = 37 friction = 0 SmackAnim = Bail_Wall_BCK_Regular sound = Bail04
        BoardOffFrame = 1 BoardVel = (20.0, 0.0, 0.0) BoardRotVel = (0.0, 1.0, 1.0) BoardSkaterVel = 1
        FoleySound BonkSound
        GroundGoneBail = GroundGoneBail
        FallBackwardSlideAnims
        Nutter
    }
endscript


script ManualBailSlow 
    GeneralBail {anim1 = Bail_Manual_BK Endpose = GetUp_Sit_Ft intoairframe = 30 friction = 20 NoBlending BloodFrame = 15 SmackAnim = Bail_Wall_BCK_Low sound = Bail04
        BoardOffFrame = 6 BoardVel = (0.0, 50.0, 400.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 1
        GroundGoneBail = GroundGoneBail
        FallBlendPeriod = 1
        FallBackwardAnims
    }
endscript


script ManualBailFast 
    GeneralBail {anim1 = Bail_Manual_BK_fast Endpose = GetUp_HK_Ft intoairframe = 30 NoBlending friction = 5 BloodFrame = 15 SmackAnim = Bail_Wall_BCK_Low sound = Bail04
        BoardOffFrame = 6 BoardVel = (0.0, 50.0, 400.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 1
        GroundGoneBail = GroundGoneBail
        FallBlendPeriod = 1.500
        FallForwardAnims
    }
endscript


script NoseManualBailSlow 
    GeneralBail {anim1 = Bail_Manual_FT Endpose = GetUp_HK_Ft intoairframe = 30 NoBlending friction = 10 BloodFrame = 13 SmackAnim = Bail_Wall_FWD_Regular sound = BoardBail01
        BoardOffFrame = 10 BoardVel = (0.0, 50.0, -400.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0
        GroundGoneBail = GroundGoneBail
        FallBlendPeriod = 1.500
        FallForwardAnims
    }
endscript


script NoseManualBailFast 
    GeneralBail {anim1 = Bail_Manual_FT_fast Endpose = GetUp_HK_Lt intoairframe = 30 NoBlending friction = 10 BloodFrame = 15 SmackAnim = Bail_Wall_FWD_Regular sound = BoardBail01
        BoardOffFrame = 10 BoardVel = (0.0, 50.0, -400.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0
        GroundGoneBail = GroundGoneBail
        FallBlendPeriod = 1.500
        FallForwardAnims
    }
endscript


script Trolley_BailB 
    GeneralBail {anim1 = Trolley_BailB BoardOffFrame = 11 Anim2 = GetUpForwards intoairframe = 20 friction = 15 SmackAnim = Bail_Wall_FWD_Regular
        sound = BoardBail01 FoleySound BloodFrame = 20
        FallBlendPeriod = 1.500
        FallForwardAnims
    }
endscript


script GurneyBail 
    GeneralBail {anim1 = Bail_Manual_BK Endpose = GetUp_Sit_Ft intoairframe = 30 friction = 20 NoBlending BloodFrame = 15 SmackAnim = Bail_Wall_BCK_Low sound = Bail04
        BoardOffFrame = 1 BoardVel = (0.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 1 Gurney = Gurney
        GroundGoneBail = GroundGoneBail
        FallBlendPeriod = 1
        FallBackwardAnims
    }
endscript


script GeneralBail friction = 18 Friction2 = 20 HeavyFriction = 100
    obj_gettype
    if (<ObjType> = object_type_ped)
        goto Ped_Skater_BeginBail params = <...> 
        return 
    endif
    obj_setboundingsphere 100
    if GotParam UnrotateBoardFirst
        if BoardIsRotated
            boardrotate
        endif
    endif
    if GotParam NoBailBoard
        NoBailBoard = 1
    endif
    nollieoff
    pressureoff
    KillSpecial
    created_trick_cleanup
    if NOT GotParam NoScuff
        PlaySkaterStream type = 'bail'
    endif
    inbail
    LaunchStateChangeEvent state = Skater_InBail
    setextrapush Radius = 48 Speed = 100 rotate = 6
    if NOT GotParam dont_face_vel
        turntofacevelocity
    endif
    if NOT GotParam BoardAlwaysOn
        if NOT (nobails = 1)
            obj_spawnscript BailBoardControl params = {BoardOffFrame = <BoardOffFrame> BoardVel = <BoardVel> BoardRotVel = <BoardRotVel> BoardSkaterVel = <BoardSkaterVel> NoBailBoard = <NoBailBoard> Gurney = <Gurney>}
        endif
    endif
    SparksOff
    VibrateOff
    ClearExceptions
    disableplayerinput AllowCameraControl
    BailSkaterTricks
    stopbalancetrick
    SetException Ex = CarBail scr = CarBail
    if (nobails = 1)
        goto Baildone
    endif
    if GotParam Endpose
        SetCurrentBailEndpose <Endpose>
    else
        SetCurrentBailEndpose
    endif
    if GotParam GroundGoneBail
        SetException Ex = GroundGone scr = <GroundGoneBail> params = { <...>  }
    endif
    if GotParam SmackAnim
        SetException Ex = FlailHitWall scr = BailSmack params = { SmackAnim = <SmackAnim> }
        SetException Ex = FlailLeft scr = BailSmack params = { SmackAnim = <SmackAnim> }
        SetException Ex = FlailRight scr = BailSmack params = { SmackAnim = <SmackAnim> }
    endif
    if InSlapGame
        SetException Ex = SkaterCollideBail scr = SkaterCollideBail
    else
        if GameModeEquals is_firefight
            seteventhandler Ex = SkaterCollideBail scr = Bail_FireFight_SkaterCollideBail
        endif
    endif
    if GotParam sound
    else
        playbonksound
    endif
    if GotParam NoBlending
        PlayAnim anim = <anim1> norestart BlendPeriod = 0.0
    else
        PlayAnim anim = <anim1> norestart BlendPeriod = 0.3000
    endif
    if NOT InSplitScreenGame
        if NOT GetGlobalFlag flag = TAP_BUTTONS_EXPLAINED
            create_panel_message {text = 'Tip: tap buttons to get up faster'
                id = skater_hint
                style = skater_hint_style
                Pos = (320.0, 170.0)
                rgba = [ 32 75 102 100 ]
            }
            SetGlobalFlag flag = TAP_BUTTONS_EXPLAINED
        endif
    endif
    if onrail
        obj_spawnscript FallOffRail params = {xmove = <xmove> moveframes = <moveframes>}
        waitanim <intoairframe> frames
        ClearException GroundGone
        vibrate actuator = 1 percent = 100 duration = 0.2000
        if GotParam BonkSound
            playbonksound
        endif
        if GotParam Nutter
            GetSidewaysVector
            setspeed 0
            begin 
            if NOT onrail
                setstate Air
                goto GroundGoneBail params = { <...>  }
            endif
            wait 1 gameframe
            repeat 20
            if Flipped
                boost = -100
            else
                boost = 100
            endif
            SetSkaterVelocity vel_x = (<vel_x> * <boost>)vel_y = <vel_y> vel_z = (<vel_z> * <boost>)
        endif
        setstate Air
        move y = 2.0
        rotate y = randomrange (1.0, 20.0)
        if GotParam ForceFall
            goto GroundGoneBail params = { <...>  }
        endif
    endif
    WaitOnGround
    if NOT GetGlobalFlag flag = BLOOD_OFF
        if NOT GotParam NoScuff
            Scuff_skater
        endif
        if GotParam BloodFrame
            waitanim frame <BloodFrame>
            obj_spawnscript BloodSmall
            playsound Random (@ hitblood01 @ hitblood02 @ hitblood03)
        endif
    endif
    vibrate actuator = 1 percent = 100 duration = 0.2000
    setrollingfriction <HeavyFriction>
    if GotParam HitBody
        SpawnScript HitBody params = { <...>  }
    endif
    if NOT GotParam BashOff
        BashOn
        if NOT GoalManager_GoalShouldExpire
            TantrumOn
        endif
    endif
    wait 3 frames
    setrollingfriction <friction>
    waitanim 30 percent
    SpeedCheckStop
    setrollingfriction <Friction2>
    waitanim 50 percent
    SpeedCheckStop
    if GotParam BoardEarlyOn
        boardrotate normal
        SwitchOnBoard
    endif
    waitanim 75 percent
    SpeedCheckStop
    if GotParam FoleySound
    endif
    Obj_WaitAnimFinished
    SpeedCheckStop
    NoQuickGetup
    if GotParam Endpose
        gettags
        if GotParam waitfortantrum
            removetags tags = [ waitfortantrum ]
            return 
        endif
        
        TantrumOff
        goto <Endpose>
    endif
    goto Baildone
endscript


script GetSidewaysVector 
    GetSkaterVelocity
    if NOT (<vel_x> = 0)
        atan ((<vel_z> * 1.0)/ (<vel_x> * 1.0))
        Angle = <atan>
        sin (90.0 - <Angle>)
        new_z = <sin>
        cos (90.0 - <Angle>)
        new_x = <cos>
    else
        if NOT (<vel_z> = 0)
            new_z = 0.0
            new_x = 1.0
        else
            new_z = 0.0
            new_x = 0.0
        endif
    endif
    
    return {vel_z = <new_z> vel_x = <new_x> vel_y = <vel_y>}
endscript


script bail_quick_getup 
    obj_spawnscript bail_quick_getup2
endscript


script bail_quick_getup2 
    setrollingfriction 20
    Obj_WaitAnimFinished
    GetCurrentBailEndpose
    if NOT (<current_bail_endpose> = None)
        SetCurrentBailEndpose
        MakeSkaterGoto <current_bail_endpose> params = { quick = true }
    endif
endscript


script TantrumOn 
    enableinputevents
    obj_spawnscript TantrumCheck
endscript

TANTRUM_PRESSES = 0

script TantrumCheck presses = 0 triangle = 0
    if (GetGlobalFlag flag = TANTRUM_OFF)
        return 
    endif
    root_window ::getsingletag menu_state
    if (<menu_state> = on)
        return 
    endif
    max = 0
    count = 0
    total = 0
    spazzfactor = 0
    got_button = 0
    GetCurrentBailEndpose
    if (<current_bail_endpose> = None)
        return 
    endif
    tantrum_draw_meter
    OnExitRun kill_tantrum_meter
    min_spaz = 5
    max_spaz = 10
    tantrum_draw_and_update_spazzfactors min = <min_spaz> max = <max_spaz>
    cleared_bash = 0
    begin 
    last_spazzfactor = <spazzfactor>
    GetSpazzFactor
    if NOT (<last_spazzfactor> = <spazzfactor>)
        tantrum_meter_update_tags spazzfactor = <spazzfactor>
    endif
    if Held triangle
        if NOT (<got_button> = 1)
            tantrum_meter_maybe_play_sound
            got_button = 1
        endif
        if (<cleared_bash> = 0)
            BashOff
            cleared_bash = 1
        endif
    else
        got_button = 0
    endif
    count = (<count> + 1)
    total = (<total> + <spazzfactor>)
    average = ((<total> * 1.0)/ (<count> * 1.0))
    tantrum_update_meter current = (<average> * 2.0)max = <max_spaz>
    if (<spazzfactor> > <max>)
        max = <spazzfactor>
        ShakeCamera {duration = 0.1000
            vert_amp = 3.0
            horiz_amp = 2.0
            vert_vel = 5
            horiz_vel = 5
        }
    endif
    if ((<average> * 2.0)> <max_spaz>)
        settags waitfortantrum = 1
        tantrum_update_meter current = (<average> * 2.0)max = <max_spaz> maxedOut
        WaitAnimFinished
        break 
    endif
    if animfinished
        break 
    endif
    wait 1 gameframe
    repeat 
    final_spazz = (<average> * 2.0)
    GetHighestTantrumReached spazzfactor = <final_spazz>
    if (<final_spazz> > <max_spaz>)
        if SkaterLastScoreLandedGreaterThan 100000
        endif
    endif
    if NOT (<tantrum> < 0)
        goto TantrumStart params = { spazzfactor = <tantrum> }
    endif
endscript


script kill_tantrum_meter 
    tantrum_draw_meter Die
endscript


script TantrumStart 
    
    BashOff
    removetags tags = [ waitfortantrum ]
    if NOT IsStreamPlaying tantrum_stream
    endif
    SpawnSound ALL_SFX_Wait_Before_Tantrum_Stream
    if NOT IsStreamPlaying SK6_Teapot_Sign_Whistle
        PlayStream SK6_Teapot_Sign_Whistle vol = 50 priority = StreamPriorityHigh
    endif
    ShakeCamera {duration = 0.5000
        vert_amp = 10.0
        horiz_amp = 10.0
        vert_vel = 5
        horiz_vel = 5
    }
    SetSkaterCamOverride heading = 2 tilt = -0.3000 time = 1 Zoom = 1.300
    playsound GotStat04 pitch = 80 vol = 500
    if SkaterLastScoreLandedLessThan 5000
        maxscore = 2000.0
        minscore = 1000.0
    else
        maxscore = 3500.0
        minscore = 2000.0
    endif
    if (<spazzfactor> = 99)
        GetArraySize tantrum_array
        rank = (tantrum_array [(<array_size> -1)].spazzfactor)
    else
        rank = <spazzfactor>
    endif
    Score = (<minscore> + ((<rank> / 5.0)* (<maxscore> - <minscore>)))
    CastToInteger Score
    SetTrickScore <Score>
    SetTrickName (spazz_out_text)
    display Blockspin
    SkaterGetScoreInfo
    if (<ScorePot> > 3000)
        ForceSpecial
    endif
    GetCurrentBailEndpose
    if NOT (<current_bail_endpose> = None)
        SetCurrentBailEndpose
        MakeSkaterGoto <current_bail_endpose> params = {tantrum = true spazzfactor = <spazzfactor> Score = <ScorePot>}
    endif
endscript


script tantrum_maybe_force_land 
    obj_spawnscript tantrum_maybe_force_land2 params = { Score = <Score> }
endscript


script tantrum_maybe_force_land2 
    begin 
    if currentscorepotgreaterthan <Score>
        return 
    endif
    if DoingTrick
        return 
    endif
    wait 1 gameframe
    repeat 120
    LandSkaterTricks
endscript


script TantrumOff 
    obj_getid
    TerminateObjectsScripts id = <ObjID> script_name = TantrumCheck
    ClearSkaterCamOverride
    tantrum_draw_meter Die
endscript


script GetUp_HK_Ft 
    
    NoQuickGetup
    if GotParam quick
        
        goto startskate params = {quick = GetUp_HK_Ft_Q rolling_Fr = 3 wait_percent = 50}
    endif
    if GotParam tantrum
        Choose_Tantrum Getup = Ft spazzfactor = <spazzfactor> Score = <Score>
    endif
    
    PlayAnim anim = GetUp_HK_Ft BlendPeriod = 0.0
    Obj_WaitAnimFinished
    goto startskate
endscript


script GetUp_HK_Bk 
    
    NoQuickGetup
    if GotParam quick
        
        goto startskate params = {quick = GetUp_HK_Bk_Q rolling_Fr = 3 wait_percent = 50}
    endif
    if GotParam tantrum
        Choose_Tantrum Getup = Bk spazzfactor = <spazzfactor> Score = <Score>
    endif
    
    PlayAnim anim = GetUp_HK_Bk BlendPeriod = 0.0
    Obj_WaitAnimFinished
    goto startskate
endscript


script GetUp_HK_Rt 
    
    NoQuickGetup
    if GotParam quick
        
        goto startskate params = {quick = GetUp_HK_Rt_Q rolling_Fr = 3 wait_percent = 50}
    endif
    if GotParam tantrum
        Choose_Tantrum Getup = RT spazzfactor = <spazzfactor> Score = <Score>
    else
        
        PlayAnim anim = GetUp_HK_Rt BlendPeriod = 0.0
        Obj_WaitAnimFinished
        goto startskate
    endif
endscript


script GetUp_HK_Lt 
    
    NoQuickGetup
    if GotParam quick
        
        goto startskate params = {quick = GetUp_HK_Lt_Q rolling_Fr = 3 wait_percent = 50}
    endif
    if GotParam tantrum
        Choose_Tantrum Getup = LT spazzfactor = <spazzfactor> Score = <Score>
    else
        
        PlayAnim anim = GetUp_HK_Lt BlendPeriod = 0.0
        Obj_WaitAnimFinished
        goto startskate
    endif
endscript


script GetUp_Sit_Ft 
    
    NoQuickGetup
    if GotParam quick
        
        goto startskate params = {quick = GetUp_Sit_Ft_Q rolling_Fr = 3 wait_percent = 50}
    endif
    if GotParam tantrum
        Choose_Tantrum Getup = Sit_Ft spazzfactor = <spazzfactor> Score = <Score>
    else
        
        PlayAnim anim = GetUp_Sit_Ft BlendPeriod = 0.0
        Obj_WaitAnimFinished
        goto startskate
    endif
endscript

StartSkateExceptionTable = [
    {exception Ex = FlailHitWall scr = FlailHitWall}
    {exception Ex = GroundGone scr = BailGroundGone}
]

script startskate 
    
    NoQuickGetup
    TantrumOff
    ExitTantrum
    SwitchOnBoard
    boardrotate normal
    if ObjectExists id = BurnMoFo
        BurnMoFo ::unhide
    endif
    if ObjectExists id = SmokeyMoFo
        SmokeyMoFo ::unhide
    endif
    OnExceptionRun
    ResetEventHandlersFromTable StartSkateExceptionTable
    if IsFacingWall
        
        Wall = 1
        gotoBrake = gotoBrake
    else
        if obj_getcollision side height = 3 Length = 3
            
            Wall = 1
            gotoBrake = gotoBrake
        endif
    endif
    if NOT obj_getcollision down distance = 6 height = 1 Length = 3
        
        Drop = 1
        gotoBrake = gotoBrake
    endif
    if ControllerPressed down
        
        PlayAnim anim = GetUp_S_NoPushOff BlendPeriod = 0.1000
        rolling_Fr = 100
        enableplayerinput
        gotoBrake = gotoBrake
    else
        if GotParam quick
            
            PlayAnim anim = <quick> BlendPeriod = 0.0
            wait_percent = <wait_percent>
            rolling_Fr = <rolling_Fr>
        else
            if GotParam Wall
                PlayAnim anim = GetUp_S_NoPushOff BlendPeriod = 0.0
                rolling_Fr = 15
                wait_percent = 66
            else
                if GotParam Drop
                    PlayAnim anim = GetUp_S_NoPushOff BlendPeriod = 0.0
                    rolling_Fr = 15
                else
                    if IsFacingVert
                        
                        PlayAnim anim = GetUp_S_RunJump BlendPeriod = 0.0
                        wait_percent = 30
                        rolling_Fr = 6
                    else
                        
                        RandomNoRepeat (
                            @ PlayAnim anim = GetUp_S_RunJump BlendPeriod = 0.0
                            wait_percent = 40
                            rolling_Fr = 6
                            @ PlayAnim anim = GetUp_S_BoardFlip1 BlendPeriod = 0.0
                            wait_percent = 95
                            rolling_Fr = 6
                            @ PlayAnim anim = GetUp_S_BoardCatch1 BlendPeriod = 0.0
                            wait_percent = 66
                            rolling_Fr = 6
                        )
                    endif
                endif
            endif
        endif
    endif
    if GotParam wait_percent
        
        waitanim <wait_percent> percent
        
    else
        if GotParam wait_frames
            animfinished_or_waitedframes frames = <wait_frames>
        else
            Obj_WaitAnimFinished
        endif
    endif
    if GotParam rolling_Fr
        
        setrollingfriction <rolling_Fr>
    else
        setrollingfriction default
    endif
    VibrateOff
    enableplayerinput
    Obj_WaitAnimFinished
    if GotParam tantrum_score
        tantrum_maybe_force_land Score = <tantrum_score>
    endif
    goto Baildone params = { gotoBrake = <gotoBrake> }
endscript


script animfinished_or_waitedframes 
    begin 
    if animfinished
        break 
    endif
    wait 1 gameframe
    repeat <frames>
endscript


script Choose_Tantrum 
    
    EnterTantrum
    if NOT GotParam spazzfactor
        
        return 
    endif
    switch <Getup>
        case Ft
        anim1 = GetUp_HK_Ft
        Anim2 = GetUp_HK_Ft_T
        case Bk
        anim1 = GetUp_HK_Bk
        Anim2 = GetUp_HK_Bk_T
        case RT
        anim1 = GetUp_HK_Rt
        Anim2 = GetUp_HK_Rt_T
        case LT
        anim1 = GetUp_HK_Lt
        Anim2 = GetUp_HK_Lt_T
        case Sit_Ft
        anim1 = GetUp_Sit_Ft
        Anim2 = GetUp_Sit_Ft_T
        default 
        
    endswitch
    
    if (<spazzfactor> > 1)
        SwitchOnBoard
        PlayAnim anim = <Anim2> BlendPeriod = 0.0
    else
        PlayAnim anim = <anim1> BlendPeriod = 0.0
    endif
    Obj_WaitAnimFinished
    SwitchOnBoard
    boardrotate normal
    if (<spazzfactor> = 99)
        goto Random (@ skaterExplode @ skaterLoseHead) params = { Score = <Score> }
    else
        if StructureContains structure = (tantrum_array [ <spazzfactor> ])name
            goto ((tantrum_array [ <spazzfactor> ]).name)params = { Score = <Score> }
        endif
    endif
endscript

tantrum_array = [{ name = KickBoard }
    { name = BoardFocus }
    { name = Slingshot }
    { name = DiscusThrow }
    { name = PileDriver }
    { name = HeadButt }
]

script DiscusThrow 
    PlayAnim anim = Tantrum_DiscusStart BlendPeriod = 0.0
    Obj_WaitAnimFinished
    PlayAnim anim = Tantrum_DiscusFinish BlendPeriod = 0.0
    obj_spawnscript BailBoardControl params = {BoardOffFrame = 38 BoardVel = (0.0, 500.0, 1000.0) BoardRotVel = (0.0, 15.0, 0.0) BoardSkaterVel = 0 tantrum = tantrum}
    Obj_WaitAnimFinished
    goto startskate params = { tantrum_score = <Score> }
endscript


script HeadButt 
    if SkaterIsNamed chainsawskater
        goto DiscusThrow params = <...> 
        return 
    endif
    PlayAnim anim = Tantrum_HeadButt BlendPeriod = 0.0
    Obj_WaitAnimFinished
    goto startskate params = { tantrum_score = <Score> }
endscript


script PileDriver 
    if SkaterIsNamed chainsawskater
        goto Slingshot params = <...> 
        return 
    endif
    PlayAnim anim = Tantrum_PileDriver BlendPeriod = 0.0
    Obj_WaitAnimFinished
    goto startskate params = { tantrum_score = <Score> }
endscript


script Slingshot 
    PlayAnim anim = Tantrum_SlingShot BlendPeriod = 0.0
    if Flipped
        obj_spawnscript BailBoardControl params = {BoardOffFrame = 42 BoardVel = (-800.0, 400.0, -600.0) BoardRotVel = (10.0, 0.0, 0.0) BoardSkaterVel = 0 tantrum = tantrum}
    else
        obj_spawnscript BailBoardControl params = {BoardOffFrame = 42 BoardVel = (800.0, 400.0, -600.0) BoardRotVel = (-10.0, 0.0, 0.0) BoardSkaterVel = 0 tantrum = tantrum}
    endif
    Obj_WaitAnimFinished
    goto startskate params = { tantrum_score = <Score> }
endscript


script BoardFocus 
    if SkaterIsNamed chainsawskater
        goto KickBoard params = <...> 
        return 
    endif
    PlayAnim anim = Tantrum_BoardFocus BlendPeriod = 0.0
    Obj_WaitAnimFinished
    goto startskate params = { tantrum_score = <Score> }
endscript


script KickBoard 
    PlayAnim anim = Tantrum_KickBoard BlendPeriod = 0.0
    wait 50 gameframes
    obj_spawnscript BailBoardControl params = {BoardOffFrame = 0 BoardVel = (0.0, 500.0, 1000.0) BoardRotVel = (0.0, 15.0, -10.0) BoardSkaterVel = 0 tantrum = tantrum}
    Obj_WaitAnimFinished
    goto startskate params = { tantrum_score = <Score> }
endscript


script skaterExplode 
    PlayAnim anim = WStandIdle1 Speed = 2.0
    Obj_WaitAnimFinished
    obj_spawnscript BailBoardControl params = {BoardOffFrame = 0 BoardVel = (0.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0 tantrum = tantrum}
    make_skater_explode
    obj_getid
    MangleChecksums a = TantrumBoard b = <ObjID>
    if ObjectExists id = <mangled_id>
        <mangled_id> ::Die
    endif
    goto startskate params = { tantrum_score = <Score> }
endscript


script skaterLoseHead 
    if SkaterIsNamed chainsawskater
        goto skaterExplode params = <...> 
        return 
    endif
    PlayAnim anim = Tantrum_HeadButt
    waitanim 22 percent
    obj_spawnscript BailBoardControl params = {BoardOffFrame = 0 BoardVel = (0.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0 tantrum = tantrum}
    make_skater_lose_head
    obj_getid
    MangleChecksums a = TantrumBoard b = <ObjID>
    if ObjectExists id = <mangled_id>
        <mangled_id> ::Die
    endif
    goto startskate params = { tantrum_score = <Score> }
endscript


script FallOffRail xmove = 5 moveframes = 0
    begin 
    if Flipped
        Length = (<xmove> / 12)
    else
        Length = (-1 * (<xmove> / 12))
    endif
    if NOT obj_getcollision height = 3 Length = <Length> side
        if NOT obj_getcollision height = 0.5000 Length = <Length> side
            break 
        endif
    endif
    xmove = (<xmove> / 2)
    if (12 > <xmove>)
        return 
    endif
    repeat 
    movetime = (<moveframes> * 1.0)
    if (<moveframes> > 0)
        slicedmove = (<xmove> / <movetime>)
        if NOT Flipped
            slicedmove = (<slicedmove> * -1.0)
        endif
        begin 
        move x = <slicedmove>
        wait 1 frame
        repeat <moveframes>
    else
        move x = <xmove>
    endif
endscript


script Scuff_skater 
    <scuffspot> = randomrange (0.0, 4.0)
    if (<scuffspot> > 3)
    else
        if (<scuffspot> = 3)
            Scuff_DoReplacement src = 'CS_NH_scar_armR.png' scuffspot = <scuffspot>
        else
            if (<scuffspot> = 2)
                Scuff_DoReplacement src = 'CS_NH_scar_armL.png' scuffspot = <scuffspot>
            else
                if (<scuffspot> = 1)
                    Scuff_DoReplacement src = 'CS_NH_scar_legR.png' src2 = 'CS_NH_scuff_legR.png' scuffspot = <scuffspot>
                else
                    Scuff_DoReplacement src = 'CS_NH_scar_legL.png' src2 = 'CS_NH_scuff_legL.png' scuffspot = <scuffspot>
                endif
            endif
        endif
    endif
endscript


script Scuff_DoReplacement leftknee = 0 rightknee = 0 rightelbow = 0 leftelbow = 0
    gettags
    switch <scuffspot>
        case 0
        leftknee = (<leftknee> + 1)
        bailcount = <leftknee>
        case 1
        rightknee = (<rightknee> + 1)
        bailcount = <rightknee>
        case 2
        leftelbow = (<leftelbow> + 1)
        bailcount = <leftelbow>
        case 3
        rightelbow = (<rightelbow> + 1)
        bailcount = <rightelbow>
    endswitch
    settags leftknee = <leftknee> rightknee = <rightknee> leftelbow = <leftelbow> rightelbow = <rightelbow>
    if GetGlobalFlag flag = CHEAT_SUPER_BLOOD
        bailcount = (<bailcount> + 5)
    endif
    if GotParam src2
        if (<bailcount> > 4)
            obj_replacetexture src = <src> dest = 'textures/scuffs/CS_NH_scar_06'
        else
            if (<bailcount> > 10)
                obj_replacetexture src = <src> dest = 'textures/scuffs/CS_NH_scar_05'
            else
                if (<bailcount> > 9)
                    obj_replacetexture src = <src> dest = 'textures/scuffs/CS_NH_scar_04'
                    obj_replacetexture src = <src2> dest = 'textures/scuffs/CS_NH_scuff_05'
                else
                    if (<bailcount> > 7)
                        obj_replacetexture src = <src> dest = 'textures/scuffs/CS_NH_scar_03'
                    else
                        if (<bailcount> > 6)
                            obj_replacetexture src = <src2> dest = 'textures/scuffs/CS_NH_scar_02'
                        else
                            if (<bailcount> > 5)
                                obj_replacetexture src = <src2> dest = 'textures/scuffs/CS_NH_scuff_04'
                                obj_replacetexture src = <src> dest = 'textures/scuffs/CS_NH_scar_01'
                            else
                                if (<bailcount> > 3)
                                    obj_replacetexture src = <src2> dest = 'textures/scuffs/CS_NH_scuff_03'
                                else
                                    if (<bailcount> > 1)
                                        obj_replacetexture src = <src2> dest = 'textures/scuffs/CS_NH_scuff_02'
                                    else
                                        obj_replacetexture src = <src2> dest = 'textures/scuffs/CS_NH_scuff_01'
                                    endif
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
    else
        if (<bailcount> > 11)
            obj_replacetexture src = <src> dest = 'textures/scuffs/CS_NH_scar_06'
        else
            if (<bailcount> > 9)
                obj_replacetexture src = <src> dest = 'textures/scuffs/CS_NH_scar_05'
            else
                if (<bailcount> > 7)
                    obj_replacetexture src = <src> dest = 'textures/scuffs/CS_NH_scar_04'
                else
                    if (<bailcount> > 5)
                        obj_replacetexture src = <src> dest = 'textures/scuffs/CS_NH_scar_03'
                    else
                        if (<bailcount> > 3)
                            obj_replacetexture src = <src> dest = 'textures/scuffs/CS_NH_scar_02'
                        else
                            obj_replacetexture src = <src> dest = 'textures/scuffs/CS_NH_scar_01'
                        endif
                    endif
                endif
            endif
        endif
    endif
endscript


script CleanUp_Scuffs 
    obj_replacetexture src = 'CS_NH_scar_armR.png' dest = 'textures/scuffs/CS_NH_scar_armR'
    obj_replacetexture src = 'CS_NH_scar_armL.png' dest = 'textures/scuffs/CS_NH_scar_armL'
    obj_replacetexture src = 'CS_NH_scar_legR.png' dest = 'textures/scuffs/CS_NH_scar_legR'
    obj_replacetexture src = 'CS_NH_scar_legL.png' dest = 'textures/scuffs/CS_NH_scar_legL'
    obj_replacetexture src = 'CS_NH_scuff_legR.png' dest = 'textures/scuffs/CS_NH_scuff_legR'
    obj_replacetexture src = 'CS_NH_scuff_legL.png' dest = 'textures/scuffs/CS_NH_scuff_legL'
    obj_replacetexture src = 'CS_NN_board_trans01.png' dest = 'textures/scuffs/CS_NN_board_trans01'
    settags leftknee = 0 rightknee = 0 rightelbow = 0 leftelbow = 0
endscript


script DoBoardScuff 
    switch <boardscuff>
        case 10
        obj_replacetexture src = 'CS_NN_board_trans01.png' dest = 'textures/scuffs/CS_NN_boardscuff_01'
        case 20
        obj_replacetexture src = 'CS_NN_board_trans01.png' dest = 'textures/scuffs/CS_NN_boardscuff_02'
        case 30
        obj_replacetexture src = 'CS_NN_board_trans01.png' dest = 'textures/scuffs/CS_NN_boardscuff_03'
        case 40
        obj_replacetexture src = 'CS_NN_board_trans01.png' dest = 'textures/scuffs/CS_NN_boardscuff_04'
        default 
    endswitch
endscript


script BailBoardControl BoardOffFrame = 5
    wait <BoardOffFrame> frames
    SwitchOffBoard
    if ObjectExists id = BurnMoFo
        BurnMoFo ::hide
    endif
    if ObjectExists id = SmokeyMoFo
        SmokeyMoFo ::hide
    endif
    if NOT GotParam NoBailBoard
        CreateBailBoard vel = <BoardVel> rotvel = <BoardRotVel> object_vel_factor = <BoardSkaterVel> Gurney = <Gurney> tantrum = <tantrum>
    endif
endscript


script SpeedCheckStop 
    if speedlessthan 300
        setrollingfriction 100
    endif
endscript


script HitBody hitbodyframe = 15
    wait <hitbodyframe> frames
endscript


script BailSmack SmackAnim = Bail_Wall_FWD_Regular SmackFriction = 55
    
    if InSlapGame
        SetException Ex = SkaterCollideBail scr = SkaterCollideBail
    else
        if GameModeEquals is_firefight
            seteventhandler Ex = SkaterCollideBail scr = Bail_FireFight_SkaterCollideBail
        endif
    endif
    SwitchOffBoard
    setrollingfriction <SmackFriction>
    PlayAnim anim = <SmackAnim> BlendPeriod = 0.1000
    obj_spawnscript BloodTiny
    vibrate actuator = 1 percent = 100 duration = 0.2000
    Obj_WaitAnimFinished
    switch <SmackAnim>
        case Bail_Wall_FWD_Regular
        
        goto GetUp_Sit_Ft
        case Bail_Wall_FWD_Low
        
        goto GetUp_HK_Rt
        case Bail_Wall_BCK_Regular
        
        goto GetUp_HK_Bk
        case Bail_Wall_BCK_Low
        
        goto GetUp_HK_Bk
        case Bail_Wall_LT_Low
        
        goto GetUp_HK_Lt
        case Bail_Wall_RT_Low
        
        goto GetUp_HK_Rt
    endswitch
    
    if animequals Smackwall
        PlayAnim anim = GetUpFaceSmash BlendPeriod = 0.1000
    else
        if animequals Smackwallupright
            PlayAnim anim = GetUpBackwards BlendPeriod = 0.1000
        else
            PlayAnim anim = GetUpFacing BlendPeriod = 0.1000
        endif
    endif
    setrollingfriction 15
    waitanim 80 percent
    SwitchOnBoard
    boardrotate normal
    Obj_WaitAnimFinished
    goto Baildone
endscript


script GroundGoneBail SplatFriction = 100 FallBlendPeriod = 0.3000
    if NOT GotParam AnimFall1
        AnimFall1 = Bail_Falling_Idle_FWD
    endif
    if NOT GotParam AnimFall2
        AnimFall2 = Bail_Falling_Hit_Med_FWD
    endif
    inbail
    ClearExceptions
    if InSlapGame
        SetException Ex = SkaterCollideBail scr = SkaterCollideBail
    else
        if GameModeEquals is_firefight
            seteventhandler Ex = SkaterCollideBail scr = Bail_FireFight_SkaterCollideBail
        endif
    endif
    disableplayerinput AllowCameraControl
    setextrapush Radius = 48 Speed = 100 rotate = 6
    SwitchOffBoard
    PlayAnim anim = <AnimFall1> norestart BlendPeriod = <FallBlendPeriod>
    begin 
    if animfinished
        PlayAnim anim = <AnimFall1> pingpong from = end to = 20 Speed = 0.5000 BlendPeriod = 0.1000
    endif
    if OnGround
        break 
    endif
    WaitOneGameFrame
    repeat 
    vibrate actuator = 1 percent = 100 duration = 0.2000
    setrollingfriction <SplatFriction>
    if airtimelessthan 0.8500 second
        
        PlayAnim anim = <AnimFall2> norestart BlendPeriod = 0.1000
        vibrate actuator = 1 percent = 100 duration = 0.2000
        if NOT GetGlobalFlag flag = BLOOD_OFF
            if GotParam splatBloodFrame
                waitanim frame <splatBloodFrame>
            endif
            obj_spawnscript BloodSmall
            playsound Random (@ hitblood01 @ hitblood02 @ hitblood03)
        endif
    else
        
        if GotParam AnimFall2Hard
            PlayAnim anim = <AnimFall2Hard> norestart BlendPeriod = 0.1000
        else
            PlayAnim anim = <AnimFall2> norestart BlendPeriod = 0.1000
        endif
        vibrate actuator = 1 percent = 100 duration = 0.3000
        if NOT GetGlobalFlag flag = BLOOD_OFF
            if GotParam splatBloodFrame
                waitanim frame <splatBloodFrame>
            endif
            obj_spawnscript BloodSmall
            playsound Random (@ hitblood01 @ hitblood02 @ hitblood03)
        endif
    endif
    BashOn
    if GotParam AnimFallEnd
        Obj_WaitAnimFinished
        goto <AnimFallEnd>
    endif
    if GotParam AnimFall3
        
        Obj_WaitAnimFinished
        PlayAnim anim = <AnimFall3> norestart BlendPeriod = 0.1000
    endif
    waitanim 20 frames fromend
    boardrotate normal
    SwitchOnBoard
    Obj_WaitAnimFinished
    goto Baildone
endscript


script Baildone 
    
    obj_restoreboundingsphere
    ClearLipCombos
    NotifyBailDone
    setextrapush Radius = 0
    setrollingfriction default
    ClearTrickQueue
    ClearEventBuffer
    ClearManualTrick
    BashOff
    ClearQuickGetup
    TantrumOff
    KillExtraTricks
    enableplayerinput
    notinbail
    ClearGapTricks
    ClearSkaterFlags
    lockvelocitydirection Off
    restoreautokick
    canbrakeon
    FireEvent type = finished_bailing
    if NOT walking
        if GotParam gotoBrake
            if NOT OnGround
                setstate Ground
            endif
            OnGroundExceptions
            goto HandBrake params = { gotoBrake = <gotoBrake> }
        else
            goto ongroundai
        endif
    endif
endscript


script BloodOn size = 1 Radius = 1 name = blood_01
    texturesplat Radius = randomrange (1.0, 40.0) size = <size> bone = Bone_Head name = <name> lifetime = 20
endscript


script BloodOn_Down size = 1 Radius = 1 name = blood_01
    texturesplat Radius = randomrange (10.0, 300.0) size = <size> bone = Bone_Head name = <name> dropdown_length = 100 dropdown_vertical lifetime = 20
endscript


script BloodCar 
    wait 30 frames
    texturesplat Radius = 2 size = 20 bone = Bone_Head name = blood_01 lifetime = 20
endscript


script BloodJackAss 
    if NOT GetGlobalFlag flag = BLOOD_OFF
        wait 30 frames
        
        BloodOn_Down size = randomrange (8.0, 15.0)
        BloodOn_Down size = randomrange (8.0, 15.0)
        wait randomrange (1.0, 8.0) frames
        BloodOn_Down <...> size = randomrange (6.0, 12.0)
        BloodOn_Down <...> size = randomrange (6.0, 12.0)
        wait randomrange (1.0, 8.0) frames
        BloodOn_Down <...> size = randomrange (4.0, 8.0)
        BloodOn_Down <...> size = randomrange (4.0, 8.0)
        wait randomrange (1.0, 8.0) frames
        BloodOn_Down size = randomrange (2.0, 6.0)
    endif
endscript


script BloodSmall 
    if NOT GetGlobalFlag flag = BLOOD_OFF
        if NOT GetGlobalFlag flag = CHEAT_SUPER_BLOOD
            if OnGround
                obj_spawnscript BloodSplat
            endif
            wait 14 frames
            BloodOn <...> size = randomrange (8.0, 12.0) freq = 2.0 rnd_radius = 36
            wait randomrange (1.0, 3.0) frames
            BloodOn <...> size = randomrange (6.0, 10.0) freq = 2.0 rnd_radius = 36
            wait randomrange (1.0, 3.0) frames
            BloodOn <...> size = randomrange (4.0, 8.0) freq = 0.8000 rnd_radius = 36
            wait randomrange (1.0, 3.0) frames
            BloodOn size = randomrange (2.0, 6.0)
        else
            obj_spawnscript BloodSplat
            wait 14 frames
            obj_spawnscript BloodSplat
            texturesplat Radius = randomrange (20.0, 40.0) size = randomrange (30.0, 40.0) bone = Bone_Head name = blood_01 lifetime = 20
            wait 5 frame
            BloodOn <...> size = randomrange (15.0, 20.0)
            wait 4 frame
            BloodOn <...> size = randomrange (10.0, 15.0)
            wait 4 frame
            BloodOn <...> size = randomrange (10.0, 15.0)
            wait 3 frames
            BloodOn size = randomrange (6.0, 10.0)
            wait 2 frame
            BloodOn size = randomrange (6.0, 10.0)
            wait 1 frame
            BloodOn size = randomrange (6.0, 10.0)
        endif
    endif
endscript


script BloodTiny 
    if NOT GetGlobalFlag flag = BLOOD_OFF
        obj_spawnscript BloodSplat
        BloodOn <...> size = 5.0 freq = 2.0 rnd_radius = 12
        wait 4 frames
        BloodOn <...> size = 2.0 freq = 0.8000 rnd_radius = 12
        wait 3 frames
    endif
endscript


script BloodSuperTiny 
    obj_spawnscript BloodSplat
    BloodOn <...> size = 1.0 freq = 2.0 rnd_radius = 12
    wait 4 frames
    BloodOn <...> size = 0.5000 freq = 0.8000 rnd_radius = 12
    wait 3 frames
endscript


script BloodSplat 
    if NOT GetGlobalFlag flag = BLOOD_OFF
        BloodParticlesOn name = 'blood_1.png' start_col = -16777046 end_col = 570425514 num = 10 emit_w = 2.0 emit_h = 2.0 Angle = 10 size = 2.0 bone = Bone_Head growth = 1.500 time = 0.3000 Speed = 250 grav = -900 life = 0.3000
    endif
endscript


script SwitchOnBoard 
    if NOT IsLocalSkater
        return 
    endif
    if IsForceWalkOn
        switchonatomic board
    else
        if NOT IsBoardMissing
            switchonatomic board
        else
            SwitchOffBoard
        endif
    endif
    obj_getid
    MangleChecksums a = bailboard b = <ObjID>
    if ObjectExists id = <mangled_id>
        <mangled_id> ::Die
    endif
endscript

BailBoardComponents = [
    {
        Component = Suspend
    }
    {
        Component = rigidbody
        coeff_friction = 0.7000
        coeff_restitution = 0.1500
        const_acc = -500
        mass_over_moment = 0.007000
        center_of_mass = (0.0, 3.0, 0.0)
        spring_const = 10
        linear_velocity_sleep_point = 3
        angular_velocity_sleep_point = 0.1000
        skater_collision_radius = 28
        skater_collision_application_radius = 8
        skater_collision_impulse_factor = 1.0
        contacts = [
            (6.0, 7.0, 18.0)
            (6.0, 7.0, -18.0)
            (-6.0, 7.0, 18.0)
            (-6.0, 7.0, -18.0)
            (6.0, 0.0, 13.0)
            (6.0, 0.0, -13.0)
            (-6.0, 0.0, 13.0)
            (-6.0, 0.0, -13.0)
        ]
        directed_friction = [
            { None }
            { None }
            { None }
            { None }
            { (1.0, 0.0, 0.0) }
            { (1.0, 0.0, 0.0) }
            { (1.0, 0.0, 0.0) }
            { (1.0, 0.0, 0.0) }
        ]
        SoundType = SkaterBoardWhenBail
    }
    {
        Component = skeleton
        SkeletonName = THPS6_human
    }
    {
        Component = Model
        usemodellights
        Model = 'board_default/board_default.mdl'
    }
    {
        Component = ModelLightUpdate
    }
    {
        Component = sound
    }
]
BailGurneyComponents = [
    {
        Component = motion
    }
    {
        Component = Suspend
    }
    {
        Component = skeleton
        SkeletonName = THPS6_human
    }
    {
        Component = Model
        usemodellights
    }
    {
        Component = AnimBlender
        AnimName = animload_THPS6_human
        SkeletonName = THPS6_human
    }
    {
        Component = rigidbody
        coeff_friction = 0.7000
        coeff_restitution = 0.05000
        const_acc = -500
        mass_over_moment = 0.007000
        center_of_mass = (0.0, 0.0, 0.0)
        spring_const = 10
        linear_velocity_sleep_point = 3
        angular_velocity_sleep_point = 0.1000
        skater_collision_radius = 28
        skater_collision_application_radius = 8
        skater_collision_impulse_factor = 1.0
        contacts = [
            (16.0, 40.0, 28.0)
            (16.0, 40.0, -28.0)
            (-16.0, 40.0, 28.0)
            (-16.0, 40.0, -28.0)
            (16.0, 0.0, 23.0)
            (16.0, 0.0, -23.0)
            (-16.0, 0.0, 23.0)
            (-16.0, 0.0, -23.0)
        ]
        directed_friction = [
            { None }
            { None }
            { None }
            { None }
            { (1.0, 0.0, 0.0) }
            { (1.0, 0.0, 0.0) }
            { (1.0, 0.0, 0.0) }
            { (1.0, 0.0, 0.0) }
        ]
        SoundType = SkaterBoardWhenBail
    }
    {
        Component = ModelLightUpdate
    }
    {
        Component = sound
    }
]

script CreateBailBoard vel = (0.0, 0.0, 0.0) rotvel = (0.0, 0.0, 0.0) object_vel_factor = 1
    obj_getid
    if GotParam Gurney
        MangleChecksums a = BailGurney b = <ObjID>
    else
        if GotParam tantrum
            MangleChecksums a = TantrumBoard b = <ObjID>
        else
            MangleChecksums a = bailboard b = <ObjID>
        endif
    endif
    if ObjectExists id = <mangled_id>
        <mangled_id> ::Die
    endif
    if GetPlayerAppearancePart player = <ObjID> part = board
        board_ok = 1
    endif
    if GotParam Gurney
        board_ok = 1
    endif
    if GotParam board_ok
        if GotParam Gurney
            animload_THPS6_Veh_Gurney
            skeleton_spawncompositeobject <...> Offset = (0.0, -3.0, 2.0) bone = Bone_Board_Root Components = BailGurneyComponents params = {name = <mangled_id> XcloneFrom = <ObjID> Xgeoms = [ board ]}
            if NOT ObjectExists id = <mangled_id>
                return 
            endif
        else
            skeleton_spawncompositeobject <...> Offset = (0.0, -3.0, 2.0) bone = Bone_Board_Root Components = BailBoardComponents params = {name = <mangled_id> CloneFrom = <ObjID> geoms = [ board ]}
            if NOT ObjectExists id = <mangled_id>
                return 
            endif
        endif
        <mangled_id> ::rigidbody_ignoreskater 15 frames
        <mangled_id> ::rigidbody_wake
        if GotParam tantrum
            SpawnScript waitandkilltantrumboard params = { id = <mangled_id> }
        endif
    endif
endscript


script waitandkilltantrumboard 
    wait 6 seconds
    BailBoard_cleanup id = <id>
endscript


script BailBoard_cleanup id = bailboard
    if ObjectExists id = <id>
        <id> ::Die
    endif
endscript


script SwitchOffBoard 
    switchoffatomic board
endscript


script CleanUpSpecialItems 
    switchoffatomic special_item
    switchonatomic special_item_2
endscript


script skater_play_bail_stream 
    obj_playstream <stream_checksum> vol = 200 priority = 49
endscript


script skater_hint_style 
    DoMorph time = 0 Scale = (0.0, 0.0)
    DoMorph time = 0.1000 Scale = (2.5, 2.5)
    DoMorph time = 0.1000 Scale = (0.75, 0.75)
    DoMorph time = 0.1000 Scale = (1.2999999523162842, 1.2999999523162842)
    DoMorph time = 0.1000 Scale = (1.100000023841858, 1.100000023841858)
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.05000 alpha = 0.6000
    DoMorph time = 0.05000 alpha = 1
    DoMorph time = 0.1000 Scale = (2.5, 2.5)
    DoMorph time = 0.2000 Scale = (12.0, 0.0) alpha = 0
    Die
endscript


script skater_bail_style 
    DoMorph time = 0 Scale = (0.0, 0.0) alpha = 0 rot_angle = 0
    DoMorph time = 0.1000 Scale = 2.0 alpha = 1 rot_angle = 2
    DoMorph time = 0.07000 Scale = 0.9000 rot_angle = -2 alpha = 1
    DoMorph time = 0.06000 Scale = 1.600 rot_angle = 3
    DoMorph time = 0.03000 Scale = 1.200 rot_angle = 0
    DoMorph time = 0.03000 Scale = 1.250 rot_angle = 0
    DoMorph time = 0.1000 Scale = 1.200 rot_angle = 0
    DoMorph time = 0.1000 Scale = 1.210 rot_angle = 0 alpha = 1
    DoMorph time = 0.1000 Scale = 1.200 rot_angle = 0 alpha = 0.8000
    DoMorph time = 0.1000 Scale = 1.210 rot_angle = 0 alpha = 1
    DoMorph time = 0.1000 Scale = 1.200 rot_angle = 0
    DoMorph time = 0.1000 Scale = 1.210 rot_angle = 0
    DoMorph time = 0.1000 Scale = 1.200 rot_angle = 0
    DoMorph time = 0.1000 Scale = 1.210 rot_angle = 0 alpha = 1
    DoMorph time = 0.1000 Scale = 1.200 rot_angle = 0 alpha = 0.7000
    DoMorph time = 0.1000 Scale = 1.210 rot_angle = 0 alpha = 1
    DoMorph time = 0.1000 Scale = 1.200 rot_angle = 0
    DoMorph time = 0.1000 Scale = 1.210 rot_angle = 0
    DoMorph time = 0.1000 Scale = 1.200 rot_angle = 0
    DoMorph time = 0.1000 Scale = 1.210 rot_angle = 0 alpha = 1
    DoMorph time = 0.1000 Scale = 1.200 rot_angle = 0 alpha = 0.8000
    DoMorph time = 0.1000 Scale = 1.210 rot_angle = 0 alpha = 1
    DoMorph time = 0.1000 Scale = 1.200 rot_angle = 0
    DoMorph time = 0.1000 Scale = 1.700 rot_angle = -3
    DoMorph time = 0.3000 Scale = 0 alpha = 0 rot_angle = 180
    Die
endscript

