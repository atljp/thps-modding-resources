
EG_creating_premade = 0
EG_premade_key_color = [60 , 60 , 60 , 128]
EG_selected_text_color = [128 , 128 , 128 , 128]
EG_unselected_text_color = [64 , 64 , 64 , 128]
EG_unselectable_text_color = [64 , 64 , 64 , 64]
EG_selected_title_color = [40 , 40 , 110 , 128]
EG_unselected_title_color = [0 , 0 , 80 , 128]
EG_selected_background_color = [16 , 16 , 16 , 128]
EG_unselected_background_color = [64 , 64 , 64 , 128]
EG_inuse_background_color = [32 , 32 , 32 , 128]
EG_unselected_image_color = [64 , 64 , 64 , 128]
EG_selected_image_color = [128 , 128 , 128 , 128]
EG_image_background_color = [32 , 32 , 32 , 128]
EG_current_layer_menu_index = 0
EG_current_layer_info_index = 0
EG_thumb_scale = (0.32499998807907104, 0.32499998807907104)
EG_thumb_pos = (47.0, 2.0)
EG_canvas_scale_factor = 2.875
EG_canvas_pos_factor = 2.875
EG_canvas_base_z = 0
EG_color_swatch_values = [
    [128 , 128 , 128 , 128]
    [128 , 0 , 0 , 128]
    [128 , 64 , 0 , 128]
    [128 , 128 , 0 , 128]
    [0 , 128 , 0 , 128]
    [0 , 0 , 128 , 128]
    [80 , 0 , 128 , 128]
    [128 , 0 , 80 , 128]
    [0 , 0 , 0 , 128]
    [50 , 0 , 0 , 128]
    [45 , 22 , 10 , 128]
    [0 , 50 , 0 , 128]
    [0 , 128 , 128 , 128]
    [0 , 60 , 60 , 128]
    [0 , 0 , 50 , 128]
    [50 , 0 , 50 , 128]
]
EG_font_names = [
    {
        name = 'graf1'
        spacing = 1
    }
    {
        name = 'graf2'
        spacing = 0.8000
    }
    {
        name = 'bold1'
        spacing = 0.6500
    }
    {
        name = 'block1'
        spacing = 0.8500
    }
    {
        name = 'ns1'
        spacing = 0.8200
    }
    {
        name = 'sten1'
        spacing = 0.6500
    }
    {
        name = 'spr1'
        spacing = 0.8000
    }
    {
        name = 'threed'
        spacing = 0.4500
    }
]

script edit_graphic_launch_cagr 
    edit_graphic_create_pre_menu
endscript


script edit_graphic_create_pre_menu 
    change EG_in_create_a_graphic = 1
    skater ::RemoveSkaterFromWorld
    play_no_skater_cam
    make_new_themed_sub_menu title = 'CREATE-A-GRAPHIC'
    SetScreenElementProps {id = sub_vmenu
        event_handlers = [{ pad_back edit_graphic_exit_pre_menu }]
    }
    theme_menu_add_item {text = 'Create New'
        pad_choose_script = edit_graphic_confirm_new_dialog
        pad_choose_params = {
            message_title = 'NEW GRAPHIC'
            test
            yes_script = edit_graphic_create_main_menu
            yes_params = { new = 1 }
        }
        centered
    }
    theme_menu_add_item {text = 'Edit Current'
        pad_choose_script = edit_graphic_create_main_menu
        pad_choose_params = { new = 0 }
        centered
    }
    theme_menu_add_item {text = 'Load Graphic'
        pad_choose_script = edit_graphic_confirm_new_dialog
        pad_choose_params = {
            message_title = 'LOAD GRAPHIC'
            yes_script = launch_load_cagr_sequence
        }
        centered
    }
    theme_menu_add_item {text = 'Save Graphic'
        pad_choose_script = launch_save_cagr_sequence
        centered
    }
    theme_menu_add_item {text = 'Load Premade'
        pad_choose_script = edit_graphic_confirm_new_dialog
        pad_choose_params = {
            message_title = 'LOAD PREMADE'
            yes_script = edit_graphic_create_premade_menu
        }
        centered
    }
    theme_menu_add_item {text = 'Done'
        pad_choose_script = edit_graphic_exit_pre_menu
        centered
        last_menu_item = last_menu_item
    }
    if LevelIs Load_MainMenu
        add_options_menu_sign_element icon = graphic_icon icon_angle = 43 icon_pos = (585.0, 202.0) icon_scale = 1.150
    endif
    finish_themed_sub_menu
endscript


script edit_graphic_exit_pre_menu 
    change EG_in_create_a_graphic = 0
    create_createamodes_menu
endscript


script edit_graphic_confirm_new_dialog 
    FireEvent type = unfocus target = current_menu
    create_error_box {title = <message_title>
        text = 'All unsaved changes to the currently loaded graphic will be lost! Would you like to continue?'
        buttons = [{text = 'Yes' pad_choose_script = <yes_script> pad_choose_params = <yes_params>}
            {text = 'No' pad_choose_script = edit_graphic_confirm_new_dialog_exit}
        ]
        no_bg
    }
endscript


script edit_graphic_confirm_new_dialog_exit 
    FireEvent type = focus target = current_menu
    dialog_box_exit no_pad_start
endscript

EG_premade_item_menu_selection = 0

script edit_graphic_create_premade_menu 
    dialog_box_exit no_pad_start
    if IsNgc
        MemPushContext TopDownHeap
        change screen_element_heap = TopDown
    else
        change screen_element_heap = FrontEnd
    endif
    load_cag_premade_to_main_memory
    if ScreenElementExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    SetScreenElementLock id = root_window off
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = current_menu_anchor
        dims = (640.0, 480.0)
        pos = (320.0, 240.0)
        heap = (screen_element_heap)
    }
    build_top_and_bottom_blocks
    make_mainmenu_3d_plane
    build_theme_sub_title title = 'LOAD PREMADE GRAPHIC'
    create_helper_text {
        helper_text_elements = [
            { text = '\b7/\b4/\b6/\b5 = Select' }
            { text = '\bn = Back' }
            { text = '\bm = Accept' }
        ]
    }
    CreateScreenElement {
        type = VScrollingMenu
        parent = current_menu_anchor
        id = edit_graphic_image_vscrollingmenu
        just = [ left top ]
        pos = (50.0, 88.0)
        dims = (224.0, 284.0)
        alpha = 0
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        type = VMenu
        parent = edit_graphic_image_vscrollingmenu
        id = edit_graphic_image_vmenu
        spacing_between = 4
        pos = (0.0, 0.0)
        just = [ left top ]
        dims = (224.0, 284.0)
        tags = { category_index = <index> }
        heap = (screen_element_heap)
    }
    SetScreenElementProps {
        id = edit_graphic_image_vmenu
        event_handlers = [{ pad_back generic_menu_pad_back_sound }
            {pad_back edit_graphic_exit_premade_menu params = { new_script = edit_graphic_create_pre_menu }}
            {pad_up generic_menu_up_or_down_sound params = { up }}
            {pad_down generic_menu_up_or_down_sound params = { down }}
        ]
        replace_handlers
    }
    GetArraySize edit_graphic_premade_graphics
    <index> = 0
    <hcounter> = 0
    <row_counter> = 0
    begin 
    if (<hcounter> = 0)
        FormatText checksumname = menu_id 'edit_graphic_image_row_%i' i = <row_counter>
        CreateScreenElement {
            type = HMenu
            parent = edit_graphic_image_vmenu
            id = <menu_id>
            spacing_between = 4
            dims = (224.0, 68.0)
            pos = (0.0, 0.0)
            just = [ left top ]
            heap = (screen_element_heap)
        }
        SetScreenElementProps {
            id = <menu_id>
            event_handlers = [{focus edit_graphic_premade_item_menu_focus params = { menu_id = <menu_id> }}
                { pad_left check_ok_pad_left }
                { pad_right check_ok_pad_right }
            ]
            replace_handlers
        }
        AssignAlias id = <menu_id> alias = current_image_hmenu
        <row_counter> = (<row_counter> + 1)
    endif
    edit_graphic_add_premade_menu_item texture = (edit_graphic_premade_graphics [ <index> ].premade_texture)index = <index> hindex = <hcounter>
    <hcounter> = (<hcounter> + 1)
    if (<hcounter> = 3)
        <hcounter> = 0
    endif
    <index> = (<index> + 1)
    repeat <array_size>
    if ((<hcounter> < 3)& (<hcounter> > 0))
        begin 
        CreateScreenElement {
            parent = current_image_hmenu
            type = ContainerElement
            dims = (68.0, 68.0)
            not_focusable
            just = [ left top ]
            heap = (screen_element_heap)
        }
        <hcounter> = (<hcounter> + 1)
        if (<hcounter> = 3)
            break 
        endif
        repeat 
    endif
    Theme_GetAltColor return_value = grad_color
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = grad_bar_left
        texture = goal_grad
        rgba = <grad_color>
        scale = (9.199999809265137, 1.0)
        pos = (286.0, 84.0)
        just = [ left top ]
        z_priority = 35
        rot_angle = 89.90
    }
    create_scroll_bar parent = current_menu_anchor VMenu = edit_graphic_image_vmenu items = <array_size> cols = 3 pos = (290.0, 87.0) size_height = 285
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = grad_bar_right
        texture = goal_grad
        rgba = <grad_color>
        scale = (9.199999809265137, 1.0)
        pos = (297.0, 84.0)
        just = [ left top ]
        z_priority = 35
        rot_angle = 90
    }
    change EG_premade_item_menu_selection = 0
    if LevelIs Load_MainMenu
        add_options_menu_sign_element icon = premade_icon scale = 0.5000 icon_angle = 43 icon_pos = (585.0, 202.0) icon_scale = 1.150
    endif
    wait 2 gameframes
    SetScreenElementProps id = edit_graphic_image_vscrollingmenu reset_window_top
    DoScreenElementMorph id = edit_graphic_image_vscrollingmenu alpha = 1
    FireEvent type = focus target = edit_graphic_image_vmenu
endscript


script create_scroll_bar {
        items = 1
        cols = 1
        size_height = 100
        pos = (0.0, 0.0)
        icon_height = 20
        bar_color = [ 0 0 0 128 ]
        width = 10
    }
    if NOT GotParam icon_color
        Theme_GetPauseBarColor return_value = icon_color
    endif
    if GotParam no_wrap
        <VMenu> ::SetTags no_wrap = 1
    else
        <VMenu> ::SetTags no_wrap = 0
    endif
    <VMenu> ::SetTags scrollbar_items = <items> scrollbar_pos = 1
    rows = (<items> / <cols>)
    if NOT ((<items> - <rows> * <cols>)= 0)
        <rows> = (<rows> + 1)
    endif
    SetScreenElementProps {
        id = <VMenu>
        event_handlers = [{pad_up scrollbar_up_down params = { up }}
            {pad_down scrollbar_up_down params = { down }}
        ]
    }
    CreateScreenElement {
        type = ContainerElement
        parent = <parent>
        id = scrollbar_holder
        pos = <pos>
        not_focusable
    }
    CreateScreenElement {
        type = SpriteElement
        parent = scrollbar_holder
        id = scrollbar_bg
        texture = white2
        pos = (0.0, 0.0)
        scale = 1
        rgba = <bar_color>
        z_priority = 10
        just = [ center top ]
    }
    CreateScreenElement {
        type = SpriteElement
        parent = scrollbar_holder
        id = scrollbar_icon
        texture = white2
        pos = (0.0, 0.0)
        scale = 1
        rgba = <icon_color>
        z_priority = 11
        just = [ center top ]
    }
    GetScreenElementDims id = scrollbar_bg
    scale_width = (<width> / (<width> * 1.0))
    icon_scaley = (<icon_height> / (<height> * 1.0))
    icon_scale = (<scale_width> * (1.0, 0.0) + (0.0, 1.0) * <icon_scaley>)
    DoScreenElementMorph id = scrollbar_icon time = 0 scale = <icon_scale>
    GetScreenElementDims id = scrollbar_icon
    sb_icon_size = <height>
    GetScreenElementDims id = scrollbar_bg
    bg_scaley = (<size_height> / (<height> * 1.0))
    bg_scale = (<scale_width> * (1.0, 0.0) + <bg_scaley> * (0.0, 1.0))
    DoScreenElementMorph id = scrollbar_bg time = 0 scale = <bg_scale>
    GetScreenElementDims id = scrollbar_bg
    icon_slide_increment = ((<height> * 1.0 - <sb_icon_size> * 1.0)/ (<rows> -1.0))
    icon_increment = ((0.0, 0.0) + <icon_slide_increment> * (0.0, 1.0))
    <VMenu> ::SetTags scrollbar_rows = <rows> sb_icon_pos = (0.0, 0.0) sb_increment = <icon_increment> sb_height = <height> sb_icon_size = <sb_icon_size>
endscript


script scrollbar_up_down 
    GetTags
    if GotParam up
        if ((<scrollbar_pos> -1)< 1)
            if NOT (<no_wrap>)
                <scrollbar_pos> = <scrollbar_rows>
                <sb_icon_pos> = ((<sb_icon_pos>.(1.0, 0.0))* (1.0, 0.0) + (0.0, 1.0) * (<sb_height> - <sb_icon_size>))
            endif
        else
            <scrollbar_pos> = (<scrollbar_pos> -1)
            <sb_icon_pos> = (<sb_icon_pos> - <sb_increment>)
        endif
    else
        if ((<scrollbar_pos> + 1)> <scrollbar_rows>)
            if NOT (<no_wrap>)
                <scrollbar_pos> = 1
                <sb_icon_pos> = ((<sb_icon_pos>.(1.0, 0.0))* (1.0, 0.0))
            endif
        else
            <scrollbar_pos> = (<scrollbar_pos> + 1)
            <sb_icon_pos> = (<sb_icon_pos> + <sb_increment>)
        endif
    endif
    SetTags scrollbar_pos = <scrollbar_pos> sb_icon_pos = <sb_icon_pos>
    DoScreenElementMorph id = scrollbar_icon time = 0 pos = <sb_icon_pos>
endscript


script edit_graphic_exit_premade_menu 
    if ScreenElementExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    load_cag_premade_to_main_memory unload
    if IsNgc
        MemPopContext
    endif
    <new_script> <new_script_params>
endscript


script edit_graphic_add_premade_menu_item 
    FormatText checksumname = id 'premade-%a' a = <index>
    CreateScreenElement {
        parent = current_image_hmenu
        type = ContainerElement
        id = <id>
        dims = (68.0, 68.0)
        event_handlers = [{focus edit_graphic_premade_item_focus params = {id = <id> index = <hindex>}}
            {unfocus edit_graphic_premade_item_unfocus params = { id = <id> }}
            { pad_choose generic_menu_pad_choose_sound }
            {pad_choose edit_graphic_select_premade params = {graphic_index = <index> texture = <texture>}}
            { pad_start null_script }
        ]
        just = [ left top ]
        heap = (screen_element_heap)
    }
    <item_id> = <id>
    CreateScreenElement {
        parent = <item_id>
        type = SpriteElement
        texture = white2
        rgba = EG_unselected_image_color
        scale = (8.5, 8.5)
        pos = (0.0, 0.0)
        just = [ left top ]
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        parent = <item_id>
        type = SpriteElement
        texture = white2
        rgba = EG_image_background_color
        scale = (7.5, 7.5)
        pos = (4.0, 4.0)
        just = [ left top ]
        z_priority = 8
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <item_id>
        texture = <texture>
        z_priority = 9
        scale = (0.8999999761581421, 0.8999999761581421)
        pos = (5.0, 6.0)
        just = [ left top ]
        z_priority = 9
        heap = (screen_element_heap)
    }
endscript


script edit_graphic_premade_item_menu_focus 
    <menu_id> ::GetTags
    if GotParam tag_selected_index
        if NOT (<tag_selected_index> = EG_premade_item_menu_selection)
            if (<tag_selected_index> > EG_premade_item_menu_selection)
                <num_pads> = (<tag_selected_index> - EG_premade_item_menu_selection)
                <pad_event> = pad_left
            else
                <num_pads> = (EG_premade_item_menu_selection - <tag_selected_index>)
                <pad_event> = pad_right
            endif
            wait 1 gameframe
            change ok_pad_left_right = 0
            begin 
            FireEvent type = <pad_event> target = <menu_id>
            repeat <num_pads>
            change ok_pad_left_right = 1
        endif
    endif
endscript


script edit_graphic_premade_item_focus 
    Theme_GetPauseBarColor return_value = rgba
    SetScreenElementProps {
        id = {<id> child = 0}
        rgba = <rgba>
    }
    change EG_premade_item_menu_selection = <index>
endscript


script edit_graphic_premade_item_unfocus 
    SetScreenElementProps {
        id = {<id> child = 0}
        rgba = EG_unselected_image_color
    }
endscript


script edit_graphic_select_premade 
    edit_graphic_set_layer_infos layer_infos = (edit_graphic_premade_graphics [ <graphic_index> ].premade_layer_infos)
    edit_graphic_exit_premade_menu new_script = edit_graphic_create_main_menu new_script_params = { new = 0 }
endscript

screen_element_heap = FrontEnd

script edit_graphic_create_main_menu new = 1
    if IsNgc
        MemPushContext TopDownHeap
        change screen_element_heap = TopDown
    else
        change screen_element_heap = FrontEnd
    endif
    load_cag_textures_to_main_memory
    if (<new> = 1)
        dialog_box_exit
        edit_graphic_clear_all
    endif
    KillSkaterCamAnim all
    PlaySkaterCamAnim skater = 0 name = CAGR_cam1 play_hold
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    SetScreenElementLock id = root_window off
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = edit_graphic_main_menu_anchor
        pos = (0.0, 0.0)
        dims = (640.0, 480.0)
        just = [ left top ]
        heap = (screen_element_heap)
    }
    AssignAlias id = edit_graphic_main_menu_anchor alias = current_menu_anchor
    kill_start_key_binding
    edit_graphic_create_title
    edit_graphic_create_layer_menu
    edit_graphic_create_action_menu_anchor menu_type = tool_menu
    SetScreenElementLock id = edit_graphic_main_menu_anchor off
    edit_graphic_create_canvas
    edit_graphic_update_layer_graphics
    edit_graphic_create_helper_text
    SetScreenElementLock id = edit_graphic_main_menu_anchor
    FireEvent type = focus target = edit_graphic_layer_vmenu
    FireEvent type = unfocus target = edit_graphic_tool_vmenu
endscript


script edit_graphic_exit_main_menu 
    if (EG_creating_premade)
        edit_graphic_print_layers
    endif
    edit_graphic_prepare_sprite_infos
    GetCurrentSkaterProfileIndex
    GenerateCAGTexture info_array = <sprite_infos> player = <currentSkaterProfileIndex> test = EG_TEST_GRAFFITI_AS_SPRITE
    SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = { has_custom_tag = 1 }
    RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex>
    if ScreenElementExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    load_cag_textures_to_main_memory unload
    if (EG_TEST_GRAFFITI_AS_SPRITE)
        edit_graphic_create_NGC_test
    else
        edit_graphic_create_pre_menu
    endif
    if IsNgc
        MemPopContext
    endif
endscript


script edit_graphic_create_NGC_test 
    SetScreenElementLock id = root_window off
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = edit_graphic_NGC_test_anchor
        pos = (0.0, 0.0)
        dims = (640.0, 480.0)
        just = [ left top ]
        event_handlers = [{ pad_back edit_graphic_exit_NGC_test }
        ]
        heap = (screen_element_heap)
    }
    AssignAlias id = edit_graphic_NGC_test_anchor alias = current_menu_anchor
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = white2
        pos = (50.0, 50.0)
        just = [ left top ]
        rgba = [ 128 128 128 128 ]
        scale = 16
        z_priority = -1
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = cag_workspace_sprite
        pos = (50.0, 50.0)
        just = [ left top ]
        rgba = [ 128 128 128 128 ]
        scale = 1
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = white2
        pos = (200.0, 50.0)
        just = [ left top ]
        rgba = [ 0 0 0 128 ]
        scale = 16
        z_priority = -1
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = cag_workspace_sprite
        pos = (200.0, 50.0)
        just = [ left top ]
        rgba = [ 128 128 128 128 ]
        scale = 1
        heap = (screen_element_heap)
    }
    FireEvent type = focus target = current_menu_anchor
endscript


script edit_graphic_exit_NGC_test 
    DestroyScreenElement id = current_menu_anchor
    UnloadTexture cag_workspace_sprite
    edit_graphic_create_pre_menu
endscript


script edit_graphic_create_helper_text 
    SetScreenElementLock id = edit_graphic_main_menu_anchor off
    create_helper_text bg_rgba = [ 0 0 0 128 ] generic_helper_text helper_pos = (320.0, 430.0)
    SetScreenElementLock id = edit_graphic_main_menu_anchor
endscript


script edit_graphic_create_title bg_texture = white2
    CreateScreenElement {
        parent = edit_graphic_main_menu_anchor
        type = SpriteElement
        id = edit_graphic_title_bar
        texture = <bg_texture>
        rgba = [0 , 0 , 0 , 128]
        scale = (80.0, 2.5)
        pos = (0.0, 67.0)
        just = [ left top ]
        heap = (screen_element_heap)
    }
    Theme_GetAltColor return_value = grad_color
    CreateScreenElement {
        type = SpriteElement
        parent = edit_graphic_main_menu_anchor
        texture = goal_grad
        rgba = <grad_color>
        scale = (19.0, 1.5)
        pos = (30.0, 64.0)
        just = [ left top ]
        flip_v
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        type = SpriteElement
        parent = edit_graphic_main_menu_anchor
        texture = goal_grad
        rgba = <grad_color>
        scale = (19.0, 1.5)
        pos = (30.0, 84.0)
        just = [ left top ]
        flip_v
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        type = ContainerElement
        parent = edit_graphic_main_menu_anchor
        id = current_menu_title
        pos = (265.0, 23.0)
        heap = (screen_element_heap)
    }
    Theme_GetSupportPieceColor return_value = tab_color
    FormatText checksumname = mainmenu_icon '%i_model' i = (THEME_PREFIXES [ current_theme_prefix ])
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_title
        texture = goal_tab
        rgba = <tab_color>
        scale = (1.0, 1.25)
        pos = (0.0, 0.0)
        alpha = 1
        just = [ left top ]
        z_priority = 1
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_title
        texture = goal_tab_extra
        rgba = <tab_color>
        scale = (9.0, 1.25)
        pos = (80.0, 0.0)
        alpha = 1
        just = [ left top ]
        z_priority = 2
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        type = TextElement
        parent = current_menu_title
        font = testtitle
        text = 'CREATE-A-GRAPHIC'
        rgba = [85 , 30 , 0 , 128]
        pos = (36.0, 0.0)
        scale = (1.5, 1.649999976158142)
        just = [ left top ]
        z_priority = 3
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_title
        texture = <mainmenu_icon>
        rgba = [ 128 128 2 30 ]
        scale = (1.5, 1.5)
        pos = (290.0, -38.0)
        alpha = 1
        rot_angle = 20
        just = [ left top ]
        z_priority = 3
        heap = (screen_element_heap)
    }
endscript


script edit_graphic_create_layer_menu 
    CreateScreenElement {
        type = ContainerElement
        parent = edit_graphic_main_menu_anchor
        id = edit_graphic_layer_menu_anchor
        pos = (30.0, 65.0)
        just = [ left top ]
        heap = (screen_element_heap)
    }
    Theme_GetAltColor return_value = title_color
    CreateScreenElement {
        type = TextElement
        parent = edit_graphic_layer_menu_anchor
        id = edit_graphic_layer_menu_title
        font = small
        text = ' LAYERS'
        scale = 1.0
        rgba = <title_color>
        pos = (0.0, 0.0)
        just = [ left top ]
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        type = VMenu
        parent = edit_graphic_layer_menu_anchor
        id = edit_graphic_layer_vmenu
        spacing_between = 3
        pos = (0.0, 26.0)
        just = [ left top ]
        heap = (screen_element_heap)
    }
    SetScreenElementProps {
        id = edit_graphic_layer_vmenu
        event_handlers = [{ focus edit_graphic_layer_menu_focus }
            { unfocus edit_graphic_layer_menu_unfocus }
            { pad_back generic_menu_pad_back_sound }
            { pad_back edit_graphic_exit_main_menu }
            {pad_up generic_menu_up_or_down_sound params = { up }}
            {pad_down generic_menu_up_or_down_sound params = { down }}
        ]
        replace_handlers
    }
    edit_graphic_add_layer_menu_item text = '-01-' menu_index = 0 id = layer_menu_01 selected = 1
    edit_graphic_add_layer_menu_item text = '-02-' menu_index = 1 id = layer_menu_02
    edit_graphic_add_layer_menu_item text = '-03-' menu_index = 2 id = layer_menu_03
    edit_graphic_add_layer_menu_item text = '-04-' menu_index = 3 id = layer_menu_04
    edit_graphic_add_layer_menu_item text = '-05-' menu_index = 4 id = layer_menu_05
    edit_graphic_add_layer_menu_item text = '-06-' menu_index = 5 id = layer_menu_06
    edit_graphic_add_layer_menu_item text = '-07-' menu_index = 6 id = layer_menu_07
    edit_graphic_add_layer_menu_item text = '-08-' menu_index = 7 id = layer_menu_08
    edit_graphic_add_layer_menu_item text = '-09-' menu_index = 8 id = layer_menu_09
    edit_graphic_add_layer_menu_item text = '-10-' menu_index = 9 id = layer_menu_10
    edit_graphic_add_layer_menu_item text = 'Done' menu_index = 10 id = layer_menu_done done = 1
endscript


script edit_graphic_add_layer_menu_item {tab = tab1
        font = small
        icon_scale = 0
        icon_pos = (-120.0, 0.0)
        dims = (80.0, 25.100000381469727)
        selected = 0
        done = 0
    }
    if (<done> = 1)
        <choose_script> = edit_graphic_exit_main_menu
    else
        <choose_script> = edit_graphic_layer_item_select
    endif
    <index> = 0
    begin 
    if (<menu_index> = (edit_graphic_layer_infos [ <index> ].layer_id))
        <layer_info_index> = <index>
    endif
    <index> = (<index> + 1)
    repeat 10
    CreateScreenElement {
        type = ContainerElement
        parent = edit_graphic_layer_vmenu
        dims = <dims>
        event_handlers = [{focus edit_graphic_layer_item_focus params = { id = <id> }}
            {unfocus edit_graphic_layer_item_unfocus params = { id = <id> }}
            { pad_choose generic_menu_pad_choose_sound }
            {pad_choose <choose_script> params = <choose_params>}
            {pad_start <choose_script> params = <choose_params>}
        ]
        id = <id>
        just = [ left top ]
        tags = {layer_info_index = <layer_info_index>
            tag_grid_x = <menu_index>
        }
        z_priority = 1
        heap = (screen_element_heap)
    }
    <vmenu_item> = <id>
    if (<selected> = 1)
        Theme_GetPauseBarColor return_value = bar_color
        <bg_rgba> = <bar_color>
        <bg_texture> = roundbar_middle
        <bg_scale> = (2.5, 0.800000011920929)
    else
        <bg_rgba> = [80 , 80 , 80 , 60]
        <bg_texture> = white2
        <bg_scale> = (10.0, 3.137500047683716)
    endif
    if (<done> = 0)
        CreateScreenElement {
            parent = <vmenu_item>
            type = SpriteElement
            texture = <bg_texture>
            rgba = <bg_rgba>
            scale = <bg_scale>
            pos = (0.0, 0.0)
            just = [ left top ]
            z_priority = 2
            heap = (screen_element_heap)
        }
        GetScreenElementPosition id = <id>
        GetScreenElementDims id = <id>
        right_edge = (<width> * (1.0, 0.0))
        offset = (-4.0, 3.0)
        <vmenu_item> ::SetTags right_edge = <right_edge> width = <width> offset = <offset> override_scale = <override_scale>
        CreateScreenElement {
            parent = <vmenu_item>
            type = SpriteElement
            texture = white2
            rgba = [0 , 0 , 0 , 128]
            scale = (3.200000047683716, 3.0999999046325684)
            pos = (46.0, 0.0)
            just = [ left top ]
            z_priority = 3
            heap = (screen_element_heap)
        }
        CreateScreenElement {
            parent = <id>
            type = SpriteElement
            texture = white2
            rgba = [20 , 20 , 20 , 128]
            scale = (0.800000011920929, 0.699999988079071)
            pos = (1.0, 1.0)
            just = [ left top ]
            z_priority = 4
            heap = (screen_element_heap)
        }
        CreateScreenElement {
            parent = <vmenu_item>
            type = SpriteElement
            texture = white2
            scale = EG_thumb_scale
            pos = EG_thumb_pos
            just = [ left top ]
            z_priority = 5
            heap = (screen_element_heap)
        }
        CreateScreenElement {
            type = SpriteElement
            parent = <vmenu_item>
            local_id = roundbar_highlight
            sacle = <bg_scale>
            texture = roundbar_highlight
            pos = (0.0, 0.0)
            rgba = [128 , 128 , 128 , 0]
            just = [ left top ]
            z_priority = 2.500
            heap = (screen_element_heap)
        }
    endif
    CreateScreenElement {
        type = TextElement
        parent = <vmenu_item>
        local_id = text
        font = <font>
        text = <text>
        rgba = [ 90 90 90 90 ]
        just = [ left top ]
        pos = (5.0, 2.0)
        z_priority = 3
        shadow
        shadow_rgba = UI_text_shadow_color
        shadow_offs = UI_text_shadow_offset
        heap = (screen_element_heap)
    }
endscript


script edit_graphic_layer_menu_focus 
    SetScreenElementProps {
        id = edit_graphic_layer_menu_title
        rgba = [128 , 128 , 128 , 128]
    }
endscript


script edit_graphic_layer_menu_unfocus 
    Theme_GetAltColor return_value = title_color
    SetScreenElementProps {
        id = edit_graphic_layer_menu_title
        rgba = <title_color>
    }
endscript


script edit_graphic_layer_item_focus 
    Theme_GetPauseBarColor return_value = bar_color
    GetTags
    if NOT (<tag_grid_x> = 10)
        SetScreenElementProps {
            id = {<id> child = 0}
            texture = roundbar_middle
            rgba = <bar_color>
        }
        DoScreenElementMorph id = {<id> child = 0}scale = (2.5, 0.800000011920929) time = 0
        RunScriptOnScreenElement id = {<id> child = roundbar_highlight}edit_CAG_menu_highlight params = {width = <width> right_edge = <right_edge> offset = <offset> override_scale = <override_scale>}
        <text_rgba> = [0 , 0 , 0 , 128]
    else
        <text_rgba> = [128 , 128 , 128 , 128]
    endif
    SetScreenElementProps {
        id = {<id> child = text}
        rgba = <text_rgba>
    }
    edit_graphic_highlight_avail_tools layer_index = <layer_info_index> menu_index = <tag_grid_x>
endscript


script edit_graphic_layer_item_unfocus 
    GetTags
    if NOT (<tag_grid_x> = 10)
        SetScreenElementProps {
            id = {<id> child = 0}
            rgba = [80 , 80 , 80 , 60]
            texture = white2
        }
        DoScreenElementMorph id = {<id> child = 0}scale = (10.0, 3.137500047683716) time = 0
        KillSpawnedScript name = edit_CAG_menu_highlight
        DoScreenElementMorph id = {<id> child = roundbar_highlight}alpha = 0 time = 0
    endif
    SetScreenElementProps {
        id = {<id> child = text}
        rgba = [90 , 90 , 90 , 90]
    }
endscript


script edit_graphic_layer_item_select 
    edit_graphic_layer_vmenu ::GetTags
    change EG_current_layer_menu_index = <tag_selected_index>
    GetTags
    change EG_current_layer_info_index = <layer_info_index>
    FireEvent type = unfocus target = edit_graphic_layer_vmenu
    FireEvent type = focus target = edit_graphic_tool_vmenu data = { grid_index = 0 }
    Theme_GetPauseBarColor return_value = rgba
    SetScreenElementProps {
        id = {<tag_selected_id> child = 0}
        rgba = <rgba>
        texture = roundbar_middle
    }
    DoScreenElementMorph id = {<tag_selected_id> child = 0}scale = (2.5, 0.800000011920929) time = 0
    SetScreenElementProps {
        id = {<tag_selected_id> child = text}
        rgba = [0 , 0 , 0 , 128]
    }
endscript


script edit_graphic_update_layer_graphics update_all = 1
    GetScreenElementChildren id = edit_graphic_layer_vmenu
    if (<update_all> = 1)
        GetArraySize <children>
        <menu_index> = 0
    else
        <array_size> = 2
        <menu_index> = <index>
    endif
    begin 
    <menu_item> = (<children> [ <menu_index> ])
    <menu_item> ::GetTags
    if ((edit_graphic_layer_infos [ <layer_info_index> ].texture_id)= none)
        if ((edit_graphic_layer_infos [ <layer_info_index> ].string)= '')
            <thumb_texture> = white2
            <thumb_scale> = EG_thumb_scale
            <thumb_pos> = EG_thumb_pos
            <thumb_rgba> = [128 , 128 , 128 , 0]
            <canvas_scale> = EG_canvas_scale_factor
            <canvas_rgba> = [128 , 128 , 128 , 0]
            <offset> = (0.0, 0.0)
        else
            edit_graphic_destroy_image_string use_current = 0 info_index = <layer_info_index>
            edit_graphic_build_image_string info_index = <layer_info_index> menu_index = <menu_index>
            edit_graphic_get_thumb_texture info_index = <layer_info_index>
            <thumb_texture> = <thumb_texture>
            <thumb_scale> = (0.28999999165534973, 0.28999999165534973)
            <thumb_pos> = (52.0, 3.0)
            HSVtoRGB hsv = (edit_graphic_layer_infos [ <layer_info_index> ].hsva)
            <thumb_rgba> = <rgb>
            <canvas_scale> = ((edit_graphic_layer_infos [ <layer_info_index> ].scale)* EG_canvas_scale_factor)
            <canvas_rgba> = [128 , 128 , 128 , 0]
            <offset> = (((1.0, 0.0) * ((8 * <canvas_scale>)/ 2))+ ((0.0, 1.0) * ((8 * <canvas_scale>)/ 2)))
        endif
        <canvas_texture> = white2
    else
        <thumb_texture> = (edit_graphic_layer_infos [ <layer_info_index> ].texture_id)
        <thumb_scale> = EG_thumb_scale
        <thumb_pos> = EG_thumb_pos
        HSVtoRGB hsv = (edit_graphic_layer_infos [ <layer_info_index> ].hsva)
        <thumb_rgba> = <rgb>
        <canvas_texture> = (edit_graphic_layer_infos [ <layer_info_index> ].texture_id)
        <canvas_scale> = ((edit_graphic_layer_infos [ <layer_info_index> ].scale)* EG_canvas_scale_factor)
        <canvas_rgba> = <rgb>
        <offset> = (0.0, 0.0)
    endif
    if ((edit_graphic_layer_infos [ <layer_info_index> ].flip_v)= 1)
        <flipv> = flip_h
    endif
    if ((edit_graphic_layer_infos [ <layer_info_index> ].flip_h)= 1)
        <fliph> = flip_v
    endif
    SetScreenElementProps {
        id = {<menu_item> child = 2}
        texture = <thumb_texture>
        rgba = <thumb_rgba>
        pos = <thumb_pos>
    }
    DoScreenElementMorph id = {<menu_item> child = 2}scale = <thumb_scale> time = 0
    <canvas_id> = (edit_graphic_layer_infos [ <layer_info_index> ].canvas_id)
    <rot_angle> = (edit_graphic_layer_infos [ <layer_info_index> ].rot)
    <pos_x> = (edit_graphic_layer_infos [ <layer_info_index> ].pos_x)
    <pos_y> = (edit_graphic_layer_infos [ <layer_info_index> ].pos_y)
    <pos> = (((1.0, 0.0) * <pos_x>)+ ((0.0, 1.0) * <pos_y>))
    <pos> = (<pos> * EG_canvas_pos_factor)
    SetScreenElementProps {
        id = <canvas_id>
        texture = <canvas_texture>
        z_priority = (EG_canvas_base_z + <menu_index>)
        rot_angle = <rot_angle>
        pos = (<pos> + <offset>)
        rgba = <canvas_rgba>
        <flipv>
        <fliph>
        just = [ center center ]
        internal_just = [ center center ]
    }
    DoScreenElementMorph id = <canvas_id> scale = <canvas_scale> time = 0
    <menu_index> = (<menu_index> + 1)
    RemoveParameter layer_info_index
    RemoveParameter flipv
    RemoveParameter fliph
    repeat (<array_size> -1)
endscript


script edit_graphic_get_thumb_texture 
    <layer_string> = (edit_graphic_layer_infos [ <info_index> ].string)
    StringToCharArray string = <layer_string>
    GetArraySize <char_array>
    <font> = (EG_font_names [(edit_graphic_layer_infos [ <info_index> ].font_id)].name)
    <index> = 0
    begin 
    if NOT ((<char_array> [ <index> ])= ' ')
        <char> = (<char_array> [ <index> ])
        break 
    endif
    <index> = (<index> + 1)
    repeat <array_size>
    FormatText checksumname = texture '%f_%l' f = <font> l = <char>
    return thumb_texture = <texture>
endscript


script edit_graphic_highlight_avail_tools tools_in_focus = 0
    GetScreenElementChildren id = edit_graphic_tool_vmenu
    FormatText checksumname = off_color '%i_UNHIGHLIGHTED_TEXT_COLOR_NEW' i = (THEME_COLOR_PREFIXES [ current_theme_prefix ])
    if (<menu_index> = 10)
        <rgba> = EG_unselectable_text_color
        <is_selectable> = not_focusable
        SetScreenElementProps {
            id = {(<children> [ 0 ])child = 0}
            rgba = EG_unselectable_text_color
        }
    else
        if (((edit_graphic_layer_infos [ <layer_index> ].texture_id)= none)& ((edit_graphic_layer_infos [ <layer_index> ].string)= ''))
            <rgba> = EG_unselectable_text_color
            <is_selectable> = not_focusable
        else
            <rgba> = <off_color>
            <is_selectable> = focusable
        endif
        if (<tools_in_focus> = 0)
            SetScreenElementProps {
                id = {(<children> [ 0 ])child = 0}
                rgba = <off_color>
            }
        endif
    endif
    GetArraySize <children>
    <child_index> = 1
    begin 
    if ((<child_index> < 8)|| (<child_index> > 9))
        SetScreenElementProps {
            id = {(<children> [ <child_index> ])child = 0}
            rgba = <rgba>
        }
    endif
    SetScreenElementProps {
        id = (<children> [ <child_index> ])
        <is_selectable>
    }
    <child_index> = (<child_index> + 1)
    repeat (<array_size> - 1)
    if NOT (<menu_index> = 10)
        if (<menu_index> = 0)
            SetScreenElementProps {
                id = swap_backward
                not_focusable
            }
            SetScreenElementProps {
                id = { swap_backward child = 0 }
                rgba = EG_unselectable_text_color
            }
        else
            if (<menu_index> = 9)
                SetScreenElementProps {
                    id = swap_forward
                    not_focusable
                }
                SetScreenElementProps {
                    id = { swap_forward child = 0 }
                    rgba = EG_unselectable_text_color
                }
            endif
        endif
        if NOT ((edit_graphic_layer_infos [ <layer_index> ].string)= '')
            SetScreenElementProps {
                id = (<children> [ 0 ])
                event_handlers = [{focus edit_graphic_tool_item_focus params = { index = 0 }}
                    {unfocus edit_graphic_tool_item_unfocus params = { index = 0 }}
                    { pad_choose generic_menu_pad_choose_sound }
                    {pad_choose edit_graphic_create_action_menu_anchor params = {menu_type = keyboard_menu new_text = 0}}
                    { pad_start null_script }
                ]
                replace_handlers
            }
            SetScreenElementProps {
                id = {(<children> [ 0 ])child = 0}
                text = 'MODIFY TEXT'
            }
        else
            SetScreenElementProps {
                id = (<children> [ 0 ])
                event_handlers = [{focus edit_graphic_tool_item_focus params = { index = 0 }}
                    {unfocus edit_graphic_tool_item_unfocus params = { index = 0 }}
                    { pad_choose generic_menu_pad_choose_sound }
                    {pad_choose edit_graphic_create_action_menu_anchor params = { menu_type = category_menu }}
                    { pad_start null_script }
                ]
                replace_handlers
            }
            SetScreenElementProps {
                id = {(<children> [ 0 ])child = 0}
                text = 'SELECT GRAPHIC'
            }
        endif
        if NOT ((edit_graphic_layer_infos [ <layer_index> ].string)= '')
            SetScreenElementProps {
                id = flip_horizontally
                not_focusable
            }
            SetScreenElementProps {
                id = { flip_horizontally child = 0 }
                rgba = EG_unselectable_text_color
            }
            SetScreenElementProps {
                id = flip_vertically
                rgba = EG_unselectable_text_color
                not_focusable
            }
            SetScreenElementProps {
                id = { flip_vertically child = 0 }
                rgba = EG_unselectable_text_color
            }
        endif
        edit_graphic_set_copy_tool layer_index = <layer_index>
    endif
endscript


script edit_graphic_set_copy_tool 
    <layer_available> = 0
    <index> = 0
    begin 
    if (((edit_graphic_layer_infos [ <index> ].texture_id)= none)& ((edit_graphic_layer_infos [ <index> ].string)= ''))
        <layer_available> = 1
        break 
    endif
    <index> = (<index> + 1)
    repeat 10
    if (((edit_graphic_layer_infos [ <layer_index> ].texture_id)= none)& ((edit_graphic_layer_infos [ <layer_index> ].string)= ''))
        <rgba> = EG_unselectable_text_color
        <is_selectable> = not_focusable
    else
        edit_graphic_tool_vmenu ::GetTags
        if (<layer_available>)
            if (<tag_selected_index> = 7)
                FormatText checksumname = rgba '%i_HIGHLIGHTED_TEXT_COLOR_NEW' i = (THEME_COLOR_PREFIXES [ current_theme_prefix ])
            else
                FormatText checksumname = rgba '%i_UNHIGHLIGHTED_TEXT_COLOR_NEW' i = (THEME_COLOR_PREFIXES [ current_theme_prefix ])
            endif
            <is_selectable> = focusable
        else
            if (<tag_selected_index> = 7)
                begin 
                FireEvent type = pad_down target = edit_graphic_tool_vmenu
                repeat 7
            endif
            <rgba> = EG_unselectable_text_color
            <is_selectable> = not_focusable
        endif
    endif
    SetScreenElementProps {
        id = copy_to_open_layer
        <is_selectable>
    }
    SetScreenElementProps {
        id = { copy_to_open_layer child = 0 }
        rgba = <rgba>
    }
endscript


script edit_graphic_create_action_menu_anchor bg_texture = white2
    SetScreenElementLock id = edit_graphic_main_menu_anchor off
    if ObjectExists id = edit_graphic_action_menu_anchor
        DestroyScreenElement id = edit_graphic_action_menu_anchor
    endif
    CreateScreenElement {
        type = ContainerElement
        parent = edit_graphic_main_menu_anchor
        id = edit_graphic_action_menu_anchor
        pos = (118.0, 65.0)
        just = [ left top ]
        heap = (screen_element_heap)
    }
    switch <menu_type>
        case tool_menu
        edit_graphic_create_tool_menu
        case category_menu
        edit_graphic_create_category_menu
        case image_menu
        edit_graphic_create_image_menu category = <category> index = <index>
        case keyboard_menu
        edit_graphic_create_keyboard_menu new_text = <new_text>
        case font_menu
        edit_graphic_create_font_menu new_text = <new_text>
    endswitch
    SetScreenElementLock id = edit_graphic_main_menu_anchor
endscript


script edit_graphic_create_tool_menu 
    Theme_GetAltColor return_value = title_color
    CreateScreenElement {
        type = TextElement
        parent = edit_graphic_action_menu_anchor
        id = edit_graphic_tool_menu_title
        font = small
        text = 'TOOLS'
        scale = 1.100
        rgba = <title_color>
        pos = (86.0, 0.0)
        just = [ left top ]
        shadow
        shadow_rgba = UI_text_shadow_color
        shadow_offs = UI_text_shadow_offset
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        type = VMenu
        parent = edit_graphic_action_menu_anchor
        id = edit_graphic_tool_vmenu
        padding_scale = 0.9500
        pos = (12.0, 30.0)
        just = [ left top ]
        heap = (screen_element_heap)
    }
    SetScreenElementProps {
        id = edit_graphic_tool_vmenu
        event_handlers = [{ focus edit_graphic_tool_menu_focus }
            { unfocus edit_graphic_tool_menu_unfocus }
            { pad_back generic_menu_pad_back_sound }
            { pad_back edit_graphic_tool_menu_back }
            {pad_up generic_menu_up_or_down_sound params = { up }}
            {pad_down generic_menu_up_or_down_sound params = { down }}
        ]
        replace_handlers
    }
    edit_graphic_add_tool_menu_item text = 'SELECT GRAPHIC' index = 0 id = select_layer choose_script = edit_graphic_create_action_menu_anchor params = { menu_type = category_menu }
    edit_graphic_add_tool_menu_item text = 'ERASE LAYER' index = 1 id = erase_layer choose_script = edit_graphic_erase_layer_dialog
    edit_graphic_add_tool_menu_item text = 'TRANSFORM LAYER' index = 2 id = transform_layer choose_script = edit_graphic_create_transform_menu
    edit_graphic_add_tool_menu_item text = 'FLIP HORIZONTALLY' index = 3 id = flip_horizontally choose_script = edit_graphic_flip_layer params = { horiz = 1 }
    edit_graphic_add_tool_menu_item text = 'FLIP VERTICALLY' index = 4 id = flip_vertically choose_script = edit_graphic_flip_layer params = { vert = 1 }
    edit_graphic_add_tool_menu_item text = 'SWAP BACKWARD' index = 5 id = swap_backward choose_script = edit_graphic_swap_layers params = { swap_up = 1 }
    edit_graphic_add_tool_menu_item text = 'SWAP FORWARD' index = 6 id = swap_forward choose_script = edit_graphic_swap_layers params = { swap_down = 1 }
    edit_graphic_add_tool_menu_item text = 'COPY TO OPEN LAYER' index = 7 id = copy_to_open_layer choose_script = edit_graphic_copy_to_open_layer
    edit_graphic_add_color_swatches menu_id = edit_graphic_color_hmenu1 color_index = 0
    edit_graphic_add_color_swatches menu_id = edit_graphic_color_hmenu2 color_index = 8
    edit_graphic_add_color_sliders
endscript


script edit_graphic_add_tool_menu_item choose_script = null_script
    CreateScreenElement {
        type = ContainerElement
        parent = edit_graphic_tool_vmenu
        id = <id>
        dims = (200.0, 20.0)
        event_handlers = [{focus edit_graphic_tool_item_focus params = { index = <index> }}
            {unfocus edit_graphic_tool_item_unfocus params = { index = <index> }}
            { pad_choose generic_menu_pad_choose_sound }
            {pad_choose <choose_script> params = <params>}
            { pad_start null_script }
        ]
        tags = { tag_grid_x = <index> }
        internal_just = [ center center ]
        heap = (screen_element_heap)
    }
    <container_id> = <id>
    CreateScreenElement {
        type = TextElement
        parent = <container_id>
        font = small
        text = <text>
        scale = 0.9000
        rgba = [128 , 128 , 128 , 128]
        z_priority = 3
        just = [ center top ]
        pos = (102.0, 0.0)
        shadow
        shadow_rgba = UI_text_shadow_color
        shadow_offs = UI_text_shadow_offset
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <container_id>
        pos = (-8.0, -3.0)
        just = [ left top ]
        scale = (1.0, 0.75)
        texture = roundbar_tip_left
        z_priority = 2
        rgba = [ 0 0 0 0 ]
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <container_id>
        pos = (24.0, -3.0)
        just = [ left top ]
        scale = (5.0, 0.75)
        texture = roundbar_middle
        z_priority = 2
        rgba = [ 0 0 0 0 ]
        heap = (screen_element_heap)
    }
    GetScreenElementPosition id = <id>
    GetScreenElementDims id = <id>
    offset = (18.0, -2.0)
    <container_id> ::SetTags right_edge = <right_edge> width = <width> offset = <offset> override_scale = <override_scale>
    CreateScreenElement {
        type = SpriteElement
        parent = <container_id>
        pos = (180.0, -3.0)
        just = [ left top ]
        scale = (1.0, 0.75)
        texture = roundbar_tip_right
        z_priority = 2
        rgba = [ 0 0 0 0 ]
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <container_id>
        local_id = roundbar_highlight
        sacle = <bg_scale>
        texture = roundbar_highlight
        pos = (24.0, -3.0)
        rgba = [128 , 128 , 128 , 0]
        just = [ left top ]
        z_priority = 2.500
        heap = (screen_element_heap)
    }
endscript


script edit_CAG_menu_highlight offset = (0.0, 0.0) override_scale = 0.9000 width = 0
    GetSingleTag id
    Theme_GetPauseBarColor return_value = bar_color
    SetScreenElementProps {
        id = <id>
        rgba = <bar_color>
    }
    start_pos = ((0.0, 0.0) + <offset>)
    end_pos = ((1.0, 0.0) * <width> + <offset>)
    SetScreenElementProps {
        id = <id>
        pos = (<start_pos>)
    }
    DoScreenElementMorph id = <id> scale = <override_scale> time = 0
    DoScreenElementMorph id = <id> alpha = 1 time = 0
    DoScreenElementMorph id = <id> pos = (<end_pos>)time = 0.3500
    DoScreenElementMorph id = <id> alpha = 0.2000 time = 0.4000
    wait 0.4000 seconds
    the_width = <width>
    DoScreenElementMorph id = <id> scale = (<width> * (0.05999999865889549, 0.0) + <override_scale> * (0.0, 1.0))time = 0
    GetScreenElementDims id = <id>
    new_xoff = ((<the_width> - <width>)* 0.5000)
    SetScreenElementProps {
        id = <id>
        pos = (<new_xoff> * (1.0, 0.0) + <offset>)
    }
    begin 
    DoScreenElementMorph id = <id> alpha = 1 time = 0.3000
    wait 0.3000 seconds
    DoScreenElementMorph id = <id> alpha = 0 time = 0.3000
    wait 0.3000 seconds
    repeat 
endscript


script edit_graphic_tool_menu_back 
    FireEvent type = unfocus target = edit_graphic_tool_vmenu
    FireEvent type = focus target = edit_graphic_layer_vmenu
endscript


script edit_graphic_tool_menu_focus 
    SetScreenElementProps {
        id = edit_graphic_tool_menu_title
        rgba = [128 , 128 , 128 , 128]
    }
endscript


script edit_graphic_tool_menu_unfocus 
    Theme_GetAltColor return_value = title_color
    SetScreenElementProps {
        id = edit_graphic_tool_menu_title
        rgba = <title_color>
    }
endscript


script edit_graphic_tool_item_focus 
    GetTags
    Theme_GetPauseBarColor return_value = bar_color
    FormatText checksumname = on_color '%i_HIGHLIGHTED_TEXT_COLOR_NEW' i = (THEME_COLOR_PREFIXES [ current_theme_prefix ])
    SetScreenElementProps {
        id = {<id> child = 0}
        rgba = <on_color>
        shadow_rgba = [128 , 128 , 128 , 0]
        pos = (102.0, -3.0)
    }
    DoScreenElementMorph id = {<id> child = 0}time = 0.05000 scale = (1.0, 1.100000023841858)
    SetScreenElementProps {
        id = {<id> child = 1}
        rgba = <bar_color>
    }
    SetScreenElementProps {
        id = {<id> child = 2}
        rgba = <bar_color>
    }
    SetScreenElementProps {
        id = {<id> child = 3}
        rgba = <bar_color>
    }
    RunScriptOnScreenElement id = {<id> child = roundbar_highlight}edit_CAG_menu_highlight params = {width = <width> right_edge = <right_edge> offset = <offset> override_scale = <override_scale>}
endscript


script edit_graphic_tool_item_unfocus 
    GetTags
    FormatText checksumname = off_color '%i_UNHIGHLIGHTED_TEXT_COLOR_NEW' i = (THEME_COLOR_PREFIXES [ current_theme_prefix ])
    Theme_GetPauseBarColor return_value = bar_color
    SetScreenElementProps {
        id = {<id> child = 0}
        rgba = <off_color>
        shadow_rgba = UI_text_shadow_color
        pos = (102.0, 0.0)
    }
    DoScreenElementMorph id = {<id> child = 0}time = 0.05000 scale = 0.9000
    SetScreenElementProps {
        id = {<id> child = 1}
        rgba = [128 , 128 , 128 , 0]
    }
    SetScreenElementProps {
        id = {<id> child = 2}
        rgba = [128 , 128 , 128 , 0]
    }
    SetScreenElementProps {
        id = {<id> child = 3}
        rgba = [128 , 128 , 128 , 0]
    }
    KillSpawnedScript name = edit_CAG_menu_highlight
    DoScreenElementMorph id = {<id> child = roundbar_highlight}alpha = 0 time = 0
endscript


script edit_graphic_add_color_swatches 
    switch <menu_id>
        case edit_graphic_color_hmenu1
        <dims> = (210.0, 40.0)
        case edit_graphic_color_hmenu2
        <dims> = (210.0, 25.0)
    endswitch
    CreateScreenElement {
        type = HMenu
        parent = edit_graphic_tool_vmenu
        id = <menu_id>
        regular_space_amount = 27
        dims = <dims>
        just = [ left top ]
        heap = (screen_element_heap)
    }
    SetScreenElementProps {
        id = <menu_id>
        event_handlers = [{focus edit_graphic_color_swatch_menu_focus params = { menu_id = <menu_id> }}
            {pad_left generic_menu_up_or_down_sound params = { up }}
            {pad_right generic_menu_up_or_down_sound params = { down }}
        ]
        replace_handlers
    }
    edit_graphic_add_color_swatch parent_id = <menu_id> color_index = <color_index> menu_index = 0
    <color_index> = (<color_index> + 1)
    edit_graphic_add_color_swatch parent_id = <menu_id> color_index = <color_index> menu_index = 1
    <color_index> = (<color_index> + 1)
    edit_graphic_add_color_swatch parent_id = <menu_id> color_index = <color_index> menu_index = 2
    <color_index> = (<color_index> + 1)
    edit_graphic_add_color_swatch parent_id = <menu_id> color_index = <color_index> menu_index = 3
    <color_index> = (<color_index> + 1)
    edit_graphic_add_color_swatch parent_id = <menu_id> color_index = <color_index> menu_index = 4
    <color_index> = (<color_index> + 1)
    edit_graphic_add_color_swatch parent_id = <menu_id> color_index = <color_index> menu_index = 5
    <color_index> = (<color_index> + 1)
    edit_graphic_add_color_swatch parent_id = <menu_id> color_index = <color_index> menu_index = 6
    <color_index> = (<color_index> + 1)
    edit_graphic_add_color_swatch parent_id = <menu_id> color_index = <color_index> menu_index = 7
endscript


script edit_graphic_add_color_swatch 
    CreateScreenElement {
        parent = <parent_id>
        type = ContainerElement
        pos = (0.0, 0.0)
        just = [ left top ]
        event_handlers = [{focus edit_graphic_color_swatch_focus params = {menu = <parent_id> index = <menu_index>}}
            {unfocus edit_graphic_color_swatch_unfocus params = {menu = <parent_id> index = <menu_index>}}
            { pad_choose generic_menu_pad_choose_sound }
            {pad_choose edit_graphic_color_swatch_select params = { color_index = <color_index> }}
        ]
        tags = { color_index = <color_index> }
        heap = (screen_element_heap)
    }
    <container_id> = <id>
    CreateScreenElement {
        parent = <container_id>
        type = SpriteElement
        texture = white2
        rgba = [32 , 32 , 32 , 128]
        scale = (3.0, 3.0)
        z_priority = 2
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        parent = <container_id>
        type = SpriteElement
        texture = white2
        rgba = (EG_color_swatch_values [ <color_index> ])
        scale = (2.0, 2.200000047683716)
        pos = (-8.0, -9.0)
        just = [ left top ]
        z_priority = 3
        not_focusable
        heap = (screen_element_heap)
    }
endscript

EG_color_swatch_menu_selection = 0

script edit_graphic_color_swatch_menu_focus 
    <menu_id> ::GetTags
    if NOT (<tag_selected_index> = EG_color_swatch_menu_selection)
        if (<tag_selected_index> > EG_color_swatch_menu_selection)
            <num_pads> = (<tag_selected_index> - EG_color_swatch_menu_selection)
            <pad_event> = pad_left
        else
            <num_pads> = (EG_color_swatch_menu_selection - <tag_selected_index>)
            <pad_event> = pad_right
        endif
        wait 1 gameframe
        begin 
        FireEvent type = <pad_event> target = <menu_id>
        repeat <num_pads>
    endif
endscript


script edit_graphic_color_swatch_focus 
    Theme_GetPauseBarColor return_value = rgba
    RunScriptOnScreenElement id = {<menu> child = {<index> child = 0}}edit_graphic_image_focus_glow
    SetScreenElementProps {
        id = {<menu> child = {<index> child = 0}}
        rgba = <rgba>
    }
    change EG_color_swatch_menu_selection = <index>
endscript


script edit_graphic_color_swatch_unfocus 
    KillSpawnedScript name = edit_graphic_image_focus_glow
    DoScreenElementMorph {
        id = {<menu> child = {<index> child = 0}}
        time = 0
        rgba = [32 , 32 , 32 , 128]
        alpha = 1
    }
endscript


script edit_graphic_color_swatch_select 
    RGBtoHSV rgb = (EG_color_swatch_values [ <color_index> ])
    edit_graphic_change_layer_info_value {
        change_h = (<hsv> [ 0 ])
        change_s = (<hsv> [ 1 ])
        change_v = (<hsv> [ 2 ])
        change_a = (<hsv> [ 3 ])
    }
    edit_graphic_update_layer_graphics update_all = 0 index = EG_current_layer_menu_index
endscript


script edit_graphic_add_color_sliders 
    AssignAlias id = edit_graphic_tool_vmenu alias = current_menu
    colormenu_add_options_to_menu part = board from_caf text_pos = (-95.0, 21.0) icon_pos = (20.0, 21.0) arrow_pos_up = (5.0, 27.0) arrow_pos_down = (5.0, 13.0)
endscript


script edit_graphic_increment_hue 
    <h> = (edit_graphic_layer_infos [ EG_current_layer_info_index ].hsva [ 0 ])
    <h> = (<h> + 5)
    if (<h> > 359)
        <h> = (<h> - 360)
    endif
    edit_graphic_change_layer_info_value change_h = <h>
    edit_graphic_update_color_arrows
    edit_graphic_update_layer_graphics update_all = 0 index = EG_current_layer_menu_index
endscript


script edit_graphic_decrement_hue 
    <h> = (edit_graphic_layer_infos [ EG_current_layer_info_index ].hsva [ 0 ])
    <h> = (<h> - 5)
    if (<h> < 0)
        <h> = (<h> + 360)
    endif
    edit_graphic_change_layer_info_value change_h = <h>
    edit_graphic_update_color_arrows
    edit_graphic_update_layer_graphics update_all = 0 index = EG_current_layer_menu_index
endscript


script edit_graphic_increment_saturation 
    <s> = (edit_graphic_layer_infos [ EG_current_layer_info_index ].hsva [ 1 ])
    <s> = (<s> + 3)
    if (<s> > 90)
        <s> = 90
    endif
    edit_graphic_change_layer_info_value change_s = <s>
    edit_graphic_update_color_arrows
    edit_graphic_update_layer_graphics update_all = 0 index = EG_current_layer_menu_index
endscript


script edit_graphic_decrement_saturation 
    <s> = (edit_graphic_layer_infos [ EG_current_layer_info_index ].hsva [ 1 ])
    <s> = (<s> - 3)
    if (<s> < 0)
        <s> = 0
    endif
    edit_graphic_change_layer_info_value change_s = <s>
    edit_graphic_update_color_arrows
    edit_graphic_update_layer_graphics update_all = 0 index = EG_current_layer_menu_index
endscript


script edit_graphic_increment_value 
    <v> = (edit_graphic_layer_infos [ EG_current_layer_info_index ].hsva [ 2 ])
    <v> = (<v> + 2)
    if (<v> > 60)
        <v> = 60
    endif
    edit_graphic_change_layer_info_value change_v = <v>
    edit_graphic_update_color_arrows
    edit_graphic_update_layer_graphics update_all = 0 index = EG_current_layer_menu_index
endscript


script edit_graphic_decrement_value 
    <v> = (edit_graphic_layer_infos [ EG_current_layer_info_index ].hsva [ 2 ])
    <v> = (<v> - 2)
    if (<v> < 0)
        <v> = 0
    endif
    edit_graphic_change_layer_info_value change_v = <v>
    edit_graphic_update_color_arrows
    edit_graphic_update_layer_graphics update_all = 0 index = EG_current_layer_menu_index
endscript


script edit_graphic_increment_alpha 
    <a> = (edit_graphic_layer_infos [ EG_current_layer_info_index ].hsva [ 3 ])
    <a> = (<a> + 4)
    if (<a> > 128)
        <a> = 128
    endif
    edit_graphic_change_layer_info_value change_a = <a>
    edit_graphic_update_color_arrows
    edit_graphic_update_layer_graphics update_all = 0 index = EG_current_layer_menu_index
endscript


script edit_graphic_decrement_alpha 
    <a> = (edit_graphic_layer_infos [ EG_current_layer_info_index ].hsva [ 3 ])
    <a> = (<a> - 4)
    if (<a> < 0)
        <a> = 0
    endif
    edit_graphic_change_layer_info_value change_a = <a>
    edit_graphic_update_color_arrows
    edit_graphic_update_layer_graphics update_all = 0 index = EG_current_layer_menu_index
endscript


script edit_graphic_update_color_arrows 
    edit_graphic_tool_vmenu ::GetTags
    <slider> = <tag_selected_index>
    switch <slider>
        case 10
        <min> = 0.0
        <max> = 360.0
        <value> = (edit_graphic_layer_infos [ EG_current_layer_info_index ].hsva [ 0 ])
        <left> = colormenu_wrap_arrow_left
        <right> = colormenu_wrap_arrow_right
        <up> = hue_up_arrow
        <down> = hue_down_arrow
        case 11
        <min> = 0.0
        <max> = 90.0
        <value> = (edit_graphic_layer_infos [ EG_current_layer_info_index ].hsva [ 1 ])
        <left> = colormenu_nowrap_arrow_left
        <right> = colormenu_nowrap_arrow_right
        <up> = saturation_up_arrow
        <down> = saturation_down_arrow
        case 12
        <min> = 0.0
        <max> = 60.0
        <value> = (edit_graphic_layer_infos [ EG_current_layer_info_index ].hsva [ 2 ])
        <left> = colormenu_nowrap_arrow_left
        <right> = colormenu_nowrap_arrow_right
        <up> = value_up_arrow
        <down> = value_down_arrow
        case 13
        <min> = 0.0
        <max> = 128.0
        <value> = (edit_graphic_layer_infos [ EG_current_layer_info_index ].hsva [ 3 ])
        <left> = colormenu_nowrap_arrow_left
        <right> = colormenu_nowrap_arrow_right
        <up> = alpha_up_arrow
        <down> = alpha_down_arrow
    endswitch
    sliderbar_rescale_to_bar min = <min> max = <max> value = <value> left = <left> right = <right>
    SetScreenElementProps {
        id = <up>
        pos = ((1.0, 0.0) * <x_val>)
    }
    SetScreenElementProps {
        id = <down>
        pos = ((1.0, 0.0) * <x_val>)
    }
endscript


script edit_graphic_erase_layer_dialog 
    FireEvent type = unfocus target = edit_graphic_tool_vmenu
    create_error_box {title = 'ERASE LAYER'
        text = 'All contents of current layer will be erased! Would you like to continue?'
        buttons = [{text = 'Yes' pad_choose_script = edit_graphic_erase_layer}
            {text = 'No' pad_choose_script = edit_graphic_erase_layer_dialog_exit}
        ]
        z_priority = 100
        no_bg
    }
endscript


script edit_graphic_erase_layer_dialog_exit 
    dialog_box_exit
    FireEvent type = focus target = edit_graphic_tool_vmenu
    edit_graphic_create_helper_text
endscript


script edit_graphic_erase_layer 
    edit_graphic_erase_layer_dialog_exit
    edit_graphic_destroy_image_string
    edit_graphic_change_layer_info_value {change_texture_id = none
        change_texture_name = ''
        change_string = ''
        change_pos_x = (32)
        change_pos_y = (32)
        change_rot = 0
        change_scale = 1
        change_flip_h = 0
        change_flip_v = 0
        change_h = 0
        change_s = 0
        change_v = 60
        change_a = 128
    }
    edit_graphic_update_layer_graphics update_all = 0 index = EG_current_layer_menu_index
    FireEvent type = pad_up target = edit_graphic_tool_vmenu
    edit_graphic_highlight_avail_tools {tools_in_focus = 1
        menu_index = EG_current_layer_menu_index
        layer_index = EG_current_layer_info_index
    }
endscript


script edit_graphic_create_transform_menu 
    SetScreenElementProps {
        id = edit_graphic_canvas_title
        rgba = EG_selected_text_color
    }
    SetScreenElementLock id = edit_graphic_main_menu_anchor off
    CreateScreenElement {
        type = ContainerElement
        parent = edit_graphic_main_menu_anchor
        id = edit_graphic_transform_menu_anchor
        pos = (370.0, 323.0)
        just = [ left top ]
        event_handlers = [{ focus edit_graphic_transform_menu_focus }
            { unfocus edit_graphic_transform_menu_unfocus }
            { pad_back generic_menu_pad_back_sound }
            { pad_back edit_graphic_transform_menu_exit }
            { pad_choose generic_menu_pad_back_sound }
            { pad_choose edit_graphic_transform_menu_exit }
            {pad_up edit_graphic_transform_pos params = { up = 1 }}
            {pad_down edit_graphic_transform_pos params = { down = 1 }}
            {pad_left edit_graphic_transform_pos params = { left = 1 }}
            {pad_right edit_graphic_transform_pos params = { right = 1 }}
        ]
        heap = (screen_element_heap)
    }
    Theme_GetPauseBarColor return_value = border_color
    CreateScreenElement {
        parent = edit_graphic_transform_menu_anchor
        type = SpriteElement
        texture = white2
        rgba = <border_color>
        scale = (30.0, 9.0)
        pos = (0.0, 0.0)
        just = [ left top ]
        z_priority = 3
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        parent = edit_graphic_transform_menu_anchor
        type = SpriteElement
        texture = white2
        rgba = EG_selected_background_color
        scale = (29.0, 8.0)
        pos = (4.0, 4.0)
        just = [ left top ]
        z_priority = 4
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        parent = edit_graphic_transform_menu_anchor
        type = TextElement
        font = small
        text = 'Pos'
        pos = (6.0, 26.0)
        rgba = EG_unselected_text_color
        just = [ left top ]
        z_priority = 5
        shadow
        shadow_rgba = UI_text_shadow_color
        shadow_offs = UI_text_shadow_offset
        heap = (screen_element_heap)
    }
    GetPlatform
    switch <Platform>
        case PS2
        <texture> = P_dpad
        case XBox
        <texture> = X_dpad
        case NGC
        <texture> = N_dpad
    endswitch
    CreateScreenElement {
        parent = edit_graphic_transform_menu_anchor
        type = TextElement
        font = small
        text = '\b7/\b4/\b6/\b5'
        pos = (5.0, 45.0)
        scale = (0.6000000238418579, 0.6000000238418579)
        just = [ left top ]
        z_priority = 5
        heap = (screen_element_heap)
        rgba = [ 128 128 128 128 ]
    }
    CreateScreenElement {
        parent = edit_graphic_transform_menu_anchor
        type = TextElement
        font = small
        text = 'Rot'
        pos = (100.0, 12.0)
        rgba = EG_unselected_text_color
        just = [ left top ]
        z_priority = 5
        shadow
        shadow_rgba = UI_text_shadow_color
        shadow_offs = UI_text_shadow_offset
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        parent = edit_graphic_transform_menu_anchor
        type = SpriteElement
        texture = left_arrow
        pos = (159.0, 9.0)
        scale = (0.75, 0.75)
        just = [ left top ]
        z_priority = 5
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        parent = edit_graphic_transform_menu_anchor
        type = TextElement
        font = small
        text = '\bj'
        pos = (179.0, 12.0)
        rgba = EG_unselected_text_color
        just = [ left top ]
        z_priority = 5
        shadow
        shadow_rgba = UI_text_shadow_color
        shadow_offs = UI_text_shadow_offset
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        parent = edit_graphic_transform_menu_anchor
        type = SpriteElement
        texture = right_arrow
        pos = (214.0, 9.0)
        scale = (0.75, 0.75)
        just = [ left top ]
        z_priority = 5
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        parent = edit_graphic_transform_menu_anchor
        type = TextElement
        font = small
        text = 'Scale'
        pos = (98.0, 38.0)
        rgba = EG_unselected_text_color
        just = [ left top ]
        z_priority = 5
        shadow
        shadow_rgba = UI_text_shadow_color
        shadow_offs = UI_text_shadow_offset
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        parent = edit_graphic_transform_menu_anchor
        type = SpriteElement
        texture = up_arrow
        pos = (155.0, 42.0)
        scale = (0.75, 0.75)
        just = [ left top ]
        z_priority = 5
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        parent = edit_graphic_transform_menu_anchor
        type = TextElement
        font = small
        text = '\bk'
        pos = (179.0, 38.0)
        rgba = EG_unselected_text_color
        just = [ left top ]
        z_priority = 5
        shadow
        shadow_rgba = UI_text_shadow_color
        shadow_offs = UI_text_shadow_offset
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        parent = edit_graphic_transform_menu_anchor
        type = SpriteElement
        texture = down_arrow
        pos = (208.0, 42.0)
        scale = (0.75, 0.75)
        just = [ left top ]
        z_priority = 5
        heap = (screen_element_heap)
    }
    SetScreenElementLock id = edit_graphic_main_menu_anchor
    FireEvent type = unfocus target = edit_graphic_tool_vmenu
    FireEvent type = focus target = edit_graphic_transform_menu_anchor
    SetScreenElementProps {
        id = { edit_graphic_tool_vmenu child = 2 }
        rgba = EG_selected_text_color
    }
endscript


script edit_graphic_transform_menu_focus 
    if ScreenElementExists id = edit_graphic_transform_menu_anchor
        RunScriptOnScreenElement id = edit_graphic_transform_menu_anchor edit_graphic_transform_layer
        RunScriptOnScreenElement id = { edit_graphic_transform_menu_anchor child = 0 }edit_graphic_image_focus_glow
    endif
endscript


script edit_graphic_transform_layer 
    begin 
    if GetAnalogueInfo controller = 0
        <old_rot> = (edit_graphic_layer_infos [ EG_current_layer_info_index ].rot)
        <new_rot> = (<old_rot> + <rightx>)
        if (<new_rot> > 359)
            <new_rot> = (<new_rot> - 360)
        else
            if (<new_rot> < 0)
                <new_rot> = (360 + <new_rot>)
            endif
        endif
        if NOT (<new_rot> = <old_rot>)
            if NOT ((edit_graphic_layer_infos [ EG_current_layer_info_index ].string)= '')
                edit_graphic_handle_string_transform new_rot = <new_rot>
            else
                edit_graphic_change_layer_info_value change_rot = <new_rot>
                edit_graphic_update_layer_graphics update_all = 0 index = EG_current_layer_menu_index
            endif
        endif
        <old_scale> = (edit_graphic_layer_infos [ EG_current_layer_info_index ].scale)
        <new_scale> = (<old_scale> - (<righty> * 0.01000))
        if (<new_scale> > 1.0)
            <new_scale> = 1.0
        else
            if (<new_scale> < 0.1000)
                <new_scale> = 0.1000
            endif
        endif
        if NOT (<new_scale> = <old_scale>)
            if NOT ((edit_graphic_layer_infos [ EG_current_layer_info_index ].string)= '')
                edit_graphic_handle_string_transform new_scale = <new_scale>
            else
                edit_graphic_change_layer_info_value change_scale = <new_scale>
                edit_graphic_update_layer_graphics update_all = 0 index = EG_current_layer_menu_index
            endif
        endif
    endif
    if IsPs2
        wait 4 gameframe
    else
        wait 1 gameframe
    endif
    repeat 
endscript


script edit_graphic_transform_pos 
    if NOT ((edit_graphic_layer_infos [ EG_current_layer_info_index ].string)= '')
        edit_graphic_handle_string_transform <...> 
        return 
    endif
    <pos_y> = (edit_graphic_layer_infos [ EG_current_layer_info_index ].pos_y)
    <pos_x> = (edit_graphic_layer_infos [ EG_current_layer_info_index ].pos_x)
    <scale> = (edit_graphic_layer_infos [ EG_current_layer_info_index ].scale)
    if (GotParam up)
        <new_y> = (<pos_y> - 1)
        if (<new_y> > (-30 * <scale>))
            <pos_y> = <new_y>
        endif
    endif
    if (GotParam down)
        <new_y> = (<pos_y> + 1)
        if (<new_y> < (64 + (30 * <scale>)))
            <pos_y> = <new_y>
        endif
    endif
    if (GotParam left)
        <new_x> = (<pos_x> - 1)
        if (<new_x> > (-30 * <scale>))
            <pos_x> = <new_x>
        endif
    endif
    if (GotParam right)
        <new_x> = (<pos_x> + 1)
        if (<new_x> < (64 + (30 * <scale>)))
            <pos_x> = <new_x>
        endif
    endif
    edit_graphic_change_layer_info_value change_pos_y = <pos_y> change_pos_x = <pos_x>
    edit_graphic_update_layer_graphics update_all = 0 index = EG_current_layer_menu_index
endscript


script edit_graphic_handle_string_transform 
    <pos_x> = (edit_graphic_layer_infos [ EG_current_layer_info_index ].pos_x)
    <original_x> = <pos_x>
    if (GotParam left)
        <pos_x> = (<pos_x> - 1)
    endif
    if (GotParam right)
        <pos_x> = (<pos_x> + 1)
    endif
    <pos_y> = (edit_graphic_layer_infos [ EG_current_layer_info_index ].pos_y)
    <original_y> = <pos_y>
    if (GotParam up)
        <pos_y> = (<pos_y> - 1)
    endif
    if (GotParam down)
        <pos_y> = (<pos_y> + 1)
    endif
    <scale> = (edit_graphic_layer_infos [ EG_current_layer_info_index ].scale)
    <original_scale> = <scale>
    if GotParam new_scale
        <scale> = <new_scale>
    endif
    <rot> = (edit_graphic_layer_infos [ EG_current_layer_info_index ].rot)
    <original_rot> = <rot>
    if GotParam new_rot
        <rot> = <new_rot>
    endif
    <layer_string> = (edit_graphic_layer_infos [ EG_current_layer_info_index ].string)
    StringToCharArray string = <layer_string>
    GetArraySize <char_array>
    <font_spacing> = (EG_font_names [(edit_graphic_layer_infos [ EG_current_layer_info_index ].font_id)].spacing)
    <char_image_size> = ((64.0 / <array_size>)* <scale>)
    <char_x_pos> = ((0 - ((<char_image_size> * <array_size>)/ 2))+ (<char_image_size> / 2))
    <char_y_pos> = 0
    <move_ok> = 1
    <index> = 0
    begin 
    Get2DPosFrom2DVec magnitude = <char_x_pos> theta = <rot>
    <letter_x> = (<x> + (<pos_x> - 32))
    <letter_y> = (<y> + (<pos_y> - 32))
    if (<letter_y> < -30)
        <move_ok> = 0
        break 
    endif
    if (<letter_y> > 30)
        <move_ok> = 0
        break 
    endif
    if (<letter_x> < -30)
        <move_ok> = 0
        break 
    endif
    if (<letter_x> > 30)
        <move_ok> = 0
        break 
    endif
    <char_x_pos> = (<char_x_pos> + <char_image_size>)
    <index> = (<index> + 1)
    repeat <array_size>
    if NOT (<move_ok>)
        <pos_x> = <original_x>
        <pos_y> = <original_y>
        <scale> = <original_scale>
        <rot> = <original_rot>
    endif
    edit_graphic_change_layer_info_value change_pos_y = <pos_y> change_pos_x = <pos_x> change_rot = <rot> change_scale = <scale>
    edit_graphic_update_layer_graphics update_all = 0 index = EG_current_layer_menu_index
endscript


script edit_graphic_transform_menu_exit 
    KillSpawnedScript name = edit_graphic_transform_layer
    Theme_GetAltColor return_value = title_color
    SetScreenElementProps {
        id = edit_graphic_canvas_title
        rgba = <title_color>
    }
    SetScreenElementLock id = edit_graphic_main_menu_anchor off
    DestroyScreenElement id = edit_graphic_transform_menu_anchor
    SetScreenElementLock id = edit_graphic_main_menu_anchor
    FireEvent type = focus target = edit_graphic_tool_vmenu
endscript

EG_graphic_item_selected = 0

script edit_graphic_create_category_menu 
    change EG_graphic_item_selected = 0
    CreateScreenElement {
        type = TextElement
        parent = edit_graphic_action_menu_anchor
        id = edit_graphic_category_menu_title
        font = small
        text = 'GRAPHIC CATEGORIES'
        scale = 0.9500
        rgba = [128 , 128 , 128 , 128]
        pos = (33.0, 1.0)
        just = [ left top ]
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        type = VMenu
        parent = edit_graphic_action_menu_anchor
        id = edit_graphic_category_vmenu
        regular_space_amount = 22
        pos = (33.0, 29.0)
        just = [ left top ]
        heap = (screen_element_heap)
    }
    SetScreenElementProps {
        id = edit_graphic_category_vmenu
        event_handlers = [
            { pad_back generic_menu_pad_back_sound }
            { pad_back edit_graphic_category_menu_back }
            {pad_up generic_menu_up_or_down_sound params = { up }}
            {pad_down generic_menu_up_or_down_sound params = { down }}
        ]
        replace_handlers
    }
    edit_graphic_add_category_menu_item text = 'GRAPHICS' id = graphics_cat index = 0 category = graphics
    edit_graphic_add_category_menu_item text = 'ILLUSTRATIONS' id = illustrations_cat index = 1 category = illustrations
    edit_graphic_add_category_menu_item text = 'LOGO SHAPES' id = logo_shapes_cat index = 2 category = logos
    edit_graphic_add_category_menu_item text = 'BACKGROUNDS' id = backgrounds_cat index = 3 category = backgrounds
    edit_graphic_add_category_menu_item text = 'ODD SHAPES' id = odd_shapes_cat index = 4 category = odd_shapes
    edit_graphic_add_category_menu_item text = 'SPONSOR LOGOS' id = sponsor_logos_cat index = 5 category = corp_logos
    edit_graphic_add_category_menu_item text = 'ENTER TEXT' id = enter_text_cat index = 6
    FireEvent type = focus target = edit_graphic_category_vmenu
endscript


script edit_graphic_add_category_menu_item 
    CreateScreenElement {
        type = ContainerElement
        parent = edit_graphic_category_vmenu
        id = <id>
        dims = (200.0, 20.0)
        event_handlers = [{focus edit_graphic_category_item_focus params = { id = <id> }}
            {unfocus edit_graphic_category_item_unfocus params = { id = <id> }}
            { pad_choose generic_menu_pad_choose_sound }
            {pad_choose edit_graphic_category_menu_select params = {menu_type = image_menu category = <category> index = <index>}}
            { pad_start null_script }
        ]
        tags = { tag_grid_x = <index> }
        internal_just = [ center center ]
        heap = (screen_element_heap)
    }
    <container_id> = <id>
    CreateScreenElement {
        type = TextElement
        parent = <container_id>
        font = small
        text = <text>
        scale = 0.9000
        rgba = [128 , 128 , 128 , 128]
        z_priority = 3
        just = [ center top ]
        pos = (80.0, 0.0)
        shadow
        shadow_rgba = UI_text_shadow_color
        shadow_offs = UI_text_shadow_offset
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <container_id>
        pos = (-29.0, -3.0)
        just = [ left top ]
        scale = (1.0, 0.75)
        texture = roundbar_tip_left
        z_priority = 2
        rgba = [ 0 0 0 0 ]
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <container_id>
        pos = (3.0, -3.0)
        just = [ left top ]
        scale = (5.0, 0.75)
        texture = roundbar_middle
        z_priority = 2
        rgba = [ 0 0 0 0 ]
        heap = (screen_element_heap)
    }
    GetScreenElementPosition id = <id>
    GetScreenElementDims id = <id>
    right_edge = (<width> * (1.0, 0.0))
    offset = (0.0, -1.0)
    override_scale = 0.8500
    <container_id> ::SetTags right_edge = <right_edge> width = <width> offset = <offset> override_scale = <override_scale>
    CreateScreenElement {
        type = SpriteElement
        parent = <container_id>
        pos = (158.0, -3.0)
        just = [ left top ]
        scale = (1.0, 0.75)
        texture = roundbar_tip_right
        z_priority = 2
        rgba = [ 0 0 0 0 ]
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <container_id>
        local_id = roundbar_highlight
        sacle = <bg_scale>
        texture = roundbar_highlight
        pos = (3.0, -3.0)
        rgba = [128 , 128 , 128 , 0]
        just = [ left top ]
        z_priority = 2.500
        heap = (screen_element_heap)
    }
endscript


script edit_graphic_category_menu_select 
    if (<index> = 6)
        edit_graphic_create_action_menu_anchor menu_type = keyboard_menu new_text = 1
    else
        edit_graphic_create_action_menu_anchor <...> 
    endif
endscript


script edit_graphic_category_menu_back 
    edit_graphic_create_action_menu_anchor menu_type = tool_menu
    edit_graphic_highlight_avail_tools layer_index = EG_current_layer_info_index menu_index = EG_current_layer_menu_index
    FireEvent type = focus target = edit_graphic_tool_vmenu
endscript


script edit_graphic_category_item_focus 
    GetTags
    Theme_GetPauseBarColor return_value = bar_color
    FormatText checksumname = on_color '%i_HIGHLIGHTED_TEXT_COLOR_NEW' i = (THEME_COLOR_PREFIXES [ current_theme_prefix ])
    SetScreenElementProps {
        id = {<id> child = 0}
        rgba = <on_color>
        shadow_rgba = [128 , 128 , 128 , 0]
        pos = (80.0, -3.0)
    }
    DoScreenElementMorph id = {<id> child = 0}time = 0.05000 scale = (1.0, 1.100000023841858)
    SetScreenElementProps {
        id = {<id> child = 1}
        rgba = <bar_color>
    }
    SetScreenElementProps {
        id = {<id> child = 2}
        rgba = <bar_color>
    }
    SetScreenElementProps {
        id = {<id> child = 3}
        rgba = <bar_color>
    }
    RunScriptOnScreenElement id = {<id> child = roundbar_highlight}edit_CAG_menu_highlight params = {width = <width> offset = <offset> override_scale = <override_scale>}
endscript


script edit_graphic_category_item_unfocus 
    GetTags
    FormatText checksumname = off_color '%i_UNHIGHLIGHTED_TEXT_COLOR_NEW' i = (THEME_COLOR_PREFIXES [ current_theme_prefix ])
    Theme_GetPauseBarColor return_value = bar_color
    SetScreenElementProps {
        id = {<id> child = 0}
        rgba = <off_color>
        shadow_rgba = UI_text_shadow_color
        pos = (80.0, 0.0)
    }
    DoScreenElementMorph id = {<id> child = 0}time = 0.05000 scale = 0.9000
    SetScreenElementProps {
        id = {<id> child = 1}
        rgba = [128 , 128 , 128 , 0]
    }
    SetScreenElementProps {
        id = {<id> child = 2}
        rgba = [128 , 128 , 128 , 0]
    }
    SetScreenElementProps {
        id = {<id> child = 3}
        rgba = [128 , 128 , 128 , 0]
    }
    KillSpawnedScript name = edit_CAG_menu_highlight
    DoScreenElementMorph id = {<id> child = roundbar_highlight}alpha = 0 time = 0
endscript


script edit_graphic_create_keyboard_menu 
    DoScreenElementMorph id = edit_graphic_main_menu_anchor alpha = 0.0 time = 0.0
    SetScreenElementLock id = root_window off
    play_no_skater_cam
    make_mainmenu_3d_plane parent = root_window id = edit_graphic_keyboard_bg z_priority = 100
    <display_text> = (edit_graphic_layer_infos [ EG_current_layer_info_index ].string)
    create_onscreen_keyboard {keyboard_cancel_script = edit_graphic_exit_keyboard_menu keyboard_cancel_params = { new_text = <new_text> }
        keyboard_done_script = edit_graphic_keyboard_menu_done
        max_length = 10
        text = <display_text>
        new_text = <new_text>
        allowed_characters = ['A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I'
            'J' 'K' 'L' 'M' 'N' 'O' 'P' 'Q' 'R'
            'S' 'T' 'U' 'V' 'W' 'X' 'Y' 'Z' '0' '1'
            '2' '3' '4' '5' '6' '7' '8' '9' ' '
        ]
    }
    SetScreenElementLock id = edit_graphic_main_menu_anchor off
    create_helper_text {
        helper_text_elements = [
            { text = '\bn = Back' }
            { text = '\bm = Accept' }
        ]
    }
    SetScreenElementLock id = root_window
endscript


script edit_graphic_check_keyboard_string 
    <is_valid> = 0
    StringToCharArray string = <string>
    GetArraySize <char_array>
    if NOT (<array_size> = 0)
        <index> = 0
        begin 
        if NOT ((<char_array> [ <index> ])= ' ')
            <is_valid> = 1
            break 
        endif
        <index> = (<index> + 1)
        repeat <array_size>
    endif
    return got_valid_string = <is_valid>
endscript


script edit_graphic_keyboard_menu_done 
    GetTextElementString id = keyboard_current_string
    edit_graphic_check_keyboard_string string = <string>
    if (<got_valid_string> = 1)
        edit_graphic_change_layer_info_value change_string = <string>
        if NOT ((edit_graphic_layer_infos [ EG_current_layer_info_index ].texture_id)= none)
            edit_graphic_change_layer_info_value {change_texture_id = none
                change_texture_name = ''
                change_pos_x = 32
                change_pos_y = 32
                change_rot = 0
                change_scale = 1
                change_flip_h = 0
                change_flip_v = 0
                change_h = 0
                change_s = 0
                change_v = 60
                change_a = 128
            }
            <canvas_id> = (edit_graphic_layer_infos [ EG_current_layer_info_index ].canvas_id)
            SetScreenElementProps {
                id = <canvas_id>
                texture = white2
                scale = EG_canvas_scale_factor
                rgba = [128 , 128 , 128 , 0]
            }
        endif
        <done> = 1
    else
        edit_graphic_change_layer_info_value change_texture_id = none change_texture_name = '' change_string = ''
        edit_graphic_destroy_image_string
        <done> = 0
    endif
    edit_graphic_update_layer_graphics update_all = 0 index = EG_current_layer_menu_index
    edit_graphic_exit_keyboard_menu done = <done> new_text = <new_text>
endscript


script edit_graphic_exit_keyboard_menu done = 0
    destroy_onscreen_keyboard
    KillSkaterCamAnim all
    PlaySkaterCamAnim skater = 0 name = CAGR_cam1 play_hold
    SetScreenElementLock id = edit_graphic_main_menu_anchor off
    AssignAlias id = edit_graphic_main_menu_anchor alias = current_menu_anchor
    edit_graphic_create_helper_text
    SetScreenElementLock id = edit_graphic_main_menu_anchor
    SetScreenElementLock id = root_window off
    DestroyScreenElement id = edit_graphic_keyboard_bg
    SetScreenElementLock id = root_window
    DoScreenElementMorph id = edit_graphic_main_menu_anchor alpha = 1.0 time = 0.0
    if (<done> = 1)
        edit_graphic_create_action_menu_anchor menu_type = font_menu new_text = <new_text>
    else
        if (<new_text> = 1)
            edit_graphic_create_action_menu_anchor menu_type = category_menu
            FireEvent type = pad_up target = edit_graphic_category_vmenu
        else
            edit_graphic_create_action_menu_anchor menu_type = tool_menu
            edit_graphic_highlight_avail_tools layer_index = EG_current_layer_info_index menu_index = EG_current_layer_menu_index
            FireEvent type = focus target = edit_graphic_tool_vmenu
        endif
    endif
endscript


script edit_graphic_create_font_menu 
    CreateScreenElement {
        type = TextElement
        parent = edit_graphic_action_menu_anchor
        id = edit_graphic_font_menu_title
        font = small
        text = 'CHANGE FONT'
        scale = 1.100
        rgba = EG_selected_text_color
        pos = (52.0, 0.0)
        just = [ left top ]
        shadow
        shadow_rgba = UI_text_shadow_color
        shadow_offs = UI_text_shadow_offset
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        type = VMenu
        parent = edit_graphic_action_menu_anchor
        id = edit_graphic_font_vmenu
        regular_space_amount = 22
        pos = (53.0, 29.0)
        just = [ left top ]
        heap = (screen_element_heap)
    }
    SetScreenElementProps {
        id = edit_graphic_font_vmenu
        event_handlers = [{ pad_back generic_menu_pad_back_sound }
            { pad_back edit_graphic_font_menu_exit }
            {pad_up generic_menu_up_or_down_sound params = { up }}
            {pad_down generic_menu_up_or_down_sound params = { down }}
        ]
        replace_handlers
        tags = { new_text = <new_text> }
    }
    edit_graphic_add_font_menu_item text = 'GRAFITTI 1' id = font_grafitti_1 index = 0
    edit_graphic_add_font_menu_item text = 'GRAFITTI 2' id = font_grafitti_2 index = 1
    edit_graphic_add_font_menu_item text = 'BOLD' id = font_bold index = 2
    edit_graphic_add_font_menu_item text = 'BLOCK' id = font_block index = 3
    edit_graphic_add_font_menu_item text = 'NEVERSOFT' id = font_neversoft index = 4
    edit_graphic_add_font_menu_item text = 'STENCIL' id = font_stencil index = 5
    edit_graphic_add_font_menu_item text = 'SPRAY' id = font_spray index = 6
    edit_graphic_add_font_menu_item text = '3D' id = font_3d index = 7
    edit_graphic_add_font_menu_item text = 'DONE' id = font_done index = 8 done = 1
    FireEvent type = focus target = edit_graphic_font_vmenu
endscript


script edit_graphic_add_font_menu_item 
    CreateScreenElement {
        type = ContainerElement
        parent = edit_graphic_font_vmenu
        id = <id>
        dims = (200.0, 20.0)
        event_handlers = [{focus edit_graphic_font_item_focus params = { id = <id> }}
            {unfocus edit_graphic_font_item_unfocus params = { id = <id> }}
            { pad_choose generic_menu_pad_choose_sound }
            {pad_choose edit_graphic_font_menu_select params = { <...>  }}
            { pad_start null_script }
        ]
        tags = { tag_grid_x = <index> }
        internal_just = [ center center ]
        heap = (screen_element_heap)
    }
    <container_id> = <id>
    CreateScreenElement {
        type = TextElement
        parent = <container_id>
        font = small
        text = <text>
        scale = 0.9000
        rgba = [128 , 128 , 128 , 128]
        z_priority = 3
        just = [ center top ]
        pos = (60.0, 0.0)
        shadow
        shadow_rgba = UI_text_shadow_color
        shadow_offs = UI_text_shadow_offset
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <container_id>
        pos = (-49.0, -3.0)
        just = [ left top ]
        scale = (1.0, 0.75)
        texture = roundbar_tip_left
        z_priority = 2
        rgba = [ 0 0 0 0 ]
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <container_id>
        pos = (-17.0, -3.0)
        just = [ left top ]
        scale = (5.0, 0.75)
        texture = roundbar_middle
        z_priority = 2
        rgba = [ 0 0 0 0 ]
        heap = (screen_element_heap)
    }
    GetScreenElementPosition id = <id>
    GetScreenElementDims id = <id>
    offset = (-20.0, -1.0)
    <container_id> ::SetTags right_edge = <right_edge> width = <width> offset = <offset> override_scale = <override_scale>
    CreateScreenElement {
        type = SpriteElement
        parent = <container_id>
        pos = (138.0, -3.0)
        just = [ left top ]
        scale = (1.0, 0.75)
        texture = roundbar_tip_right
        z_priority = 2
        rgba = [ 0 0 0 0 ]
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <container_id>
        local_id = roundbar_highlight
        sacle = <bg_scale>
        texture = roundbar_highlight
        pos = (24.0, -3.0)
        rgba = [128 , 128 , 128 , 0]
        just = [ left top ]
        z_priority = 2.500
        heap = (screen_element_heap)
    }
endscript


script edit_graphic_font_menu_exit 
    edit_graphic_create_action_menu_anchor menu_type = tool_menu
    edit_graphic_highlight_avail_tools layer_index = EG_current_layer_info_index menu_index = EG_current_layer_menu_index
    FireEvent type = focus target = edit_graphic_tool_vmenu
endscript


script edit_graphic_font_menu_select 
    edit_graphic_font_vmenu ::GetTags
    if (GotParam done)
        edit_graphic_font_menu_exit
    else
        edit_graphic_change_layer_info_value change_font_id = <index>
        edit_graphic_update_layer_graphics update_all = 0 index = EG_current_layer_menu_index
    endif
endscript


script edit_graphic_font_item_focus 
    GetTags
    Theme_GetPauseBarColor return_value = bar_color
    FormatText checksumname = on_color '%i_HIGHLIGHTED_TEXT_COLOR_NEW' i = (THEME_COLOR_PREFIXES [ current_theme_prefix ])
    SetScreenElementProps {
        id = {<id> child = 0}
        rgba = <on_color>
        shadow_rgba = [128 , 128 , 128 , 0]
        pos = (60.0, -3.0)
    }
    DoScreenElementMorph id = {<id> child = 0}time = 0.05000 scale = (1.0, 1.100000023841858)
    SetScreenElementProps {
        id = {<id> child = 1}
        rgba = <bar_color>
    }
    SetScreenElementProps {
        id = {<id> child = 2}
        rgba = <bar_color>
    }
    SetScreenElementProps {
        id = {<id> child = 3}
        rgba = <bar_color>
    }
    RunScriptOnScreenElement id = {<id> child = roundbar_highlight}edit_CAG_menu_highlight params = {width = <width> right_edge = <right_edge> offset = <offset> override_scale = <override_scale>}
endscript


script edit_graphic_font_item_unfocus 
    GetTags
    FormatText checksumname = off_color '%i_UNHIGHLIGHTED_TEXT_COLOR_NEW' i = (THEME_COLOR_PREFIXES [ current_theme_prefix ])
    Theme_GetPauseBarColor return_value = bar_color
    SetScreenElementProps {
        id = {<id> child = 0}
        rgba = <off_color>
        shadow_rgba = UI_text_shadow_color
        pos = (60.0, 0.0)
    }
    DoScreenElementMorph id = {<id> child = 0}time = 0.05000 scale = 0.9000
    SetScreenElementProps {
        id = {<id> child = 1}
        rgba = [128 , 128 , 128 , 0]
    }
    SetScreenElementProps {
        id = {<id> child = 2}
        rgba = [128 , 128 , 128 , 0]
    }
    SetScreenElementProps {
        id = {<id> child = 3}
        rgba = [128 , 128 , 128 , 0]
    }
    KillSpawnedScript name = edit_CAG_menu_highlight
    DoScreenElementMorph id = {<id> child = roundbar_highlight}alpha = 0 time = 0
endscript


script edit_graphic_create_image_menu 
    
    switch <category>
        case graphics
        <title> = 'GRAPHICS'
        <title_pos> = (56.0, 0.0)
        if GlobalExists name = edit_graphics_graphics type = array
            <array_name> = edit_graphics_graphics
        else
            <array_name> = none
        endif
        case illustrations
        <title> = 'ILLUSTRATIONS'
        <title_pos> = (35.0, 0.0)
        if GlobalExists name = edit_graphics_illustrations type = array
            <array_name> = edit_graphics_illustrations
        else
            <array_name> = none
        endif
        case logos
        <title> = 'LOGO SHAPES'
        <title_pos> = (41.0, 0.0)
        if GlobalExists name = edit_graphics_logos type = array
            <array_name> = edit_graphics_logos
        else
            <array_name> = none
        endif
        case backgrounds
        <title> = 'BACKGROUNDS'
        <title_pos> = (40.0, 0.0)
        if GlobalExists name = edit_graphics_backgrounds type = array
            <array_name> = edit_graphics_backgrounds
        else
            <array_name> = none
        endif
        case odd_shapes
        <title> = 'ODD SHAPES'
        <title_pos> = (45.0, 0.0)
        if GlobalExists name = edit_graphics_odd type = array
            <array_name> = edit_graphics_odd
        else
            <array_name> = none
        endif
        case corp_logos
        <title> = 'SPONSOR LOGOS'
        <title_pos> = (35.0, 0.0)
        if GlobalExists name = edit_graphics_corp_logo type = array
            <array_name> = edit_graphics_corp_logo
        else
            <array_name> = none
        endif
    endswitch
    CreateScreenElement {
        type = TextElement
        parent = edit_graphic_action_menu_anchor
        id = edit_graphic_image_menu_title
        font = small
        text = <title>
        scale = 1.100
        rgba = EG_selected_text_color
        pos = <title_pos>
        just = [ left top ]
        shadow
        shadow_rgba = UI_text_shadow_color
        shadow_offs = UI_text_shadow_offset
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        parent = edit_graphic_action_menu_anchor
        type = SpriteElement
        texture = up_arrow
        pos = (70.0, 27.0)
        scale = (0.5, 0.5)
        just = [ left top ]
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        parent = edit_graphic_action_menu_anchor
        type = SpriteElement
        texture = up_arrow
        pos = (142.0, 27.0)
        scale = (0.5, 0.5)
        just = [ left top ]
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        parent = edit_graphic_action_menu_anchor
        type = SpriteElement
        texture = down_arrow
        pos = (70.0, 323.0)
        scale = (0.5, 0.5)
        just = [ left top ]
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        parent = edit_graphic_action_menu_anchor
        type = SpriteElement
        texture = down_arrow
        pos = (142.0, 323.0)
        scale = (0.5, 0.5)
        just = [ left top ]
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        type = VScrollingMenu
        parent = edit_graphic_action_menu_anchor
        id = edit_graphic_image_vscrollingmenu
        just = [ left top ]
        pos = (0.0, 38.0)
        dims = (224.0, 284.0)
        alpha = 0
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        type = VMenu
        parent = edit_graphic_image_vscrollingmenu
        id = edit_graphic_image_vmenu
        spacing_between = 4
        pos = (0.0, 0.0)
        just = [ left top ]
        dims = (224.0, 284.0)
        tags = { category_index = <index> }
        heap = (screen_element_heap)
    }
    SetScreenElementProps {
        id = edit_graphic_image_vmenu
        event_handlers = [{ pad_back generic_menu_pad_back_sound }
            { pad_back edit_graphic_image_menu_exit }
            {pad_up generic_menu_up_or_down_sound params = { up }}
            {pad_down generic_menu_up_or_down_sound params = { down }}
        ]
        replace_handlers
    }
    if NOT (<array_name> = none)
        GetArraySize <array_name>
        <index> = 0
        <hcounter> = 0
        <row_counter> = 0
        begin 
        if (<hcounter> = 0)
            FormatText checksumname = menu_id 'edit_graphic_image_row_%i' i = <row_counter>
            CreateScreenElement {
                type = HMenu
                parent = edit_graphic_image_vmenu
                id = <menu_id>
                spacing_between = 4
                dims = (224.0, 68.0)
                pos = (0.0, 0.0)
                just = [ left top ]
                heap = (screen_element_heap)
            }
            SetScreenElementProps {
                id = <menu_id>
                event_handlers = [{focus edit_graphic_image_item_menu_focus params = { menu_id = <menu_id> }}
                    { pad_left check_ok_pad_left }
                    { pad_right check_ok_pad_right }
                ]
                replace_handlers
            }
            AssignAlias id = <menu_id> alias = current_image_hmenu
            <row_counter> = (<row_counter> + 1)
        endif
        GetTextureFromPath path = (<array_name> [ <index> ])
        FormatText checksumname = texture_id '%t' t = <texture>
        edit_graphic_add_image_menu_item texture = <texture_id> texture_name = <texture> index = <index> hindex = <hcounter>
        <hcounter> = (<hcounter> + 1)
        if (<hcounter> = 3)
            <hcounter> = 0
        endif
        <index> = (<index> + 1)
        repeat <array_size>
    endif
    if ((<hcounter> < 3)& (<hcounter> > 0))
        begin 
        CreateScreenElement {
            parent = current_image_hmenu
            type = ContainerElement
            dims = (68.0, 68.0)
            not_focusable
            just = [ left top ]
            heap = (screen_element_heap)
        }
        <hcounter> = (<hcounter> + 1)
        if (<hcounter> = 3)
            break 
        endif
        repeat 
    endif
    Theme_GetAltColor return_value = grad_color
    CreateScreenElement {
        type = SpriteElement
        parent = edit_graphic_action_menu_anchor
        id = grad_bar_left
        texture = goal_grad
        rgba = <grad_color>
        scale = (10.199999809265137, 1.0)
        pos = (230.0, 24.0)
        just = [ left top ]
        z_priority = 35
        rot_angle = 89.90
    }
    create_scroll_bar parent = edit_graphic_action_menu_anchor VMenu = edit_graphic_image_vmenu items = <array_size> cols = 3 pos = (235.0, 22.0) size_height = 316
    CreateScreenElement {
        type = SpriteElement
        parent = edit_graphic_action_menu_anchor
        id = grad_bar_right
        texture = goal_grad
        rgba = <grad_color>
        scale = (10.199999809265137, 1.0)
        pos = (242.0, 24.0)
        just = [ left top ]
        z_priority = 35
        rot_angle = 89.90
    }
    change EG_image_item_menu_selection = 0
    wait 2 gameframes
    SetScreenElementProps id = edit_graphic_image_vscrollingmenu reset_window_top
    DoScreenElementMorph id = edit_graphic_image_vscrollingmenu alpha = 1
    FireEvent type = focus target = edit_graphic_image_vmenu
endscript


script edit_graphic_add_image_menu_item 
    FormatText checksumname = id '%a%b' a = <index> b = <texture_name>
    CreateScreenElement {
        parent = current_image_hmenu
        type = ContainerElement
        id = <id>
        dims = (68.0, 68.0)
        event_handlers = [{focus edit_graphic_image_item_focus params = {id = <id> index = <hindex>}}
            {unfocus edit_graphic_image_item_unfocus params = { id = <id> }}
            { pad_choose generic_menu_pad_choose_sound }
            {pad_choose edit_graphic_image_item_select params = {texture = <texture> texture_name = <texture_name>}}
            { pad_start null_script }
        ]
        just = [ left top ]
        heap = (screen_element_heap)
    }
    <item_id> = <id>
    CreateScreenElement {
        parent = <item_id>
        type = SpriteElement
        texture = white2
        rgba = EG_unselected_image_color
        scale = (8.5, 8.5)
        pos = (0.0, 0.0)
        just = [ left top ]
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        parent = <item_id>
        type = SpriteElement
        texture = white2
        rgba = EG_image_background_color
        scale = (7.5, 7.5)
        pos = (4.0, 4.0)
        just = [ left top ]
        z_priority = 8
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <item_id>
        texture = <texture>
        z_priority = 9
        scale = (0.8999999761581421, 0.8999999761581421)
        pos = (5.0, 6.0)
        just = [ left top ]
        z_priority = 9
        heap = (screen_element_heap)
    }
endscript


script edit_graphic_image_menu_exit 
    if (EG_graphic_item_selected = 0)
        edit_graphic_image_vmenu ::GetTags
        edit_graphic_create_action_menu_anchor menu_type = category_menu
        FireEvent type = focus target = edit_graphic_category_vmenu
        if NOT (<category_index> = 0)
            begin 
            FireEvent type = pad_down target = edit_graphic_category_vmenu
            repeat <category_index>
        endif
    else
        edit_graphic_category_menu_back
    endif
endscript

EG_image_item_menu_selection = 0

script edit_graphic_image_item_menu_focus 
    <menu_id> ::GetTags
    if GotParam tag_selected_index
        if NOT (<tag_selected_index> = EG_image_item_menu_selection)
            if (<tag_selected_index> > EG_image_item_menu_selection)
                <num_pads> = (<tag_selected_index> - EG_image_item_menu_selection)
                <pad_event> = pad_left
            else
                <num_pads> = (EG_image_item_menu_selection - <tag_selected_index>)
                <pad_event> = pad_right
            endif
            wait 1 gameframe
            change ok_pad_left_right = 0
            begin 
            FireEvent type = <pad_event> target = <menu_id>
            repeat <num_pads>
            change ok_pad_left_right = 1
        endif
    endif
endscript


script edit_graphic_image_item_focus 
    Theme_GetPauseBarColor return_value = rgba
    SetScreenElementProps {
        id = {<id> child = 0}
        rgba = <rgba>
    }
    RunScriptOnScreenElement id = {<id> child = 0}edit_graphic_image_focus_glow
    change EG_image_item_menu_selection = <index>
endscript


script edit_graphic_image_item_unfocus 
    KillSpawnedScript name = edit_graphic_image_focus_glow
    DoScreenElementMorph {
        id = {<id> child = 0}
        rgba = EG_unselected_image_color
        alpha = 1
        time = 0
    }
endscript


script edit_graphic_image_item_select 
    change EG_graphic_item_selected = 1
    edit_graphic_change_layer_info_value change_texture_id = <texture> change_texture_name = <texture_name>
    edit_graphic_update_layer_graphics update_all = 0 index = EG_current_layer_menu_index
endscript


script edit_graphic_create_canvas bg_texture = white2
    CreateScreenElement {
        type = ContainerElement
        parent = edit_graphic_main_menu_anchor
        id = edit_graphic_canvas_anchor
        pos = (370.0, 65.0)
        just = [ left top ]
        heap = (screen_element_heap)
    }
    Theme_GetAltColor return_value = title_color
    CreateScreenElement {
        type = TextElement
        parent = edit_graphic_canvas_anchor
        id = edit_graphic_canvas_title
        font = small
        text = 'CANVAS'
        scale = 1.100
        rgba = <title_color>
        pos = (76.0, 0.0)
        just = [ left top ]
        shadow
        shadow_rgba = UI_text_shadow_color
        shadow_offs = UI_text_shadow_offset
        heap = (screen_element_heap)
    }
    if (EG_creating_premade)
        CreateScreenElement {
            parent = edit_graphic_canvas_anchor
            type = SpriteElement
            texture = white2
            rgba = EG_premade_key_color
            pos = (23.0, 40.0)
            just = [ left top ]
            z_priority = -1
            scale = 24
            heap = (screen_element_heap)
        }
    endif
    CreateScreenElement {
        parent = edit_graphic_canvas_anchor
        type = SpriteElement
        texture = white2
        rgba = [ 32 32 32 128 ]
        scale = (23.0, 0.20000000298023224)
        pos = (27.0, 44.0)
        just = [ left top ]
        z_priority = 3
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        parent = edit_graphic_canvas_anchor
        type = SpriteElement
        texture = white2
        rgba = [ 32 32 32 128 ]
        scale = (23.0, 0.20000000298023224)
        pos = (27.0, 230.0)
        just = [ left top ]
        z_priority = 3
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        parent = edit_graphic_canvas_anchor
        type = SpriteElement
        texture = white2
        rgba = [ 32 32 32 128 ]
        scale = (0.20000000298023224, 23.5)
        pos = (24.0, 44.0)
        just = [ left top ]
        z_priority = 3
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        parent = edit_graphic_canvas_anchor
        type = SpriteElement
        texture = white2
        rgba = [ 32 32 32 128 ]
        scale = (0.20000000298023224, 23.5)
        pos = (212.0, 44.0)
        just = [ left top ]
        z_priority = 3
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        type = ContainerElement
        parent = edit_graphic_canvas_anchor
        id = edit_graphic_canvas_space
        pos = (27.0, 46.0)
        dims = (184.0, 184.0)
        just = [ left top ]
        heap = (screen_element_heap)
    }
    CreateScreenElement {
        parent = edit_graphic_canvas_space
        type = WindowElement
        id = edit_graphic_canvas_clip
        pos = (0.0, 0.0)
        dims = (184.0, 184.0)
        just = [ left top ]
        heap = (screen_element_heap)
    }
    GetArraySize edit_graphic_layer_infos
    <index> = 0
    begin 
    if ((edit_graphic_layer_infos [ <index> ].texture_id)= none)
        <texture> = white2
        <current_scaling> = 1
    else
        <texture> = (edit_graphic_layer_infos [ <index> ].texture_id)
        <current_scaling> = (edit_graphic_layer_infos [ <index> ].scale)
    endif
    CreateScreenElement {
        parent = edit_graphic_canvas_clip
        type = SpriteElement
        texture = <texture>
        scale = (<current_scaling> * EG_canvas_scale_factor)
        pos = (0.0, 0.0)
        just = [ center center ]
        internal_just = [ center center ]
        z_priority = (EG_canvas_base_z + <index>)
        heap = (screen_element_heap)
    }
    edit_graphic_change_layer_info_value use_current = 0 index = <index> change_canvas_id = <id>
    <index> = (<index> + 1)
    repeat <array_size>
endscript


script edit_graphic_copy_to_open_layer 
    GetScreenElementChildren id = edit_graphic_layer_vmenu
    GetArraySize <children>
    <menu_index> = 0
    <found_open> = 0
    <num_layers> = (<array_size> - 1)
    begin 
    <this_layer> = (<children> [ <menu_index> ])
    <this_layer> ::GetTags
    if (((edit_graphic_layer_infos [ <layer_info_index> ].texture_id)= none)& ((edit_graphic_layer_infos [ <layer_info_index> ].string)= ''))
        <found_open> = 1
        break 
    endif
    <menu_index> = (<menu_index> + 1)
    repeat <num_layers>
    if (<found_open> = 1)
        edit_graphic_get_array_info_vals index = EG_current_layer_info_index
        edit_graphic_change_layer_info_value {use_current = 0 index = <layer_info_index>
            change_texture_id = <texture_id>
            change_texture_name = <texture_name>
            change_string = <string>
            change_font_id = <font_id>
            change_pos_x = <pos_x>
            change_pos_y = <pos_y>
            change_rot = <rot>
            change_scale = <scale>
            change_flip_h = <flip_h>
            change_flip_v = <flip_v>
            change_h = (<hsva> [ 0 ])
            change_s = (<hsva> [ 1 ])
            change_v = (<hsva> [ 2 ])
            change_a = (<hsva> [ 3 ])
        }
        edit_graphic_update_layer_graphics update_all = 0 index = <menu_index>
        edit_graphic_layer_vmenu ::GetTags
        SetScreenElementProps {
            id = {<tag_selected_id> child = 0}
            rgba = [80 , 80 , 80 , 60]
            texture = white2
        }
        DoScreenElementMorph id = {<tag_selected_id> child = 0}scale = (10.0, 3.137500047683716) time = 0
        SetScreenElementProps {
            id = {<tag_selected_id> child = text}
            rgba = [90 , 90 , 90 , 90]
        }
        FireEvent type = focus target = edit_graphic_layer_vmenu data = { grid_index = <menu_index> }
        FireEvent type = unfocus target = edit_graphic_layer_vmenu
        edit_graphic_layer_vmenu ::GetTags
        Theme_GetPauseBarColor return_value = bar_color
        SetScreenElementProps {
            id = {<tag_selected_id> child = 0}
            texture = roundbar_middle
            rgba = <bar_color>
        }
        DoScreenElementMorph id = {<tag_selected_id> child = 0}scale = (2.5, 0.800000011920929) time = 0
        SetScreenElementProps {
            id = {<tag_selected_id> child = text}
            rgba = [0 , 0 , 0 , 128]
        }
        change EG_current_layer_menu_index = <menu_index>
        change EG_current_layer_info_index = <layer_info_index>
        edit_graphic_tool_vmenu ::GetTags
        SetScreenElementProps {
            id = {<tag_selected_id> child = 0}
            rgba = [0 , 0 , 0 , 128]
        }
    endif
endscript


script edit_graphic_swap_layers 
    GetScreenElementChildren id = edit_graphic_layer_vmenu
    <this_layer> = (<children> [ EG_current_layer_menu_index ])
    <this_layer> ::GetTags
    <this_layer_index> = <layer_info_index>
    <this_menu_index> = <tag_grid_x>
    RemoveParameter layer_info_index
    if (GotParam swap_up)
        <selected_tool_id> = swap_backward
        <pad_event> = pad_up
        <other_layer_menu_index> = (EG_current_layer_menu_index -1)
        <other_layer> = (<children> [ <other_layer_menu_index> ])
    endif
    if (GotParam swap_down)
        <selected_tool_id> = swap_forward
        <pad_event> = pad_down
        <other_layer_menu_index> = (EG_current_layer_menu_index + 1)
        <other_layer> = (<children> [ <other_layer_menu_index> ])
    endif
    <other_layer> ::GetTags
    <other_layer_index> = <layer_info_index>
    <other_menu_index> = <tag_grid_x>
    SetScreenElementProps {
        id = <this_layer>
        tags = { layer_info_index = <other_layer_index> }
    }
    SetScreenElementProps {
        id = <other_layer>
        tags = { layer_info_index = <this_layer_index> }
    }
    edit_graphic_change_layer_info_value {use_current = 0 index = <other_layer_index>
        change_layer_id = <this_menu_index>
    }
    edit_graphic_change_layer_info_value {use_current = 0 index = <this_layer_index>
        change_layer_id = <other_menu_index>
    }
    change EG_current_layer_menu_index = <other_menu_index>
    change EG_current_layer_info_index = <this_layer_index>
    edit_graphic_update_layer_graphics update_all = 0 index = <other_menu_index>
    edit_graphic_update_layer_graphics update_all = 0 index = <this_menu_index>
    FireEvent type = focus target = edit_graphic_layer_vmenu
    FireEvent type = <pad_event> target = edit_graphic_layer_vmenu
    FireEvent type = unfocus target = edit_graphic_layer_vmenu
    edit_graphic_layer_vmenu ::GetTags
    Theme_GetPauseBarColor return_value = bar_color
    SetScreenElementProps {
        id = {<tag_selected_id> child = 0}
        texture = roundbar_middle
        rgba = <bar_color>
    }
    DoScreenElementMorph id = {<tag_selected_id> child = 0}scale = (2.5, 0.800000011920929) time = 0
    SetScreenElementProps {
        id = {<tag_selected_id> child = text}
        rgba = [0 , 0 , 0 , 128]
    }
    if (EG_current_layer_menu_index = 9)
        FireEvent type = pad_up target = edit_graphic_tool_vmenu
        SetScreenElementProps {
            id = {<selected_tool_id> child = 0}
            rgba = EG_unselectable_text_color
        }
    else
        if (EG_current_layer_menu_index = 0)
            FireEvent type = pad_down target = edit_graphic_tool_vmenu
            SetScreenElementProps {
                id = {<selected_tool_id> child = 0}
                rgba = EG_unselectable_text_color
            }
        else
            SetScreenElementProps {
                id = {<selected_tool_id> child = 0}
                rgba = [0 , 0 , 0 , 128]
            }
        endif
    endif
endscript


script edit_graphic_flip_layer 
    if (GotParam horiz)
        <flip_h> = (1 - (edit_graphic_layer_infos [ EG_current_layer_info_index ].flip_h))
        edit_graphic_change_layer_info_value change_flip_h = <flip_h>
    endif
    if (GotParam vert)
        <flip_v> = (1 - (edit_graphic_layer_infos [ EG_current_layer_info_index ].flip_v))
        edit_graphic_change_layer_info_value change_flip_v = <flip_v>
    endif
    edit_graphic_update_layer_graphics update_all = 0 index = EG_current_layer_menu_index
endscript


script edit_graphic_clear_all 
    GetArraySize edit_graphic_layer_infos
    <index> = 0
    begin 
    edit_graphic_change_layer_info_value {
        use_current = 0
        index = <index>
        change_texture_id = none
        change_texture_name = ''
        change_string = ''
        change_font_id = 0
        change_pos_x = (32)
        change_pos_y = (32)
        change_rot = 0
        change_scale = 1
        change_flip_h = 0
        change_flip_v = 0
        change_h = 0
        change_s = 0
        change_v = 60
        change_a = 128
        change_layer_id = <index>
    }
    <index> = (<index> + 1)
    repeat <array_size>
    change EG_current_layer_menu_index = 0
    change EG_current_layer_info_index = 0
endscript


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
        <scale> = <change_scale>
    endif
    if (GotParam change_flip_h)
        <flip_h> = <change_flip_h>
    endif
    if (GotParam change_flip_v)
        <flip_v> = <change_flip_v>
    endif
    if (GotParam change_h)
        SetArrayElement arrayname = hsva index = 0 newvalue = <change_h>
    endif
    if (GotParam change_s)
        SetArrayElement arrayname = hsva index = 1 newvalue = <change_s>
    endif
    if (GotParam change_v)
        SetArrayElement arrayname = hsva index = 2 newvalue = <change_v>
    endif
    if (GotParam change_a)
        SetArrayElement arrayname = hsva index = 3 newvalue = <change_a>
    endif
    if (GotParam change_layer_id)
        <layer_id> = <change_layer_id>
    endif
    SetArrayElement {arrayname = tmpArray index = <info_index>
        newvalue = {texture_id = <texture_id> texture_name = <texture_name> string = <string> canvas_id = <canvas_id>
            font_id = <font_id> pos_x = <pos_x> pos_y = <pos_y> rot = <rot> scale = <scale>
            flip_h = <flip_h> flip_v = <flip_v> hsva = <hsva> layer_id = <layer_id>
        }
    }
endscript


script edit_graphic_build_image_string 
    <layer_string> = (edit_graphic_layer_infos [ <info_index> ].string)
    StringToCharArray string = <layer_string>
    GetArraySize <char_array>
    <font_spacing> = (EG_font_names [(edit_graphic_layer_infos [ <info_index> ].font_id)].spacing)
    <char_image_size> = ((64.0 / <array_size>))
    <char_x_pos> = ((0 - ((<char_image_size> * <array_size>)/ 2))+ (<char_image_size> / 2))
    <char_y_pos> = 0
    <canvas_id> = (edit_graphic_layer_infos [ <info_index> ].canvas_id)
    <font> = (EG_font_names [(edit_graphic_layer_infos [ <info_index> ].font_id)].name)
    <scale> = (<char_image_size> / 64.0)
    if NOT (<array_size> = 1)
        if NOT (<font_spacing> = 0)
            <scale> = (<scale> * (1 / <font_spacing>))
        endif
    endif
    SetScreenElementLock id = <canvas_id> off
    <index> = 0
    begin 
    <pos> = (((1.0, 0.0) * <char_x_pos>)+ ((0.0, 1.0) * <char_y_pos>))
    <char> = (<char_array> [ <index> ])
    if (<char> = ' ')
        FormatText checksumname = texture '%f_a' f = <font> l = <char>
        <rgba> = [128 , 128 , 128 , 0]
    else
        FormatText checksumname = texture '%f_%l' f = <font> l = <char>
        HSVtoRGB hsv = (edit_graphic_layer_infos [ <info_index> ].hsva)
        <rgba> = <rgb>
    endif
    CreateScreenElement {
        parent = <canvas_id>
        type = SpriteElement
        texture = <texture>
        rgba = <rgba>
        scale = <scale>
        pos = <pos>
        just = [ center center ]
        z_priority = (EG_canvas_base_z + <menu_index>)
        tags = { current_texture = <texture> }
        heap = (screen_element_heap)
    }
    <char_x_pos> = (<char_x_pos> + <char_image_size>)
    <index> = (<index> + 1)
    repeat <array_size>
    SetScreenElementLock id = <canvas_id>
endscript


script edit_graphic_destroy_image_string use_current = 1
    if (<use_current> = 1)
        <info_index> = EG_current_layer_info_index
    else
        <info_index> = <info_index>
    endif
    <canvas_id> = (edit_graphic_layer_infos [ <info_index> ].canvas_id)
    GetScreenElementChildren id = <canvas_id>
    if (GotParam children)
        SetScreenElementLock id = <canvas_id> off
        GetArraySize <children>
        <index> = 0
        begin 
        <child_id> = (<children> [ <index> ])
        DestroyScreenElement id = <child_id>
        <index> = (<index> + 1)
        repeat <array_size>
        SetScreenElementLock id = <canvas_id>
    endif
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
    if ((edit_graphic_layer_infos [ <layer_info_index> ].texture_id)= none)
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
                scale = (edit_graphic_layer_infos [ <layer_info_index> ].scale)
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
    <container_scale> = (edit_graphic_layer_infos [ <info_index> ].scale)
    <char_image_size> = ((64.0 / <array_size>)* <container_scale>)
    <container_pos_x> = (edit_graphic_layer_infos [ <info_index> ].pos_x)
    <char_x_pos> = ((0 - ((<char_image_size> * <array_size>)/ 2))+ (<char_image_size> / 2))
    <char_y_pos> = 0
    <font> = (EG_font_names [(edit_graphic_layer_infos [ <info_index> ].font_id)].name)
    <scale> = (<char_image_size> / 64.0)
    if NOT (<array_size> = 1)
        if NOT (<font_spacing> = 0)
            <scale> = (<scale> * (1 / <font_spacing>))
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
            scale = <scale>
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


script edit_graphic_print_layers 
    
    
    
    
    
    
    
    <index> = 0
    begin 
    
    if ((edit_graphic_layer_infos [ <index> ].texture_id)= none)
        
    else
        
    endif
    
    
    
    
    
    
    
    
    
    
    
    
    
    <index> = (<index> + 1)
    repeat 10
    
    
    
    
    
    
endscript


script edit_graphic_set_layer_infos 
    <index> = 0
    begin 
    if NOT ((<layer_infos> [ <index> ].texture_name)= '')
        FormatText checksumname = texture_id '%t' t = (<layer_infos> [ <index> ].texture_name)
    else
        <texture_id> = none
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
        change_scale = (<layer_infos> [ <index> ].scale)
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


script edit_graphic_apply_graphic_from_save 
    load_cag_textures_to_main_memory
    edit_graphic_prepare_sprite_infos
    GetCurrentSkaterProfileIndex
    GenerateCAGTexture info_array = <sprite_infos> player = <currentSkaterProfileIndex> test = 0
    load_cag_textures_to_main_memory unload
endscript


script edit_graphic_copy_layer_infos 
    <tmpArray> = edit_graphic_layer_infos_copy
    <index> = 0
    begin 
    SetArrayElement {
        arrayname = tmpArray
        index = <index>
        newvalue = {
            texture_id = (edit_graphic_layer_infos [ <index> ].texture_id)
            texture_name = (edit_graphic_layer_infos [ <index> ].texture_name)
            string = (edit_graphic_layer_infos [ <index> ].string)
            canvas_id = (edit_graphic_layer_infos [ <index> ].canvas_id)
            font_id = (edit_graphic_layer_infos [ <index> ].font_id)
            pos_x = (edit_graphic_layer_infos [ <index> ].pos_x)
            pos_y = (edit_graphic_layer_infos [ <index> ].pos_y)
            rot = (edit_graphic_layer_infos [ <index> ].rot)
            scale = (edit_graphic_layer_infos [ <index> ].scale)
            flip_h = (edit_graphic_layer_infos [ <index> ].flip_h)
            flip_v = (edit_graphic_layer_infos [ <index> ].flip_v)
            hsva = (edit_graphic_layer_infos [ <index> ].hsva)
            layer_id = (edit_graphic_layer_infos [ <index> ].layer_id)
        }
    }
    <index> = (<index> + 1)
    repeat 10
endscript


script edit_graphic_reset_layer_infos 
    <tmpArray> = edit_graphic_layer_infos
    <index> = 0
    begin 
    SetArrayElement {
        arrayname = tmpArray
        index = <index>
        newvalue = {
            texture_id = (edit_graphic_layer_infos_copy [ <index> ].texture_id)
            texture_name = (edit_graphic_layer_infos_copy [ <index> ].texture_name)
            string = (edit_graphic_layer_infos_copy [ <index> ].string)
            canvas_id = (edit_graphic_layer_infos_copy [ <index> ].canvas_id)
            font_id = (edit_graphic_layer_infos_copy [ <index> ].font_id)
            pos_x = (edit_graphic_layer_infos_copy [ <index> ].pos_x)
            pos_y = (edit_graphic_layer_infos_copy [ <index> ].pos_y)
            rot = (edit_graphic_layer_infos_copy [ <index> ].rot)
            scale = (edit_graphic_layer_infos_copy [ <index> ].scale)
            flip_h = (edit_graphic_layer_infos_copy [ <index> ].flip_h)
            flip_v = (edit_graphic_layer_infos_copy [ <index> ].flip_v)
            hsva = (edit_graphic_layer_infos_copy [ <index> ].hsva)
            layer_id = (edit_graphic_layer_infos_copy [ <index> ].layer_id)
        }
    }
    <index> = (<index> + 1)
    repeat 10
endscript

