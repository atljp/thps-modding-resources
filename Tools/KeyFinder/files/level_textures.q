
script display_current_level_texture_values 
    if ScreenElementExists id = texture_list
        DestroyScreenElement id = texture_list
    endif
    initials = ['af' 'jg' 'tb' 'jku' 'apm' 'cp' 'jo' 'as' 'hj' 'jm' 'tz' 'tw' 'cs' 'tc' 'cr' 'cg' 'jt' 'jh']
    if LevelIs load_bo
        if GotParam bo
            level = <bo>
        else
            return 
        endif
    endif
    if LevelIs load_be
        if GotParam be
            level = <be>
        else
            return 
        endif
    endif
    if LevelIs load_ba
        if GotParam ba
            level = <ba>
        else
            return 
        endif
    endif
    if LevelIs load_au
        if GotParam AU
            level = <AU>
        else
            return 
        endif
    endif
    if LevelIs load_NO
        if GotParam no
            level = <no>
        else
            return 
        endif
    endif
    if LevelIs load_se
        if GotParam SE
            level = <SE>
        else
            return 
        endif
    endif
    if LevelIs load_default
        if GotParam Def_Lev
            level = <Def_Lev>
        else
            return 
        endif
    endif
    if NOT GotParam level
        return 
    endif
    SetScreenElementLock id = root_window Off
    GetArraySize <initials>
    index = 0
    shift = 0
    begin 
    FormatText checksumname = checksum '%i' i = (<initials> [ <index> ])
    if (<level>.<checksum> > 0)
        FormatText textname = text '%i = %t KB' i = (<initials> [ <index> ])t = ((<level>.<checksum>)/ 1024)
        CreateScreenElement {
            type = TextElement
            parent = tex_count_anchor
            Pos = (((0.0, 15.0) * <shift>)+ (0.0, 30.0))
            text = <text>
            font = dialog
            rgba = [ 60 60 100 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        shift = (<shift> + 1)
    endif
    index = (<index> + 1)
    repeat <array_size>
endscript

