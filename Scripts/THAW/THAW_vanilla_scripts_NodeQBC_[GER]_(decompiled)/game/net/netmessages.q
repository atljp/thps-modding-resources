
script ScavengerHuntOneObjectLeftOther 
    FormatText textname = msg_text '%s braucht nur noch ein Objekt!' s = <name>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript

script ScavengerHuntOneObjectLeftYou 
    create_net_panel_message \{ text = 'Du brauchst nur noch ein Objekt!' style = net_team_panel_message }
endscript

script ScavengerHuntFiveObjectsLeftOther 
    FormatText textname = msg_text '%s braucht nur noch 5 Objekte!' s = <name>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript

script ScavengerHuntFiveObjectsLeftYou 
    create_net_panel_message \{ text = 'Du brauchst nur noch fünf Objekte!' style = net_team_panel_message }
endscript

script ScavengerHuntOneObjectLeftOtherTeam 
    FormatText textname = msg_text 'Team %s braucht nur noch ein Objekt!' s = <name>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript

script ScavengerHuntFiveObjectsLeftOtherTeam 
    FormatText textname = msg_text 'Team %s braucht nur noch 5 Objekte!' s = <name>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript

script newscoreleaderyou 
    if InNetGame
        create_net_panel_message \{ text = 'Du hast die Führung übernommen!' style = net_team_panel_message }
    endif
endscript

script newscoreleaderother 
    if InNetGame
        FormatText textname = msg_text '%s hat die Führung übernommen!' s = <string0>
        create_net_panel_message text = <msg_text> style = net_team_panel_message
    endif
endscript

script EliminatedNone 
    create_net_panel_message \{ text = 'In dieser Runde ist niemand ausgeschieden!' style = net_team_panel_message }
endscript

script EliminatedYou 
    if InNetGame
        TantrumMessageHide
        pause_trick_text
        create_net_panel_message \{ text = 'Du bist ausgeschieden! Drück \b3, um den anderen Spielern zuzuschauen.' style = net_team_panel_message }
        EnterSurveyorMode
        if GameModeEquals \{ is_elimiskate }
            if NOT OnServer
                CheckForElimiskateGameOver
            endif
        endif
    endif
endscript

script EliminatedOther 
    if InNetGame
        FormatText textname = msg_text '%s wurde ausgeschaltet!' s = <string0>
        create_net_panel_message text = <msg_text> style = net_team_panel_message
        if NOT OnServer
            CheckForElimiskateGameOver
        endif
    endif
endscript

script NewKingOther 
    if InNetGame
        FormatText textname = msg_text '%s ist der Lord of the Board!' s = <string0>
        create_net_panel_message text = <msg_text> style = net_team_panel_message
    else
        playsound \{ HUD_specialtrickAA vol = 100 }
    endif
endscript

script NewGoldOwnerOther 
    if InNetGame
        FormatText textname = msg_text '%s hat das Gold!' s = <string0>
        create_net_panel_message text = <msg_text> style = net_team_panel_message
    else
        playsound \{ HUD_specialtrickAA vol = 100 }
    endif
endscript

script NewKingYou 
    if InNetGame
        FormatText \{ textname = msg_text 'Lang lebe der König!' }
        create_net_panel_message text = <msg_text> style = net_team_panel_message
    else
        playsound \{ HUD_specialtrickAA vol = 100 }
    endif
endscript

script NewGoldOwnerYou 
    if InNetGame
        FormatText \{ textname = msg_text 'Zeit zu punkten!' }
        create_net_panel_message text = <msg_text> style = net_team_panel_message
    else
        playsound \{ HUD_specialtrickAA vol = 100 }
    endif
endscript

script NewScoreLeaderYourTeam 
    if InNetGame
        create_net_panel_message \{ text = 'Dein Team hat die Führung übernommen!' style = net_team_panel_message }
    endif
endscript

script NewScoreLeaderOtherTeam 
    if InNetGame
        FormatText textname = msg_text 'Team %s hat die Führung übernommen!' s = <string0>
        create_net_panel_message text = <msg_text> style = net_team_panel_message
    endif
endscript

script timer_runout_beep 
    playsound \{ TimeoutA vol = 75 pitch = 110 }
endscript

script GraffitiStealYou 
    if InNetGame
        FormatText textname = msg_text 'Du hast %s was geklaut!' s = <string0>
        create_net_panel_message text = <msg_text> style = net_team_panel_message
    endif
endscript

script GraffitiStealOther 
    if InNetGame
        FormatText textname = msg_text '%s hat dir was geklaut!' s = <string0>
        create_net_panel_message text = <msg_text> style = net_team_panel_message
    endif
endscript

script SkaterCollideBail 
    TurnSparksOff
    stopbalancetrick
    inbail
    playsound HUDtrickslopC
    printf 'SkaterCollideBail 1'
    if InNetGame
        if NOT GameModeEquals is_ctf
            if NOT GotParam WinnerIsDriving
                FormatText textname = msg_text s = <string0> Random (
                    @ '%s hat dir eine verpasst'
                    @ '%s hat\'s dir gerade gezeigt.'
                    @ 'Präsentiert von %s'
                    @ '%s bekommt seine Rache.'
                    @ '%s hat\'s dir gezeigt'
                    @ '%s hat dir eine verpasst.'
                    @ 'Vielleicht magst du dir erst die Schuhabdrücke von %s aus dem Gesicht wischen?'
                    @ 'Willst du %s wirklich so davonkommen lassen?'
                    @ '%s grindet dir auf dem Gesicht herum.'
                    @ '%s begleitet dich nach draußen.'
                    @ 'Du wurdest kräftig von %s bearbeitet.'
                    @ 'Heutiger Schaukampf,\nmit freundlicher Genehmigung von %s'
                    @ '%s hat ein schönes Abschiedsgeschenk für dich'
                    @ '%s statuiert ein Exempel an dir.'
                    @ '%s hat das nicht so gewollt.'
                    @ '%s hat es dir ordentlich gegeben.'
                    @ '%s schlägt immer noch mal nach.'
                    @ '%s hat den Schmerz gebracht.'
                    @ '%s tut\'s dir gleich.'
                    @ '%s hämmert dir Vernunft ein.'
                    @ 'Dir wurde von %s\ndie Tür gezeigt.'
                    @ '%s hat dir eine Lehre erteilt.'
                    @ 'Kreide jemand anderen für %s an.'
                    @ '%s hat dich brutal behandelt.'
                    @ '%s ist ein wahrer Neversoft'
                    @ '%s hat dir gerade eine geknallt.'
                    @ 'Diesen Knaller präsentieren dir %s und die netten Leute bei Neversoft'
                    @ '%s hat dich in die Mangel genommen.'
                )
            else
                FormatText textname = msg_text s = <string0> Random (
                    @ 'Du wurdest von %s über den Haufen gefahren.'
                    @ 'Du wurdest von %s erdrückt.'
                    @ '%s hat dich überrollt.'
                    @ '%s hat dir die Fresse poliert.'
                    @ '%s hat dich in Straßenbelag verwandelt.'
                    @ 'Jetzt bleiben die Reifen von %s immer an dir kleben.'
                    @ '%s hat dich wie ein Hühnchen gerupft.'
                    @ '%s hat dich kalt erwischt.'
                    @ 'Du trägst die Windschutzscheibe von %s.'
                    @ '%s braucht ein bisschen Ausgleichssport, aber du brauchst einen neuen Körper.'
                    @ '%s hat dich übers Knie gelegt.'
                )
            endif
            create_net_panel_message text = <msg_text> generic_net_panel_message
        endif
    endif
    printf 'SkaterCollideBail 2'
    if InSlapGame
        BailSkaterTricks
        if NOT GotParam projectile
            MoveToRandomRestart
        endif
    endif
    if NOT walking
        goto NoseManualBail
    else
        goto WalkBailState
    endif
endscript

script Bail_FireFight_SkaterCollideBail 
    if NOT InTantrum
        if GotParam \{ fireball }
            goto SkaterCollideBail params = { string0 = <string0> }
        endif
    endif
endscript

script MadeOtherSkaterBail 
    if InNetGame
        if NOT GameModeEquals is_ctf
            if GotParam fireball
                FormatText textname = msg_text s = <string0> Random (
                    @*4 '\c2Du hast %s versengt'
                    @ '\c2%s ist geröstet'
                )
            else
                if GotParam projectile
                    FormatText textname = msg_text s = <string0> Random (
                        @*4 '\c2Du hast %s in die Mangel genommen.'
                        @ '\c2%s wurde getroffen.'
                    )
                else
                    FormatText textname = msg_text s = <string0> Random (
                        @*4 'Du hast %s eine verpasst'
                        @ 'Du hast es %s gegeben'
                        @ 'Du hast %s ganz schön zugesetzt'
                        @ 'Du hast gerade %s K.O. geschlagen.'
                        @ 'Du hast %s die letzte Ehre erwiesen.'
                        @ 'Du hast %s fallen lassen wie eine heiße Kartoffel'
                        @ '%s leckt für dich den Boden'
                        @ 'Du zeigst %s, wer der Meister ist'
                        @ '%s hat deine Skills zu spüren bekommen.'
                        @ '%s ist ein Anfänger.'
                        @ '%s ist gerade heulend zu Mami gerannt.'
                        @ '%s mag es nicht so schroff.'
                        @ 'Du hast gerade %s die Augen geöffnet!'
                    )
                endif
            endif
            create_net_panel_message text = <msg_text> style = net_team_panel_message_long
        endif
    endif
    OnGroundExceptions NoEndRun
    SetQueueTricks Jumptricks GroundTricks
    if NOT GotParam fireball
        if NOT GotParam projectile
            SetTrickName 'Kopfnuss'
            SetTrickScore 2000
            display Blockspin
            Skater_Playanim anim = SlapRight BlendPeriod = 0.3000
            obj_playsound BailSlap03
            WaitAnimWhilstChecking AndManuals
            LandSkaterTricks
        endif
    endif
    goto ongroundai
endscript

script MadeOtherSkaterBailAir 
    if NOT GotParam fireball
        if NOT GotParam projectile
            SetTrickName 'Kopfnuss'
            SetTrickScore 2000
            display Blockspin
        endif
    endif
    if InNetGame
        if NOT GameModeEquals is_ctf
            if GotParam fireball
                FormatText textname = msg_text s = <string0> Random (
                    @*4 '\c2Du hast %s versengt'
                    @ '\c2%s ist geröstet'
                )
            else
                if GotParam projectile
                    FormatText textname = msg_text s = <string0> Random (
                        @*4 '\c2Du hast %s in die Mangel genommen.'
                        @ '\c2%s wurde getroffen.'
                    )
                else
                    FormatText textname = msg_text 'Kopfnuss aus der Luft - für %s!' s = <string0>
                endif
            endif
            create_net_panel_message text = <msg_text> style = net_team_panel_message
        endif
    endif
    if NOT GotParam fireball
        if NOT GotParam projectile
            if DoingTrick
            else
                InAirExceptions
                Skater_Playanim anim = SlapAir BlendPeriod = 0.3000
                playsound BailSlap03
                WaitAnimWhilstChecking
                goto Airborne
            endif
        endif
    endif
endscript

script MadeOtherSkaterBail_Called 
    if NOT GotParam fireball
        if NOT GotParam projectile
            SetTrickName 'Kopfnuss'
            SetTrickScore 2000
            display Blockspin
        endif
    endif
    if InNetGame
        if NOT GameModeEquals is_ctf
            if GotParam fireball
                FormatText textname = msg_text s = <string0> Random (
                    @*4 '\c2Du hast %s versengt'
                    @ '\c2%s ist geröstet'
                )
            else
                if GotParam projectile
                    FormatText textname = msg_text s = <string0> Random (
                        @*4 '\c2Du hast %s in die Mangel genommen.'
                        @ '\c2%s wurde getroffen.'
                    )
                else
                    FormatText textname = msg_text 'Ohrfeige für %s!' s = <string0>
                endif
            endif
            create_net_panel_message text = <msg_text> style = net_team_panel_message
        endif
    endif
endscript

script MadeOtherSkaterBailWalk 
    if NOT GotParam fireball
        if NOT GotParam projectile
            if skater ::currentscorepotlessthan 1
                LandStraightAway = 1
            endif
            SetTrickName 'Fieser Schlag'
            SetTrickScore 2000
            display Blockspin
            if GotParam LandStraightAway
                LandSkaterTricks
            endif
        endif
    endif
    if InNetGame
        if NOT GameModeEquals is_ctf
            if GotParam fireball
                FormatText textname = msg_text s = <string0> Random (
                    @*4 '\c2Du hast %s versengt'
                    @ '\c2%s ist geröstet'
                )
            else
                if GotParam projectile
                    FormatText textname = msg_text s = <string0> Random (
                        @*4 '\c2Du hast %s in die Mangel genommen.'
                        @ '\c2%s wurde getroffen.'
                    )
                else
                    FormatText textname = msg_text 'Du hast %s einen Sucker-Punch verpasst!' s = <string0>
                endif
            endif
            create_net_panel_message text = <msg_text> style = net_team_panel_message
        endif
    else
    endif
    if NOT GotParam fireball
        if NOT IsTagging
            if NOT GotParam projectile
                if walk_ground
                    goto GroundPunchState
                else
                    if Walk_Air
                        goto AirPunchState
                    endif
                endif
            endif
        endif
    else
        goto GroundOrAirWaitState
    endif
endscript

script NetIdle 
endscript

script ChooseTeamMessage 
    create_net_panel_message \{ text = 'Die Teams wurden aufgestellt.\nWähl eins, indem du dir die Flagge schnappst.' style = generic_net_panel_message }
endscript

script server_enter_free_skate 
    if InTeamGame
        create_net_panel_message \{ text = 'Wähle ein Team, indem du dir eine Flagge schnappst.\nDrück START, um das Spiel zu beginnen.' style = generic_net_panel_message }
    else
        create_net_panel_message \{ text = 'Skate for Fun wird geladen.\nDrück START, um das Spiel zu beginnen.' style = generic_net_panel_message }
    endif
    if OnServer
        loadpendingplayers
    endif
endscript

script client_enter_free_skate 
    if NOT IsObserving
        if InTeamGame
            create_net_panel_message \{ text = 'Wähle ein Team, indem du dir eine Flagge schnappst.' style = generic_net_panel_message }
        else
            create_net_panel_message \{ text = 'Skate for Fun wird geladen.' style = generic_net_panel_message }
        endif
    endif
endscript
netmessageprops = {
    font = 'small.fnt'
    just = (0.0, 0.0)
    dims = (600.0, 112.0)
    colors = [
        { (50.0, 80.0, 128.0) alpha = 128 }
        { (128.0, 128.0, 128.0) alpha = 75 }
        { (110.0, 50.0, 50.0) alpha = 75 }
        { (180.0, 160.0, 0.0) alpha = 75 }
    ]
    key_points = [
        { Pos = (320.0, 250.0) alpha = 0 Scale = 0.2000 time = 0 }
        { alpha = 128 Scale = 1.010 time = 0.09000 }
        { alpha = 128 Scale = 1.010 time = 5 }
        { alpha = 0 Scale = 0.2000 time = 5.090 }
    ]
}
netstatusprops = {
    font = 'small.fnt'
    just = (0.0, 0.0)
    dims = (600.0, 112.0)
    colors = [
        { (128.0, 128.0, 128.0) alpha = 128 }
        { (50.0, 80.0, 128.0) alpha = 75 }
        { (110.0, 50.0, 50.0) alpha = 75 }
        { (180.0, 160.0, 0.0) alpha = 75 }
    ]
    key_points = [
        { Pos = (320.0, 285.0) alpha = 0 Scale = 0.2000 time = 0 }
        { alpha = 128 Scale = 1.010 time = 0.09000 }
        { alpha = 128 Scale = 1.010 time = 5 }
        { alpha = 0 Scale = 0.2000 time = 5.090 }
    ]
}
netexceptionprops = {
    font = 'small.fnt'
    just = (0.0, 0.0)
    dims = (600.0, 112.0)
    colors = [
        { (128.0, 128.0, 128.0) alpha = 128 }
        { (50.0, 80.0, 128.0) alpha = 75 }
        { (110.0, 50.0, 50.0) alpha = 75 }
        { (180.0, 160.0, 0.0) alpha = 75 }
    ]
    key_points = [
        { Pos = (320.0, 305.0) alpha = 0 Scale = 0.2000 time = 0 }
        { alpha = 128 Scale = 1.010 time = 0.09000 }
        { alpha = 128 Scale = 1.010 time = 5 }
        { alpha = 0 Scale = 0.2000 time = 5.090 }
    ]
}
chat1props = {
    font = 'small.fnt'
    just = (0.0, 0.0)
    dims = (600.0, 112.0)
    colors = [
        { (50.0, 80.0, 128.0) alpha = 128 }
        { (180.0, 160.0, 0.0) alpha = 75 }
        { (110.0, 50.0, 50.0) alpha = 75 }
        { (128.0, 128.0, 128.0) alpha = 75 }
    ]
    key_points = [
        { Pos = (320.0, 150.0) alpha = 0 Scale = 0.2000 time = 0 }
        { alpha = 128 Scale = 1.010 time = 0.09000 }
        { alpha = 128 Scale = 1.010 time = 5 }
        { alpha = 0 Scale = 0.2000 time = 5.090 }
    ]
}
chat2props = {
    font = 'small.fnt'
    just = (0.0, 0.0)
    dims = (600.0, 112.0)
    colors = [
        { (50.0, 80.0, 128.0) alpha = 128 }
        { (180.0, 160.0, 0.0) alpha = 75 }
        { (110.0, 50.0, 50.0) alpha = 75 }
        { (128.0, 128.0, 128.0) alpha = 75 }
    ]
    key_points = [
        { Pos = (320.0, 170.0) alpha = 0 Scale = 0.2000 time = 0 }
        { alpha = 128 Scale = 1.010 time = 0.09000 }
        { alpha = 128 Scale = 1.010 time = 5 }
        { alpha = 0 Scale = 0.2000 time = 5.090 }
    ]
}
chat3props = {
    font = 'small.fnt'
    just = (0.0, 0.0)
    dims = (600.0, 112.0)
    colors = [
        { (50.0, 80.0, 128.0) alpha = 128 }
        { (180.0, 160.0, 0.0) alpha = 75 }
        { (110.0, 50.0, 50.0) alpha = 75 }
        { (128.0, 128.0, 128.0) alpha = 75 }
    ]
    key_points = [
        { Pos = (320.0, 190.0) alpha = 0 Scale = 0.2000 time = 0 }
        { alpha = 128 Scale = 1.010 time = 0.09000 }
        { alpha = 128 Scale = 1.010 time = 5 }
        { alpha = 0 Scale = 0.2000 time = 5.090 }
    ]
}
chat4props = {
    font = 'small.fnt'
    just = (0.0, 0.0)
    dims = (600.0, 112.0)
    colors = [
        { (50.0, 80.0, 128.0) alpha = 128 }
        { (180.0, 160.0, 0.0) alpha = 75 }
        { (110.0, 50.0, 50.0) alpha = 75 }
        { (128.0, 128.0, 128.0) alpha = 75 }
    ]
    key_points = [
        { Pos = (320.0, 210.0) alpha = 0 Scale = 0.2000 time = 0 }
        { alpha = 128 Scale = 1.010 time = 0.09000 }
        { alpha = 128 Scale = 1.010 time = 5 }
        { alpha = 0 Scale = 0.2000 time = 5.090 }
    ]
}
chat5props = {
    font = 'small.fnt'
    just = (0.0, 0.0)
    dims = (600.0, 112.0)
    colors = [
        { (50.0, 80.0, 128.0) alpha = 128 }
        { (180.0, 160.0, 0.0) alpha = 75 }
        { (110.0, 50.0, 50.0) alpha = 75 }
        { (128.0, 128.0, 128.0) alpha = 75 }
    ]
    key_points = [
        { Pos = (320.0, 230.0) alpha = 0 Scale = 0.2000 time = 0 }
        { alpha = 128 Scale = 1.010 time = 0.09000 }
        { alpha = 128 Scale = 1.010 time = 5 }
        { alpha = 0 Scale = 0.2000 time = 5.090 }
    ]
}
net_error_msg = 'Fehler'
net_notice_msg = "Notiz"
net_status_msg = 'Status'
net_refused_msg = 'Abgelehnt'
net_warning_msg = 'Warnung'
net_question_are_you_sure = 'Bist du sicher?'
net_question_are_you_sure_block = 'Möchtest du Anfragen zur Liste der Freunde von %s immer blockieren?'
net_question_are_you_sure_remove = 'Möchtest du Spieler %s wirklich entfernen?'
net_answer_yes = 'Ja'
net_answer_no = 'Nein'
net_answer_ok = 'OK'
net_answer_cancel = 'Zurück'
net_answer_play = 'Spielen'
net_answer_stop = 'Anhalten'
net_answer_send_feedback = 'Feedback senden'
net_friends_accepted_invitation = 'Angenommene Einladung'
net_friends_accept_invitation = "Einladung annehmen"
net_friends_attach_voice = "Sprachnachricht einfügen"
net_friends_decline_invitation = "Einladung ablehnen"
net_friends_cancel_invitation = "Spieleinladung widerrufen"
net_friends_listen_to_message = "Sprachmitteilung anhören"
net_friends_join_friend = 'Freund beitreten'
net_friends_eject_disc = "Bitte wirf deine Spiel-CD aus und lege folgende Spiel-CD ein:"
net_friends_send_complaint = 'Beschwerde senden'
net_friends_block_requests = 'Anfragen blockieren: '
net_friends_invite = "Freund einladen"
net_friends_remove = "Freund entfernen"
net_friends_join = "Freund beitreten"
net_friends_block = "Immer blockieren"
net_friend_status_received_request = "Freundesanfrage erhalten"
net_friend_status_sent_request = "Freundesanfrage senden"
net_friend_status_friend = "Freund"
net_friend_status_offline = "Offline"
net_friend_status_online = "Online in"
net_friend_status_available = "Verfügbar in"
net_friend_status_playing = "Spiel in"
net_friend_status_wants_to_play = "Will spielen"
net_friend_status_invited_to_play = "Zum Spiel eingeladen"
net_friend_status_wants_friendship = "Möchte dein Freund sein."
net_friend_status_you_want_friend = "Du hast dir selbst eine Freundesanfrage gesendet"
net_friend_status_voice_muted = "Sprachausgabe: stumm"
net_friend_status_voice_on = "Sprachausgabe: ein"
net_friend_status_voice_tv = "Sprachausgabe  über Fernseher"
net_title_up = '(OBEN)'
net_title_down = '(UNTEN)'
net_title_remove = 'Entfernen'
net_title_confirm_compaint = "Willst du diese Beschwerde über Spieler %s wirklich senden?"
net_title_feedback = 'Feedback'
net_title_select_feedback = 'Bitte wähle dein Feedback für\n\''
net_title_complaints = "-----Beschwerden-----"
net_title_cursing = "Fluchen oder Anzüglichkeiten"
net_title_screaming = "Schreien"
net_title_offensive_msg = "Beleidigende Nachricht"
net_title_threats = "Drohung oder Belästigung"
net_title_voice_message = "Sprachmitteilung"
net_title_friends_menu = 'Freundesmenü'
net_title_accept_friend_request = 'Nimmst du die Freundesanfrage an von'
net_title_cancel_friend_request = 'Möchtest du die Freundesanfrage widerrufen für '
net_title_attach_voice = "Möchtest du diese Einladung mit einer Sprachmitteilung schicken?"
net_error_device_not_hot = 'Das Netzwerk-Kabel ist nicht angeschlossen. Bitte überprüfen Sie Ihre Netzwerk-Kabel und versuchen Sie es erneut.'
net_error_not_connected = 'Kein Zugang zum externen Netzwerk-Gerät. Bitte überprüfe alle Verbindungen und versuche es erneut.'
net_error_not_detected = 'Die unterstützte Hardware ist nicht richtig mit dem System verbunden.'
net_error_dhcp_error = 'Kein Zugang zum externen Netzwerk-Gerät. Bitte überprüfe alle Verbindungen und versuche es erneut.'
net_error_changed_device = 'Du hast die Netzwerk-Gerät-Einstellungen geändert und musst dein System neu starten, um die Änderungen wirksam zu machen.'
net_error_device_error = 'Es wurde kein Netzwerkadapter (Ethernet) (für PlayStation®2) erkannt. Du kannst dieses Spiel nicht spielen.'
net_error_general_error = 'Dein Netzwerk-Gerät ist nicht richtig konfiguriert oder möglicherweise nicht richtig angeschlossen.  Weitere Tipps zur Problembehebung findest du im THUG2-Handbuch.'
net_error_cant_change_device = 'Du musst dein System neu starten, bevor du diese Option änderst.'
net_error_cant_load_settings = 'Um die von deiner Netzwerkkonfiguration verwendete Hardware zu ändern, musst du das Spiel neu starten.'
net_error_unplugged = "Die Verbindung zum Netzwerk wurde getrennt. Stell die Verbindung wieder her, um das Online-Spiel fortzusetzen."
net_error_unplugged_front_end = "Die Verbindung zum Netzwerk wurde getrennt. Bestätige, um zum Hauptmenü zurückzukehren."
net_error_unplugged_ps2 = "Kein Zugang zum externen Netzwerk-Gerät. Bitte überprüfe alle Verbindungen und versuche es erneut."
net_error_unplugged_front_end_ps2 = "Kein Zugang zum externen Netzwerk-Gerät. Bitte überprüfe alle Verbindungen und versuche es erneut."
net_error_lost_gamespy_connection = "Deine Verbindung zu GameSpy wurde getrennt. Überprüfe deine Netzwerk-Kabel oder beende und versuch es erneut."
net_error_no_net_configs = 'Deine Netzwerkkonfigurationsdatei wurde nicht gefunden. Um deine Netzwerkkonfigurationsdatei zu erstellen, zu bearbeiten oder zu löschen, benutze bitte die Network Access Disc (CD für den Netzwerkzugang).'
net_error_no_useful_configs = 'Diese Netzwerkkonfiguration ist unzulässig und kann nicht verwendet werden.'
net_error_invalid_irx = 'Invalid IRX'
net_error_failed_msg_retrieval = 'Sprachmitteilung konnte nicht abgerufen werden.'
net_reason_full_observers = 'Der Host lässt momentan keine weiteren Zuschauer zu.'
net_reason_banned = "Du wurdest von dieser Sitzung ausgeschlossen."
net_reason_full = "Diese Sitzung ist voll."
net_reason_wrong_password = "Ungültiges Passwort"
net_reason_version = "Inkompatible Version"
net_reason_rank_limit_high = "Dein Spielerrang ist zu hoch, um diesem Spiel beizutreten."
net_reason_rank_limit_low = "Dein Spielerrang ist zu niedrig, um diesem Spiel beizutreten."
net_reason_general = "Verbindung abgelehnt"
net_reason_default = "Verbindung konnte nicht hergestellt werden. Bitte versuch es noch mal."
net_message_goals_next_level = 'Diese neuen Ziele sind erst spielbar, wenn du den Level wechselst oder diesen Level neu lädtst.'
net_message_game_in_progress = 'Das Spiel läuft bereits. Möchtest du die restliche Spielzeit zuschauen und hinterher automatisch einsteigen?'
net_message_game_in_progress_refused = 'Das Spiel läuft bereits. Um einzusteigen, musst du warten, bis es fertig ist.'
net_message_waiting_for_players = 'Einige Spieler sind noch nicht bereit. Möchtest du auf sie warten?'
net_message_server_removed_you = 'Der Host will dich aus dem Spiel entfernen. Drück \m0, um zum Hauptmenü zurückzukehren.'
net_message_server_moved_on = 'Der Host hat beschlossen, das Spiel ohne dich zu starten. Drück \m0, um zum Hauptmenü zurückzukehren.'
net_message_waiting = 'Warte auf Verbindung vom Host ...'
net_message_no_servers_found = "Kein Server gefunden"
net_message_new_king_other = '%s0 ist der Lord of the Board!'
net_message_new_king_you = 'Du bist der Lord of the Board!'
net_message_new_player = "%s0 tritt dem Spiel bei"
net_message_dropped_crown_you = "Du hast deine Krone verloren!"
net_message_dropped_crown_other = "Der Lord hat die Krone verloren!"
net_message_dropped_gold_you = "Du hast den Goldkessel fallen gelassen!"
net_message_dropped_gold_other = "Der Goldkessel wurde fallen gelassen!"
net_message_changing_levels = "Mach dich bereit! Neuer Level ist %s0."
net_message_game_will_start = 'Das Spiel beginnt, wenn alle Spieler fertig geladen sind.'
net_message_join_pending = "%s0 wartet auf Beitritt."
net_message_observing = "%s0 ist jetzt Zuschauer."
net_message_joining = "%s0 ist ins Spiel eingestiegen."
net_message_starting_game = "Mach dich bereit!\nNeues Spiel wird gestartet ..."
net_message_auto_starting_game = "Mach dich bereit!\nDer Auto-Server startet ein neues Spiel ..."
net_message_server_cheating = "Warnung! Der Host hat Cheat-Codes aktiviert!"
net_message_flag_base_warning = "Um Punkte zu machen, muss dein Team erst deine Flagge zurückholen!"
net_message_player_quit = "%s0 hat das Spiel verlassen."
net_message_player_timed_out = "Die Zeit von %s0 ist abgelaufen."
net_message_player_now_observing = "%s0 ist Zuschauer"
net_message_player_kicked = "%s0 wurde aus dem Spiel entfernt."
net_message_player_banned = "%s0 wurde vom Spiel ausgeschlossen."
net_message_player_left_out = "Der Host hat %s0 aus dem Spiel geworfen."
net_message_player_dropped = "%s0 wurde aufgrund einer schlechten Verbindung rausgeworfen."
net_status_please_wait = "Bitte warten ..."
net_status_locating = 'Verbindung zum Host wird hergestellt. Bitte warten ...'
net_status_connecting = 'Verbindung wird hergestellt ...'
net_status_joining = 'Spiel beitreten ...'
net_status_trying_password = 'Teste Passwort ...'
net_status_lost_connection = "Deine Verbindung zum Host wurde unterbrochen. Drück die X-Taste, um zum Hauptmenü zurückzukehren."
net_status_server_quit = "Der Host hat das Spiel verlassen. Drück die X-Taste, um zum Hauptmenü zurückzukehren."
net_status_join_timeout = 'Diese Sitzung ist nicht mehr verfügbar.'
net_status_join_failed = 'Du konntest dem Spiel nicht beitreten. Aktualisiere deine Spielliste und versuch es noch mal.'
net_status_not_posted = 'Dein Spiel wurde nicht auf GameSpy gepostet. Überprüfe deine Netzwerk-Kabel sowie gegebenenfalls die Firewall-Einstellungen.'
net_status_checking_motd = 'Verbindungsaufbau zum Master-Server ...'
net_status_retry_motd = "Erneuter Verbindungsaufbau zum Master-Server ..."
net_status_getting_lobbies = 'Abruf der Lobby-Liste ...'
net_status_connecting_chat = 'Verbindungsaufbau zum Chat-Server ...'
net_status_gamespy_no_dns = 'Keine Verbindung zu GameSpy. Überprüfe die Gateway- und/oder Firewall-Einstellungen. Tipps zur Problembehebung findest du im THAW-Handbuch.'
net_status_gamespy_no_connect = 'Verbindung zu GameSpy konnte nicht hergestellt werden. Überprüfe deine Verbindung und Einstellungen. Weitere Tipps zur Problembehebung findest du im THAW-Handbuch.'
net_status_gamespy_lost_connection = 'Deine Verbindung zu GameSpy wurde getrennt. Überprüfe deine Netzwerk-Kabel und versuch es erneut.'
net_status_live_lost_connection = 'Du hast die Verbindung zu Xbox Live verloren.'
net_status_live_lost_connection_dupe = 'Sie wurden bei Xbox Live abgemeldet, da sich jemand anderes mit diesen Kontoinformationen angemeldet hat.'
net_status_motd_failed = 'Keine Verbindung zum Master-Server.'
net_status_not_available = 'THAW-Online-Spiel ist vorübergehend nicht verfügbar. Bitte versuch es später noch mal.'
net_status_never_available = 'Das THAW-Online-Spiel ist nicht mehr verfügbar.'
net_status_login_error = 'GameSpy-Profil kann nicht authentifiziert werden. Möchtest du ohne Profil fortfahren? Highscore- und Freundesliste sind dann deaktiviert.'
net_status_buddy_login_failed = 'Keine Verbindung zum Server'
net_status_stats_login_failed = 'Keine Verbindung zum Stats-Server.'
net_status_stats_retrieval_failed = 'Stats konnten nicht abgerufen werden.'
net_status_testing_settings = 'Verbindet mit dem Netzwerk ...'
net_status_need_to_setup = 'Du musst noch dein Netzwerk-Gerät und eine Verbindung einrichten. Möchtest du dies jetzt tun?'
net_status_need_to_setup_dialup = 'Du musst noch deine Verbindungseinstellungen einrichten. Möchtest du dies jetzt tun?'
net_status_nat_neg_failed = 'Verbindung zum Host konnte nicht hergestellt werden. Aktualisiere deine Spieleliste und versuch es noch mal.'
net_status_need_to_choose_combo = 'Du musst noch deine Netzwerkkonfiguration wählen. Möchtest du dies jetzt tun?'
net_modem_state_dialing = 'Wähle ...'
net_modem_state_connected = 'Authentifiziert Benutzerkennung und Passwort ...'
net_modem_state_logged_in = 'Verbunden'
net_modem_state_disconnecting = 'Trennt Verbindung mit Netzwerk .'
net_modem_state_hanging_up = 'Trennt Verbindung mit Netzwerk .'
net_modem_state_disconnected = 'Nicht verbunden.'
net_modem_state_conencting = 'Verbindet mit dem Netzwerk ...'
net_modem_state_redial_pause = 'Besetzt. Wählt eine andere Telefonnummer ...'
net_modem_error_no_modem = 'Kein kompatibles Modem angeschlossen.'
net_modem_error_timeout = 'Konnte Benutzerkennung und Passwort nicht authentifizieren. Bitte überprüfe deine Netzwerkkonfiguration und versuche es erneut.'
net_modem_error_busy = 'Die gewählte Telefonnummer ist belegt.'
net_modem_error_no_connect = 'Konnte Benutzerkennung und Passwort nicht authentifizieren. Bitte überprüfe deine Netzwerkkonfiguration und versuche es erneut.'
net_modem_error_no_dialtone = 'Kein Wählton. Stell sicher, dass eine Verbindung zum Telefonnetz besteht.'
net_modem_error_during_connect = 'Konnte Benutzerkennung und Passwort nicht authentifizieren. Bitte überprüfe deine Netzwerkkonfiguration und versuche es erneut.'
net_modem_error_during_connect_ync = 'Konnte Benutzerkennung und Passwort nicht authentifizieren. Bitte überprüfe deine Netzwerkkonfiguration und versuche es erneut.'
net_friends_list = 'Freundesliste'
homie_status_online = 'Online'
homie_status_logging_in = 'Anmelden ...'
homie_status_offline = 'Offline'
homie_status_chatting = 'Am chatten'
homie_status_observing = 'Zuschauer'
homie_status_playing = 'Am Spielen'
homie_status_hosting = 'Host'
lobby_status_joined = 'hat den Raum betreten'
lobby_status_left = 'hat den Raum verlassen'
score_title_trick_attack = "Pkt."
score_title_graffiti = "Tags"
score_title_king = "Zeit"
score_title_slap = "Slaps"
net_lobby_full = 'VOLL'
sort_title_list = "Serverliste"
sort_title_name = "Name"
sort_title_ping = "Ping"
sort_title_players = "Spieler"
sort_title_observers = "Zuschauer"
sort_title_mode = "Modus"
sort_title_level = "Level"
sort_title_skill = "Schwierigkeit"
sort_title_ranked = "Ranked"
lobby_full_title = "Voll"
lobby_lan_title = "LAN-Spiele"
net_lobby_chat_msg = "%s0"
team_1_name = 'Rot'
team_2_name = 'Blau'
team_3_name = 'Grün'
team_4_name = 'Yellow'
total_str = 'Total'
category_all_levels = 'Alle Level'
manual_settings_str = 'Manuelle Einstellungen'
net_error_file_not_found = 'Die Datei wurde nicht gefunden, bitte überprüfe, ob der Key richtig eingegeben wurde.'
net_error_server_error = 'Konnte gewählte Datei nicht runterladen. Möglicherweise besteht keine Verbindung zum Server. Bitte versuch es später noch einmal.'
net_error_general = 'Der Server gewährt keinen Dateizugang.'
net_auth_msg = 'Prüft DNAS-Daten ...'
net_auth_error_server_busy = 'Der Netzwerk-Authentifikations-Server ist beschäftigt. Bitte versuch es später wieder.'
net_auth_error_before_service = 'Dieser Software-Titel ist nicht verfügbar.'
net_auth_error_out_of_service = 'Dieser Software-Titel ist nicht verfügbar.'
net_auth_error_end_of_service = 'Der Netzwerk-Authentifikations-Server ist nicht verfügbar.'
net_auth_error_time_out = 'Verbindungszeit mit dem Netzwerk-Authentifikations-Server ist abgelaufen. Bitte versuchen Sie es später wieder.'
net_auth_error_invalid_server = 'Ein Netzwerk-Authentifikations-Systemfehler ist aufgetreten.'
net_auth_error_internal = 'Ein Netzwerk-Authentifikations-Systemfehler ist aufgetreten.'
net_auth_error_external = 'Ein Netzwerk-Authentifikations-Systemfehler ist aufgetreten.'
net_auth_error_download = 'Ein Netzwerkfehler ist aufgetreten.'
net_auth_error_machine = 'Ein PlayStation®2-Hardware-Informationsfehler ist aufgetreten.'
net_auth_error_disc = 'Ein PlayStation®2-DVD/CD-ROM-Informationsfehler ist aufgetreten.'
net_auth_err_glue_abort = 'Die Netzwerkverbindung wurde abgebrochen.'
net_auth_err_net_proxy = 'Fehler in der Proxy-Einstellung'
net_auth_err_net_timeout = 'Verbindungszeit abgelaufen. Bitte versuch es später noch einmal.'
net_auth_err_net_dns_host_not_found = 'Fehler in der Antwort vom DNS-Server. Bitte überprüfe deine Netzwerkkonfiguration.'
net_auth_err_net_dns_try_again = 'Keine Antwort vom DNS-Server. Bitte überprüfe deine Netzwerkkonfiguration.'
net_auth_err_net_dns_others = 'Ein DNS-Fehler ist aufgetreten. Bitte überprüfe deine Netzwerkkonfiguration.'
net_auth_err_net_conn_failed = 'Die Verbindung zum DNAS-Server konnte nicht hergestellt werden.'
net_auth_error_network = 'Ein Verbindungsfehler ist aufgetreten.'
net_auth_error_unique = 'Ein Software-Kategorie-Fehler ist aufgetreten.'
net_auth_error_generic = 'Ein Authentifikationsfehler ist aufgetreten.'
net_auth_footer_contact = 'Sollte dieses Problem weiterhin bestehen, kontaktiere bitte deinen zuständigen Kundendienst unter der im Software-Handbuch angegebenen Telefonnummer.'
net_auth_footer_network = 'Bitte prüfe deine Netzwerkverbindung und/oder deine Netzwerkkonfiguration.'
net_auth_footer_empty = ''
net_auth_footer_service_pal = 'Bitte überprüfe die Start- und Enddaten dieses Online-Titels auf PlayStation.de.'
net_auth_footer_central_pal = 'Für weitere Informationen gehe bitte auf PlayStation.com.'
net_auth_footer_cont_customer_pal = 'Sollte dieses Problem weiterhin bestehen, kontaktieren Sie bitte Ihren zuständigen Kundendienst unter der im Software-Handbuch angegebenen Telefonnummer.'
net_auth_footer_customer_pal = 'Für weitere Informationen kontaktieren Sie bitte Ihren zuständigen Kundendienst unter der im Software-Handbuch angegebenen Telefonnummer.'
net_auth_footer_clean_pal = 'Versuche, deine DVD/CD-ROM zu säubern. Anleitungen dazu findest du auf der Network Access Disc (CD für den Netzwerkzugang) oder auf PlayStation.com. Sollte dieses Problem weiterhin bestehen, kontaktiere bitte deinen zuständigen Kundendienst unter der im Software-Handbuch angegebenen Telefonnummer.'
net_auth_footer_network_pal = 'Bitte prüfe deine Netzwerkverbindung und/oder deine Netzwerkkonfiguration. Weitere Informationen befinden sich auf der Network Access Disc (CD für den Netzwerkzugang).'
net_auth_header_dnas = 'DNAS-Fehler'
net_auth_header_network = 'Netzwerkfehler'

script joined_team_you 
    printf \{ 'join team you' }
    FormatText textname = msg_text 'Du bist Team %s beigetreten.' s = <string0>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript

script net_team_panel_message 
    playsound HUD_specialtrickAA vol = 100
    DoMorph Pos = (320.0, 204.0) Scale = 0 time = 0 alpha = 0
    DoMorph Pos = (320.0, 204.0) Scale = 1.500 time = 0.1000 alpha = 0.9000
    DoMorph Pos = (320.0, 204.0) Scale = 0.7000 time = 0.1000
    DoMorph Pos = (320.0, 204.0) Scale = 1.100 time = 0.1000
    DoMorph Pos = (320.0, 204.0) Scale = 0.9000 time = 0.1000
    DoMorph Pos = (321.0, 205.0) time = 0.1000
    DoMorph Pos = (321.0, 205.0) time = 0.1000
    DoMorph Pos = (319.0, 203.0) time = 0.1000
    DoMorph Pos = (321.0, 205.0) time = 0.1000
    DoMorph Pos = (319.0, 203.0) time = 0.1000
    DoMorph Pos = (321.0, 205.0) time = 0.1000
    DoMorph Pos = (319.0, 203.0) time = 0.1000
    DoMorph Pos = (321.0, 205.0) time = 0.1000
    DoMorph alpha = 0 time = 0.3000
    Die
endscript

script net_team_panel_message_long 
    playsound HUD_specialtrickAA vol = 100
    DoMorph Pos = (320.0, 204.0) Scale = 0 time = 0 alpha = 0
    DoMorph Pos = (320.0, 204.0) Scale = 1.500 time = 0.1000 alpha = 0.9000
    DoMorph Pos = (320.0, 204.0) Scale = 0.7000 time = 0.1000
    DoMorph Pos = (320.0, 204.0) Scale = 1.100 time = 0.1000
    DoMorph Pos = (320.0, 204.0) Scale = 0.9000 time = 0.1000
    DoMorph Pos = (321.0, 205.0) time = 0.1000
    DoMorph Pos = (321.0, 205.0) time = 0.1000
    DoMorph Pos = (319.0, 203.0) time = 0.1000
    DoMorph Pos = (321.0, 205.0) time = 0.1000
    DoMorph Pos = (321.0, 205.0) time = 0.1000
    DoMorph Pos = (321.0, 205.0) time = 0.1000
    DoMorph Pos = (319.0, 203.0) time = 0.1000
    DoMorph Pos = (321.0, 205.0) time = 0.1000
    DoMorph Pos = (321.0, 205.0) time = 0.1000
    DoMorph Pos = (321.0, 205.0) time = 0.1000
    DoMorph alpha = 0 time = 0.3000
    Die
endscript

script generic_net_panel_message 
    DoMorph Pos = (320.0, 204.0) Scale = 0 time = 0 alpha = 0
    DoMorph Pos = (320.0, 204.0) Scale = 1.500 time = 0.1000 alpha = 0.9000
    DoMorph Pos = (320.0, 204.0) Scale = 0.7000 time = 0.1000
    DoMorph Pos = (320.0, 204.0) Scale = 1.100 time = 0.1000
    DoMorph Pos = (320.0, 204.0) Scale = 0.9000 time = 0.1000
    DoMorph Pos = (321.0, 205.0) time = 0.1000
    DoMorph Pos = (321.0, 205.0) time = 0.1000
    DoMorph Pos = (319.0, 203.0) time = 0.1000
    DoMorph Pos = (321.0, 201.0) time = 0.1000
    DoMorph Pos = (321.0, 205.0) time = 0.1000
    DoMorph Pos = (321.0, 205.0) time = 0.1000
    DoMorph Pos = (319.0, 203.0) time = 0.1000
    DoMorph Pos = (324.0, 205.0) time = 0.1000
    DoMorph Pos = (321.0, 205.0) time = 0.1000
    DoMorph Pos = (321.0, 205.0) time = 0.1000
    DoMorph Pos = (319.0, 203.0) time = 0.1000
    DoMorph Pos = (321.0, 205.0) time = 0.1000
    DoMorph Pos = (321.0, 205.0) time = 0.1000
    DoMorph Pos = (321.0, 207.0) time = 0.1000
    DoMorph Pos = (319.0, 203.0) time = 0.1000
    DoMorph Pos = (321.0, 205.0) time = 0.1000
    DoMorph Pos = (317.0, 203.0) time = 0.1000
    DoMorph Pos = (321.0, 205.0) time = 0.1000
    DoMorph Pos = (321.0, 205.0) time = 0.1000
    DoMorph Pos = (321.0, 205.0) time = 0.1000
    DoMorph Pos = (319.0, 203.0) time = 0.1000
    DoMorph Pos = (321.0, 205.0) time = 0.1000
    DoMorph alpha = 0 time = 0.6000
    Die
endscript

script joined_team_other 
    FormatText textname = msg_text '%s ist Team %w beigetreten.' s = <string0> w = <string1>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript
