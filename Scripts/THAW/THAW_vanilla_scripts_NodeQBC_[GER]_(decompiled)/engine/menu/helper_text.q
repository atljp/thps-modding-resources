
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
        { text = '\b7/\b4 = Wählen' }
        { text = '\m1 = Zurück' }
        { text = '\m0 = OK' }
    ]
}
generic_helper_text_no_back = {
    helper_text_elements = [
        { text = '\b7/\b4 = Wählen' }
        { text = '\m0 = OK' }
    ]
}
generic_helper_text_no_accept = {
    helper_text_elements = [
        { text = '\b7/\b4 = Wählen' }
        { text = '\m1 = Zurück' }
    ]
}
generic_helper_text_cas = {
    helper_text_elements = [
        { text = '\b7/\b4 = Wählen' }
        { text = '\m1 = Zurück' }
        { text = '\m0 = OK' }
        { text = '\be/\bf = Drehen' }
    ]
}
generic_helper_text_cas_no_back = {
    helper_text_elements = [
        { text = '\b7/\b4 = Wählen' }
        { text = '\m0 = OK' }
        { text = '\be/\bf = Drehen' }
    ]
}
generic_helper_text_cas_z = {
    helper_text_elements = [
        { text = '\b7/\b4 = Wählen' }
        { text = '\m1 = Zurück' }
        { text = '\m0 = OK' }
        { text = '\be/\bf = Drehen' }
        { text = '\mj = Zoom' }
    ]
}
generic_helper_text_left_right = {
    helper_text_elements = [
        { text = '\b6/\b5 = Wählen' }
        { text = '\m1 = Zurück' }
        { text = '\m0 = OK' }
    ]
}
generic_helper_text_up_down_left_right = {
    helper_text_elements = [
        { text = '\b7/\b4/\b6/\b5 = Wählen' }
        { text = '\m1 = Zurück' }
        { text = '\m0 = OK' }
    ]
}
generic_helper_text_up_down_adjust = {
    helper_text_elements = [
        { text = '\b7/\b4 = Wählen' }
        { text = '\b6/\b5 = Anpassen' }
        { text = '\m1 = Zurück' }
        { text = '\m0 = OK' }
    ]
}
generic_helper_text_left_right_l_r = {
    helper_text_elements = [
        { text = '\b6/\b5 = Wählen' }
        { text = '\m1 = Zurück' }
        { text = '\m0 = OK' }
        { text = '\be/\bf = Drehen' }
    ]
}
generic_helper_text_left_right_up_down = {
    helper_text_elements = [
        { text = '\b7/\b4 = Wählen' }
        { text = '\b6/\b5=Position' }
        { text = '\m1 = Zurück' }
        { text = '\m0 = OK' }
    ]
}
generic_helper_text_color_menu = {
    helper_text_elements = [
        { text = '\b7/\b4=Wahl' }
        { text = '\b6/\b5=Position' }
        { text = '\m1=Zurück' }
        { text = '\m0=OK' }
        { text = '\be/\bf=Drehen' }
    ]
}
generic_helper_text_color_menu_z = {
    helper_text_elements = [
        { text = '\b7/\b4=Wahl' }
        { text = '\b6/\b5=Position' }
        { text = '\m1=Zurück' }
        { text = '\m0=OK' }
        { text = '\be/\bf=Drehen' }
        { text = '\mj=Zoomen' }
    ]
}
generic_helper_text_color_menu_reset = {
    helper_text_elements = [
        { text = '\m1=Zurück' }
        { text = '\be/\bf=Drehen' }
        { text = '\mn=Zurücksetzen' }
        { text = '\mj=Zoomen' }
    ]
}
generic_helper_text_color_menu_reset_ngc = {
    helper_text_elements = [
        { text = '\m1=Zurück' }
        { text = '\be/\bf=Drehen' }
        { text = '\be+\bf=Zurücksetzen' }
        { text = '\mj=Zoomen' }
    ]
}
cag_helper_text = {
    helper_text_elements = [
        { text = '\b8=Ende' }
        { text = '\m1=Zurück' }
        { text = '\m0=Platzieren' }
        { text = '\be/\bg=Heben/Senken' }
        { text = '\bf/\bh=Zoomen' }
    ]
}
cag_helper_text_xbox = {
    helper_text_elements = [
        { text = '\b8=Ende' }
        { text = '\b0=Zurück' }
        { text = '\m0=Platzieren' }
        { text = '\be/\bf=Senken/Heben' }
        { text = '\bg/\bh=Zoom' }
    ]
}
cag_helper_text_ngc = {
    helper_text_elements = [
        { text = '\b8=Ende' }
        { text = '\b0=Zurück' }
        { text = '\m0=Platzieren' }
        { text = '\be/\bf=Heben/Senken' }
        { text = '\b9+\be/\bf=Zoomen' }
    ]
}
cag_helper_text_no_back = {
    helper_text_elements = [
        { text = '\b8=Ende' }
        { text = '\m0 = Platzieren' }
        { text = '\be/\bg=Heben/Senken' }
        { text = '\bf/\bh = Zoomen' }
    ]
}
cag_helper_text_no_back_xbox = {
    helper_text_elements = [
        { text = '\b8=Ende' }
        { text = '\m0 = Platzieren' }
        { text = '\be/\bf=Senken/Heben' }
        { text = '\bg/\bh = Zoomen' }
    ]
}
cag_helper_text_no_back_ngc = {
    helper_text_elements = [
        { text = '\b8=Ende' }
        { text = '\m0 = Platzieren' }
        { text = '\be/\bf=Heben/Senken' }
        { text = '\b9+\be/\bf=Zoomen' }
    ]
}
rail_editor_free_roam_helper_text = {
    helper_text_elements = [
        { text = '\m1=Löschen' }
        { text = '\m0 = Platzieren' }
        { text = '\b1=Einschnappen' }
        { text = '\b2 = Grab' }
        { text = '\be/\bg=Heben/Senken' }
        { text = '\bf/\bh = Zoomen' }
    ]
}
rail_editor_layout_helper_text = {
    helper_text_elements = [
        { text = '\m1 = Ende' }
        { text = '\m0 = Platzieren' }
        { text = '\b1=Einschnappen' }
        { text = '\be/\bg=Heben/Senken' }
        { text = '\bf/\bh = Zoomen' }
    ]
}
rail_editor_grab_helper_text = {
    helper_text_elements = [
        { text = '\m1 = Rückgängig' }
        { text = '\m0 = Platzieren' }
        { text = '\b1=Einschnappen' }
        { text = '\be/\bg=Heben/Senken' }
        { text = '\bf/\bh = Zoomen' }
    ]
}
rail_editor_free_roam_helper_text_xbox = {
    helper_text_elements = [
        { text = '\b0=Löschen' }
        { text = '\m0 = Platzieren' }
        { text = '\b1=Einschnappen' }
        { text = '\b2 = Grab' }
        { text = '\be/\bf=Senken/Heben' }
        { text = '\bg/\bh = Zoomen' }
    ]
}
rail_editor_layout_helper_text_xbox = {
    helper_text_elements = [
        { text = '\b0 = Ende' }
        { text = '\m0 = Platzieren' }
        { text = '\b1=Einschnappen' }
        { text = '\be/\bf=Senken/Heben' }
        { text = '\bg/\bh = Zoomen' }
    ]
}
rail_editor_grab_helper_text_xbox = {
    helper_text_elements = [
        { text = '\b0 = Rückgängig' }
        { text = '\m0 = Platzieren' }
        { text = '\b1=Einschnappen' }
        { text = '\be/\bf=Senken/Heben' }
        { text = '\bg/\bh = Zoomen' }
    ]
}
rail_editor_free_roam_helper_text_xenon = {
    helper_text_elements = [
        { text = '\b0=Löschen' }
        { text = '\m0 = Platzieren' }
        { text = '\b1=Einschnappen' }
        { text = '\b2 = Grab' }
        { text = '\be/\bg=Heben/Senken' }
        { text = '\bf/\bh = Zoomen' }
    ]
}
rail_editor_layout_helper_text_xenon = {
    helper_text_elements = [
        { text = '\b0 = Ende' }
        { text = '\m0 = Platzieren' }
        { text = '\b1=Einschnappen' }
        { text = '\be/\bg=Heben/Senken' }
        { text = '\bf/\bh = Zoomen' }
    ]
}
rail_editor_grab_helper_text_xenon = {
    helper_text_elements = [
        { text = '\b0 = Rückgängig' }
        { text = '\m0 = Platzieren' }
        { text = '\b1=Einschnappen' }
        { text = '\be/\bg=Heben/Senken' }
        { text = '\bf/\bh = Zoomen' }
    ]
}
rail_editor_free_roam_helper_text_ngc = {
    helper_text_elements = [
        { text = '\b1=Löschen' }
        { text = '\m0=Platzieren' }
        { text = '\b0=Verbinden' }
        { text = '\b2= Nehmen' }
        { text = '\be/\bf=Heben/Senken' }
        { text = '\b9+\be/\bf=Zoomen' }
    ]
}
rail_editor_layout_helper_text_ngc = {
    helper_text_elements = [
        { text = '\b1=Ende' }
        { text = '\m0=Platzieren' }
        { text = '\b0=Verbinden' }
        { text = '\be/\bf=Heben/Senken' }
        { text = '\b9+\be/\bf=Zoomen' }
    ]
}
rail_editor_grab_helper_text_ngc = {
    helper_text_elements = [
        { text = '\b1=Rückgängig' }
        { text = '\m0=Platzieren' }
        { text = '\b0=Verbinden' }
        { text = '\be/\bf=Heben/Senken' }
        { text = '\b9+\be/\bf=Zoomen' }
    ]
}
park_editor_helper_text = {
    helper_text_elements = [
        { text = '\m1 = Entf.' }
        { text = '\m0 = OK' }
        { text = '\b1/\b2 = Drehen' }
        { text = '\be/\bg=Heben/Senken' }
        { text = '\bf/\bh = Zoomen' }
    ]
}
park_editor_helper_text_xbox = {
    helper_text_elements = [
        { text = '\b0 = Entf.' }
        { text = '\m0 = OK' }
        { text = '\b1/\b2 = Drehen' }
        { text = '\be/\bf=Senken/Heben' }
        { text = '\bg/\bh = Zoomen' }
    ]
}
park_editor_helper_text_xenon = {
    helper_text_elements = [
        { text = '\b0 = Entf.' }
        { text = '\m0 = OK' }
        { text = '\b1/\b2 = Drehen' }
        { text = '\be/\bg=Heben/Senken' }
        { text = '\bf/\bh = Zoomen' }
    ]
}
park_editor_helper_text_ngc = {
    helper_text_elements = [
        { text = '\b1=Entf.' }
        { text = '\m0=OK' }
        { text = '\b0/\b2=Drehen' }
        { text = '\be/\bf=Heben/Senken' }
        { text = '\b9+\be/\bf=Zoomen' }
    ]
}
gap_regular_helper_text = {
    helper_text_elements = [
        { text = '\m1=Löschen' }
        { text = '\m0 = OK' }
    ]
}
gap_regular_helper_text_xbox = {
    helper_text_elements = [
        { text = '\b0=Löschen' }
        { text = '\m0 = OK' }
    ]
}
gap_regular_helper_text_ngc = {
    helper_text_elements = [
        { text = '\b1=Löschen' }
        { text = '\m0 = OK' }
    ]
}
gap_adjust_helper_text = {
    helper_text_elements = [
        { text = '\m1=Löschen \b1/\b2=Drehen \be/\bg=Links anpassen \bf/\bh=Rechts anpassen' }
    ]
}
gap_adjust_helper_text_xbox = {
    helper_text_elements = [
        { text = '\b0=Löschen' }
        { text = '\b1/\b2 = Drehen' }
        { text = '\be/\bf/\bg/\bh = Anpassen' }
    ]
}
gap_adjust_helper_text_xenon = {
    helper_text_elements = [
        { text = '\b0=Löschen' }
        { text = '\b1/\b2 = Drehen' }
        { text = '\be/\bg/\bf/\bh = Anpassen' }
    ]
}
gap_adjust_helper_text_ngc = {
    helper_text_elements = [
        { text = '\b1=Löschen' }
        { text = '\b0/\b2 = Drehen' }
        { text = '\be/\bf + \b7/\b4  = Anpassen' }
    ]
}
resize_park_helper_text_lr = {
    helper_text_elements = [
        { text = '\b6/\b5 = Anpassen' }
        { text = '\m0 = Seite' }
        { text = '\b2 = Größer' }
        { text = '\b1 = Kleiner' }
        { text = '\m1 = Zurück' }
    ]
}
resize_park_helper_text_ud = {
    helper_text_elements = [
        { text = '\b7/\b4 = Anpassen' }
        { text = '\m0 = Seite' }
        { text = '\b2 = Größer' }
        { text = '\b1 = Kleiner' }
        { text = '\m1 = Zurück' }
    ]
}
resize_park_helper_text_lr_xbox = {
    helper_text_elements = [
        { text = '\b6/\b5 = Anpassen' }
        { text = '\m0 = Seite' }
        { text = '\b0 = Größer' }
        { text = '\b1 = Kleiner' }
        { text = '\m1 = Zurück' }
    ]
}
resize_park_helper_text_ud_xbox = {
    helper_text_elements = [
        { text = '\b7/\b4 = Anpassen' }
        { text = '\m0 = Seite' }
        { text = '\b0 = Größer' }
        { text = '\b1 = Kleiner' }
        { text = '\m1 = Zurück' }
    ]
}
resize_park_helper_text_lr_xenon = {
    helper_text_elements = [
        { text = '\b6/\b5 = Anpassen' }
        { text = '\m0 = Seite' }
        { text = '\b0 = Größer' }
        { text = '\b1 = Kleiner' }
        { text = '\m1 = Zurück' }
    ]
}
resize_park_helper_text_ud_xenon = {
    helper_text_elements = [
        { text = '\b7/\b4 = Anpassen' }
        { text = '\m0 = Seite' }
        { text = '\b0 = Größer' }
        { text = '\b1 = Kleiner' }
        { text = '\m1 = Zurück' }
    ]
}
resize_park_helper_text_lr_ngc = {
    helper_text_elements = [
        { text = '\b6/\b5 = Anpassen' }
        { text = '\m0 = Seite' }
        { text = '\b2 = Größer' }
        { text = '\b0 = Kleiner' }
        { text = '\m1 = Zurück' }
    ]
}
resize_park_helper_text_ud_ngc = {
    helper_text_elements = [
        { text = '\b7/\b4 = Anpassen' }
        { text = '\m0 = Seite' }
        { text = '\b2 = Größer' }
        { text = '\b0 = Kleiner' }
        { text = '\m1 = Zurück' }
    ]
}
generic_dialog_helper_text = {
    helper_text_elements = [
        { text = '\m0 = OK' }
    ]
}
generic_dialog_helper_text2 = {
    helper_text_elements = [
        { text = '\b7/\b4 = Wählen' }
        { text = '\m0 = OK' }
    ]
}
generic_dialog_helper_text3 = {
    helper_text_elements = [
        { text = '\m1 = Zurück' }
        { text = '\m0 = OK' }
    ]
}
generic_helper_text_toggle = {
    helper_text_elements = [
        { text = '\b7/\b4 = Wählen' }
        { text = '\m1 = Zurück' }
        { text = '\m0 = Ein/Aus' }
    ]
}
eye_toy_helper_text = {
    helper_text_elements = [
        { text = '\m9 = Toggle Low Light' }
        { text = '\m0 = Foto' }
        { text = '\m1 = Zurück' }
    ]
}
