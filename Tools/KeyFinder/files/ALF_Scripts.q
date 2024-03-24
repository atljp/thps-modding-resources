
script ALF_Placeholder 
endscript


script ALF_Ped_Generic 
    Obj_ClearExceptions
    Obj_SetException Ex = objectinradius scr = ALF_Ped_BailWhenSkaterClose
    obj_setinnerradius 5
    wait Random (@ 5 frames @ 10 frames @ 15 frames)
    begin 
    Obj_CycleAnim anim = Ped_M_Idle1 numCycles = Random (@ 2 @ 4 @ 7 @ 9)
    Obj_CycleAnim anim = Ped_M_Idle1toIdle2
    Obj_CycleAnim anim = Ped_M_Idle2 numCycles = Random (@ 1 @ 2 @ 3)
    Obj_CycleAnim anim = Ped_M_Idle2toIdle3
    Obj_CycleAnim anim = Ped_M_Idle3 numCycles = Random (@ 1 @ 2 @ 3)
    Obj_CycleAnim anim = Ped_M_Idle3toIdle1
    repeat 
endscript


script ALF_Ped_BailWhenSkaterClose 
    Obj_ClearExceptions
    Random (
        @ Obj_CycleAnim anim = Ped_M_FalldownA
        Obj_PlayAnim anim = Ped_M_LayIdleA Cycle
        settags bail = a
        @ Obj_CycleAnim anim = Ped_M_FalldownB
        Obj_PlayAnim anim = Ped_M_LayIdleB Cycle
        settags bail = b
        @ Obj_CycleAnim anim = Ped_M_FalldownC
        Obj_PlayAnim anim = Ped_M_LayIdleC Cycle
        settags bail = c
        @ Obj_CycleAnim anim = Ped_M_FalldownD
        Obj_PlayAnim anim = Ped_M_LayIdleD Cycle
        settags bail = d
        @ Obj_CycleAnim anim = Ped_M_FalldownE
        Obj_PlayAnim anim = Ped_M_LayIdleE Cycle
        settags bail = e)
    Obj_SetException Ex = objectoutofradius scr = ALF_Ped_GetUpFromBail
    obj_setouterradius 10
endscript


script ALF_Ped_GetUpFromBail 
    Obj_ClearExceptions
    gettags
    obj_setanimcyclemode Off
    Obj_WaitAnimFinished
    switch <bail>
        case a
        Obj_CycleAnim anim = Ped_M_GetUpA
        case b
        Obj_CycleAnim anim = Ped_M_GetUpB
        case c
        Obj_CycleAnim anim = Ped_M_GetUpC
        case d
        Obj_CycleAnim anim = Ped_M_GetUpD
        case e
        Obj_CycleAnim anim = Ped_M_GetUpE
        default 
    endswitch
    goto ALF_Ped_Generic
endscript

