

script sandbox_menu 
    make_new_roundbar_menu {
        pad_back_script = exit_pause_menu
        Title = 'Your Menu'
        helper_text = <helper>
    }
    create_helper_text generic_helper_text
    add_roundbar_menu_item text = 'Hey, here is your menu.'
    add_roundbar_menu_item text = 'Feel free to add anything you like.'
    add_roundbar_menu_item text = 'Edit yourscript.qb located in game/data/sandbox.'
    roundbar_menu_finish
endscript

