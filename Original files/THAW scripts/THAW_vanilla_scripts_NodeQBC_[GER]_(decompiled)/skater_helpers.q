debug_CAS_show_appearance = 0
edit_graphic_layer_infos = [
]

script refresh_skater_model 
    GetCurrentSkaterProfileIndex
    if InFrontend
        <skaterIndex> = 0
    else
        <skaterIndex> = <currentSkaterProfileIndex>
    endif
    RefreshSkaterModel texDictOffset = 9 profile = <currentSkaterProfileIndex> skater = <skaterIndex>
    RefreshSkaterScale profile = <currentSkaterProfileIndex> skater = <skaterIndex>
    RefreshSkaterVisibility profile = <currentSkaterProfileIndex> skater = <skaterIndex>
endscript

script refresh_skater_model_for_cheats 
    <refresh_both_skaters> = 0
    if InSplitScreenGame
        <refresh_both_skaters> = 1
        if InFrontend
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
        if InFrontend
            <skaterIndex> = 0
        else
            <skaterIndex> = <currentSkaterProfileIndex>
        endif
        RefreshSkaterScale profile = <currentSkaterProfileIndex> skater = <skaterIndex>
        RefreshSkaterVisibility profile = <currentSkaterProfileIndex> skater = <skaterIndex>
    endif
endscript

script load_pro_skater_set_custom 
    load_pro_skater_get_current_skater_name
    load_pro_skater_get_desired_skater_profile_name
    if NOT (<current_skater> = <desired_skater_profile_name>)
        load_pro_skater {profile = 0 skater = 0 name = <desired_skater_profile_name>}
    endif
endscript

script load_pro_skater_get_current_skater_name 
    GetCurrentSkaterProfileIndex
    GetSingleSkaterProfileInfo player = <currentSkaterProfileIndex> name
    return current_skater = <name>
endscript

script load_pro_skater_get_desired_skater_profile_name 
    if GameModeEquals \{ is_career }
        return \{ desired_skater_profile_name = custom_story }
    else
        return \{ desired_skater_profile_name = custom_classic }
    endif
endscript

script load_pro_skater profile = 0 skater = 0
    if NOT GotParam name
        load_pro_skater_get_desired_skater_profile_name
        <name> = <desired_skater_profile_name>
    endif
    save_player_profile_caginfo
    SelectCurrentSkater name = <name>
    get_player_profile_caginfo
    if InFrontend
        skater ::SwitchOffBoard
        no_board = no_board
    endif
    GetCurrentSkaterProfileIndex
    refresh_skater_model profile = <currentSkaterProfileIndex> skater = 0
    if (<currentSkaterProfileIndex> = 0)
        UpdateTrickMappings skater = <currentSkaterProfileIndex>
    endif
    GetSkaterProfileInfo player = <currentSkaterProfileIndex>
    set_correct_graffiti_textures <...> 
endscript

script set_correct_graffiti_textures 
    if NOT GotParam name
        script_assert 'Kein Name festgelegt'
    endif
    GetCurrentSkaterProfileIndex
    if NOT (<currentSkaterProfileIndex> = 0)
        return 
    endif
    GetSkaterProfileInfo player = <currentSkaterProfileIndex>
    GetSkaterId skater = <currentSkaterProfileIndex>
    if (<is_pro> = 0)
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
player_voices = [
    {
        id = male1
        stream_name = 'Male1'
        play_skater_stream_name = 'CustomM1'
        frontend_desc = 'Männlich 1'
        is_male = 1
    }
    {
        id = male2
        stream_name = 'Male2'
        play_skater_stream_name = 'CustomM2'
        frontend_desc = 'Männlich 2'
        is_male = 1
    }
    {
        id = male3
        stream_name = 'Male3'
        play_skater_stream_name = 'CustomM3'
        frontend_desc = 'Männlich 3'
        is_male = 1
    }
    {
        id = male4
        stream_name = 'Male4'
        play_skater_stream_name = 'CustomM4'
        frontend_desc = 'Männlich 4'
        is_male = 1
    }
    {
        id = female1
        stream_name = 'Female1'
        play_skater_stream_name = 'CustomF1'
        frontend_desc = 'Weiblich 1'
        is_male = 0
    }
    {
        id = Female2
        stream_name = 'Female2'
        play_skater_stream_name = 'CustomF2'
        frontend_desc = 'Weiblich 2'
        is_male = 0
    }
]
EG_in_create_a_graphic = 0
EG_pak_loaded = 0
EG_pak_always_in_frontend = 1
EG_TEST_GRAFFITI_AS_SPRITE = 0

script edit_graphic_get_array_info_vals 
    return (edit_graphic_layer_infos [ <index> ])
endscript

script edit_graphic_change_layer_info_value use_current = 1
    <tmpArray> = edit_graphic_layer_infos
    if (<use_current> = 1)
        <info_index> = EG_current_layer_info_index
    else
        <info_index> = <index>
    endif
    edit_graphic_get_array_info_vals index = <info_index>
    if (GotParam change_texture_id)
        <texture_id> = <change_texture_id>
    endif
    if (GotParam change_texture_name)
        <texture_name> = <change_texture_name>
    endif
    if (GotParam change_string)
        <string> = <change_string>
    endif
    if (GotParam change_font_id)
        <font_id> = <change_font_id>
    endif
    if (GotParam change_canvas_id)
        <canvas_id> = <change_canvas_id>
    endif
    if (GotParam change_pos_x)
        <pos_x> = <change_pos_x>
    endif
    if (GotParam change_pos_y)
        <pos_y> = <change_pos_y>
    endif
    if (GotParam change_rot)
        <rot> = <change_rot>
    endif
    if (GotParam change_scale)
        <Scale> = <change_scale>
    endif
    if (GotParam change_flip_h)
        <flip_h> = <change_flip_h>
    endif
    if (GotParam change_flip_v)
        <flip_v> = <change_flip_v>
    endif
    if (GotParam change_h)
        SetArrayElement arrayName = hsva index = 0 newValue = <change_h>
    endif
    if (GotParam change_s)
        SetArrayElement arrayName = hsva index = 1 newValue = <change_s>
    endif
    if (GotParam change_v)
        SetArrayElement arrayName = hsva index = 2 newValue = <change_v>
    endif
    if (GotParam change_a)
        SetArrayElement arrayName = hsva index = 3 newValue = <change_a>
    endif
    if (GotParam change_layer_id)
        <layer_id> = <change_layer_id>
    endif
    SetArrayElement {arrayName = tmpArray index = <info_index>
        newValue = {texture_id = <texture_id> texture_name = <texture_name> string = <string> canvas_id = <canvas_id>
            font_id = <font_id> pos_x = <pos_x> pos_y = <pos_y> rot = <rot> Scale = <Scale>
            flip_h = <flip_h> flip_v = <flip_v> hsva = <hsva> layer_id = <layer_id>
        }
    }
endscript

script edit_graphic_prepare_sprite_infos 
    <sprite_infos> = []
    <index> = 0
    begin 
    <layer_info_index> = 0
    begin 
    if ((edit_graphic_layer_infos [ <layer_info_index> ].layer_id)= <index>)
        break 
    endif
    <layer_info_index> = (<layer_info_index> + 1)
    repeat 10
    if ((edit_graphic_layer_infos [ <layer_info_index> ].texture_id)= None)
        if NOT ((edit_graphic_layer_infos [ <layer_info_index> ].string)= '')
            edit_graphic_prepare_text_sprite_infos info_index = <layer_info_index>
            <sprite_infos> = (<sprite_infos> + <text_infos>)
        endif
    else
        <posx> = ((edit_graphic_layer_infos [ <layer_info_index> ].pos_x)- 32)
        <posy> = ((edit_graphic_layer_infos [ <layer_info_index> ].pos_y)- 32)
        HSVtoRGB hsv = (edit_graphic_layer_infos [ <layer_info_index> ].hsva)
        <tmp_array> = [
            {
                texture_id = (edit_graphic_layer_infos [ <layer_info_index> ].texture_id)
                pos_x = <posx>
                pos_y = <posy>
                rot = (edit_graphic_layer_infos [ <layer_info_index> ].rot)
                Scale = (edit_graphic_layer_infos [ <layer_info_index> ].Scale)
                flip_h = (edit_graphic_layer_infos [ <layer_info_index> ].flip_h)
                flip_v = (edit_graphic_layer_infos [ <layer_info_index> ].flip_v)
                rgba = <rgb>
                layer_id = (edit_graphic_layer_infos [ <layer_info_index> ].layer_id)
            }
        ]
        <sprite_infos> = (<sprite_infos> + <tmp_array>)
    endif
    <index> = (<index> + 1)
    RemoveParameter layer_info_index
    repeat 10
    return sprite_infos = <sprite_infos>
endscript

script edit_graphic_prepare_text_sprite_infos 
    <layer_string> = (edit_graphic_layer_infos [ <info_index> ].string)
    StringToCharArray string = <layer_string>
    GetArraySize <char_array>
    <font_spacing> = (EG_font_names [(edit_graphic_layer_infos [ <info_index> ].font_id)].spacing)
    <container_scale> = (edit_graphic_layer_infos [ <info_index> ].Scale)
    <char_image_size> = ((64.0 / <array_size>)* <container_scale>)
    <container_pos_x> = (edit_graphic_layer_infos [ <info_index> ].pos_x)
    <char_x_pos> = ((0 - ((<char_image_size> * <array_size>)/ 2))+ (<char_image_size> / 2))
    <char_y_pos> = 0
    <font> = (EG_font_names [(edit_graphic_layer_infos [ <info_index> ].font_id)].name)
    <Scale> = (<char_image_size> / 64.0)
    if NOT (<array_size> = 1)
        if NOT (<font_spacing> = 0)
            <Scale> = (<Scale> * (1 / <font_spacing>))
        endif
    endif
    <rot> = (edit_graphic_layer_infos [ <info_index> ].rot)
    HSVtoRGB hsv = (edit_graphic_layer_infos [ <info_index> ].hsva)
    <text_infos> = []
    <index> = 0
    begin 
    <char> = (<char_array> [ <index> ])
    if (<char> = ' ')
        FormatText checksumname = texture '%f_a' f = <font> l = <char>
        <rgba> = [0 , 0 , 0 , 0]
    else
        FormatText checksumname = texture '%f_%l' f = <font> l = <char>
        <rgba> = <rgb>
    endif
    Get2DPosFrom2DVec magnitude = <char_x_pos> theta = <rot>
    <tmp_array> = [
        {
            texture_id = <texture>
            pos_x = (<x> + (<container_pos_x> - 32))
            pos_y = (<y> + ((edit_graphic_layer_infos [ <info_index> ].pos_y)- 32))
            rot = <rot>
            Scale = <Scale>
            flip_h = (edit_graphic_layer_infos [ <info_index> ].flip_h)
            flip_v = (edit_graphic_layer_infos [ <info_index> ].flip_v)
            rgba = <rgba>
            layer_id = (edit_graphic_layer_infos [ <info_index> ].layer_id)
        }
    ]
    <text_infos> = (<text_infos> + <tmp_array>)
    <char_x_pos> = (<char_x_pos> + <char_image_size>)
    <index> = (<index> + 1)
    repeat <array_size>
    <index> = (<array_size> - 1)
    <reverse_infos> = []
    begin 
    <tmp_array> = [{(<text_infos> [ <index> ])}]
    <reverse_infos> = (<reverse_infos> + <tmp_array>)
    <index> = (<index> - 1)
    repeat <array_size>
    return text_infos = <reverse_infos>
endscript

script edit_graphic_apply_graphic_from_save 
    if NOT IsTrue EG_pak_loaded
        LoadPak 'pak/CAGR_assets/CAGR_assets.pak' localized
        want_pak_unload = 1
    endif
    <textures> = []
    <index> = 0
    begin 
    if NOT ((edit_graphic_layer_infos [ <index> ].texture_name)= '')
        <temp_array> = [
            {
                image = (edit_graphic_layer_infos [ <index> ].texture_name)
            }
        ]
        <textures> = (<textures> + <temp_array>)
    else
        if NOT ((edit_graphic_layer_infos [ <index> ].string)= '')
            <font> = (EG_font_names [(edit_graphic_layer_infos [ <index> ].font_id)].name)
            StringToCharArray string = (edit_graphic_layer_infos [ <index> ].string)
            GetArraySize <char_array>
            <index2> = 0
            begin 
            FormatText textname = Character '%a_%b' a = <font> b = (<char_array> [ <index2> ])
            <temp_array> = [
                {
                    Character = <Character>
                }
            ]
            <textures> = (<textures> + <temp_array>)
            <index2> = (<index2> + 1)
            repeat <array_size>
        endif
    endif
    <index> = (<index> + 1)
    repeat 10
    edit_graphic_prepare_sprite_infos
    GetCurrentSkaterProfileIndex
    GenerateCAGTexture info_array = <sprite_infos> player = <currentSkaterProfileIndex> test = 0
    if GotParam want_pak_unload
        BeginUnloadPak 'pak/CAGR_assets/CAGR_assets.pak' localized
        EndUnloadPak 'pak/CAGR_assets/CAGR_assets.pak' localized
    endif
endscript

script edit_graphic_print_layers 
    printf ' '
    printf '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
    printf '------------  COPY BELOW HERE  ------------------'
    printf ' '
    printf '    {'
    printf '        premade_texture       = pre_cagr_INSERTNUMBERHERE'
    printf '        premade_layer_infos   = ['
    <index> = 0
    begin 
    printf '            {'
    if ((edit_graphic_layer_infos [ <index> ].texture_id)= None)
        printf '                texture_id=none'
    else
        printf '                texture_id=%s' s = (edit_graphic_layer_infos [ <index> ].texture_name)
    endif
    printf '                texture_name=\'%s\'' s = (edit_graphic_layer_infos [ <index> ].texture_name)
    printf '                string=\'%s\'' s = (edit_graphic_layer_infos [ <index> ].string)
    printf '                canvas_id=none'
    printf '                font_id=%s' s = (edit_graphic_layer_infos [ <index> ].font_id)
    printf '                pos_x=%s' s = (edit_graphic_layer_infos [ <index> ].pos_x)
    printf '                pos_y=%s' s = (edit_graphic_layer_infos [ <index> ].pos_y)
    printf '                rot=%s' s = (edit_graphic_layer_infos [ <index> ].rot)
    printf '                scale=%s' s = (edit_graphic_layer_infos [ <index> ].Scale)
    printf '                flip_h=%s' s = (edit_graphic_layer_infos [ <index> ].flip_h)
    printf '                flip_v=%s' s = (edit_graphic_layer_infos [ <index> ].flip_v)
    printf '                hsva=[%h,%s,%v,%a]' h = (edit_graphic_layer_infos [ <index> ].hsva [ 0 ])s = (edit_graphic_layer_infos [ <index> ].hsva [ 1 ])v = (edit_graphic_layer_infos [ <index> ].hsva [ 2 ])a = (edit_graphic_layer_infos [ <index> ].hsva [ 3 ])
    printf '                layer_id=%s' s = (edit_graphic_layer_infos [ <index> ].layer_id)
    printf '            }'
    <index> = (<index> + 1)
    repeat 10
    printf '        ]'
    printf '    }'
    printf ' '
    printf '------------  COPY ABOVE HERE  ------------------'
    printf '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
    printf ' '
endscript

script edit_graphic_set_layer_infos 
    <index> = 0
    begin 
    if NOT ((<layer_infos> [ <index> ].texture_name)= '')
        FormatText checksumname = texture_id '%t' t = (<layer_infos> [ <index> ].texture_name)
    else
        <texture_id> = None
    endif
    edit_graphic_change_layer_info_value {
        use_current = 0
        index = <index>
        change_texture_id = <texture_id>
        change_texture_name = (<layer_infos> [ <index> ].texture_name)
        change_string = (<layer_infos> [ <index> ].string)
        change_font_id = (<layer_infos> [ <index> ].font_id)
        change_pos_x = (<layer_infos> [ <index> ].pos_x)
        change_pos_y = (<layer_infos> [ <index> ].pos_y)
        change_rot = (<layer_infos> [ <index> ].rot)
        change_scale = (<layer_infos> [ <index> ].Scale)
        change_flip_h = (<layer_infos> [ <index> ].flip_h)
        change_flip_v = (<layer_infos> [ <index> ].flip_v)
        change_h = (<layer_infos> [ <index> ].hsva [ 0 ])
        change_s = (<layer_infos> [ <index> ].hsva [ 1 ])
        change_v = (<layer_infos> [ <index> ].hsva [ 2 ])
        change_a = (<layer_infos> [ <index> ].hsva [ 3 ])
        change_layer_id = (<layer_infos> [ <index> ].layer_id)
    }
    <index> = (<index> + 1)
    repeat 10
endscript
