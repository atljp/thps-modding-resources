LEVEL_VISITED = 400
LEVEL_VISITED_STORY = 197
LEVEL_UNLOCKED_STORY = 198
LEVEL_COMPLETE_STORY = 199
LEVEL_UNLOCKED_CLASSIC = 398
LEVEL_COMPLETE_CLASSIC = 399
FLAG_G_COMP_GEO_ON = 128
FLAG_PROSET1_GEO_ON = 129
FLAG_PROSET2_GEO_ON = 130
FLAG_PROSET3_GEO_ON = 131
FLAG_PROSET4_GEO_ON = 132
FLAG_PROSET5_GEO_ON = 133
FLAG_PROSET6_GEO_ON = 134
FLAG_PROSET7_GEO_ON = 135

script ResetLevelFlags 
    <flag_num> = 0
    begin 
    UnSetFlag flag = <flag_num>
    <flag_num> = (<flag_num> + 1)
    repeat 64
endscript

script IsLevelUnlocked 
    GetGameMode
    switch <gamemode>
        case career
        if GetFlag level = <level> flag = LEVEL_UNLOCKED_STORY
            return \{ unlocked = 1 }
        endif
        case classic
        if GetFlag level = <level> flag = LEVEL_UNLOCKED_CLASSIC
            return \{ unlocked = 1 }
        endif
        default 
        if GetFlag level = <level> flag = LEVEL_VISITED
            return \{ unlocked = 1 }
        endif
    endswitch
    return \{ unlocked = 0 }
endscript
