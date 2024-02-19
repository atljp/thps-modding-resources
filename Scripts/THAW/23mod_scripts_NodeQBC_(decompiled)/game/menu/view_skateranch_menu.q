view_skateranch_array = [
    { checksum = NODEFLAG_Z_SR_HO_DINO name = 'G³owa dinozaura' }
    { checksum = NODEFLAG_Z_SR_HO_FAME name = 'Walk of Fame' }
    { checksum = NODEFLAG_Z_SR_HO_ROPES name = 'Fimowe liny' }
    { checksum = NODEFLAG_Z_SR_HO_CAPTOP name = 'Ig³a gramofonowa' }
    { checksum = NODEFLAG_Z_SR_HO_TOWER name = 'El Teniente' }
    { checksum = NODEFLAG_Z_SR_HO_WASTE name = 'Znak Hollywood' }
    { checksum = NODEFLAG_Z_LV_HO_LIFT name = 'Winda no¿ycowa' }
    { checksum = NODEFLAG_Z_SR_BH_STAR name = '69Ball and Star' }
    { checksum = NODEFLAG_Z_SR_BH_ARCH name = '£uk sklepu z torb.' }
    { checksum = NODEFLAG_Z_SR_BH_GATE name = 'Wrota muzeum' }
    { checksum = NODEFLAG_Z_SR_BH_RUBBLE name = 'Bud. gruzowiska' }
    { checksum = NODEFLAG_Z_SR_BH_DOME name = 'Zielona kopu³a' }
    { checksum = NODEFLAG_Z_OR_BH_FOUNTAIN name = 'Fontanna' }
    { checksum = NODEFLAG_Z_SR_DT_FREEWAY name = 'Znak autostrady' }
    { checksum = NODEFLAG_Z_SR_DT_BELL name = 'Meksyk. dzwon' }
    { checksum = NODEFLAG_Z_SR_DT_PYR name = 'Szklana piramida' }
    { checksum = NODEFLAG_Z_SR_DT_STREET name = 'Kawa³ek ulicy' }
    { checksum = NODEFLAG_Z_SR_DT_SCAF name = 'Wyjcie po¿arowe' }
    { checksum = NODEFLAG_Z_SR_DT_TOWER name = 'Chiñska wie¿a' }
    { checksum = NODEFLAG_Z_SR_BH_SM_STAIRS name = 'Schody' }
    { checksum = NODEFLAG_Z_SR_SM_SCOPE name = 'Teleskop' }
    { checksum = NODEFLAG_Z_SR_SM_COURT name = 'Court Roof' }
    { checksum = NODEFLAG_Z_SR_SM_FERRIS name = 'A-Frame' }
    { checksum = NODEFLAG_Z_SR_SM_PACPARK name = 'Nadbrze¿na Markiza' }
    { checksum = NODEFLAG_Z_OR_SM_MONSTER name = 'G³owa rekina' }
    { checksum = NODEFLAG_Z_OR_FLOOR name = 'P³yta pod³ogowa' }
    { checksum = NODEFLAG_Z_OR_BALLS name = 'Zbiorniki' }
    { checksum = NODEFLAG_Z_OR_DERRICK name = 'Wie¿a wiert.' }
    { checksum = NODEFLAG_Z_OR_PIPE name = 'Chemiczna rura' }
    { checksum = NODEFLAG_Z_LV_OR_SIDEWALL name = 'cia. wie¿y wiert.' }
    { checksum = NODEFLAG_Z_SR_EL_OR_CONTROL name = 'Kontrolka' }
    { checksum = NODEFLAG_Z_SR_EL_LIMO name = 'Limousine' }
    { checksum = NODEFLAG_Z_SR_EL_COUCH name = 'Kanapa' }
    { checksum = NODEFLAG_Z_SR_EL_CARPARTS name = 'Czeci samochodu' }
    { checksum = NODEFLAG_Z_SR_EL_SHACK name = 'Hopka w Sk-parku' }
    { checksum = NODEFLAG_Z_SR_EL_SIGN name = 'Znak poprzecz.' }
    { checksum = NODEFLAG_Z_SR_EL_MATTRESS name = 'Materac' }
    { checksum = NODEFLAG_Z_LV_VATOR name = 'Casino Elevator' }
    { checksum = NODEFLAG_Z_LV_CROWN name = 'Dekoracja barowa' }
    { checksum = NODEFLAG_Z_LV_SPOT name = 'Reflektor' }
    { checksum = NODEFLAG_Z_LV_WHEEL name = 'Ko³o ruletki' }
    { checksum = NODEFLAG_Z_LV_ESCALATOR name = 'Escalators' }
    { checksum = NODEFLAG_Z_SR_DT_LV_SLOT name = '777 slotów' }
]

script create_view_skateranch_menu 
    printf 'Create View Skateranch Menu'
    if ScreenElementExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    make_new_roundbar_menu {
        menu_id = view_skateranch_menu
        vmenu_id = view_skateranch_vmenu
        pad_back_script = generic_menu_pad_back
        pad_back_params = { callback = create_your_options_menu }
        scrolling
        just = [ center center ]
        dims = (150.0, 260.0)
        Pos = (240.0, 100.0)
        additional_create_script = view_skateranch_additional_create
        helper_text = generic_helper_text_no_accept
        no_animate
    }
    Theme_GetMenuTitleColor return_value = title_color
    CreateScreenElement {
        type = TextElement
        parent = view_skateranch_menu
        id = view_skateranch_title
        font = testtitle
        text = 'PRZEJRZYJ ORODEK'
        Pos = (400.0, 20.0)
        Scale = 2
        rot_angle = 2
        rgba = <title_color>
        just = [ center top ]
        z_priority = 10
    }
    theme_background width = 3.400 Pos = (330.0, 80.0) num_parts = 9 parent = view_skateranch_menu id = atom_bg bg_rgba = [ 30 30 35 90 ] rot = 0
    GetArraySize view_skateranch_array
    <i> = 0
    begin 
    add_view_skateranch_item (view_skateranch_array [ <i> ])
    <i> = (<i> + 1)
    repeat <array_size>
    FireEvent type = focus target = view_skateranch_menu
endscript

script add_view_skateranch_item 
    if GetNodeFlag <checksum>
        add_roundbar_menu_item {
            text = <name>
            pad_choose_script = NullScript
            rot = 0 show_bar = 0
            checked
        }
    else
        add_roundbar_menu_item {
            text = <name>
            pad_choose_script = NullScript
            rot = 0 show_bar = 0
            rgba = [ 70 70 70 120 ]
            focus_script = view_skateranch_disabled_focus
            unfocus_script = view_skateranch_disabled_unfocus
        }
    endif
endscript

script draw_skateranch_dialog 
    create_snazzy_dialog_box {
        Title = <name>
        text = <desc>
        text_dims = (400.0, 0.0)
        pad_back_script = back_to_view_skateranch
        no_bg
        buttons = [
            {text = 'Ok' pad_choose_script = back_to_view_skateranch}
        ]
    }
endscript

script back_to_view_skateranch 
    dialog_box_exit
    create_view_skateranch_menu
endscript

script view_skateranch_disabled_focus 
    SetScreenElementProps {
        id = {<id> child = text}
        rgba = [ 123 4 93 58 ]
    }
    DoScreenElementMorph id = {<id> child = text}time = 0.05000 Scale = (1.149999976158142, 1.25)
endscript

script view_skateranch_disabled_unfocus 
    SetScreenElementProps {
        id = {<id> child = text}
        rgba = [ 70 70 70 120 ]
    }
    DoScreenElementMorph id = {<id> child = text}time = 0.05000 Scale = 1.0
endscript

script view_skateranch_additional_create 
    Theme_GetHighlightedTextColor return_value = on_rgba
    Theme_GetUnhighlightedTextColor return_value = off_rgba
    if GotParam checked
        CreateScreenElement {
            type = SpriteElement
            parent = <id>
            texture = checkmark
            Pos = (<Pos> + (200.0, 10.0))
            just = [ left center ]
            rgba = <on_rgba>
            z_priority = 5
        }
        CreateScreenElement {
            type = SpriteElement
            parent = <id>
            texture = checkbox
            Pos = (<Pos> + (0.0, 20.0))
            just = [ left center ]
            Scale = 0.5000
            rgba = <off_rgba>
            z_priority = 4
        }
    else
        CreateScreenElement {
            type = SpriteElement
            parent = <id>
            texture = checkbox
            Pos = (<Pos> + (200.0, 15.0))
            alpha = 0.5000
            just = [ left center ]
            Scale = 0.5000
            rgba = <off_rgba>
            z_priority = 4
        }
    endif
endscript
