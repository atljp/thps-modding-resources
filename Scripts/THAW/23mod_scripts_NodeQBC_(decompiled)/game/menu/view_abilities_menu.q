view_abilities_array = [
    { checksum = caveman name = 'Caveman' text = 'Biegn¹æ podskocz i wcinij \mm.' }
    { checksum = extragrind name = 'Grind' text = 'Wcinij \b0 w pobli¿u raila. Podczas grindu, wcinij \b2 \b0, a zrobisz one footera.' }
    { checksum = doubletapflip name = 'Flipy' text = 'Wcinij \b1 i kierunek bêd¹c w powietrzu. Wcinij \b1 \b1 by wykonaæ podwójny flip, albo \b1 \b1 \b1 by wykonaæ potrójny.' }
    { checksum = doubletapgrab name = 'Graby' text = 'Nacinij \b2 i kierunek bêd¹c w powietrzu.' }
    { checksum = lip name = 'Lip Triki' text = 'Wcinij \b7 + \b0 u szczytu rampy. Aby zmodyfikowaæ swojego lipa, wciskaj kombinacje \b0, \b1 i \b2.' }
    { checksum = lip name = 'To-Tail' text = 'Wcinij \b4 + \b0 koñcz¹c powietrzny vert aby uderzyæ koñcem deski w zwieñczenie.' }
    { checksum = Manual name = 'Manual' text = 'Podczas jazdy wcinij \b7 + \b4 aby wykonaæ manual, albo \b4 + \b7 by zrobiæ nose manual.' }
    { checksum = boardsmack name = 'Board Whack' text = 'Podczas chodzenia wcinij \b2.' }
    { checksum = boardthrow name = 'Board Throw' text = 'Id¹c pieszo, szybko wcinij \b1, by upuciæ deskê. Przytrzymaj \b1 by ni¹ rzuciæ.' }
    { checksum = lip name = 'Finger Flip' text = 'Podczas chodzenia wcinij \mk \mk.' }
    { checksum = revert name = 'Revert' text = 'Wcinij \mk, zje¿d¿aj¹c z rampy.' }
    { checksum = Nollie name = 'Nollie Pressure' text = 'Wcinij \mp, by prze³¹czyæ miêdzy pozycjami Nollie i Pressure.' }
    { checksum = NoComply name = 'No Comply' text = 'Wcinij \b7 + \b3 podczas jazdy.' }
    { checksum = tag name = 'Graffiti Tag' text = 'Przytrzymaj \b0 Stoj¹c nieruchomo.' }
    { checksum = Natas name = 'Natas Spin' text = 'L¹duj¹c na czym, na czym mo¿esz siê krêciæ, wcinij \be + \b0. Za pomoc¹ kombinacji \b0, \b1 i \b2 mo¿esz modyfikowaæ swojego Natas Spina.' }
    { checksum = wallplant name = 'Sticker Slap' text = 'Zbli¿aj¹c siê do ciany wcinij \b3.' }
    { checksum = wallplant name = 'Wall Plant' text = 'Wcinij \b4 + \b3 jad¹c w kierunku ciany.' }
    { checksum = wallplant name = 'Vert Wall Plant' text = 'Wcinij \b7 + \b3 robi¹c vert air by wykonaæ vert wall.' }
    { checksum = wallride name = 'Wall Ride' text = 'Wcinij \b0, gdy lecisz wzd³u¿ ciany.' }
    { checksum = spine name = 'Spine Transfer' text = 'Bêd¹c w powietrzu nacinij \ml nad rampami ustawionymi ty³em do siebie.' }
    { checksum = flipandroll name = 'Flips' text = 'Bêd¹c w powietrzu, przytrzymaj \b2 i\nnacinij \b7 \b7 by zrobiæ front flip,\nlub \b4 \b4 by zrobiæ back flip.' }
    { checksum = flipandroll name = 'Rolls' text = 'Bêd¹c w powietrzu przytrzymaj \b2 a nastêpnie\nwcinij \b5 \b5.' }
    { checksum = spine name = 'Acid Drop' text = 'Wcinij \ml nad ramp¹.' }
    { checksum = spine name = 'Bank Drop' text = 'Wcinij \ml nad obrze¿on¹ powierzchni¹' }
    { checksum = wallrunup name = 'Wall Run' text = 'Biegn¹c na cianê, przytrzymaj \bf.' }
    { checksum = wallflip name = 'Wall Flip' text = 'Gdy wykonujesz wall run \bf, wcinij \b4 + \b3.' }
    { checksum = wallhang name = 'Shimmy' text = 'Wcinij \b6 lub \b5 zwisaj¹c z parapetu \bf.' }
    { checksum = walkingflip name = 'Back Tuck' text = 'Wcinij \b3 \b3 stoj¹c nieruchomo.' }
    { checksum = walkingflip name = 'Front Tuck' text = 'Wcinij \b3 \b3 podczas biegu.' }
    { checksum = Boneless name = 'Boneless' text = 'Wcinij \b7 \b7 + \b3 podczas jazdy na desce.' }
    { checksum = highollie name = 'Boned Ollie' text = 'Wcinij \b3 + \b3 podczas jazdy.' }
    { checksum = bertslide name = 'Bert Slide' text = '\mt + lewo lub prawo.\n540 Bert: \mu podczas bert slide\'a.' }
    { checksum = skitch name = 'Skitch' text = 'Stoj¹c z ty³u pojazdu, wcinij \b7.' }
    { checksum = stall name = 'Stall' text = 'Aby przeci¹gn¹æ wcinij \m4\b0.\nWcinij kombinacjê \b0, \b1, i \b2 by wykonaæ modyfikacje przeci¹gania.' }
    { checksum = special name = 'Triki specjalne' text = 'wykonuj triki dopóki nie wype³ni siê licznik specjalny, a potem u¿yj swoich trików specjalnych.' }
    { checksum = focus name = 'Focus' text = 'Nacinij \mq, aby siê skoncentrowaæ. Bêdziesz wtedy korzystaæ z licznika specjalnego.' }
    { checksum = freestyle name = 'Flatland' text = 'Podczas manuala, wciskaj kombinacje \b0, \b1 i \b2.' }
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
        text = 'UMIEJÊTNOCI'
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
            {text = 'Ok' pad_choose_script = back_to_view_abilities}
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
