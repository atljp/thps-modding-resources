CHEAT_SUPER_BLOOD = CHEAT_ON_1
cheat_always_special = CHEAT_ON_2
cheat_perfect_rail = CHEAT_ON_3
cheat_stats_13 = CHEAT_ON_4
CHEAT_COOL_SPECIAL_TRICKS = CHEAT_ON_5
CHEAT_MATRIX = CHEAT_ON_6
cheat_perfect_manual = CHEAT_ON_7
CHEAT_KID = CHEAT_ON_8
CHEAT_MOON = CHEAT_ON_9
CHEAT_SIM = CHEAT_ON_10
CHEAT_GORILLA = CHEAT_ON_11
cheat_perfect_skitch = CHEAT_ON_12
CHEAT_BIGHEAD = CHEAT_ON_13
CHEAT_HOVERBOARD = CHEAT_ON_14
CHEAT_SLOMO = CHEAT_ON_15
CHEAT_DISCO = CHEAT_ON_16
CHEAT_INVISIBLE = CHEAT_ON_17
CHEAT_FLAME = CHEAT_ON_18
CHEAT_INLINE = CHEAT_ON_19

script client_toggle_cheat 
    if GotParam \{ on }
        SetGlobalFlag flag = <cheat_flag>
    else
        UnsetGlobalFlag flag = <cheat_flag>
    endif
endscript

script toggle_cheat 
    if InNetGame
        if OnServer
            if (GetGlobalFlag flag = <cheat_flag>)
                BroadcastOmnigon <...> Off
            else
                BroadcastOmnigon <...> on
            endif
        endif
    endif
    if InNetGame
        if NOT OmnigonAllowed <...> 
            return 
        endif
    endif
    if InNetGame
        if NOT LastBroadcastedOmnigonWas <...> 
            return 
        endif
    endif
    if LastBroadcastedOmnigonWas cheat_flag = CHEAT_MADE_UP
        return 
    endif
    gettags
    if (GetGlobalFlag flag = <cheat_flag>)
        SetScreenElementProps id = {<id> child = 3}text = 'Aus'
        UnsetGlobalFlag flag = <cheat_flag>
        if GotParam off_callback
            <off_callback> <...> 
        endif
    else
        SetScreenElementProps id = {<id> child = 3}text = 'Ein'
        SetGlobalFlag flag = <cheat_flag>
        if (<cheat_flag> = CHEAT_BIGHEAD)
            if ScreenElementExists id = menu_gorilla
                SetScreenElementProps id = { menu_gorilla child = 3 }text = 'Aus'
                UnsetGlobalFlag flag = CHEAT_GORILLA
            endif
        endif
        if (<cheat_flag> = CHEAT_GORILLA)
            if ScreenElementExists id = menu_bighead
                SetScreenElementProps id = { menu_bighead child = 0 }text = 'Aus'
                UnsetGlobalFlag flag = CHEAT_BIGHEAD
            endif
        endif
        if GotParam on_callback
            <on_callback> <...> 
        endif
    endif
endscript

script unlock_all_cheat_codes 
    SetGlobalFlag \{ flag = CHEAT_UNLOCKED_1 }
    SetGlobalFlag \{ flag = CHEAT_UNLOCKED_3 }
    SetGlobalFlag \{ flag = CHEAT_UNLOCKED_5 }
    SetGlobalFlag \{ flag = CHEAT_UNLOCKED_10 }
endscript

script unlock_all_gameplay_cheat_codes 
    SetGlobalFlag \{ flag = CHEAT_UNLOCKED_12 }
    SetGlobalFlag \{ flag = CHEAT_UNLOCKED_13 }
    SetGlobalFlag \{ flag = CHEAT_UNLOCKED_14 }
    SetGlobalFlag \{ flag = CHEAT_UNLOCKED_16 }
    SetGlobalFlag \{ flag = CHEAT_UNLOCKED_17 }
endscript

script unlock_all_cheats 
    unlock_all_gameplay_cheat_codes
    cheat_unlockmovies
    cheat_reallygivelevels
    cheat_give_skaters
    cheat_give_peds
endscript

script cheat_give_skaters 
    cheat_unlock_robotony
    cheat_unlock_mindy
    cheat_unlock_liljohn
    cheat_unlock_iggy
    cheat_unlock_ellis
    cheat_unlock_jimbo
    cheat_unlock_murphy
    cheat_unlock_mega
    cheat_unlock_billiejoe
    cheat_unlock_boone
    cheat_unlock_hoffman
    cheat_unlock_careless
    cheat_unlock_clover
    cheat_unlock_butterfinger1
    cheat_unlock_butterfinger2
    cheat_unlock_butterfinger3
endscript

script cheat_give_peds 
    cheat_unlock_pedgroupA
    cheat_unlock_pedgroupB
    cheat_unlock_pedgroupC
    cheat_unlock_pedgroupD
endscript

script cheat_unlock_robotony 
    SetGlobalFlag \{ flag = SKATER_UNLOCKED_ROBOTONY }
endscript

script cheat_unlock_mindy 
    SetGlobalFlag \{ flag = SKATER_UNLOCKED_MINDY }
endscript

script cheat_unlock_liljohn 
    SetGlobalFlag \{ flag = SKATER_UNLOCKED_LILJOHN }
endscript

script cheat_unlock_iggy 
    SetGlobalFlag \{ flag = SKATER_UNLOCKED_IGGY }
endscript

script cheat_unlock_ellis 
    SetGlobalFlag \{ flag = SKATER_UNLOCKED_ELLIS }
endscript

script cheat_unlock_jimbo 
    SetGlobalFlag \{ flag = SKATER_UNLOCKED_JIMBO }
endscript

script cheat_unlock_murphy 
    SetGlobalFlag \{ flag = SKATER_UNLOCKED_MURPHY }
endscript

script cheat_unlock_mega 
    SetGlobalFlag \{ flag = SKATER_UNLOCKED_MEGA }
endscript

script cheat_unlock_billiejoe 
    SetGlobalFlag \{ flag = SKATER_UNLOCKED_BILLIEJOE }
endscript

script cheat_unlock_boone 
    SetGlobalFlag \{ flag = SKATER_UNLOCKED_BOONE }
endscript

script cheat_unlock_hoffman 
    SetGlobalFlag \{ flag = SKATER_UNLOCKED_HOFFMAN }
endscript

script cheat_unlock_careless 
    SetGlobalFlag \{ flag = SKATER_UNLOCKED_CARELESS }
endscript

script cheat_unlock_pedgroupA 
    SetGlobalFlag \{ flag = SKATER_UNLOCKED_PEDGROUPA }
endscript

script cheat_unlock_pedgroupB 
    SetGlobalFlag \{ flag = SKATER_UNLOCKED_PEDGROUPB }
endscript

script cheat_unlock_pedgroupC 
    SetGlobalFlag \{ flag = SKATER_UNLOCKED_PEDGROUPC }
endscript

script cheat_unlock_pedgroupD 
    SetGlobalFlag \{ flag = SKATER_UNLOCKED_PEDGROUPD }
endscript

script cheat_unlock_clover 
    SetGlobalFlag \{ flag = SKATER_UNLOCKED_CLOVER }
endscript

script cheat_unlock_butterfinger1 
    SetGlobalFlag \{ flag = SKATER_UNLOCKED_BUTTERFINGER1 }
endscript

script cheat_unlock_butterfinger2 
    SetGlobalFlag \{ flag = SKATER_UNLOCKED_BUTTERFINGER2 }
endscript

script cheat_unlock_butterfinger3 
    SetGlobalFlag \{ flag = SKATER_UNLOCKED_BUTTERFINGER3 }
endscript

script cheat_sce_patchtest 
    SceAltPt
endscript

script cheat_unlockmovies 
    SetGlobalFlag \{ flag = MOVIE_UNLOCKED_WASTELAND }
    SetGlobalFlag \{ flag = MOVIE_UNLOCKED_PRO_BAILS }
    SetGlobalFlag \{ flag = MOVIE_UNLOCKED_PRO_BAILS2 }
    SetGlobalFlag \{ flag = MOVIE_UNLOCKED_NS_BAILS }
endscript

script cheat_xxx 
    printf \{ 'Cheat without a cheatscript' }
endscript

script cheat_give_neversoft_skaters 
    change \{ give_neversoft_skaters = 1 }
endscript

script cheat_select_shift 
    change \{ select_shift = 1 }
endscript

script cheat_playsound_good 
    playsound \{ CheatGood }
endscript

script cheat_playsound_bad 
    printf \{ '******************Playing Cheat Bad Sound*****************' }
    playsound \{ CheatBad }
endscript

script cheat_reallygivelevels 
    level_list = [
        Load_Z_BH
        Load_Z_DT
        Load_Z_EL
        Load_Z_SM
        Load_Z_OI
        Load_Z_SV
        Load_Z_LV
        Load_Z_SR
        Load_Z_DN
        Load_Z_SZ
        Load_Z_MA
        Load_Z_CH
        Load_Z_JA
        Load_Z_SV2
        Load_Z_AT
        Load_Z_MS
    ]
    GetArraySize level_list
    i = 0
    begin 
    SetFlag level = (<level_list> [ <i> ])flag = LEVEL_VISITED
    i = (<i> + 1)
    repeat <array_size>
    SetGlobalFlag flag = Z_SR_UNLOCKED_WITH_STORY
endscript

script cheat_unlock_always_special 
    SetGlobalFlag \{ flag = CHEAT_UNLOCKED_12 }
endscript

script cheat_unlock_perfect_rail 
    SetGlobalFlag \{ flag = CHEAT_UNLOCKED_13 }
endscript

script cheat_unlock_perfect_skitch 
    SetGlobalFlag \{ flag = CHEAT_UNLOCKED_14 }
endscript

script cheat_unlock_perfect_manual 
    SetGlobalFlag \{ flag = CHEAT_UNLOCKED_16 }
endscript

script cheat_unlock_moon_grav 
    SetGlobalFlag \{ flag = CHEAT_UNLOCKED_17 }
endscript

script cheat_unlock_debug_menu 
    SetGlobalFlag \{ flag = CHEAT_DEBUG_MENU_UNLOCKED }
endscript
