PressureTricks2 = [
    {
        trigger = { AirTrickLogic square up 300 }
        Trick_BS360PressureFlip
    }
    {
        trigger = { AirTrickLogic square down 300 }
        Trick_FS360PressureFlip
    }
    {
        trigger = { AirTrickLogic square RIGHT 300 }
        Trick_BS180PressureFlip
    }
    {
        trigger = { AirTrickLogic square left 300 }
        Trick_BSToeFlip
    }
]
Trick_PressureFlip = {
    scr = FlipTrick
    params = {
        name = "\c2Pressure Flip\c0"
        ollie
        Speed = 1.500
        Score = 100
        anim = _360Flip
    }
}
Trick_PressureFlip2 = {
    scr = FlipTrick
    params = { name = "\c2Pressure Flip\c0" Speed = 1.500 Score = 100 anim = _360Flip }
}
Trick_BS180PressureFlip = {
    scr = FlipTrick
    params = {
        name = "BS 180 Flip"
        Score = 100
        anim = BS180PressureFlip
        boardrotate
        FlipAfter
    }
}
Trick_BSToeFlip = {
    scr = FlipTrick
    params = { name = "BS Toe Flip " Score = 100 anim = BSToeFlip boardrotate }
}
Trick_BS360PressureFlip = {
    scr = FlipTrick
    params = { name = "BS 360 Flip" Score = 200 anim = BS360PressureFlip }
}
Trick_FS360PressureFlip = {
    scr = FlipTrick
    params = { name = "FS 360 Flip" Score = 200 anim = FS360PressureFlip }
}
