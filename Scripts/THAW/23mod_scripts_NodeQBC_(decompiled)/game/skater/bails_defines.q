FallForwardAnims = {
    AnimFall1 = Bail_Falling_Idle_FWD
    AnimFall2 = Bail_Falling_Hit_Med_FWD
    AnimFall2Hard = Bail_Falling_Hit_Hard_FWD
    AnimFallEnd = GetUp_HK_Bk
    xmove = 150
    moveframes = 60
}
FallBackwardAnims = {
    AnimFall1 = Bail_Falling_Idle_BCK
    AnimFall2 = Bail_Falling_Hit_Med_BCK
    AnimFall2Hard = Bail_Falling_Hit_Hard_BCK
    AnimFallEnd = GetUp_HK_Bk
    xmove = 150
    moveframes = 60
}
FallRightAnims = {
    AnimFall1 = Bail_Falling_Idle_RT
    AnimFall2 = Bail_Falling_Hit_Med
    AnimFall2Hard = Bail_Falling_Hit_Hard
    AnimFallEnd = GetUp_HK_Rt
    xmove = 150
    moveframes = 60
}
FallLeftAnims = {
    AnimFall1 = Bail_Falling_Idle_LT
    AnimFall2 = Bail_Falling_Hit_Hard
    AnimFall2Hard = Bail_Falling_Hit_Hard
    AnimFallEnd = GetUp_HK_Lt
    xmove = -165
    moveframes = 30
}
FallForwardRightAnims = {
    AnimFall1 = Bail_Falling_Slide_Idle_RTf
    AnimFall2 = Bail_Falling_Slide_HitM_RTf
    AnimFall2Hard = Bail_Falling_Slide_HitH_RTf
    AnimFallEnd = GetUp_HK_Lt
    xmove = 150
    moveframes = 60
}
FallForwardLeftAnims = {
    AnimFall1 = Bail_Falling_Slide_Idle_LTf
    AnimFall2 = Bail_Falling_Slide_HitM_LTf
    AnimFall2Hard = Bail_Falling_Slide_HitH_LTf
    AnimFallEnd = GetUp_HK_Lt
    xmove = -150
    moveframes = 60
}
FallBackwardLeftAnims = {
    AnimFall1 = Bail_Falling_Slide_Idle_LTb
    AnimFall2 = Bail_Falling_Slide_HitM_LTb
    AnimFall2Hard = Bail_Falling_Slide_HitH_LTb
    AnimFallEnd = GetUp_HK_Rt
    xmove = -150
    moveframes = 60
}
FallBackwardRightAnims = {
    AnimFall1 = Bail_Falling_Slide_Idle_RTb
    AnimFall2 = Bail_Falling_Slide_HitM_RTb
    AnimFall2Hard = Bail_Falling_Slide_HitH_RTb
    AnimFallEnd = GetUp_HK_Rt
    xmove = 150
    moveframes = 60
}
FallBackwardSlideAnims = { AnimFall1 = Bail_Falling_Slide_Idle_BCK AnimFall2 = Bail_Falling_Slide_HitM_BCK AnimFall2Hard = Bail_Falling_Slide_HitH_BCK AnimFallEnd = GetUp_HK_Ft }
FallStandingAnims = {
    AnimFall1 = RunOut_Drop_Idle
    AnimFall2 = RunOut_Drop_Land_Med
    AnimFall2Hard = RunOut_Drop_Land_Med
    AnimFallEnd = GetUp_HK_Ft
    splatBloodFrame = 6
}
BAILSCRIPT = Kneeslide

script RunOutQuick 
    GeneralBail \{anim1 = RunOutQuick intoairframe = 1 friction = 11 BoardAlwaysOn BashOff NoBlood BoardAlwaysOn sound = Bailrunoutflip NoScuff GroundGoneBail = GroundGoneBail FallBlendPeriod = 1 FallStandingAnims}
endscript

script Bail_RunOut_Old 
    GeneralBail \{anim1 = Bail_RunOut_Old intoairframe = 1 SmackAnim = Bail_Wall_FWD_Regular friction = 13 BoardAlwaysOn BashOff NoBlood BoardAlwaysOn sound = Bailrunoutflip NoScuff GroundGoneBail = GroundGoneBail FallBlendPeriod = 1 FallStandingAnims}
endscript

script Bail_RunOut_New_A 
    GeneralBail \{anim1 = Bail_RunOut_New_A intoairframe = 1 SmackAnim = Bail_Wall_FWD_Regular friction = 17 BoardAlwaysOn BashOff NoBlood BoardAlwaysOn sound = Bailrunoutflip NoScuff GroundGoneBail = GroundGoneBail FallBlendPeriod = 0.4000 FallStandingAnims}
endscript

script RunOut_Drop_Land_Med 
    GeneralBail \{anim1 = RunOut_Drop_Land_Med intoairframe = 1 SmackAnim = Bail_Wall_FWD_Low friction = 13 BoardAlwaysOn BashOff sound = bail_knee1 FoleySound BloodFrame = 6 GroundGoneBail = GroundGoneBail FallBlendPeriod = 1 FallStandingAnims}
endscript

script Bail_Ramp_Ft 
    GeneralBail \{anim1 = Bail_Ramp_Ft NoBlending Endpose = GetUp_HK_Ft intoairframe = 1 friction = 11 SmackAnim = Bail_Wall_FWD_Regular BoardOffFrame = 10 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0 sound = bail_knee1 FoleySound BloodFrame = 18 GroundGoneBail = GroundGoneBail FallBlendPeriod = 1 FallForwardAnims}
endscript

script Bail_Ramp_Ft_Med 
    GeneralBail \{anim1 = Bail_Ramp_Ft_Med NoBlending Endpose = GetUp_HK_Ft intoairframe = 1 friction = 10 SmackAnim = Bail_Wall_FWD_Regular BoardOffFrame = 6 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0 sound = bail_knee1 FoleySound BloodFrame = 13 GroundGoneBail = GroundGoneBail FallBlendPeriod = 1 FallForwardAnims}
endscript

script Bail_Ramp_Ft_Hd 
    GeneralBail \{anim1 = Bail_Ramp_Ft_Hd NoBlending Endpose = GetUp_HK_Ft intoairframe = 1 friction = 6 SmackAnim = Bail_Wall_FWD_Regular BoardOffFrame = 8 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0 sound = bail_knee1 FoleySound BloodFrame = 10 GroundGoneBail = GroundGoneBail FallBlendPeriod = 0.7500 FallForwardAnims}
endscript

script Bail_Ramp_Bk 
    GeneralBail \{anim1 = Bail_Ramp_Bk NoBlending Endpose = GetUp_HK_Ft intoairframe = 1 friction = 17 SmackAnim = Bail_Wall_BCK_Regular BoardOffFrame = 3 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0 sound = bail_knee1 FoleySound BloodFrame = 11 GroundGoneBail = GroundGoneBail FallBlendPeriod = 1 FallBackwardSlideAnims}
endscript

script Bail_Ramp_Bk_Hd 
    GeneralBail \{anim1 = Bail_Ramp_Bk_Hd NoBlending Endpose = GetUp_HK_Rt intoairframe = 1 friction = 14 SmackAnim = Bail_Wall_BCK_Regular BoardOffFrame = 10 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0 sound = bail_knee1 FoleySound BloodFrame = 12 GroundGoneBail = GroundGoneBail FallBlendPeriod = 1.500 FallBackwardSlideAnims}
endscript

script Bail_Ramp_Lt 
    GeneralBail \{anim1 = Bail_Ramp_Lt NoBlending Endpose = GetUp_HK_Ft intoairframe = 1 friction = 16 SmackAnim = Bail_Wall_FWD_Regular BoardOffFrame = 10 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0 sound = bail_knee1 FoleySound BloodFrame = 18 GroundGoneBail = GroundGoneBail FallBlendPeriod = 1.0 FallForwardAnims}
endscript

script Bail_Ramp_Lt_Med 
    GeneralBail \{anim1 = Bail_Ramp_Lt_Med NoBlending Endpose = GetUp_HK_Lt intoairframe = 1 friction = 20 SmackAnim = Bail_Wall_FWD_Low BoardOffFrame = 10 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0 sound = bail_knee1 FoleySound BloodFrame = 16 GroundGoneBail = GroundGoneBail FallBlendPeriod = 1 FallLeftAnims}
endscript

script Bail_Ramp_Lt_Hd 
    GeneralBail \{anim1 = Bail_Ramp_Lt_Hd NoBlending Endpose = GetUp_HK_Lt intoairframe = 1 friction = 0 SmackAnim = Bail_Wall_LT_Low BoardOffFrame = 5 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 10 sound = bail_knee1 FoleySound BloodFrame = 19 GroundGoneBail = GroundGoneBail FallBlendPeriod = 1.500 FallLeftAnims}
endscript

script Bail_Ramp_Rt 
    GeneralBail \{anim1 = Bail_Ramp_Rt NoBlending Endpose = GetUp_HK_Ft intoairframe = 1 friction = 20 SmackAnim = Bail_Wall_RT_Low BoardOffFrame = 10 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0 sound = bail_knee1 FoleySound BloodFrame = 18 GroundGoneBail = GroundGoneBail FallBlendPeriod = 1 FallForwardAnims}
endscript

script Bail_Ramp_Rt_Med 
    GeneralBail \{anim1 = Bail_Ramp_Rt_Med NoBlending Endpose = GetUp_HK_Bk intoairframe = 1 friction = 1 SmackAnim = Bail_Wall_RT_Low BoardOffFrame = 10 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0 sound = bail_knee1 FoleySound BloodFrame = 18 GroundGoneBail = GroundGoneBail FallBlendPeriod = 1 FallBackwardAnims}
endscript

script Bail_Ramp_Rt_Hd 
    GeneralBail \{anim1 = Bail_Ramp_Rt_Hd NoBlending Endpose = GetUp_HK_Ft intoairframe = 1 friction = 20 SmackAnim = Bail_Wall_RT_Low BoardOffFrame = 10 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0 sound = bail_knee1 FoleySound BloodFrame = 18 GroundGoneBail = GroundGoneBail FallBlendPeriod = 1 FallBackwardSlideAnims}
endscript

script Bail_Spin_CW_Hard 
    GeneralBail \{anim1 = Bail_Spin_CW_Hard NoBlending Endpose = GetUp_HK_Ft intoairframe = 1 friction = 20 SmackAnim = Bail_Wall_FWD_Low BoardOffFrame = 10 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0 sound = bail_knee1 FoleySound BloodFrame = 18 GroundGoneBail = GroundGoneBail FallBlendPeriod = 1.500 FallBackwardSlideAnims}
endscript

script Bail_Spin_CCW_Hard 
    GeneralBail \{anim1 = Bail_Spin_CCW_Hard NoBlending Endpose = GetUp_HK_Ft intoairframe = 1 friction = 20 SmackAnim = Bail_Wall_FWD_Low BoardOffFrame = 10 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0 sound = bail_knee1 FoleySound BloodFrame = 20 GroundGoneBail = GroundGoneBail FallBlendPeriod = 1.500 FallForwardAnims}
endscript

script Bail_Spin_CW_Hard_A 
    GeneralBail \{anim1 = Bail_Spin_CW_Hard_A NoBlending Endpose = GetUp_HK_Ft intoairframe = 1 friction = 23 SmackAnim = Bail_Wall_FWD_Low BoardOffFrame = 5 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0 sound = bail_knee1 FoleySound BloodFrame = 12 GroundGoneBail = GroundGoneBail FallBlendPeriod = 1.500 FallBackwardSlideAnims}
endscript

script Bail_Spin_CCW_Hard_B 
    GeneralBail \{anim1 = Bail_Spin_CCW_Hard_B NoBlending Endpose = GetUp_HK_Ft intoairframe = 1 friction = 20 SmackAnim = Bail_Wall_RT_Low BoardOffFrame = 10 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0 sound = bail_knee1 FoleySound BloodFrame = 25 GroundGoneBail = GroundGoneBail FallBlendPeriod = 1.500 FallForwardAnims}
endscript

script Bail_Spin_CCW_Hard_C 
    GeneralBail \{anim1 = Bail_Spin_CCW_Hard_C NoBlending Endpose = GetUp_HK_Ft intoairframe = 1 friction = 13.50 SmackAnim = Bail_Wall_LT_Low BoardOffFrame = 2 BoardVel = (-30.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0 sound = bail_knee1 FoleySound BloodFrame = 25 GroundGoneBail = GroundGoneBail FallBlendPeriod = 1 FallBackwardSlideAnims}
endscript

script Bail_Spin_CW_Hard_B 
    GeneralBail \{anim1 = Bail_Spin_CW_Hard_B NoBlending Endpose = GetUp_HK_Rt intoairframe = 1 HeavyFriction = 10 friction = 10 Friction2 = 17.50 SmackAnim = Bail_Wall_FWD_Low BoardOffFrame = 2 BoardVel = (-30.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0 sound = bail_knee1 FoleySound BloodFrame = 20 GroundGoneBail = GroundGoneBail FallBlendPeriod = 1.500 FallRightAnims}
endscript

script Bail_Spin_FWD_Regular 
    GeneralBail \{anim1 = Bail_Spin_FWD_Regular NoBlending Endpose = GetUp_Sit_Ft intoairframe = 1 friction = 14 SmackAnim = Bail_Wall_FWD_Low BoardOffFrame = 10 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0 sound = bail_knee1 FoleySound BloodFrame = 13 GroundGoneBail = GroundGoneBail FallBlendPeriod = 1 FallForwardAnims}
endscript

script Bail_Spin_FWD_Hard 
    GeneralBail \{anim1 = Bail_Spin_FWD_Hard NoBlending Endpose = GetUp_HK_Ft intoairframe = 1 friction = 18 SmackAnim = Bail_Wall_FWD_Low BoardOffFrame = 10 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0 sound = bail_knee1 FoleySound BloodFrame = 24 GroundGoneBail = GroundGoneBail FallBlendPeriod = 1 FallForwardAnims}
endscript

script Bail_Spin_FWD_Fast 
    GeneralBail \{anim1 = Bail_Spin_FWD_Fast NoBlending Endpose = GetUp_HK_Lt intoairframe = 1 friction = 14 SmackAnim = Bail_Wall_FWD_Low BoardOffFrame = 10 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0 sound = bail_knee1 FoleySound BloodFrame = 12 GroundGoneBail = GroundGoneBail FallBlendPeriod = 1 FallForwardAnims}
endscript

script Bail_Spin_BCK_Regular 
    GeneralBail \{anim1 = Bail_Spin_BCK_Regular NoBlending Endpose = GetUp_HK_Bk intoairframe = 1 friction = 12 SmackAnim = Bail_Wall_FWD_Low BoardOffFrame = 10 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0 sound = bail_knee1 FoleySound BloodFrame = 5 GroundGoneBail = GroundGoneBail FallBlendPeriod = 0.3000 FallBackwardSlideAnims}
endscript

script Bail_Spin_BCK_Hard 
    GeneralBail \{anim1 = Bail_Spin_BCK_Hard NoBlending Endpose = GetUp_HK_Ft intoairframe = 1 friction = 19 SmackAnim = Bail_Wall_FWD_Low BoardOffFrame = 10 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0 sound = bail_knee1 FoleySound BloodFrame = 10 GroundGoneBail = GroundGoneBail FallBlendPeriod = 1 FallBackwardSlideAnims}
endscript

script Bail_Spin_BCK_Fast 
    GeneralBail \{anim1 = Bail_Spin_BCK_Fast NoBlending Endpose = GetUp_HK_Ft intoairframe = 1 Friction2 = 10 friction = 28 SmackAnim = Bail_Wall_FWD_Low BoardOffFrame = 10 BoardVel = (-10.0, 0.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = -10 sound = bail_knee1 FoleySound BloodFrame = 56 GroundGoneBail = GroundGoneBail FallBlendPeriod = 1 FallBackwardSlideAnims}
endscript

script Bail_Pitch_Back 
    printf \{ 'Bail_Pitch_Back' }
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
    printf \{ 'Bail_Pitch_Tail' }
    GeneralBail \{anim1 = Bail_Pitch_Tail Endpose = GetUp_HK_Lt intoairframe = 1 friction = 100 SmackAnim = Bail_Wall_BCK_Regular sound = Bail04 FoleySound NoBlending BoardOffFrame = 1 BoardVel = (25.0, 150.0, 0.0) BoardRotVel = (0.5, 3.0, 2.0) BoardSkaterVel = 0 BloodFrame = 6 GroundGoneBail = GroundGoneBail FallBackwardSlideAnims}
endscript

script Bail_Pitch_Face 
    printf \{ 'Bail_Pitch_Face' }
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
    printf \{ 'Bail_Pitch_Nose' }
    GeneralBail \{anim1 = Bail_Pitch_Nose NoBlending Endpose = GetUp_HK_Lt intoairframe = 20 friction = 100 SmackAnim = Bail_Wall_FWD_Low BoardOffFrame = 1 BoardVel = (-100.0, 50.0, -250.0) BoardRotVel = (10.0, 2.0, -2.0) BoardSkaterVel = 1 sound = BoardBail01 FoleySound BloodFrame = 4 NoBlending GroundGoneBail = GroundGoneBail FallForwardAnims}
endscript

script Nutsac 
    GeneralBail \{anim1 = Nutsac NoBlending Endpose = GetUp_HK_Lt intoairframe = 1 friction = 20 SmackAnim = Bail_Wall_RT_Low BoardOffFrame = 43 BoardVel = (0.0, 50.0, 0.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 1 sound = bail_knee1 FoleySound GroundGoneBail = GroundGoneBail FallBlendPeriod = 1 FallForwardAnims}
endscript

script Bail_Falling_FWD 
    GeneralBail \{anim1 = Bail_Falling_FWD Endpose = GetUp_HK_Lt intoairframe = 26 ForceFall friction = 0 BloodFrame = 50 SmackAnim = Bail_Wall_BCK_Low sound = Bail04 BoardOffFrame = 1 BoardVel = (-50.0, 20.0, 0.0) BoardRotVel = (0.0, 1.0, -1.0) BoardSkaterVel = 1 FoleySound FallBlendPeriod = 0 SplatFriction = 20 GroundGoneBail = GroundGoneBail FallForwardAnims}
endscript

script Bail_Falling_BCK 
    GeneralBail \{anim1 = Bail_Falling_BCK Endpose = GetUp_HK_Bk intoairframe = 33 ForceFall friction = 0 BloodFrame = 50 SmackAnim = Bail_Wall_BCK_Low sound = Bail04 BoardOffFrame = 1 BoardVel = (-50.0, 20.0, 0.0) BoardRotVel = (0.0, 1.0, -1.0) BoardSkaterVel = 1 FoleySound FallBlendPeriod = 0 SplatFriction = 20 GroundGoneBail = GroundGoneBail FallBackwardAnims}
endscript

script Bail_Falling_RT 
    GeneralBail \{anim1 = Bail_Falling_RT Endpose = GetUp_HK_Rt intoairframe = 36 ForceFall friction = 0 BloodFrame = 50 SmackAnim = Bail_Wall_RT_Low sound = Bail04 BoardOffFrame = 1 BoardVel = (-50.0, 20.0, 0.0) BoardRotVel = (0.0, 1.0, -1.0) BoardSkaterVel = 1 FoleySound FallBlendPeriod = 0 SplatFriction = 20 GroundGoneBail = GroundGoneBail FallRightAnims}
endscript

script Bail_Falling_LT 
    GeneralBail \{anim1 = Bail_Falling_LT Endpose = GetUp_HK_Lt intoairframe = 16 ForceFall friction = 0 BloodFrame = 7 SmackAnim = Bail_Wall_LT_Low sound = Bail04 BoardOffFrame = 1 BoardVel = (-50.0, 20.0, 0.0) BoardRotVel = (0.0, 1.0, -1.0) BoardSkaterVel = 1 FoleySound FallBlendPeriod = 0 SplatFriction = 20 GroundGoneBail = GroundGoneBail FallLeftAnims}
endscript

script Bail_Falling_Slide_BCK 
    GeneralBail \{anim1 = Bail_Falling_Slide_BCK Endpose = GetUp_HK_Ft intoairframe = 28 ForceFall friction = 0 BloodFrame = 50 SmackAnim = Bail_Wall_BCK_Low sound = Bail04 BoardOffFrame = 3 BoardVel = (-50.0, 20.0, 0.0) BoardRotVel = (0.0, 1.0, -1.0) BoardSkaterVel = 1 FoleySound FallBlendPeriod = 0 SplatFriction = 20 GroundGoneBail = GroundGoneBail FallBackwardSlideAnims}
endscript

script Bail_Falling_Slide_BCK_lt 
    GeneralBail \{anim1 = Bail_Falling_Slide_LTb Endpose = GetUp_HK_Rt intoairframe = 26 ForceFall friction = 0 BloodFrame = 50 SmackAnim = Bail_Wall_LT_Low sound = Bail04 BoardOffFrame = 1 BoardVel = (-50.0, 20.0, 0.0) BoardRotVel = (0.0, 1.0, -1.0) BoardSkaterVel = 1 FoleySound FallBlendPeriod = 0 SplatFriction = 20 GroundGoneBail = GroundGoneBail FallBackwardLeftAnims}
endscript

script Bail_Falling_Slide_BCK_rt 
    GeneralBail \{anim1 = Bail_Falling_Slide_RTb Endpose = GetUp_HK_Rt intoairframe = 34 ForceFall friction = 0 BloodFrame = 50 SmackAnim = Bail_Wall_RT_Low sound = Bail04 BoardOffFrame = 1 BoardVel = (-50.0, 20.0, 0.0) BoardRotVel = (0.0, 1.0, -1.0) BoardSkaterVel = 1 FoleySound FallBlendPeriod = 0 SplatFriction = 20 GroundGoneBail = GroundGoneBail FallBackwardRightAnims}
endscript

script Bail_Falling_Slide_FWD_lt 
    GeneralBail \{anim1 = Bail_Falling_Slide_LTf Endpose = GetUp_HK_Lt intoairframe = 26 ForceFall friction = 0 BloodFrame = 50 SmackAnim = Bail_Wall_LT_Low sound = Bail04 BoardOffFrame = 1 BoardVel = (-50.0, 20.0, 0.0) BoardRotVel = (0.0, 1.0, -1.0) BoardSkaterVel = 1 FoleySound FallBlendPeriod = 0 SplatFriction = 20 GroundGoneBail = GroundGoneBail FallForwardLeftAnims}
endscript

script Bail_Falling_Slide_FWD_rt 
    GeneralBail \{anim1 = Bail_Falling_Slide_RTf Endpose = GetUp_HK_Lt intoairframe = 26 ForceFall friction = 0 BloodFrame = 50 SmackAnim = Bail_Wall_RT_Low sound = Bail04 BoardOffFrame = 1 BoardVel = (-50.0, 20.0, 0.0) BoardRotVel = (0.0, 1.0, -1.0) BoardSkaterVel = 1 FoleySound FallBlendPeriod = 0 SplatFriction = 20 GroundGoneBail = GroundGoneBail FallForwardRightAnims}
endscript

script Bail_Nutter_FWD 
    GeneralBail \{anim1 = Bail_Nutter_FWD Endpose = GetUp_HK_Ft intoairframe = 47 friction = 0 SmackAnim = Bail_Wall_FWD_Regular sound = Bail04 BoardOffFrame = 5 BoardVel = (20.0, 0.0, 0.0) BoardRotVel = (0.0, 1.0, 1.0) BoardSkaterVel = 1 FoleySound BonkSound GroundGoneBail = GroundGoneBail Nutter}
endscript

script Bail_Nutter_BCK 
    GeneralBail \{anim1 = Bail_Nutter_BCK Endpose = GetUp_HK_Ft intoairframe = 37 friction = 0 SmackAnim = Bail_Wall_BCK_Regular sound = Bail04 BoardOffFrame = 1 BoardVel = (20.0, 0.0, 0.0) BoardRotVel = (0.0, 1.0, 1.0) BoardSkaterVel = 1 FoleySound BonkSound GroundGoneBail = GroundGoneBail FallBackwardSlideAnims Nutter}
endscript

script ManualBailSlow 
    GeneralBail \{anim1 = Bail_Manual_BK Endpose = GetUp_Sit_Ft intoairframe = 30 friction = 20 NoBlending BloodFrame = 15 SmackAnim = Bail_Wall_BCK_Low sound = Bail04 BoardOffFrame = 6 BoardVel = (0.0, 50.0, 400.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 1 GroundGoneBail = GroundGoneBail FallBlendPeriod = 1 FallBackwardAnims}
endscript

script ManualBailFast 
    GeneralBail \{anim1 = Bail_Manual_BK_fast Endpose = GetUp_HK_Lt intoairframe = 30 NoBlending friction = 5 BloodFrame = 15 SmackAnim = Bail_Wall_BCK_Low sound = Bail04 BoardOffFrame = 6 BoardVel = (0.0, 50.0, 400.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 1 GroundGoneBail = GroundGoneBail FallBlendPeriod = 1.500 FallForwardAnims}
endscript

script NoseManualBailSlow 
    GeneralBail \{anim1 = Bail_Manual_FT Endpose = GetUp_HK_Ft intoairframe = 30 NoBlending friction = 10 BloodFrame = 13 SmackAnim = Bail_Wall_FWD_Regular sound = BoardBail01 BoardOffFrame = 10 BoardVel = (0.0, 50.0, -400.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0 GroundGoneBail = GroundGoneBail FallBlendPeriod = 1.500 FallForwardAnims}
endscript

script NoseManualBailFast 
    GeneralBail \{anim1 = Bail_Manual_FT_fast Endpose = GetUp_HK_Lt intoairframe = 30 NoBlending friction = 10 BloodFrame = 15 SmackAnim = Bail_Wall_FWD_Regular sound = BoardBail01 BoardOffFrame = 10 BoardVel = (0.0, 50.0, -400.0) BoardRotVel = (0.0, 0.0, 0.0) BoardSkaterVel = 0 GroundGoneBail = GroundGoneBail FallBlendPeriod = 1.500 FallForwardAnims}
endscript

script Trolley_BailB 
    GeneralBail \{anim1 = Trolley_BailB BoardOffFrame = 11 Anim2 = GetUpForwards intoairframe = 20 friction = 15 SmackAnim = Bail_Wall_FWD_Regular sound = BoardBail01 FoleySound BloodFrame = 20 FallBlendPeriod = 1.500 FallForwardAnims}
endscript
