

script refresh_skater_model 
    GetCurrentSkaterProfileIndex
    if LevelIs load_mainmenu
        <skaterIndex> = 0
    else
        <skaterIndex> = <currentSkaterProfileIndex>
    endif
    RefreshSkaterModel profile = <currentSkaterProfileIndex> skater = <skaterIndex>
    RefreshSkaterScale profile = <currentSkaterProfileIndex> skater = <skaterIndex>
    RefreshSkaterVisibility profile = <currentSkaterProfileIndex> skater = <skaterIndex>
endscript


script refresh_skater_model_for_cheats 
    <refresh_both_skaters> = 0
    if InSplitScreenGame
        <refresh_both_skaters> = 1
        if LevelIs load_mainmenu
            <refresh_both_skaters> = 0
        endif
    endif
    if (<refresh_both_skaters> = 1)
        RefreshSkaterScale profile = 0 skater = 0
        RefreshSkaterVisibility profile = 0 skater = 0
        RefreshSkaterScale profile = 1 skater = 1
        RefreshSkaterVisibility profile = 1 skater = 1
    else
        GetCurrentSkaterProfileIndex
        if LevelIs load_mainmenu
            <skaterIndex> = 0
        else
            <skaterIndex> = <currentSkaterProfileIndex>
        endif
        RefreshSkaterScale profile = <currentSkaterProfileIndex> skater = <skaterIndex>
        RefreshSkaterVisibility profile = <currentSkaterProfileIndex> skater = <skaterIndex>
    endif
endscript


script load_pro_skater 
    SelectCurrentSkater name = <name>
    if ((LevelIs load_cas)|| (LevelIs load_mainmenu))
        skater ::SwitchOffBoard
        no_board = no_board
    endif
    GetCurrentSkaterProfileIndex
    RefreshSkaterModel profile = <currentSkaterProfileIndex> skater = 0 no_board = <no_board>
    if (<currentSkaterProfileIndex> = 0)
        UpdateTrickMappings skater = <currentSkaterProfileIndex>
    endif
    GetSkaterProfileInfo player = <currentSkaterProfileIndex>
    set_correct_graffiti_textures <...> 
endscript


script set_correct_graffiti_textures 
    if NOT GotParam name
        script_assert 'no name specified'
    endif
    GetCurrentSkaterProfileIndex
    if NOT (<currentSkaterProfileIndex> = 0)
        return 
    endif
    GetSkaterId skater = <currentSkaterProfileIndex>
    if (<name> = custom)
        if <ObjID> ::HasCustomTagTexture
            <ObjID> ::ApplyCustomTagTexture
        else
            <ObjID> ::SetGraffitiTexture <tag_texture>
        endif
    else
        <ObjID> ::SetGraffitiTexture <tag_texture>
    endif
    if NOT GotParam sticker_texture
        <sticker_texture> = sticker
    endif
    <ObjID> ::SetStickerTexture <sticker_texture>
endscript


script scalingmenu_get_xyz 
    GetCurrentSkaterProfileIndex
    GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = <part>
    if NOT GotParam use_default_scale
        <use_default_scale> = 1
    endif
    if NOT GotParam x
        <x> = 100
    endif
    if NOT GotParam y
        <y> = 100
    endif
    if NOT GotParam z
        <z> = 100
    endif
    if (<use_default_scale> = 1)
        <x> = 100
        <y> = 100
        <z> = 100
    endif
    return x = <x> y = <y> z = <z>
endscript

EG_in_create_a_graphic = 0
EG_TEST_GRAFFITI_AS_SPRITE = 0
edit_graphic_layer_infos = [
    {
        texture_id = odd_1
        texture_name = 'odd_1'
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 32
        pos_y = 32
        rot = 0
        Scale = 0.9200
        flip_h = 0
        flip_v = 0
        hsva = [0 , 90 , 23 , 128]
        layer_id = 0
    }
    {
        texture_id = grap_76
        texture_name = 'grap_76'
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 45
        pos_y = 29
        rot = 351.9
        Scale = 0.9500
        flip_h = 0
        flip_v = 0
        hsva = [0 , 0 , 60 , 128]
        layer_id = 1
    }
    {
        texture_id = grap_76
        texture_name = 'grap_76'
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 22
        pos_y = 40
        rot = 181.7
        Scale = 0.8060
        flip_h = 0
        flip_v = 0
        hsva = [0 , 0 , 60 , 128]
        layer_id = 2
    }
    {
        texture_id = ill_30
        texture_name = 'ill_30'
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 32
        pos_y = 34
        rot = 18.58
        Scale = 0.8670
        flip_h = 0
        flip_v = 0
        hsva = [0 , 0 , 0 , 128]
        layer_id = 6
    }
    {
        texture_id = grap_82
        texture_name = 'grap_82'
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 16
        pos_y = 16
        rot = 331.3
        Scale = 0.4780
        flip_h = 0
        flip_v = 0
        hsva = [0 , 0 , 60 , 128]
        layer_id = 9
    }
    {
        texture_id = odd_15
        texture_name = 'odd_15'
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 36
        pos_y = 30
        rot = 35.0
        Scale = 0.7260
        flip_h = 0
        flip_v = 0
        hsva = [30 , 90 , 60 , 92]
        layer_id = 3
    }
    {
        texture_id = ill_30
        texture_name = 'ill_30'
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 32
        pos_y = 33
        rot = 18.58
        Scale = 0.8120
        flip_h = 0
        flip_v = 0
        hsva = [0 , 0 , 60 , 128]
        layer_id = 7
    }
    {
        texture_id = None
        texture_name = ''
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 32
        pos_y = 32
        rot = 0
        Scale = 1
        flip_h = 0
        flip_v = 0
        hsva = [0 , 0 , 60 , 128]
        layer_id = 4
    }
    {
        texture_id = odd_16
        texture_name = 'odd_16'
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 43
        pos_y = 49
        rot = 349.2
        Scale = 0.6920
        flip_h = 0
        flip_v = 0
        hsva = [180 , 90 , 28 , 128]
        layer_id = 5
    }
    {
        texture_id = ill_17
        texture_name = 'ill_17'
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 50
        pos_y = 47
        rot = 354.9
        Scale = 0.4880
        flip_h = 1
        flip_v = 0
        hsva = [30 , 57 , 60 , 128]
        layer_id = 8
    }
]
layer_infos_need_resetting = 0
edit_graphic_layer_infos_copy = [
    {
        texture_id = odd_1
        texture_name = 'odd_1'
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 32
        pos_y = 32
        rot = 0
        Scale = 0.9200
        flip_h = 0
        flip_v = 0
        hsva = [0 , 90 , 23 , 128]
        layer_id = 0
    }
    {
        texture_id = grap_76
        texture_name = 'grap_76'
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 45
        pos_y = 29
        rot = 351.9
        Scale = 0.9500
        flip_h = 0
        flip_v = 0
        hsva = [0 , 0 , 60 , 128]
        layer_id = 1
    }
    {
        texture_id = grap_76
        texture_name = 'grap_76'
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 22
        pos_y = 40
        rot = 181.7
        Scale = 0.8060
        flip_h = 0
        flip_v = 0
        hsva = [0 , 0 , 60 , 128]
        layer_id = 2
    }
    {
        texture_id = ill_30
        texture_name = 'ill_30'
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 32
        pos_y = 34
        rot = 18.58
        Scale = 0.8670
        flip_h = 0
        flip_v = 0
        hsva = [0 , 0 , 0 , 128]
        layer_id = 6
    }
    {
        texture_id = grap_82
        texture_name = 'grap_82'
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 16
        pos_y = 16
        rot = 331.3
        Scale = 0.4780
        flip_h = 0
        flip_v = 0
        hsva = [0 , 0 , 60 , 128]
        layer_id = 9
    }
    {
        texture_id = odd_15
        texture_name = 'odd_15'
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 36
        pos_y = 30
        rot = 35.0
        Scale = 0.7260
        flip_h = 0
        flip_v = 0
        hsva = [30 , 90 , 60 , 92]
        layer_id = 3
    }
    {
        texture_id = ill_30
        texture_name = 'ill_30'
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 32
        pos_y = 33
        rot = 18.58
        Scale = 0.8120
        flip_h = 0
        flip_v = 0
        hsva = [0 , 0 , 60 , 128]
        layer_id = 7
    }
    {
        texture_id = None
        texture_name = ''
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 32
        pos_y = 32
        rot = 0
        Scale = 1
        flip_h = 0
        flip_v = 0
        hsva = [0 , 0 , 60 , 128]
        layer_id = 4
    }
    {
        texture_id = odd_16
        texture_name = 'odd_16'
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 43
        pos_y = 49
        rot = 349.2
        Scale = 0.6920
        flip_h = 0
        flip_v = 0
        hsva = [180 , 90 , 28 , 128]
        layer_id = 5
    }
    {
        texture_id = ill_17
        texture_name = 'ill_17'
        string = ''
        canvas_id = None
        font_id = 0
        pos_x = 50
        pos_y = 47
        rot = 354.9
        Scale = 0.4880
        flip_h = 1
        flip_v = 0
        hsva = [30 , 57 , 60 , 128]
        layer_id = 8
    }
]
