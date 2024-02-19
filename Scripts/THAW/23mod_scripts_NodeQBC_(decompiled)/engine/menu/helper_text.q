
script create_helper_text {anchor_id = helper_text_anchor
        parent = current_menu_anchor
        helper_pos = (318.0, 426.0)
        spacing_between = 3
        bg_rgba = [ 2 0 1 98 ]
        z_priority = 100
    }
    if ObjectExists id = <anchor_id>
        DestroyScreenElement id = <anchor_id>
    endif
    CreateScreenElement {
        type = ContainerElement
        parent = <parent>
        id = <anchor_id>
        Pos = (320.0, 240.0)
        dims = (640.0, 480.0)
        rot_angle = 0
    }
    if NOT GotParam no_bar
        CreateScreenElement {
            type = SpriteElement
            parent = <anchor_id>
            texture = white2
            Pos = <helper_pos>
            just = [ center bottom ]
            rgba = [ 5 5 5 80 ]
            Scale = (200.5, 3.4000000953674316)
        }
        CreateScreenElement {
            type = SpriteElement
            parent = <anchor_id>
            texture = snaz_T_M
            Pos = <helper_pos>
            just = [ center bottom ]
            rgba = [ 40 40 40 70 ]
            Scale = (10.0, 0.75)
            z_priority = 10
        }
        CreateScreenElement {
            type = SpriteElement
            parent = <anchor_id>
            texture = spazzbody
            Pos = <helper_pos>
            just = [ center bottom ]
            rgba = [ 10 31 60 60 ]
            Scale = (50.0, 1.2999999523162842)
            z_priority = 11
        }
        CreateScreenElement {
            type = SpriteElement
            parent = <anchor_id>
            texture = white3
            Scale = (40.0, 0.019999999552965164)
            rgba = [ 28 125 6 48 ]
            Pos = (<helper_pos> - (0.0, 28.0))
        }
        CreateScreenElement {
            type = SpriteElement
            parent = <anchor_id>
            texture = white3
            Scale = (40.0, 0.019999999552965164)
            rgba = [ 28 125 6 48 ]
            Pos = (<helper_pos> + (0.0, 2.0))
        }
    endif
    CreateScreenElement {
        type = hmenu
        parent = <anchor_id>
        Pos = (<helper_pos> - (0.0, 3.0))
        just = [ center bottom ]
        internal_just = [ center center ]
        padding_scale = 0.9000
        spacing_between = <spacing_between>
        Scale = <Scale>
    }
    <menu_id> = <id>
    if GotParam helper_text_elements
        ForEachIn <helper_text_elements> do = helper_text_update_element params = {menu_id = <menu_id> z_priority = <z_priority>}
    endif
endscript

script helper_text_update_element 
    if GotParam \{ id }
        if ObjectExists <id>
            SetScreenElementProps {
                id = <id>
                text = <text>
            }
            return 
        endif
    endif
    CreateScreenElement {
        type = TextElement
        parent = <menu_id>
        id = <id>
        font = dialog
        text = <text>
        rgba = [ 128 128 128 78 ]
        Scale = 0.7900
        z_priority = <z_priority>
        not_focusable
    }
endscript
generic_helper_text = {
    helper_text_elements = [
        { text = '\b7/\b4 = Select' }
        { text = '\m1 = Back' }
        { text = '\m0 = Accept' }
    ]
}
generic_helper_text_no_back = {
    helper_text_elements = [
        { text = '\b7/\b4 = Select' }
        { text = '\m0 = Accept' }
    ]
}
generic_helper_text_no_accept = {
    helper_text_elements = [
        { text = '\b7/\b4 = Select' }
        { text = '\m1 = Back' }
    ]
}
generic_helper_text_cas = {
    helper_text_elements = [
        { text = '\b7/\b4 = Select' }
        { text = '\m1 = Back' }
        { text = '\m0 = Accept' }
        { text = '\be/\bf = Rotate' }
    ]
}
generic_helper_text_cas_no_back = {
    helper_text_elements = [
        { text = '\b7/\b4 = Select' }
        { text = '\m0 = Accept' }
        { text = '\be/\bf = Rotate' }
    ]
}
generic_helper_text_cas_z = {
    helper_text_elements = [
        { text = '\b7/\b4 = Select' }
        { text = '\m1 = Back' }
        { text = '\m0 = Accept' }
        { text = '\be/\bf = Rotate' }
        { text = '\mj = Zoom' }
    ]
}
generic_helper_text_left_right = {
    helper_text_elements = [
        { text = '\b6/\b5 = Select' }
        { text = '\m1 = Back' }
        { text = '\m0 = Accept' }
    ]
}
generic_helper_text_up_down_left_right = {
    helper_text_elements = [
        { text = '\b7/\b4/\b6/\b5 = Select' }
        { text = '\m1 = Back' }
        { text = '\m0 = Accept' }
    ]
}
generic_helper_text_up_down_adjust = {
    helper_text_elements = [
        { text = '\b7/\b4 = Select' }
        { text = '\b6/\b5 = Adjust' }
        { text = '\m1 = Back' }
        { text = '\m0 = Accept' }
    ]
}
generic_helper_text_left_right_l_r = {
    helper_text_elements = [
        { text = '\b6/\b5 = Select' }
        { text = '\m1 = Back' }
        { text = '\m0 = Accept' }
        { text = '\be/\bf = Rotate' }
    ]
}
generic_helper_text_left_right_up_down = {
    helper_text_elements = [
        { text = '\b7/\b4 = Select' }
        { text = '\b6/\b5=Adjust' }
        { text = '\m1 = Back' }
        { text = '\m0 = Accept' }
    ]
}
generic_helper_text_color_menu = {
    helper_text_elements = [
        { text = '\b7/\b4=Select' }
        { text = '\b6/\b5=Adjust' }
        { text = '\m1=Back' }
        { text = '\m0=Accept' }
        { text = '\be/\bf=Rotate' }
    ]
}
generic_helper_text_color_menu_z = {
    helper_text_elements = [
        { text = '\b7/\b4=Select' }
        { text = '\b6/\b5=Adjust' }
        { text = '\m1=Back' }
        { text = '\m0=Accept' }
        { text = '\be/\bf=Rotate' }
        { text = '\mj=Zoom' }
    ]
}
generic_helper_text_color_menu_reset = {
    helper_text_elements = [
        { text = '\m1=Back' }
        { text = '\be/\bf=Rotate' }
        { text = '\mn=Reset' }
        { text = '\mj=Zoom' }
    ]
}
generic_helper_text_color_menu_reset_ngc = {
    helper_text_elements = [
        { text = '\m1=Back' }
        { text = '\be/\bf=Rotate' }
        { text = '\be+\bf=Reset' }
        { text = '\mj=Zoom' }
    ]
}
cag_helper_text = {
    helper_text_elements = [
        { text = '\b8=Quit' }
        { text = '\m1=Back' }
        { text = '\m0=Place' }
        { text = '\be/\bg=Raise/Lower' }
        { text = '\bf/\bh=Zoom' }
    ]
}
cag_helper_text_xbox = {
    helper_text_elements = [
        { text = '\b8=Quit' }
        { text = '\b0=Back' }
        { text = '\m0=Place' }
        { text = '\be/\bf=Lower/Raise' }
        { text = '\bg/\bh=Zoom' }
    ]
}
cag_helper_text_ngc = {
    helper_text_elements = [
        { text = '\b8=Quit' }
        { text = '\b0=Back' }
        { text = '\m0=Place' }
        { text = '\be/\bf=Raise/Lower' }
        { text = '\b9+\be/\bf=Zoom' }
    ]
}
cag_helper_text_no_back = {
    helper_text_elements = [
        { text = '\b8 = Quit' }
        { text = '\m0 = Place' }
        { text = '\be/\bg = Raise/Lower' }
        { text = '\bf/\bh = Zoom' }
    ]
}
cag_helper_text_no_back_xbox = {
    helper_text_elements = [
        { text = '\b8 = Quit' }
        { text = '\m0 = Place' }
        { text = '\be/\bf = Lower/Raise' }
        { text = '\bg/\bh = Zoom' }
    ]
}
cag_helper_text_no_back_ngc = {
    helper_text_elements = [
        { text = '\b8 = Quit' }
        { text = '\m0 = Place' }
        { text = '\be/\bf=Raise/Lower' }
        { text = '\b9+\be/\bf=Zoom' }
    ]
}
rail_editor_free_roam_helper_text = {
    helper_text_elements = [
        { text = '\m1 = Delete' }
        { text = '\m0 = Place' }
        { text = '\b1 = Snap' }
        { text = '\b2 = Grab' }
        { text = '\be/\bg = Raise/Lower' }
        { text = '\bf/\bh = Zoom' }
    ]
}
rail_editor_layout_helper_text = {
    helper_text_elements = [
        { text = '\m1 = End' }
        { text = '\m0 = Place' }
        { text = '\b1 = Snap' }
        { text = '\be/\bg = Raise/Lower' }
        { text = '\bf/\bh = Zoom' }
    ]
}
rail_editor_grab_helper_text = {
    helper_text_elements = [
        { text = '\m1 = Undo' }
        { text = '\m0 = Place' }
        { text = '\b1 = Snap' }
        { text = '\be/\bg = Raise/Lower' }
        { text = '\bf/\bh = Zoom' }
    ]
}
rail_editor_free_roam_helper_text_xbox = {
    helper_text_elements = [
        { text = '\b0 = Delete' }
        { text = '\m0 = Place' }
        { text = '\b1 = Snap' }
        { text = '\b2 = Grab' }
        { text = '\be/\bf = Lower/Raise' }
        { text = '\bg/\bh = Zoom' }
    ]
}
rail_editor_layout_helper_text_xbox = {
    helper_text_elements = [
        { text = '\b0 = End' }
        { text = '\m0 = Place' }
        { text = '\b1 = Snap' }
        { text = '\be/\bf = Lower/Raise' }
        { text = '\bg/\bh = Zoom' }
    ]
}
rail_editor_grab_helper_text_xbox = {
    helper_text_elements = [
        { text = '\b0 = Undo' }
        { text = '\m0 = Place' }
        { text = '\b1 = Snap' }
        { text = '\be/\bf = Lower/Raise' }
        { text = '\bg/\bh = Zoom' }
    ]
}
rail_editor_free_roam_helper_text_xenon = {
    helper_text_elements = [
        { text = '\b0 = Delete' }
        { text = '\m0 = Place' }
        { text = '\b1 = Snap' }
        { text = '\b2 = Grab' }
        { text = '\be/\bg = Raise/Lower' }
        { text = '\bf/\bh = Zoom' }
    ]
}
rail_editor_layout_helper_text_xenon = {
    helper_text_elements = [
        { text = '\b0 = End' }
        { text = '\m0 = Place' }
        { text = '\b1 = Snap' }
        { text = '\be/\bg = Raise/Lower' }
        { text = '\bf/\bh = Zoom' }
    ]
}
rail_editor_grab_helper_text_xenon = {
    helper_text_elements = [
        { text = '\b0 = Undo' }
        { text = '\m0 = Place' }
        { text = '\b1 = Snap' }
        { text = '\be/\bg = Raise/Lower' }
        { text = '\bf/\bh = Zoom' }
    ]
}
rail_editor_free_roam_helper_text_ngc = {
    helper_text_elements = [
        { text = '\b1=Delete' }
        { text = '\m0=Place' }
        { text = '\b0=Snap' }
        { text = '\b2= Grab' }
        { text = '\be/\bf=Raise/Lower' }
        { text = '\b9+\be/\bf=Zoom' }
    ]
}
rail_editor_layout_helper_text_ngc = {
    helper_text_elements = [
        { text = '\b1=End' }
        { text = '\m0=Place' }
        { text = '\b0=Snap' }
        { text = '\be/\bf=Raise/Lower' }
        { text = '\b9+\be/\bf=Zoom' }
    ]
}
rail_editor_grab_helper_text_ngc = {
    helper_text_elements = [
        { text = '\b1=Undo' }
        { text = '\m0=Place' }
        { text = '\b0=Snap' }
        { text = '\be/\bf=Raise/Lower' }
        { text = '\b9+\be/\bf=Zoom' }
    ]
}
park_editor_helper_text = {
    helper_text_elements = [
        { text = '\m1 = Del.' }
        { text = '\m0 = Ok' }
        { text = '\b1/\b2 = Rotate' }
        { text = '\be/\bg = Raise/Lower' }
        { text = '\bf/\bh = Zoom' }
    ]
}
park_editor_helper_text_xbox = {
    helper_text_elements = [
        { text = '\b0 = Del.' }
        { text = '\m0 = Ok' }
        { text = '\b1/\b2 = Rotate' }
        { text = '\be/\bf = Lower/Raise' }
        { text = '\bg/\bh = Zoom' }
    ]
}
park_editor_helper_text_xenon = {
    helper_text_elements = [
        { text = '\b0 = Del.' }
        { text = '\m0 = Ok' }
        { text = '\b1/\b2 = Rotate' }
        { text = '\be/\bg = Raise/Lower' }
        { text = '\bf/\bh = Zoom' }
    ]
}
park_editor_helper_text_ngc = {
    helper_text_elements = [
        { text = '\b1=Del.' }
        { text = '\m0=Ok' }
        { text = '\b0/\b2=Rotate' }
        { text = '\be/\bf=Raise/Lower' }
        { text = '\b9+\be/\bf=Zoom' }
    ]
}
gap_regular_helper_text = {
    helper_text_elements = [
        { text = '\m1 = Delete' }
        { text = '\m0 = Accept' }
    ]
}
gap_regular_helper_text_xbox = {
    helper_text_elements = [
        { text = '\b0 = Delete' }
        { text = '\m0 = Accept' }
    ]
}
gap_regular_helper_text_ngc = {
    helper_text_elements = [
        { text = '\b1 = Delete' }
        { text = '\m0 = Accept' }
    ]
}
gap_adjust_helper_text = {
    helper_text_elements = [
        { text = '\m1=Delete \b1/\b2=Rotate \be/\bg=Adjust Left \bf/\bh=Adjust Right' }
    ]
}
gap_adjust_helper_text_xbox = {
    helper_text_elements = [
        { text = '\b0 = Delete' }
        { text = '\b1/\b2 = Rotate' }
        { text = '\be/\bf/\bg/\bh = Adjust' }
    ]
}
gap_adjust_helper_text_xenon = {
    helper_text_elements = [
        { text = '\b0 = Delete' }
        { text = '\b1/\b2 = Rotate' }
        { text = '\be/\bg/\bf/\bh = Adjust' }
    ]
}
gap_adjust_helper_text_ngc = {
    helper_text_elements = [
        { text = '\b1 = Delete' }
        { text = '\b0/\b2 = Rotate' }
        { text = '\be/\bf + \b7/\b4  = Adjust' }
    ]
}
resize_park_helper_text_lr = {
    helper_text_elements = [
        { text = '\b6/\b5 = Adjust' }
        { text = '\m0 = Side' }
        { text = '\b2 = Expand' }
        { text = '\b1 = Contract' }
        { text = '\m1 = Back' }
    ]
}
resize_park_helper_text_ud = {
    helper_text_elements = [
        { text = '\b7/\b4 = Adjust' }
        { text = '\m0 = Side' }
        { text = '\b2 = Expand' }
        { text = '\b1 = Contract' }
        { text = '\m1 = Back' }
    ]
}
resize_park_helper_text_lr_xbox = {
    helper_text_elements = [
        { text = '\b6/\b5 = Adjust' }
        { text = '\m0 = Side' }
        { text = '\b0 = Expand' }
        { text = '\b1 = Contract' }
        { text = '\m1 = Back' }
    ]
}
resize_park_helper_text_ud_xbox = {
    helper_text_elements = [
        { text = '\b7/\b4 = Adjust' }
        { text = '\m0 = Side' }
        { text = '\b0 = Expand' }
        { text = '\b1 = Contract' }
        { text = '\m1 = Back' }
    ]
}
resize_park_helper_text_lr_xenon = {
    helper_text_elements = [
        { text = '\b6/\b5 = Adjust' }
        { text = '\m0 = Side' }
        { text = '\b0 = Expand' }
        { text = '\b1 = Contract' }
        { text = '\m1 = Back' }
    ]
}
resize_park_helper_text_ud_xenon = {
    helper_text_elements = [
        { text = '\b7/\b4 = Adjust' }
        { text = '\m0 = Side' }
        { text = '\b0 = Expand' }
        { text = '\b1 = Contract' }
        { text = '\m1 = Back' }
    ]
}
resize_park_helper_text_lr_ngc = {
    helper_text_elements = [
        { text = '\b6/\b5 = Adjust' }
        { text = '\m0 = Side' }
        { text = '\b2 = Expand' }
        { text = '\b0 = Contract' }
        { text = '\m1 = Back' }
    ]
}
resize_park_helper_text_ud_ngc = {
    helper_text_elements = [
        { text = '\b7/\b4 = Adjust' }
        { text = '\m0 = Side' }
        { text = '\b2 = Expand' }
        { text = '\b0 = Contract' }
        { text = '\m1 = Back' }
    ]
}
generic_dialog_helper_text = {
    helper_text_elements = [
        { text = '\m0 = Accept' }
    ]
}
generic_dialog_helper_text2 = {
    helper_text_elements = [
        { text = '\b7/\b4 = Select' }
        { text = '\m0 = Accept' }
    ]
}
generic_dialog_helper_text3 = {
    helper_text_elements = [
        { text = '\m1 = Back' }
        { text = '\m0 = Accept' }
    ]
}
generic_helper_text_toggle = {
    helper_text_elements = [
        { text = '\b7/\b4 = Select' }
        { text = '\m1 = Back' }
        { text = '\m0 = Toggle' }
    ]
}
eye_toy_helper_text = {
    helper_text_elements = [
        { text = '\m9 = Toggle Low Light' }
        { text = '\m0 = Capture' }
        { text = '\m1 = Back' }
    ]
}
