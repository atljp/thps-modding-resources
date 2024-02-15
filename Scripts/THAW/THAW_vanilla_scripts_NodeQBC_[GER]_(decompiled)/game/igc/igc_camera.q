
script IGC_Camera_MoveToPlayer \{ time = 0 motion = smooth }
    cameraid = skatercam0
    <cameraid> ::gethfov
    CinematicCamera_DoMorph {
        LockTo = <cameraid>
        Pos = (0.0, 0.0, 0.0)
        Quat = (0.0, 0.0, 0.0)
        FOV = <hfov>
        time = <time> Block
        motion = <motion>
    }
endscript
