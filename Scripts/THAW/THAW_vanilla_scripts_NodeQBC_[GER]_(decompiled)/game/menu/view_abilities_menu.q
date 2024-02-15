view_abilities_array = [
    { checksum = caveman name = 'Caveman' text = 'Spring beim Rennen und drück \mm.' }
    { checksum = extragrind name = 'Grind' text = 'Dück \b0 nah bei einer Rail. Drück beim grinden \b2 \b0 um einen One Footer zu machen.' }
    { checksum = doubletapflip name = 'Flip Tricks' text = 'Drück \b1 und bewege dich in irgendeine Richtung, während du in der Luft bist. Drücke \b1 \b1 für einen doppelten Flip und \b1 \b1 \b1 für einen dreifachen.' }
    { checksum = doubletapgrab name = 'Grab Tricks' text = 'Drück \b2 und bewege dich in irgendeine Richtung während du in der Luft bist.' }
    { checksum = lip name = 'Lip-Tricks' text = 'Drück \b7 + \b0 am ende der Quater Pipe. Mach eine Kombi aus \b0, \b1 und \b2 um einen Lip zu modifizieren. ' }
    { checksum = lip name = 'To-Tail' text = 'Drück \b4 + \b0 während du aus einem Vert Air kommst um Abdeckung zu smacken.' }
    { checksum = Manual name = 'Manual' text = 'Drück beim Skaten \b7 + \b4 um einen Manual zu machen oder \b4 + \b7 und du machst einen Nose Manual.' }
    { checksum = boardsmack name = 'Board Whack' text = 'Drück \b2 beim Gehen.' }
    { checksum = boardthrow name = 'Board Throw' text = 'Drück beim Gehen \b1 um dein Board fallen zu lassen, wenn du \b1 gedrückt hälst wirfst du es weg.' }
    { checksum = lip name = 'Finger Flip' text = 'Drück \mk \mk während du gehst.' }
    { checksum = revert name = 'Revert' text = 'Drück \mk, während du eine Quarterpipe nach unten fährst.' }
    { checksum = Nollie name = 'Nollie Pressure' text = 'Drück \mp für einen Toggle Nollie und  für einen Pressure Stance.' }
    { checksum = NoComply name = 'No Comply' text = 'Drück \b7 + \b3 beim Skaten.' }
    { checksum = tag name = 'Graffiti Tag' text = 'Halte \b0 gedrückt, wenn du still stehst.' }
    { checksum = Natas name = 'Natas Spin' text = 'Drück \be + \b0, wenn du auf etwas landest, wo du einen Spin machen kannst. Mach eine Kombi aus \b0, \b1 und \b2 um einen Natas zu modifizieren.' }
    { checksum = wallplant name = 'Sticker Slap' text = 'Wenn du auf eine Mauer zu fährst, drück \b3.' }
    { checksum = wallplant name = 'Wall Plant' text = 'Drück \b4 + \b3, wenn du auf eine Wand zu fährst.' }
    { checksum = wallplant name = 'Vert Wall Plant' text = 'Drück \b7 + \b3 während eines Vert Airs um in einen Vert Wall über zu gehen.' }
    { checksum = wallride name = 'Wall Ride' text = 'Drück \b0, wenn du an einer Wand in der Luft bist.' }
    { checksum = spine name = 'Spine Transfer' text = 'Wenn du in der Luft bist, drück \ml und zurück in Rücken an Rücken stehenden Quater Pipes.' }
    { checksum = flipandroll name = 'Flips' text = 'Halte in der Luft \b2 und drück \b7 \b7 für einen Front Flip oder \b4 \b4 für einen Back Flip.' }
    { checksum = flipandroll name = 'Rolls' text = 'Halte \b2 und drück dann \b5 \b5, während du einen Airborne machst.' }
    { checksum = spine name = 'Acid Drop' text = 'Drücke \ml während du über einer Quater Pipe bist.' }
    { checksum = spine name = 'Bank Drop' text = 'Drück \ml über der gneigten Fläche.' }
    { checksum = wallrunup name = 'Wall Run' text = 'Halte \bf gedrückt, während du auf eine Wand zu rennst.' }
    { checksum = wallflip name = 'Wall Flip' text = 'Drück während eines Wall Runs (\bf) \b4 + \b3.' }
    { checksum = wallhang name = 'Shimmy' text = 'Drück \b6 oder \b5, wenn du von einem Vorsprung hängst und dann drück \bf.' }
    { checksum = walkingflip name = 'Back Tuck' text = 'Drück \b3 \b3 während du still stehst.' }
    { checksum = walkingflip name = 'Front Tuck' text = 'Drück \b3 \b3 während du rennst.' }
    { checksum = Boneless name = 'Boneless' text = 'Drück \b7 \b7 + \b3 beim Skaten.' }
    { checksum = highollie name = 'Boned Ollie' text = 'Drück beim Skaten \b3 + \b3.' }
    { checksum = bertslide name = 'Bert Slide' text = '\mt+ Links oder Rechts.\n540 Bert: \mu während du einen Bert Slide machst.' }
    { checksum = skitch name = 'Skitch' text = 'Drück \b7 hinter einem Wagen' }
    { checksum = stall name = 'Stall' text = 'Für einen Stall drück \m4 \b0.\nMach eine Kombi aus \b0, \b1 und \b2 um einen Stall zu modifizieren.' }
    { checksum = special name = 'Special' text = 'Mach Tricks, bis die Spezialanzeige gefüllt ist. Und mach dann deine Spezialtricks.' }
    { checksum = focus name = 'Focus' text = 'Drück \mq für den Fokus. Dadurch leert sich deine Spezialanzeige.' }
    { checksum = freestyle name = 'Flatland' text = 'Drück eine Kombi aus \b0, \b1 und \b2 während du einen Manual machst.' }
]

script create_view_abilities_menu 
    printf 'Create View Abilities Menu'
    if ScreenElementExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    make_new_roundbar_menu {
        menu_id = view_abilities_menu
        vmenu_id = view_abilities_vmenu
        pad_back_script = generic_menu_pad_back
        pad_back_params = { callback = create_your_options_menu }
        scrolling
        just = [ center center ]
        dims = (150.0, 260.0)
        Pos = (240.0, 100.0)
        additional_create_script = view_abilities_additional_create
        no_animate
    }
    Theme_GetMenuTitleColor return_value = title_color
    CreateScreenElement {
        type = TextElement
        parent = view_abilities_menu
        id = view_abilities_title
        font = testtitle
        text = 'FÄHIGKEITEN ANSEHEN'
        Pos = (400.0, 20.0)
        Scale = 2
        rot_angle = 2
        rgba = <title_color>
        just = [ center top ]
        z_priority = 10
    }
    theme_background width = 3.400 Pos = (330.0, 80.0) num_parts = 9 parent = view_abilities_menu id = atom_bg bg_rgba = [ 30 30 35 90 ] rot = 0
    GetArraySize view_abilities_array
    <i> = 0
    begin 
    add_view_abilities_item (view_abilities_array [ <i> ])
    <i> = (<i> + 1)
    repeat <array_size>
    FireEvent type = focus target = view_abilities_menu
endscript

script add_view_abilities_item 
    if skater ::AbilityEnabled <checksum>
        add_roundbar_menu_item {
            text = <name>
            pad_choose_script = draw_ability_dialog
            pad_choose_params = {name = <name> desc = <text>}
            rot = 0 show_bar = 0
            checked
        }
    else
        add_roundbar_menu_item {
            text = <name>
            pad_choose_script = NullScript
            rot = 0 show_bar = 0
            rgba = [ 70 70 70 120 ]
            focus_script = view_abilities_disabled_focus
            unfocus_script = view_abilities_disabled_unfocus
        }
    endif
endscript

script draw_ability_dialog 
    create_snazzy_dialog_box {
        Title = <name>
        text = <desc>
        text_dims = (400.0, 0.0)
        line_spacing = 1.500
        pad_back_script = back_to_view_abilities
        no_bg
        buttons = [
            {text = 'OK' pad_choose_script = back_to_view_abilities}
        ]
    }
endscript

script back_to_view_abilities 
    dialog_box_exit
    create_view_abilities_menu
endscript

script view_abilities_disabled_focus 
    SetScreenElementProps {
        id = {<id> child = text}
        rgba = [ 123 4 93 58 ]
    }
    DoScreenElementMorph id = {<id> child = text}time = 0.05000 Scale = (1.149999976158142, 1.25)
endscript

script view_abilities_disabled_unfocus 
    SetScreenElementProps {
        id = {<id> child = text}
        rgba = [ 70 70 70 120 ]
    }
    DoScreenElementMorph id = {<id> child = text}time = 0.05000 Scale = 1.0
endscript

script view_abilities_additional_create 
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
