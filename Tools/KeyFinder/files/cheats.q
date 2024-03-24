
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
    if GotParam on
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
        SetScreenElementProps id = {<id> child = 3}text = 'Off'
        UnsetGlobalFlag flag = <cheat_flag>
        if GotParam off_callback
            <off_callback> <...> 
        endif
    else
        SetScreenElementProps id = {<id> child = 3}text = 'On'
        SetGlobalFlag flag = <cheat_flag>
        if (<cheat_flag> = CHEAT_BIGHEAD)
            if ScreenElementExists id = menu_gorilla
                SetScreenElementProps id = { menu_gorilla child = 3 }text = 'Off'
                UnsetGlobalFlag flag = CHEAT_GORILLA
            endif
        endif
        if (<cheat_flag> = CHEAT_GORILLA)
            if ScreenElementExists id = menu_bighead
                SetScreenElementProps id = { menu_bighead child = 0 }text = 'Off'
                UnsetGlobalFlag flag = CHEAT_BIGHEAD
            endif
        endif
        if GotParam on_callback
            <on_callback> <...> 
        endif
    endif
endscript


script unlock_all_cheat_codes 
    SetGlobalFlag flag = CHEAT_UNLOCKED_1
    SetGlobalFlag flag = CHEAT_UNLOCKED_3
    SetGlobalFlag flag = CHEAT_UNLOCKED_5
    SetGlobalFlag flag = CHEAT_UNLOCKED_10
endscript


script unlock_all_gameplay_cheat_codes 
    SetGlobalFlag flag = CHEAT_UNLOCKED_12
    SetGlobalFlag flag = CHEAT_UNLOCKED_13
    SetGlobalFlag flag = CHEAT_UNLOCKED_14
    SetGlobalFlag flag = CHEAT_UNLOCKED_16
    SetGlobalFlag flag = CHEAT_UNLOCKED_17
endscript


script unlock_all_sponsors 
endscript


script unlock_all_cheats 
    unlock_all_gameplay_cheat_codes
    cheat_unlockmovies
    cheat_reallygivelevels
    cheat_give_skaters
    SetGlobalFlag flag = CAREER_STARTED
    unlock_all_sponsors
    unlock_all_cutscenes
    cheat_unlock_pedgroup1
    cheat_unlock_pedgroup2
    cheat_unlock_pedgroup3
    cheat_unlock_pedgroup4
    cheat_unlock_pedgroup5
    cheat_unlock_pedgroup6
    cheat_unlock_pedgroup7
    cheat_unlock_pedgroup8
    cheat_unlock_pedgroup9
endscript


script cheat_give_skaters 
    SetGlobalFlag flag = SKATER_UNLOCKED_SECRETPC2
    SetGlobalFlag flag = SKATER_UNLOCKED_SHREK
    SetGlobalFlag flag = SKATER_UNLOCKED_SOLDIER
    SetGlobalFlag flag = SKATER_UNLOCKED_PHIL
    SetGlobalFlag flag = SKATER_UNLOCKED_HAND
    SetGlobalFlag flag = SKATER_UNLOCKED_PAULIE
    SetGlobalFlag flag = SKATER_UNLOCKED_NIGEL
    SetGlobalFlag flag = SKATER_UNLOCKED_THPS
    SetGlobalFlag flag = SKATER_UNLOCKED_STEVEO
    SetGlobalFlag flag = SKATER_UNLOCKED_JESSEJAMES
    SetGlobalFlag flag = SKATER_UNLOCKED_NATAS
    cheat_give_story_skaters
    SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP1
    SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP2
    SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP3
    SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP4
    SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP5
    SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP6
    SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP7
    SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP8
endscript


script unlock_PC_secret_character1 
endscript


script unlock_PC_secret_character2 
    SetGlobalFlag flag = SKATER_UNLOCKED_SECRETPC2
endscript


script cheat_give_story_skaters 
    SetGlobalFlag flag = SKATER_UNLOCKED_BENFRANKLIN
    SetGlobalFlag flag = SKATER_UNLOCKED_BULLFIGHTER
    SetGlobalFlag flag = SKATER_UNLOCKED_GRAFFITITAGGER
    SetGlobalFlag flag = SKATER_UNLOCKED_SHRIMPVENDOR
    SetGlobalFlag flag = SKATER_UNLOCKED_JESTER
    SetGlobalFlag flag = SKATER_UNLOCKED_SHECKLER
endscript


script cheat_sce_patchtest 
    SceAltPt
endscript


script cheat_give_shrek 
    SetGlobalFlag flag = SKATER_UNLOCKED_SHREK
endscript


script cheat_give_soldier 
    SetGlobalFlag flag = SKATER_UNLOCKED_SOLDIER
endscript


script cheat_give_phil 
    SetGlobalFlag flag = SKATER_UNLOCKED_PHIL
endscript


script cheat_give_hand 
    SetGlobalFlag flag = SKATER_UNLOCKED_HAND
endscript


script cheat_give_paulie 
    SetGlobalFlag flag = SKATER_UNLOCKED_PAULIE
endscript


script cheat_give_nigel 
    SetGlobalFlag flag = SKATER_UNLOCKED_NIGEL
endscript


script cheat_give_steveo 
    SetGlobalFlag flag = SKATER_UNLOCKED_STEVEO
endscript


script cheat_give_jesse 
    SetGlobalFlag flag = SKATER_UNLOCKED_JESSEJAMES
endscript


script cheat_give_thps 
    SetGlobalFlag flag = SKATER_UNLOCKED_THPS
endscript


script cheat_give_natas 
    SetGlobalFlag flag = SKATER_UNLOCKED_NATAS
endscript


script cheat_unlock_pedgroup1 
    SetGlobalFlag flag = SKATER_UNLOCKED_PEDS
    SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP1
endscript


script cheat_unlock_pedgroup2 
    SetGlobalFlag flag = SKATER_UNLOCKED_PEDS
    SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP2
endscript


script cheat_unlock_pedgroup3 
    SetGlobalFlag flag = SKATER_UNLOCKED_PEDS
    SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP3
endscript


script cheat_unlock_pedgroup4 
    SetGlobalFlag flag = SKATER_UNLOCKED_PEDS
    SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP4
endscript


script cheat_unlock_pedgroup5 
    SetGlobalFlag flag = SKATER_UNLOCKED_PEDS
    SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP5
endscript


script cheat_unlock_pedgroup6 
    SetGlobalFlag flag = SKATER_UNLOCKED_PEDS
    SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP6
endscript


script cheat_unlock_pedgroup7 
    SetGlobalFlag flag = SKATER_UNLOCKED_PEDS
    SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP7
endscript


script cheat_unlock_pedgroup8 
    SetGlobalFlag flag = SKATER_UNLOCKED_PEDS
    SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP8
endscript


script cheat_unlock_pedgroup9 
    SetGlobalFlag flag = SKATER_UNLOCKED_PEDS
    SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP9
endscript


script cheat_unlockmovies 
    SetGlobalFlag flag = MOVIE_UNLOCKED_WDT
    SetGlobalFlag flag = MOVIE_UNLOCKED_PRO_BAILS
    SetGlobalFlag flag = MOVIE_UNLOCKED_PRO_BAILS2
    SetGlobalFlag flag = MOVIE_UNLOCKED_NS_BAILS
endscript


script cheat_xxx 
    
endscript


script cheat_give_neversoft_skaters 
    change give_neversoft_skaters = 1
endscript


script cheat_select_shift 
    change select_shift = 1
endscript


script cheat_playsound_good 
    playsound CheatGood
endscript


script cheat_playsound_bad 
    
    playsound CheatBad
endscript


script cheat_reallygivelevels 
    
    change DEMO_BUILD = 0
    SetGlobalFlag flag = LEVEL_UNLOCKED_TR
    SetGlobalFlag flag = LEVEL_UNLOCKED_BO
    SetGlobalFlag flag = LEVEL_UNLOCKED_BA
    SetGlobalFlag flag = LEVEL_UNLOCKED_BE
    SetGlobalFlag flag = LEVEL_UNLOCKED_AU
    SetGlobalFlag flag = LEVEL_UNLOCKED_NO
    SetGlobalFlag flag = LEVEL_UNLOCKED_ST
    SetGlobalFlag flag = LEVEL_UNLOCKED_SE
    unlock_all_chapters
    SetGlobalFlag flag = LEVEL_BRACKET_UNLOCKED_1
    SetGlobalFlag flag = LEVEL_BRACKET_UNLOCKED_2
    SetGlobalFlag flag = LEVEL_BRACKET_UNLOCKED_3
    SetGlobalFlag flag = LEVEL_BRACKET_UNLOCKED_4
    SetGlobalFlag flag = LEVEL_BRACKET_UNLOCKED_5
    SetGlobalFlag flag = LEVEL_BRACKET_UNLOCKED_6
    SetGlobalFlag flag = LEVEL_BRACKET_UNLOCKED_7
    SetGlobalFlag flag = LEVEL_BRACKET_UNLOCKED_8
    SetGlobalFlag flag = LEVEL_BRACKET_UNLOCKED_9
    SetGlobalFlag flag = GAME_CLASSIC_UNLOCKED_SE2
    SetGlobalFlag flag = LEVEL_SEEN_TR
    SetGlobalFlag flag = LEVEL_SEEN_BO
    SetGlobalFlag flag = LEVEL_SEEN_BA
    SetGlobalFlag flag = LEVEL_SEEN_BE
    SetGlobalFlag flag = LEVEL_SEEN_AU
    SetGlobalFlag flag = LEVEL_SEEN_NO
    SetGlobalFlag flag = LEVEL_SEEN_ST
    SetGlobalFlag flag = LEVEL_SEEN_SE
    SetGlobalFlag flag = LEVEL_SEEN_SE2
    SetGlobalFlag flag = LEVEL_SEEN_SC
    SetGlobalFlag flag = LEVEL_SEEN_PH
    SetGlobalFlag flag = LEVEL_SEEN_DJ
    SetGlobalFlag flag = LEVEL_SEEN_LA
    SetGlobalFlag flag = LEVEL_SEEN_CA
    SetGlobalFlag flag = LEVEL_SEEN_AP
endscript


script cheat_unlock_always_special 
    SetGlobalFlag flag = CHEAT_UNLOCKED_12
endscript


script cheat_unlock_perfect_rail 
    SetGlobalFlag flag = CHEAT_UNLOCKED_13
endscript


script cheat_unlock_perfect_skitch 
    SetGlobalFlag flag = CHEAT_UNLOCKED_14
endscript


script cheat_unlock_perfect_manual 
    SetGlobalFlag flag = CHEAT_UNLOCKED_16
endscript


script cheat_unlock_moon_grav 
    SetGlobalFlag flag = CHEAT_UNLOCKED_17
endscript

