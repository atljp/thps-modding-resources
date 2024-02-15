menu_template_style_ticker = { menu_create_script = make_label_menu item_create_script = add_label_menu_item Pos = (100.0, 120.0) spacing = 5 }

script menu_template_create parent = root_window
    SetScreenElementLock id = <parent> Off
    if ScreenElementExists id = <menu_id>
        DestroyScreenElement id = <menu_id>
    endif
    <menu_create_script> <...> 
    if GotParam pad_back_script
        <menu_id> ::setprops {
            event_handlers = [
                {
                    pad_back
                    menu_template_kill
                    params = {
                        id = <menu_id>
                        callback_script = <pad_back_script>
                        callback_params = <pad_back_params>
                    }
                }
            ]
        }
    endif
    if GotParam items
        ForEachIn {
            <items>
            do = <item_create_script>
            params = {
                focus_script = <focus_script>
                unfocus_script = <unfocus_script>
                exclusive_device = <exclusive_device>
            }
        }
    endif
    if GotParam helper_text_elements
        create_helper_text helper_text_elements = <helper_text_elements>
    endif
    if GotParam additional_event_handlers
        <menu_id> ::setprops event_handlers = <additional_event_handlers>
    endif
    if GotParam tags
        <menu_id> ::settags <tags>
    endif
    if NOT GotParam no_focus
        FireEvent type = focus target = <menu_id>
    endif
endscript

script menu_template_kill 
    if GotParam \{ id }
        disassociatefromobject
        DestroyScreenElement id = <id>
    endif
    if GotParam \{ callback_script }
        <callback_script> <callback_params>
    endif
endscript
