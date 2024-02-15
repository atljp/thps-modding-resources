
script create_dialog_box_with_wait 
    if (no_load = 0)
        memcard_menus_cleanup
    else
        <no_bg> = no_bg
    endif
    create_snazzy_dialog_box { <...> no_animate }
    change \{ check_for_unplugged_controllers = 0 }
    DisableReset
    wait \{ 20 gameframes }
    EnableReset
    change \{ check_for_unplugged_controllers = 1 }
endscript

script mcmess_CheckingCard 
    GetPlatform
    switch <platform>
        case ps2
        create_dialog_box_with_wait {
            Title = 'Überprüfung ...'
            text = 'Memory Card (8MB) (für PlayStation®2) in MEMORY CARD-Steckplatz 1 wird überprüft. Memory Card (8MB) (für PlayStation®2) und Controller nicht entfernen und die Konsole nicht zurückstellen oder abschalten.'
            add_loading_anim = add_loading_anim
        }
        case xbox
        create_dialog_box_with_wait {
            Title = 'Überprüfung ...'
            text = 'Festplatte wird überprüft.\nBitte die Xbox nicht ausschalten.'
            no_bg = <no_bg>
            add_loading_anim = add_loading_anim
        }
        case pc
        create_dialog_box_with_wait {
            Title = 'Überprüfung ...'
            text = 'Festplatte wird überprüft...\nBitte warten.'
            no_bg = <no_bg>
            add_loading_anim = add_loading_anim
        }
        case ngc
        create_dialog_box_with_wait {
            Title = 'Zugriff ...'
            text = 'Zugriff. Bitte entferne nicht die Nintendo GameCube Memory Card in Steckplatz A und betätige nicht den POWER-Schalter.'
            add_loading_anim = add_loading_anim
        }
        case xenon
        create_dialog_box_with_wait {
            Title = 'Überprüfung ...'
            text = 'Speichermedium wird überprüft ...\nBitte die Xbox 360 Konsole nicht ausschalten.'
            no_bg = <no_bg>
            add_loading_anim = add_loading_anim
        }
    endswitch
endscript

script mcmess_SavingData 
    GetPlatform
    switch <platform>
        case ps2
        create_dialog_box_with_wait {
            Title = 'Speichern ...'
            text = 'Speichert Daten. Memory Card (8MB) (für PlayStation®2) in MEMORY CARD-Steckplatz 1 und Controller nicht entfernen und die Konsole nicht zurückstellen oder abschalten.'
            add_loading_anim = add_loading_anim
        }
        case xbox
        GetFileTypeName file_type = <filetype>
        FormatText {
            textname = text
            '%f wird gespeichert.\nBitte die Xbox nicht ausschalten.'
            f = <filetype_name>
        }
        create_dialog_box_with_wait {
            Title = 'Speichern ...'
            text_dims = (350.0, 0.0)
            text = <text>
            add_loading_anim = add_loading_anim
        }
        case pc
        GetFileTypeName file_type = <filetype>
        FormatText {
            textname = text
            '%f wird auf Festplatte gespeichert...\nBitte warten.'
            f = <filetype_name>
        }
        create_dialog_box_with_wait {
            Title = 'Speichern ...'
            text_dims = (350.0, 0.0)
            text = <text>
            add_loading_anim = add_loading_anim
        }
        case xenon
        GetFileTypeName file_type = <filetype>
        FormatText {
            textname = text
            'Speichert Daten.\nBitte die Konsole nicht ausschalten.'
            f = <filetype_name>
        }
        create_dialog_box_with_wait {
            Title = 'Speichern ...'
            text_dims = (350.0, 0.0)
            text = <text>
            add_loading_anim = add_loading_anim
        }
        case ngc
        create_dialog_box_with_wait {
            Title = 'Speichern ...'
            text_dims = (350.0, 0.0)
            text = 'Speichervorgang. Bitte entferne nicht die Nintendo GameCube Memory Card in Steckplatz A und betätige nicht den POWER-Schalter.'
            add_loading_anim = add_loading_anim
        }
    endswitch
endscript

script mcmess_OverwritingData 
    GetPlatform
    switch <platform>
        case ps2
        create_dialog_box_with_wait {
            Title = 'Überschreiben'
            text = 'Überschreibt Daten. Memory Card (8MB) (für PlayStation®2) und Controller nicht entfernen und die Konsole nicht zurückstellen oder abschalten.'
            add_loading_anim = add_loading_anim
        }
        case xbox
        GetFileTypeName file_type = <filetype>
        FormatText {
            textname = text
            'Überschreibt %f auf Festplatte.\nBitte die Xbox nicht ausschalten.'
            f = <filetype_name>
        }
        create_dialog_box_with_wait {
            Title = 'Überschreiben'
            text_dims = (350.0, 0.0)
            text = <text>
            add_loading_anim = add_loading_anim
        }
        case pc
        GetFileTypeName file_type = <filetype>
        FormatText {
            textname = text
            '%f wird auf die Festplatte gespeichert...\nBitte warten.'
            f = <filetype_name>
        }
        create_dialog_box_with_wait {
            Title = 'Überschreiben'
            text_dims = (350.0, 0.0)
            text = <text>
            add_loading_anim = add_loading_anim
        }
        case xenon
        GetFileTypeName file_type = <filetype>
        FormatText {
            textname = text
            'Überschreibt Daten.\nBitte die Konsole nicht ausschalten.'
            f = <filetype_name>
        }
        create_dialog_box_with_wait {
            Title = 'Überschreiben'
            text_dims = (350.0, 0.0)
            text = <text>
            add_loading_anim = add_loading_anim
        }
        case ngc
        create_dialog_box_with_wait {
            Title = 'Überschreiben'
            text_dims = (350.0, 0.0)
            text = 'Überschreibt Daten. Bitte entferne nicht die Nintendo GameCube Memory Card in Steckplatz A und betätige nicht den POWER-Schalter.'
            add_loading_anim = add_loading_anim
        }
    endswitch
endscript

script mcmess_LoadingData 
    GetPlatform
    switch <platform>
        case ps2
        create_dialog_box_with_wait {
            Title = 'Laden ...'
            text = 'Lädt Daten. Memory Card (8MB) (für PlayStation®2) in MEMORY CARD-Steckplatz 1 und Controller nicht entfernen und die Konsole nicht zurückstellen oder abschalten.'
            add_loading_anim = add_loading_anim
        }
        no_animate = <no_animate>
        case xbox
        GetFileTypeName file_type = <filetype>
        FormatText {
            textname = text
            '%f wird von der Festplatte geladen.\nBitte die Xbox nicht ausschalten.'
            f = <filetype_name>
        }
        create_dialog_box_with_wait {
            Title = 'Laden ...'
            text_dims = (400.0, 0.0)
            text = <text>
            add_loading_anim = add_loading_anim
        }
        no_animate = <no_animate>
        case pc
        GetFileTypeName file_type = <filetype>
        FormatText {
            textname = text
            '%f wird von der Festplatte geladen...\nBitte warten.'
            f = <filetype_name>
        }
        create_dialog_box_with_wait {
            Title = 'Laden ...'
            text_dims = (400.0, 0.0)
            text = <text>
            add_loading_anim = add_loading_anim
        }
        no_animate = <no_animate>
        case xenon
        GetFileTypeName file_type = <filetype>
        FormatText {
            textname = text
            'Lädt Daten.\nBitte die Konsole nicht ausschalten.'
            f = <filetype_name>
        }
        create_dialog_box_with_wait {
            Title = 'Laden ...'
            text_dims = (400.0, 0.0)
            text = <text>
            add_loading_anim = add_loading_anim
        }
        no_animate = <no_animate>
        case ngc
        create_dialog_box_with_wait {
            Title = 'Laden ...'
            text_dims = (350.0, 0.0)
            text = 'Ladevorgang. Bitte die Nintendo GameCube Memory Card in Steckplatz A nicht entfernen und die Konsole nicht ausschalten.'
            add_loading_anim = add_loading_anim
        }
        no_animate = <no_animate>
    endswitch
endscript

script mcmess_DeletingFile 
    GetPlatform
    switch <platform>
        case ps2
        create_dialog_box_with_wait {
            Title = 'Löschen ...'
            text = 'Löscht Daten. Memory Card (8MB) (für PlayStation®2) in MEMORY CARD-Steckplatz 1 und Controller nicht entfernen und die Konsole nicht zurückstellen oder abschalten.'
            add_loading_anim = add_loading_anim
        }
        case pc
        GetFileTypeName file_type = <filetype>
        FormatText {
            textname = text
            '%f wird von Festplatte gelöscht ...\nBitte warten.'
            f = <filetype_name>
        }
        create_dialog_box_with_wait {
            Title = 'Löschen ...'
            text_dims = (350.0, 0.0)
            text = <text>
            add_loading_anim = add_loading_anim
        }
        case xbox
        GetFileTypeName file_type = <filetype>
        FormatText {
            textname = text
            '%f wird von der Festplatte gelöscht.\nBitte die Xbox nicht ausschalten.'
            f = <filetype_name>
        }
        create_dialog_box_with_wait {
            Title = 'Löschen ...'
            text_dims = (350.0, 0.0)
            text = <text>
            add_loading_anim = add_loading_anim
        }
        case xenon
        GetFileTypeName file_type = <filetype>
        FormatText {
            textname = text
            'Löscht Daten.\nBitte die Konsole nicht ausschalten.'
            f = <filetype_name>
        }
        create_dialog_box_with_wait {
            Title = 'Löschen ...'
            text_dims = (350.0, 0.0)
            text = <text>
            add_loading_anim = add_loading_anim
        }
        case ngc
        create_dialog_box_with_wait {
            Title = 'Löschen ...'
            text_dims = (350.0, 0.0)
            text = 'Löschvorgang. Bitte entferne nicht die Nintendo GameCube Memory Card in Steckplatz A und betätige nicht den POWER-Schalter.'
            add_loading_anim = add_loading_anim
        }
    endswitch
endscript

script mcmess_SaveSuccessful 
    <text> = 'Speichern erfolgreich'
    create_memcard_success_dialog_box {
        Title = 'Erfolgreich'
        text = <text>
    }
endscript

script mcmess_OverwriteSuccessful 
    <text> = 'Überschreiben erfolgreich.'
    create_memcard_success_dialog_box {
        Title = 'Erfolgreich'
        text = <text>
    }
endscript

script mcmess_LoadSuccessful 
    create_memcard_success_dialog_box \{ Title = "Erfolgreich" text = "Laden erfolgreich." }
endscript

script mcmess_FormattingCard 
    GetPlatform
    switch <platform>
        case ps2
        create_dialog_box_with_wait {
            Title = 'Formatiere ...'
            text = 'Formatiert Memory Card (8MB) (für PlayStation®2) in MEMORY CARD-Steckplatz 1. Memory Card (8MB) (für PlayStation®2) und Controller nicht entfernen und die Konsole nicht zurückstellen oder abschalten.'
            add_loading_anim = add_loading_anim
        }
        case ngc
        create_dialog_box_with_wait {
            text_dims = (400.0, 0.0)
            Title = 'Formatiere ...'
            text = 'Formatiert. Bitte entferne nicht die Nintendo GameCube Memory Card in Steckplatz A und betätige nicht den POWER-Schalter.'
            add_loading_anim = add_loading_anim
        }
    endswitch
endscript

script mcmess_FormatSuccessful 
    memcard_menus_cleanup
    create_snazzy_dialog_box \{Title = "Erfolgreich" text = "Formatieren erfolgreich." pad_back_script = RetryScript buttons = [{ font = small text = "OK" pad_choose_script = RetryScript }]}
endscript

script create_memcard_error_dialog_box 
    memcard_menus_cleanup
    create_error_box {
        <...> 
        pad_back_script = reload_anims_then_run_abort_script
        buttons = [
            {font = small text = 'Wiederholen' pad_choose_script = RetryScript}
            {font = small text = 'Ende' pad_choose_script = reload_anims_then_run_abort_script}
        ]
    }
endscript

script create_memcard_success_dialog_box 
    memcard_menus_cleanup
    create_snazzy_dialog_box {
        <...> 
        pad_back_script = DoneScript
        buttons = [
            {font = small text = 'OK' pad_choose_script = DoneScript pad_choose_params = { type = <type> }}
        ]
    }
endscript

script mcmess_FormatFailed 
    memcard_menus_cleanup
    GetPlatform
    switch <platform>
        case ps2
        create_error_box {
            Title = 'Warnung!'
            text = 'Formatieren gescheitert! Bitte überprüfe die Memory Card (8MB) (für PlayStation®2) in MEMORY CARD-Steckplatz 1 und versuche es noch einmal.'
            pad_back_script = reload_anims_then_run_abort_script
            buttons = [
                {font = small text = 'Wiederholen' pad_choose_script = RetryScript}
                {font = small text = 'Ohne Speichern fortfahren' pad_choose_script = reload_anims_then_run_abort_script}
            ]
        }
        case ngc
        goto mcmess_DamagedCard
    endswitch
endscript

script mcmess_ErrorSaveFailed 
    GetPlatform
    switch <platform>
        case ps2
        <text> = [
            'Speichern gescheitert!\n'
            'Bitte überprüfe die Memory Card (8MB) '
            '(für PlayStation®2) in MEMORY CARD-'
            'Steckplatz 1 und versuch es noch einmal.'
        ]
        create_memcard_error_dialog_box {
            Title = 'Warnung!'
            text = <text>
        }
        case pc
        case xbox
        case xenon
        create_memcard_error_dialog_box {
            Title = 'Warnung!'
            text = 'Speichern fehlgeschlagen.'
        }
        case ngc
        create_memcard_error_dialog_box {
            text_dims = (350.0, 0.0)
            Title = 'Warnung!'
            text = 'Speichern fehlgeschlagen!\nBitte Nintendo GameCube Memory Card in Steckplatz A überprüfen und erneut versuchen!'
        }
    endswitch
endscript

script mcmess_ErrorOverwriteFailed 
    GetPlatform
    switch <platform>
        case ps2
        if CheckPS2SaveState
            FormatText textname = text 'OVERWRITE NOT SUCCESSFUL!!!\n\n\n\n TELL HIM THIS:\n Save State = %d' d = <save_state>
        else
            <text> = [
                'Überschreiben gescheitert!\n'
                'Bitte überprüfe die Memory Card (8MB) '
                '(für PlayStation®2) in MEMORY CARD-'
                'Steckplatz 1 und versuch es noch einmal.'
            ]
        endif
        create_memcard_error_dialog_box {
            Title = 'Warnung!'
            text = <text>
        }
        case pc
        case xbox
        case xenon
        create_memcard_error_dialog_box {
            Title = 'Warnung!'
            text = 'Überschreiben gescheitert.'
        }
        case ngc
        create_memcard_error_dialog_box {
            text_dims = (350.0, 0.0)
            Title = 'Warnung!'
            text = 'Überschreiben gescheitert!\nÜberprüfe die Nintendo GameCube Memory Card in Steckplatz A und versuch es noch einmal!'
        }
    endswitch
endscript

script mcmess_ErrorbadParkMaxPlayers back_script = reload_anims_then_run_abort_script back_params = {}
    FormatText {
        textname = text
        'Dieser Park funktioniert nicht mit %p Spielern.\nDie maximale Anzahl an Spielern für diesen Park beträgt %m.'
        p = <num_players>
        m = <maxplayers>
    }
    create_error_box {
        Title = 'Warnung!'
        text = <text>
        text_dims = (400.0, 0.0)
        pad_back_script = <back_script>
        pad_back_params = <back_params>
        buttons = [
            {font = small text = 'OK' pad_choose_script = <back_script> pad_choose_params = <back_params>}
        ]
    }
endscript

script mcmess_ErrorLoadFailed 
    GetPlatform
    switch <platform>
        case ps2
        if GotParam CorruptedData
            create_memcard_error_dialog_box {
                Title = 'Warnung!'
                text = [
                    'Laden gescheitert!\n'
                    'Die Datei ist beschädigt.\n'
                    'Bitte überprüfe die Memory Card (8MB) '
                    '(für PlayStation®2) in MEMORY CARD-'
                    'und versuche es noch einmal.'
                ]
            }
        else
            create_memcard_error_dialog_box {
                Title = 'Warnung!'
                text = [
                    'Laden gescheitert!\n'
                    'Bitte überprüfe die Memory Card (8MB) '
                    '(für PlayStation®2) in MEMORY CARD-'
                    'Steckplatz 1 und versuch es noch einmal.'
                ]
            }
        endif
        case pc
        GetFileTypeName file_type = <file_type>
        FormatText textname = text '%s appears to be damaged and cannot be used. Press Jump to continue.' s = <filetype_name>
        memcard_menus_cleanup
        create_error_box {
            Title = ''
            text = <text>
            pad_back_script = reload_anims_then_run_abort_script
            buttons = [
                {font = small text = 'Weiter' pad_choose_script = reload_anims_then_run_abort_script}
            ]
        }
        case xbox
        case xenon
        GetFileTypeName file_type = <file_type>
        FormatText textname = text '%s kann nicht geladen werden. Weiter mit A-Taste.' s = <filetype_name>
        memcard_menus_cleanup
        create_error_box {
            Title = ''
            text = <text>
            pad_back_script = reload_anims_then_run_abort_script
            buttons = [
                {font = small text = 'Weiter' pad_choose_script = reload_anims_then_run_abort_script}
            ]
        }
        case ngc
        create_error_box {
            text_dims = (450.0, 0.0)
            Title = 'Warnung!'
            text = 'Die Memory Card in Steckplatz A enthält eine fehlerhafte Tony Hawk\'s American Wasteland Datei.'
            pad_back_script = reload_anims_then_run_abort_script
            buttons = [
                {font = small text = 'Weiter ohne zu laden' pad_choose_script = reload_anims_then_run_abort_script}
                {font = small text = 'Wiederholen' pad_choose_script = RetryScript}
                {font = small text = 'Datei löschen' pad_choose_script = delete_bad_file pad_choose_params = <...> }
            ]
        }
        CheckForCardRemoval menu_id = dialog_box_anchor
    endswitch
endscript

script mcmess_NGCDeleteCorruptFile 
    memcard_menus_cleanup
    create_error_box {
        text_dims = (450.0, 0.0)
        Title = 'Warnung!'
        text = 'Die Memory Card in Steckplatz A enthält eine fehlerhafte Tony Hawk\'s American Wasteland Datei.'
        pad_back_script = reload_anims_then_run_abort_script
        buttons = [
            {font = small text = 'Ohne Speichern fortfahren' pad_choose_script = reload_anims_then_run_abort_script}
            {font = small text = 'Wiederholen' pad_choose_script = RetryScript}
            {font = small text = 'Fehlerhafte Daten löschen' pad_choose_script = NGC_delete_bad_file pad_choose_params = <...> }
        ]
    }
    CheckForCardRemoval menu_id = dialog_box_anchor
endscript

script mcmess_ErrorNoCardInSlot 
    memcard_menus_cleanup
    if (SavingOrLoading = saving)
        ContinueText = 'Ohne Speichern fortfahren'
    else
        ContinueText = 'Weiter'
    endif
    GetPlatform
    switch <platform>
        case ps2
        create_error_box {
            Title = 'Warnung!'
            text = [
                'Keine Memory Card (8MB) (für PlayStation®2) '
                'in MEMORY CARD-Steckplatz 1.'
            ]
            pad_back_script = reload_anims_then_run_abort_script
            buttons = [
                {font = small text = 'Wiederholen' pad_choose_script = RetryScript}
                {font = small text = <ContinueText> pad_choose_script = reload_anims_then_run_abort_script}
            ]
        }
        case ngc
        create_error_box {
            Title = 'Warnung!'
            text = 'Keine Nintendo GameCube Memory Card in Steckplatz A vorhanden.'
            pad_back_script = reload_anims_then_run_abort_script
            buttons = [
                {font = small text = 'Wiederholen' pad_choose_script = RetryScript}
                {font = small text = <ContinueText> pad_choose_script = reload_anims_then_run_abort_script}
            ]
        }
        case xenon
        create_error_box {
            Title = 'Warnung!'
            text = [ 
            'Es wurde kein Speichermodul ausgewählt oder das benutzte Speichermodul ist nicht verfügbar.'
             ]
            pad_back_script = reload_anims_then_run_abort_script
            buttons = [
                {font = small text = 'Wähl ein Modul' pad_choose_script = RetryScript}
                {font = small text = <ContinueText> pad_choose_script = reload_anims_then_run_abort_script}
            ]
        }
    endswitch
endscript

script mcmess_ErrorNotEnoughRoomNoTHPSFilesExist spacerequired = 0 spaceavailable = 0
    memcard_menus_cleanup
    GetFileTypeName file_type = <filetype>
    GetPlatform
    switch <platform>
        case ps2
        FormatText {
            textname = text
            'Ungenügend Speicherplatz auf der Memory Card (8MB) (für PlayStation®2) in MEMORY CARD-Steckplatz 1.\n%f benötigt %s KB freien Speicherplatz, um Daten zu speichern.'
            s = <spacerequired>
            f = <filetype_name>
        }
        create_error_box {
            Title = 'Warnung!'
            text = <text>
            pad_back_script = reload_anims_then_run_abort_script
            buttons = [
                {font = small text = 'Ohne Speichern fortfahren' pad_choose_script = reload_anims_then_run_abort_script}
                {font = small text = 'Wiederholen' pad_choose_script = RetryScript}
            ]
        }
        case xbox
        FormatText {
            textname = text
            'Die Xbox hat nicht genügend freie Blöcke, um zu speichern.\nMindestens %s Blöcke werden benötigt, um die aktuelle %f-Datei zu speichern.\nBitte mach mindestens %n Blöcke frei.'
            s = <spacerequired>
            f = <filetype_name>
            n = (<spacerequired> - <spaceavailable>)
        }
        create_error_box {
            Title = 'Warnung!'
            text = <text>
            text_dims = (400.0, 0.0)
            pad_back_script = reload_anims_then_run_abort_script
            buttons = [
                {font = small text = 'Ohne Speichern fortfahren' pad_choose_script = reload_anims_then_run_abort_script}
            ]
        }
        case xenon
        FormatText {
            textname = text
            'Dein Speichermedium hat nicht genügend freie Blöcke zum Speichern.\nZum Speichern der aktuellen %f-Datei werden mindestens %s Blöcke benötigt.\nBitte sorg für mindestens %n freie Blöcke.'
            s = <spacerequired>
            f = <filetype_name>
            n = (<spacerequired> - <spaceavailable>)
        }
        create_error_box {
            Title = 'Warnung!'
            text = <text>
            text_dims = (400.0, 0.0)
            pad_back_script = reload_anims_then_run_abort_script
            buttons = [
                {font = small text = 'Ohne Speichern fortfahren' pad_choose_script = reload_anims_then_run_abort_script}
            ]
        }
        case ngc
        FormatText {
            textname = text
            'Es befindet sich nicht genügend freier Platz auf der Memory Card (Speicherkarte) in Steckplatz A. Tony Hawk\'s American Wasteland benötigt zum Speichern %t Datei und %b Blöcke.  Bitte rufe den Memory Card-Bildschirm auf, um die Inhalte deiner Memory Card zu verwalten.'
            t = <filetype_name>
            b = <spacerequired>
        }
        create_error_box {
            Title = 'Warnung!'
            text = <text>
            text_dims = (400.0, 0.0)
            pad_back_script = reload_anims_then_run_abort_script
            buttons = [
                {font = small text = 'Ohne Speichern fortfahren' pad_choose_script = reload_anims_then_run_abort_script}
                {font = small text = 'Wiederholen' pad_choose_script = RetryScript}
            ]
        }
    endswitch
endscript

script mcmess_ErrorNotEnoughRoomButTHPSFilesExist spacerequired = 0
    memcard_menus_cleanup
    GetFileTypeName file_type = <filetype>
    GetPlatform
    switch <platform>
        case ps2
        FormatText {
            textname = text
            'Ungenügend Speicherplatz auf der Memory Card (8MB) (für PlayStation®2) in MEMORY CARD-Steckplatz 1.\n%f benötigt %s KB freien Speicherplatz, um Daten zu speichern.\nMöchtest du vorherige %f-Daten überschreiben?'
            s = <spacerequired>
            f = <filetype_name>
        }
        create_error_box {
            Title = 'Warnung!'
            text = <text>
            text_dims = (450.0, 0.0)
            pad_back_script = reload_anims_then_run_abort_script
            buttons = [
                {font = small text = 'Weiter' pad_choose_script = launch_files_menu pad_choose_params = {DoNotShowNotEnoughRoomMessage save filetype = <filetype>}}
                {font = small text = 'Ende' pad_choose_script = reload_anims_then_run_abort_script}
            ]
        }
        case xbox
        FormatText {
            textname = text
            'Die Xbox hat nicht genügend freie Blöcke, um zu speichern.\nMindestens %s Blöcke werden benötigt, um die aktuelle %f-Datei zu speichern.\nDu musst entweder bestehende Spielstände löschen oder überschreiben.'
            s = <spacerequired>
            f = <filetype_name>
        }
        create_error_box {
            Title = 'Warnung!'
            text = <text>
            text_dims = (450.0, 0.0)
            pad_back_script = reload_anims_then_run_abort_script
            buttons = [
                {font = small text = 'Weiter' pad_choose_script = launch_files_menu pad_choose_params = {DoNotShowNotEnoughRoomMessage save filetype = <filetype>}}
                {font = small text = 'Ende' pad_choose_script = reload_anims_then_run_abort_script}
            ]
        }
        case xenon
        FormatText {
            textname = text
            'Dein Speichermedium hat nicht genügend freie Blöcke zum Speichern.\nZum Speichern der aktuellen %f-Datei werden mindestens %s Blöcke benötigt.\nDu musst bestehende Spielstände entweder löschen oder überschreiben.'
            s = <spacerequired>
            f = <filetype_name>
        }
        create_error_box {
            Title = 'Warnung!'
            text = <text>
            text_dims = (450.0, 0.0)
            pad_back_script = reload_anims_then_run_abort_script
            buttons = [
                {font = small text = 'Weiter' pad_choose_script = launch_files_menu pad_choose_params = {DoNotShowNotEnoughRoomMessage save filetype = <filetype>}}
                {font = small text = 'Ende' pad_choose_script = reload_anims_then_run_abort_script}
            ]
        }
        case ngc
        if GotParam overwrite
            <word> = 'überschreiben'
        else
            <word> = 'speichern'
        endif
        FormatText {
            textname = text
            'Es befindet sich nicht genügend freier Platz auf der Memory Card (Speicherkarte) in Steckplatz A. Um die aktuelle %t-Datei zu %w, werden 1 Datei und %b Blöcke benötigt.\nDu musst bestehende Tony Hawk\'s American Wasteland-Dateien löschen oder überschreiben. Bitte ruf den Memory Card-Bildschirm auf, um die Inhalte deiner Memory Card zu verwalten. '
            w = <word>
            t = <filetype_name>
            b = <spacerequired>
        }
        create_error_box {
            Title = 'Warnung!'
            text = <text>
            text_dims = (450.0, 0.0)
            pad_back_script = reload_anims_then_run_abort_script
            buttons = [
                {font = small text = 'Ohne Speichern fortfahren' pad_choose_script = reload_anims_then_run_abort_script}
                {font = small text = 'Wiederholen' pad_choose_script = RetryScript}
                {font = small text = 'Dateien löschen/überschreiben' pad_choose_script = launch_files_menu pad_choose_params = {DoNotShowNotEnoughRoomMessage save filetype = <filetype>}}
            ]
        }
    endswitch
endscript

script mcmess_ErrorDeleteFailed 
    if CardIsDamaged
        goto mcmess_DamagedCard
    endif
    GetPlatform
    switch <platform>
        case ps2
        create_memcard_error_dialog_box {
            Title = 'Löschen gescheitert!'
            text = 'Löschen gescheitert! Bitte überprüfe die Memory Card (8MB) (für PlayStation®2) in MEMORY CARD-Steckplatz 1 und versuch es noch einmal.'
        }
        case pc
        case xbox
        case xenon
        create_memcard_error_dialog_box {
            Title = 'Löschen gescheitert!'
            text = 'Löschen nicht möglich.'
        }
        case ngc
        create_memcard_error_dialog_box {
            text_dims = (350.0, 0.0)
            Title = 'Löschen gescheitert!'
            text = 'Bitte überprüfe die Nintendo GameCube Memory Card in Steckplatz A und versuch es erneut!'
        }
    endswitch
endscript

script mcmess_NoFiles 
    GetFileTypeName file_type = <MenuFileType>
    if ScreenElementExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    GetPlatform
    switch <platform>
        case ps2
        FormatText {
            textname = text
            'Keine gespeicherten Tony Hawk\'s American Wasteland %n-Daten auf der Memory Card (8MB) (für PlayStation®2) in MEMORY CARD-Steckplatz 1 vorhanden.'
            n = <filetype_name>
        }
        create_memcard_error_dialog_box {
            Title = 'Warnung!'
            text = <text>
        }
        case pc
        case xbox
        FormatText {
            textname = text
            'Keine Tony Hawk\'s American Wasteland %n-Daten auf Festplatte vorhanden.'
            n = <filetype_name>
        }
        memcard_menus_cleanup
        create_error_box {
            Title = 'Keine Spielstände'
            text = <text>
            pad_back_script = reload_anims_then_run_abort_script
            buttons = [
                {font = small text = 'Ende' pad_choose_script = reload_anims_then_run_abort_script}
            ]
        }
        case xenon
        FormatText {
            textname = text
            'Keine Tony Hawk\'s American Wasteland %n-Daten vorhanden.'
            n = <filetype_name>
        }
        memcard_menus_cleanup
        create_error_box {
            Title = 'Keine Spielstände'
            text = <text>
            pad_back_script = reload_anims_then_run_abort_script
            buttons = [
                {font = small text = 'Weiter' pad_choose_script = reload_anims_then_run_abort_script}
            ]
        }
        case ngc
        FormatText {
            textname = text
            'Keine Tony Hawk\'s American Wasteland-%n-Daten auf der Nintendo GameCube Memory Card in Steckplatz A vorhanden.'
            n = <filetype_name>
        }
        create_memcard_error_dialog_box {
            Title = 'Warnung!'
            text = <text>
        }
    endswitch
endscript

script mcmess_ErrorNotFormatted QuitText = 'Ohne Formatieren fortfahren' backScript = reload_anims_then_run_abort_script
    memcard_menus_cleanup
    GetPlatform
    switch <platform>
        case ps2
        create_error_box {
            text_dims = (650.0, 0.0)
            Title = 'Warnung!'
            text = 'Die Memory Card (8MB) (für PlayStation®2)\n in MEMORY CARD-Steckplatz 1 ist nicht formatiert.'
            pad_back_script = <backScript>
            buttons = [
                {font = small text = <QuitText> pad_choose_script = reload_anims_then_run_abort_script}
                {font = small text = 'Wiederholen' pad_choose_script = RetryScript}
                {font = small text = 'Memory Card (8MB) (für PlayStation®2) formatieren?' pad_choose_script = mcmess_FormatYesNo pad_choose_params = { backScript = <backScript> }}
            ]
        }
        case ngc
        if CardIsForeign
            create_error_box {
                text_dims = (590.0, 0.0)
                Title = 'Warnung!'
                text = 'Die Memory Card in Steckplatz A ist fehlerhaft und muss formatiert werden.'
                pad_back_script = <backScript>
                buttons = [
                    {font = small text = 'Ohne Speichern fortfahren' pad_choose_script = reload_anims_then_run_abort_script}
                    {font = small text = 'Wiederholen' pad_choose_script = RetryScript}
                    {font = small text = 'Memory Card formatieren' pad_choose_script = mcmess_FormatYesNo pad_choose_params = { backScript = <backScript> }}
                ]
            }
        else
            create_error_box {
                text_dims = (590.0, 0.0)
                Title = 'Warnung!'
                text = 'Die Memory Card in Steckplatz A ist fehlerhaft und muss formatiert werden.\nMemory Card formatieren?'
                pad_back_script = <backScript>
                buttons = [
                    {font = small text = 'Ohne Speichern fortfahren' pad_choose_script = reload_anims_then_run_abort_script}
                    {font = small text = 'Wiederholen' pad_choose_script = RetryScript}
                    {font = small text = 'Memory Card formatieren' pad_choose_script = mcmess_FormatYesNo pad_choose_params = { backScript = <backScript> }}
                ]
            }
        endif
    endswitch
    CheckForCardRemoval menu_id = dialog_box_anchor
endscript

script mcmess_ErrorNotFormattedNoFormatOption 
    memcard_menus_cleanup
    GetPlatform
    switch <platform>
        case ps2
        create_error_box {
            Title = 'Warnung!'
            text = 'Die Memory Card (8MB) (für PlayStation®2) in MEMORY CARD-Steckplatz 1 ist nicht formatiert.'
            pad_back_script = reload_anims_then_run_abort_script
            buttons = [
                {font = small text = 'Weiter' pad_choose_script = reload_anims_then_run_abort_script}
                {font = small text = 'Wiederholen' pad_choose_script = RetryScript}
            ]
        }
        case ngc
        if CardIsForeign
            create_error_box {
                text_dims = (350.0, 0.0)
                Title = 'Warnung!'
                text = 'Die Memory Card in Steckplatz A ist fehlerhaft und muss formatiert werden.'
                pad_back_script = <backScript>
                buttons = [
                    {font = small text = 'Ohne Speichern fortfahren' pad_choose_script = reload_anims_then_run_abort_script}
                    {font = small text = 'Wiederholen' pad_choose_script = RetryScript}
                    {font = small text = 'Memory Card formatieren' pad_choose_script = mcmess_FormatYesNo pad_choose_params = { backScript = reload_anims_then_run_abort_script }}
                ]
            }
        else
            create_error_box {
                text_dims = (350.0, 0.0)
                Title = 'Warnung!'
                text = 'Die Nintendo GameCube Memory Card in Steckplatz A ist fehlerhaft und muss formatiert werden.\nMemory Card formatieren?'
                pad_back_script = <backScript>
                buttons = [
                    {font = small text = 'Ohne Speichern fortfahren' pad_choose_script = reload_anims_then_run_abort_script}
                    {font = small text = 'Wiederholen' pad_choose_script = RetryScript}
                    {font = small text = 'Memory Card formatieren' pad_choose_script = mcmess_FormatYesNo pad_choose_params = { backScript = reload_anims_then_run_abort_script }}
                ]
            }
        endif
    endswitch
    CheckForCardRemoval menu_id = dialog_box_anchor
endscript

script mcmess_FormatYesNo backScript = reload_anims_then_run_abort_script
    memcard_menus_cleanup
    GetPlatform
    switch <platform>
        case ps2
        create_snazzy_dialog_box {
            Title = 'Formatieren'
            text = 'Bist du sicher, dass du die Memory Card (8MB) (für PlayStation®2) in MEMORY CARD-Steckplatz 1 formatieren möchtest?'
            pad_back_script = <backScript>
            buttons = [
                {font = small text = 'Nein' pad_choose_script = reload_anims_then_run_abort_script}
                {font = small text = 'Ja' pad_choose_script = DoFormatCard}
            ]
        }
        case ngc
        create_snazzy_dialog_box {
            Title = 'Formatieren'
            text = 'Durch das Formatieren der Memory Card in Steckplatz A werden alle zuvor gespeicherten Daten gelöscht. Soll sie trotzdem formatiert werden?'
            pad_back_script = <backScript>
            buttons = [
                {font = small text = 'Nein' pad_choose_script = reload_anims_then_run_abort_script}
                {font = small text = 'Ja' pad_choose_script = DoFormatCard}
            ]
        }
    endswitch
    CheckForCardRemoval menu_id = dialog_box_anchor
endscript

script GetSaveSizes 
    GetMemCardSpaceRequired \{ OptionsAndPros }
    <SaveSize_OptionsAndPros> = <spacerequired>
    GetMemCardSpaceRequired \{ NetworkSettings }
    <SaveSize_NetworkSettings> = <spacerequired>
    GetMemCardSpaceRequired \{ Park }
    <SaveSize_Park> = <spacerequired>
    GetMemCardSpaceRequired \{ CAT }
    <SaveSize_CreateATrick> = <spacerequired>
    GetMemCardSpaceRequired \{ CreatedGoals }
    <SaveSize_Goals> = <spacerequired>
    GetMemCardSpaceRequired \{ createdgraphic }
    <SaveSize_CreatedGraphic> = <spacerequired>
    return <...> 
endscript

script mcmess_ErrorNotEnoughSpaceToSaveAllTypes 
    if (no_load = 0)
        memcard_menus_cleanup
    else
        <no_bg> = no_bg
    endif
    GetSaveSizes
    GetPlatform
    switch <platform>
        case ps2
        FormatText {
            textname = text
            'Ungenügend Speicherplatz auf der Memory Card (8MB) (für PlayStation®2) in MEMORY CARD-Steckplatz 1.\nZum Speichern des Spielfortschritts benötigst du mindestens %c KB freien Speicher. 94 KB freier Speicher werden benötigt, \num deine Netzwerkkonfigurationsdatei zu erstellen oder zu bearbeiten.\nZum Speichern der Online-Einstellungen werden\nzusätzliche %n KB freier Speicher benötigt.\n\nDer Spielfortschritt erfordert %c KB,\ndie Online-Einstellungen %n KB,\nein Park %p KB,\nTricks %t KB und\nGrafiken %u KB'
            c = <SaveSize_OptionsAndPros>
            n = <SaveSize_NetworkSettings>
            u = <SaveSize_CreatedGraphic>
            p = <SaveSize_Park>
            t = <SaveSize_CreateATrick>
            z = ''
        }
        create_error_box {
            Title = 'Warnung!'
            text = <text>
            text_dims = (580.0, 0.0)
            pos_tweak = (0.0, -33.0)
            no_animate
            pad_back_script = reload_anims_then_run_abort_script
            buttons = [
                {font = small text = 'Fortsetzen, ohne alle Dateitypen zu speichern' pad_choose_script = reload_anims_then_run_abort_script}
                {font = small text = 'Wiederholen' pad_choose_script = RetryScript}
            ]
        }
        case xbox
        GetMemCardSpaceAvailable
        total_blocks_needed = (<SaveSize_OptionsAndPros> + <SaveSize_Park> + <SaveSize_CreateATrick> + <SaveSize_CreatedGraphic>)
        change movies_disabled = 1
        FormatText {
            textname = text
            'Die Xbox hat nicht genügend freie Blöcke, um alle Dateitypen von Tony Hawk\'s American Wasteland zu speichern.\nBitte sorge für mindestens %f freie Blöcke.\n\nDer Spielfortschritt erfordert %c Blöcke,\nein Park %p Blöcke,\nTricks %t Blöcke\nund Grafiken %u Blöcke.'
            c = <SaveSize_OptionsAndPros>
            p = <SaveSize_Park>
            t = <SaveSize_CreateATrick>
            u = <SaveSize_CreatedGraphic>
            f = (<total_blocks_needed> - <spaceavailable>)
        }
        create_error_box {
            Title = ''
            text = <text>
            text_dims = (560.0, 0.0)
            pos_tweak = (0.0, -15.0)
            no_animate
            no_bg = <no_bg>
            buttons = [
                {font = small text = 'Fortfahren, ohne alle Dateitypen zu speichern?' pad_choose_script = reload_anims_then_run_abort_script}
                {font = small text = 'Weitere Blöcke frei machen' pad_choose_script = QuitToDashboard pad_choose_params = { total_blocks_needed = <total_blocks_needed> }}
            ]
        }
        case xenon
        GetMemCardSpaceAvailable
        total_blocks_needed = (<SaveSize_OptionsAndPros> + <SaveSize_Park> + <SaveSize_CreateATrick> + <SaveSize_CreatedGraphic>)
        change movies_disabled = 1
        FormatText {
            textname = text
            'Dein Speichermedium hat nicht genügend freie Blöcke, um alle Dateitypen von Tony Hawk\'s American Wasteland zu speichern.\nBitte sorg für mindestens %f freie Blöcke.\n\nDer Spielfortschritt erfordert %c Blöcke,\nein Park %p Blöcke,\nTricks %t Blöcke\nund Grafiken %u Blöcke'
            c = <SaveSize_OptionsAndPros>
            p = <SaveSize_Park>
            t = <SaveSize_CreateATrick>
            u = <SaveSize_CreatedGraphic>
            f = (<total_blocks_needed> - <spaceavailable>)
        }
        create_error_box {
            Title = ''
            text = <text>
            text_dims = (560.0, 0.0)
            pos_tweak = (0.0, -15.0)
            no_animate
            no_bg = <no_bg>
            buttons = [
                {font = small text = 'Fortfahren, ohne alle Dateitypen zu speichern?' pad_choose_script = reload_anims_then_run_abort_script}
                {font = small text = 'Weitere Blöcke frei machen' pad_choose_script = QuitToDashboard pad_choose_params = { total_blocks_needed = <total_blocks_needed> }}
            ]
        }
        case ngc
        FormatText {
            textname = text
            'Es befindet sich nicht genügend freier Platz auf der Memory Card (Speicherkarte) in Steckplatz A, \num alle Dateitypen von Tony Hawk\'s American Wasteland zu speichern. \nGespeicherte Daten können geladen und überschrieben werden.\n\nDer Spielfortschritt erfordert 1 Datei und %c Blöcke,\nein Park 1 Datei und %p Blöcke,\nTricks 1 Datei und %t Blöcke\nund Grafiken 1 Datei und %u Blöcke.\nBitte ruf den Memory Card-Bildschirm auf, um die Inhalte deiner Memory Card zu verwalten.'
            c = <SaveSize_OptionsAndPros>
            p = <SaveSize_Park>
            t = <SaveSize_CreateATrick>
            u = <SaveSize_CreatedGraphic>
        }
        if GotParam no_manager
            create_error_box {
                Title = 'Warnung!'
                text = <text>
                text_dims = (550.0, 0.0)
                pos_tweak = (15.0, -17.0)
                no_animate
                pad_back_script = reload_anims_then_run_abort_script
                buttons = [
                    {font = small text = 'Fortsetzen, ohne alle Dateitypen zu speichern' pad_choose_script = reload_anims_then_run_abort_script}
                    {font = small text = 'Wiederholen' pad_choose_script = RetryScript}
                ]
            }
        else
            create_error_box {
                Title = 'Warnung!'
                text = <text>
                text_dims = (550.0, 0.0)
                pos_tweak = (15.0, -17.0)
                no_animate
                pad_back_script = reload_anims_then_run_abort_script
                buttons = [
                    {font = small text = 'Fortsetzen, ohne alle Dateitypen zu speichern' pad_choose_script = reload_anims_then_run_abort_script}
                    {font = small text = 'Wiederholen' pad_choose_script = RetryScript}
                    {font = small text = 'Memory Card (Speicherkarte) verwalten' pad_choose_script = QuitToDashboard}
                ]
            }
        endif
    endswitch
endscript

script mcmess_ErrorNoCardOnBootup 
    memcard_menus_cleanup
    GetSaveSizes
    GetPlatform
    switch <platform>
        case ps2
        FormatText {
            textname = text
            'Keine Memory Card (8MB) (für PlayStation®2)\n in MEMORY CARD-Steckplatz 1 eingelegt.\nBitte lege eine Memory Card (8MB) (für PlayStation®2)\nmit mindestens %c KB freiem Speicherplatz für \nden Spielfortschritt ein. Du benötigst mindestens 94 KB freien Speicher, \num deine Netzwerkkonfigurationsdatei zu erstellen oder zu bearbeiten.\nZum Speichern der Online-Einstellungen werden \nzusätzliche %n KB freier Speicher benötigt.\n\nDer Spielfortschritt erfordert %c KB,\ndie Online-Einstellungen %n KB,\nein Park %p KB,\nTricks %t KB und\nGrafiken %u KB'
            c = <SaveSize_OptionsAndPros>
            n = <SaveSize_NetworkSettings>
            u = <SaveSize_CreatedGraphic>
            p = <SaveSize_Park>
            t = <SaveSize_CreateATrick>
            z = ''
        }
        create_error_box {
            Title = 'Warnung!'
            text = <text>
            text_dims = (560.0, 0.0)
            pos_tweak = (0.0, -33.0)
            no_animate
            pad_back_script = generic_menu_pad_back
            pad_back_params = { callback = reload_anims_then_run_abort_script }
            buttons = [
                {font = small text = 'Ohne Speichern fortfahren' pad_choose_script = reload_anims_then_run_abort_script}
                {font = small text = 'Wiederholen' pad_choose_script = RetryScript}
            ]
        }
        case xenon
        mcmess_ErrorNoCardInSlot
        case ngc
        FormatText {
            textname = text
            'Es befindet sich keine Memory Card in Steckplatz A.\n\nDer Spielfortschritt erfordert 1 Datei und %c Blöcke,\nein Park 1 Datei und %p Blöcke,\nTricks 1 Datei und %t Blöcke\nund Grafiken 1 Datei und %u Blöcke.'
            c = <SaveSize_OptionsAndPros>
            p = <SaveSize_Park>
            t = <SaveSize_CreateATrick>
            u = <SaveSize_CreatedGraphic>
        }
        create_error_box {
            Title = 'Warnung!'
            text = <text>
            text_dims = (560.0, 0.0)
            pos_tweak = (0.0, 0.0)
            no_animate
            pad_back_script = generic_menu_pad_back
            pad_back_params = { callback = reload_anims_then_run_abort_script }
            buttons = [
                {font = small text = 'Fortsetzen, ohne alle Dateitypen zu speichern' pad_choose_script = reload_anims_then_run_abort_script}
                {font = small text = 'Wiederholen' pad_choose_script = RetryScript}
            ]
        }
    endswitch
endscript

script mcmess_DamagedCard 
    memcard_menus_cleanup
    create_error_box {
        Title = 'Fehler'
        text = 'Die Memory Card (Speicherkarte) in Steckplatz A ist beschädigt und kann nicht verwendet werden'
        pad_back_script = reload_anims_then_run_abort_script
        buttons = [
            {font = small text = 'Ohne Speichern fortfahren' pad_choose_script = reload_anims_then_run_abort_script}
            {font = small text = 'Wiederholen' pad_choose_script = RetryScript}
        ]
    }
endscript

script mcmess_BadDevice 
    memcard_menus_cleanup
    create_error_box {
        Title = 'Fehler'
        text = 'Das Objekt in Steckplatz A wird nicht als Memory Card (Speicherkarte) anerkannt. Bitte stecke eine Memory Card ein.'
        pad_back_script = reload_anims_then_run_abort_script
        buttons = [
            {font = small text = 'Ohne Speichern fortfahren' pad_choose_script = reload_anims_then_run_abort_script}
            {font = small text = 'Wiederholen' pad_choose_script = RetryScript}
        ]
    }
endscript

script mcmess_BadSectorSize 
    memcard_menus_cleanup
    create_error_box {
        Title = 'Fehler'
        text = 'Die Memory Card in Steckplatz A ist nicht mit dem Tony Hawk\'s American Wasteland-Spielstand kompatibel.'
        pad_back_script = reload_anims_then_run_abort_script
        buttons = [
            {font = small text = 'Ohne Speichern fortfahren' pad_choose_script = reload_anims_then_run_abort_script}
            {font = small text = 'Wiederholen' pad_choose_script = RetryScript}
        ]
    }
endscript
