
script ScavengerHuntOneObjectLeftOther 
    FormatText textname = msg_text '%s only needs one more object!' s = <name>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript

script ScavengerHuntOneObjectLeftYou 
    create_net_panel_message \{ text = 'You only need one more object!' style = net_team_panel_message }
endscript

script ScavengerHuntFiveObjectsLeftOther 
    FormatText textname = msg_text '%s only needs 5 more objects!' s = <name>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript

script ScavengerHuntFiveObjectsLeftYou 
    create_net_panel_message \{ text = 'You only need five more objects!' style = net_team_panel_message }
endscript

script ScavengerHuntOneObjectLeftOtherTeam 
    FormatText textname = msg_text 'Team %s only needs one more object!' s = <name>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript

script ScavengerHuntFiveObjectsLeftOtherTeam 
    FormatText textname = msg_text 'Team %s only needs 5 more objects!' s = <name>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript

script newscoreleaderyou 
    if InNetGame
        create_net_panel_message \{ text = 'You have taken the lead!' style = net_team_panel_message }
    endif
endscript

script newscoreleaderother 
    if InNetGame
        FormatText textname = msg_text '%s has taken the lead!' s = <string0>
        create_net_panel_message text = <msg_text> style = net_team_panel_message
    endif
endscript

script EliminatedNone 
    create_net_panel_message \{ text = 'No one was eliminated this round!' style = net_team_panel_message }
endscript

script EliminatedYou 
    if InNetGame
        TantrumMessageHide
        pause_trick_text
        create_net_panel_message \{ text = 'You have been eliminated! Press \b3 to observe other players.' style = net_team_panel_message }
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
        FormatText textname = msg_text '%s has been eliminated!' s = <string0>
        create_net_panel_message text = <msg_text> style = net_team_panel_message
        if NOT OnServer
            CheckForElimiskateGameOver
        endif
    endif
endscript

script NewKingOther 
    if InNetGame
        FormatText textname = msg_text '%s is king of the hill!' s = <string0>
        create_net_panel_message text = <msg_text> style = net_team_panel_message
    else
        playsound \{ HUD_specialtrickAA vol = 100 }
    endif
endscript

script NewGoldOwnerOther 
    if InNetGame
        FormatText textname = msg_text '%s has the gold!' s = <string0>
        create_net_panel_message text = <msg_text> style = net_team_panel_message
    else
        playsound \{ HUD_specialtrickAA vol = 100 }
    endif
endscript

script NewKingYou 
    if InNetGame
        FormatText \{ textname = msg_text 'Long live the King!' }
        create_net_panel_message text = <msg_text> style = net_team_panel_message
    else
        playsound \{ HUD_specialtrickAA vol = 100 }
    endif
endscript

script NewGoldOwnerYou 
    if InNetGame
        FormatText \{ textname = msg_text 'Time to score!' }
        create_net_panel_message text = <msg_text> style = net_team_panel_message
    else
        playsound \{ HUD_specialtrickAA vol = 100 }
    endif
endscript

script NewScoreLeaderYourTeam 
    if InNetGame
        create_net_panel_message \{ text = 'Your team has taken the lead!' style = net_team_panel_message }
    endif
endscript

script NewScoreLeaderOtherTeam 
    if InNetGame
        FormatText textname = msg_text 'Team %s has taken the lead!' s = <string0>
        create_net_panel_message text = <msg_text> style = net_team_panel_message
    endif
endscript

script timer_runout_beep 
    playsound \{ TimeoutA vol = 75 pitch = 110 }
endscript

script GraffitiStealYou 
    if InNetGame
        FormatText textname = msg_text 'You stole from %s!' s = <string0>
        create_net_panel_message text = <msg_text> style = net_team_panel_message
    endif
endscript

script GraffitiStealOther 
    if InNetGame
        FormatText textname = msg_text '%s stole from you!' s = <string0>
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
                    @ 'You got smacked by %s'
                    @ '%s just laid the smack down on you'
                    @ 'Brought to you by %s'
                    @ '%s gets his revenge'
                    @ '%s shows you to the kiddie park'
                    @ '%s kicked you in the junk'
                    @ 'Might want to clean %s\'s shoe prints off your face'
                    @ 'Are you gonna let %s get away with that?'
                    @ '%s grinds your face'
                    @ '%s escorts you to the floor'
                    @ 'You got worked by %s'
                    @ 'Today\'s beat-down,\ncourtesy of %s'
                    @ '%s offers you lovely parting gifts'
                    @ '%s makes an example of you'
                    @ '%s didn\'t really mean to do that'
                    @ '%s let you have it'
                    @ '%s adds insult to injury'
                    @ '%s brought the pain'
                    @ '%s levels you'
                    @ '%s knocks some sense into you'
                    @ 'You have been shown the door\nby %s'
                    @ '%s schooled you'
                    @ 'Chalk another one up for %s'
                    @ '%s brutalized you'
                    @ '%s is never soft'
                    @ '%s just kicked your nads'
                    @ 'This smack brought to you by %s and the friendly people at Neversoft'
                    @ 'You were OWN3D by %s'
                )
            else
                FormatText textname = msg_text s = <string0> Random (
                    @ 'You got run over by %s'
                    @ 'You got squashed by %s'
                    @ 'You got flattened by %s'
                    @ 'You got smushed by %s'
                    @ '%s turned you into road kill'
                    @ 'You\'re making %s\'s tires all sticky'
                    @ '%s squashed you like squirrel'
                    @ '%s peeled out on your forehead'
                    @ 'You\'re wearing %s\'s windshield'
                    @ '%s might need some body work, but you need a new body'
                    @ '%s put you over the hood'
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
                    @*4 '\c2You just flamed %s'
                    @ '\c2%s got roasted'
                )
            else
                if GotParam projectile
                    FormatText textname = msg_text s = <string0> Random (
                        @*4 '\c2You just nailed %s'
                        @ '\c2%s got beaned'
                    )
                else
                    FormatText textname = msg_text s = <string0> Random (
                        @*4 'You smacked %s'
                        @ 'You punked %s'
                        @ 'You shanked %s'
                        @ 'You just K.O.\'d %s'
                        @ 'You read %s his last rights'
                        @ 'You dropped %s like a bad habit'
                        @ 'You made %s lick the floor'
                        @ 'You are %s\'s daddy'
                        @ '%s got a taste of j00r 1337 $xi11z'
                        @ '%s is a n00b'
                        @ '%s just ran cryin\' to mommy'
                        @ '%s doesn\'t like to play that rough'
                        @ 'You just opened %s\'s eyes to a whole new world'
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
            SetTrickName 'Head Smack'
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
            SetTrickName 'Head Smack'
            SetTrickScore 2000
            display Blockspin
        endif
    endif
    if InNetGame
        if NOT GameModeEquals is_ctf
            if GotParam fireball
                FormatText textname = msg_text s = <string0> Random (
                    @*4 '\c2You just flamed %s'
                    @ '\c2%s got roasted'
                )
            else
                if GotParam projectile
                    FormatText textname = msg_text s = <string0> Random (
                        @*4 '\c2You just nailed %s'
                        @ '\c2%s got beaned'
                    )
                else
                    FormatText textname = msg_text 'Airborne face smack to %s!' s = <string0>
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
            SetTrickName 'Head Smack'
            SetTrickScore 2000
            display Blockspin
        endif
    endif
    if InNetGame
        if NOT GameModeEquals is_ctf
            if GotParam fireball
                FormatText textname = msg_text s = <string0> Random (
                    @*4 '\c2You just flamed %s'
                    @ '\c2%s got roasted'
                )
            else
                if GotParam projectile
                    FormatText textname = msg_text s = <string0> Random (
                        @*4 '\c2You just nailed %s'
                        @ '\c2%s got beaned'
                    )
                else
                    FormatText textname = msg_text 'Face smack to %s!' s = <string0>
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
            SetTrickName 'Sucker Punch'
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
                    @*4 '\c2You just flamed %s'
                    @ '\c2%s got roasted'
                )
            else
                if GotParam projectile
                    FormatText textname = msg_text s = <string0> Random (
                        @*4 '\c2You just nailed %s'
                        @ '\c2%s got beaned'
                    )
                else
                    FormatText textname = msg_text 'You sucker punched %s!' s = <string0>
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
    create_net_panel_message \{ text = 'Teams have been created.\nChoose a team by grabbing its flag.' style = generic_net_panel_message }
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
net_error_msg = 'Error'
net_notice_msg = "Notice"
net_status_msg = 'Status'
net_refused_msg = 'Refused'
net_warning_msg = 'Warning'
net_question_are_you_sure = 'Are you sure?'
net_question_are_you_sure_block = 'Do you wish to permanently block friend requests from %s?'
net_question_are_you_sure_remove = 'Are you sure you want to remove friend %s?'
net_answer_yes = 'Yes'
net_answer_no = 'No'
net_answer_ok = 'Ok'
net_answer_cancel = 'Cancel'
net_answer_play = 'Play'
net_answer_stop = 'Stop'
net_answer_send_feedback = 'Send Feedback'
net_friends_accepted_invitation = 'Accepted Game Invitation'
net_friends_accept_invitation = "Accept Game Invitation"
net_friends_attach_voice = "Attach Voice"
net_friends_decline_invitation = "Decline Game Invitation"
net_friends_cancel_invitation = "Cancel Game Invitation"
net_friends_listen_to_message = "Listen to Voice Message"
net_friends_join_friend = 'Join Friend'
net_friends_eject_disc = "Please eject your game disc and insert the game disc for "
net_friends_send_complaint = 'Send Complaint'
net_friends_block_requests = 'Block Requests'
net_friends_invite = "Invite Friend"
net_friends_remove = "Remove Friend"
net_friends_join = "Join Friend"
net_friends_block = "Permanently Block"
net_friend_status_received_request = "Friend request received"
net_friend_status_sent_request = "Friend request sent"
net_friend_status_friend = "Friend"
net_friend_status_offline = "Offline"
net_friend_status_online = "Online in"
net_friend_status_available = "Available in "
net_friend_status_playing = "Playing in "
net_friend_status_wants_to_play = "Wants to play "
net_friend_status_invited_to_play = "Invited to play"
net_friend_status_wants_friendship = "Wants to be your friend"
net_friend_status_you_want_friend = "You asked to be your friend"
net_friend_status_voice_muted = "Voice: Muted"
net_friend_status_voice_on = "Voice: On"
net_friend_status_voice_tv = "Voice through TV"
net_title_up = '(UP)'
net_title_down = '(DOWN)'
net_title_remove = 'Remove '
net_title_confirm_compaint = "Are you sure you want to send this complaint about %s?"
net_title_feedback = 'Feedback'
net_title_select_feedback = 'Please select your feedback for\n\''
net_title_complaints = "-----Complaints-----"
net_title_cursing = "Cursing or Lewdness"
net_title_screaming = "Screaming"
net_title_offensive_msg = "Offensive Message"
net_title_threats = "Threats or Harassment"
net_title_voice_message = "Voice Message"
net_title_friends_menu = 'Friends Menu'
net_title_accept_friend_request = 'Do you wish to accept a friend request from '
net_title_cancel_friend_request = 'Do you wish to cancel your friend request for '
net_title_attach_voice = "Would you like to attach a voice message to this invitation?"
net_error_device_not_hot = 'The network cable is not connected. Please check your network cables and try again.'
net_error_not_connected = 'Could not access the external network device. Please check all connections and reconnect.'
net_error_not_detected = 'Supported network hardware is not correctly connected to the PlayStation®2 console.'
net_error_dhcp_error = 'Could not access the external network device. Please check all connections and reconnect.'
net_error_changed_device = 'You have changed network device settings and must restart your system for this change to take effect.'
net_error_device_error = 'No network adaptor (Ethernet) (for PlayStation®2) detected. You will not be able to play this title.'
net_error_general_error = 'Your network device is not configured properly or may not be properly connected. See the THAW manual for troubleshooting.'
net_error_cant_change_device = 'You must restart your console before changing this option.'
net_error_cant_load_settings = 'To change the hardware used by Your Network Configuration, you must restart the game.'
net_error_unplugged = "Your network connection has been disconnected. To continue playing online, please reconnect it."
net_error_unplugged_front_end = "Your network connection has been disconnected. Select Ok to return to the main menu."
net_error_unplugged_ps2 = "Could not access the external network device. Please check all connections and reconnect."
net_error_unplugged_front_end_ps2 = "Could not access the external network device. Please check all connections and reconnect."
net_error_lost_gamespy_connection = "You have lost connection to GameSpy. Check your network cables or quit and try reconnecting."
net_error_no_net_configs = 'Your Network Configuration file was not found. To create, edit or delete Your Network Configuration Files please use the network adaptor start-up disc.'
net_error_no_useful_configs = 'This network configuration is invalid and cannot be used.'
net_error_invalid_irx = 'Invalid IRX'
net_error_failed_msg_retrieval = 'Failed to retrieve voice message.'
net_reason_full_observers = 'The host will not allow any more observers at this time.'
net_reason_banned = "You have been banned from this session."
net_reason_full = "This session is full."
net_reason_wrong_password = "Incorrect password."
net_reason_version = "Incompatible version."
net_reason_rank_limit_high = "Your player ranking is too high to enter this game."
net_reason_rank_limit_low = "Your player ranking is too low to enter this game."
net_reason_general = "Connection refused."
net_reason_default = "Connection failed. Please try again"
net_message_goals_next_level = 'These new goals will not be playable until you change level to a new level, or reload this level.'
net_message_game_in_progress = 'This game is in progress. Would you like to observe the remainder of this game and join automatically afterwards?'
net_message_game_in_progress_refused = 'This game is in progress.  You must wait until it finishes to join.'
net_message_waiting_for_players = 'Waiting for some players to fully load... Would you like to wait for them?'
net_message_server_removed_you = 'The host has chosen to remove you from this game. Press \m0 to return to the main menu.'
net_message_server_moved_on = 'The host decided to start the game without you. Press \m0 to return to the main menu.'
net_message_waiting = 'Waiting for communication from the host...'
net_message_no_servers_found = "No Servers Found"
net_message_new_king_other = '%s0 is king of the hill!'
net_message_new_king_you = 'You are king of the hill!'
net_message_new_player = "%s0 is joining the game"
net_message_dropped_crown_you = "You dropped your crown!"
net_message_dropped_crown_other = "The king has dropped his crown!"
net_message_dropped_gold_you = "You dropped the Pot of Gold!"
net_message_dropped_gold_other = "The Pot of Gold has been dropped!"
net_message_changing_levels = "Get Ready! Changing levels to %s0...."
net_message_game_will_start = 'The game will start when all players are fully-loaded.'
net_message_join_pending = "%s0 is waiting to join."
net_message_observing = "%s0 is now observing the game."
net_message_joining = "%s0 is joining the game."
net_message_starting_game = "Get Ready!\nStarting a new game..."
net_message_auto_starting_game = "Get Ready!\nAuto-Server starting a new game..."
net_message_server_cheating = "Warning! The host has enabled cheat codes!"
net_message_flag_base_warning = "To score, your team must first retrieve your flag!"
net_message_player_quit = "%s0 has left the game."
net_message_player_timed_out = "%s0 has timed out."
net_message_player_now_observing = "%s0 has chosen to observe."
net_message_player_kicked = "The host has removed %s0 from the game."
net_message_player_banned = "The host has banned %s0 from the game."
net_message_player_left_out = "The host has dropped %s0 from the game."
net_message_player_dropped = "%s0 had a bad connection and was dropped."
net_status_please_wait = "Please Wait..."
net_status_locating = 'Connecting to host. Please wait...'
net_status_connecting = 'Connecting to game....'
net_status_joining = 'Joining game....'
net_status_trying_password = 'Trying password....'
net_status_lost_connection = "You have lost connection to the host. Press X to return to main menu."
net_status_server_quit = "The host has quit. Press X to return to main menu."
net_status_join_timeout = 'This game session is no longer available.'
net_status_join_failed = 'Failed to join game.  Refresh your game list and try again.'
net_status_not_posted = 'Your game was not posted on GameSpy. Check your network cables as well as any Firewall settings you may have.'
net_status_checking_motd = 'Connecting to master server....'
net_status_retry_motd = "Reattempting to Connect to master server...."
net_status_getting_lobbies = 'Getting lobby list....'
net_status_connecting_chat = 'Connecting to chat server...'
net_status_gamespy_no_dns = 'Failed to connect to GameSpy. Check your Gateway and/or Firewall settings. See the THAW manual for troubleshooting.'
net_status_gamespy_no_connect = 'Failed to connect to GameSpy. Check your connection and settings. See the THAW manual for troubleshooting.'
net_status_gamespy_lost_connection = 'You have lost connection to GameSpy. Check your network cables and reconnect.'
net_status_live_lost_connection = 'You have lost connection to Xbox Live.'
net_status_live_lost_connection_dupe = 'You were signed out of Xbox Live because another person signed in using your account.'
net_status_motd_failed = 'Failed to connect to master server.'
net_status_not_available = 'THAW online play is temporarily unavailable. Please try again later.'
net_status_never_available = 'THAW online play is no longer available.'
net_status_login_error = 'Unable to authenticate GameSpy profile. Would you like to continue without a profile? High score tracking and buddy list will be disabled.'
net_status_buddy_login_failed = 'Failed to connect to server.'
net_status_stats_login_failed = 'Failed to connect to stats server.'
net_status_stats_retrieval_failed = 'Failed to retrieve stats.'
net_status_testing_settings = 'Connecting to network...'
net_status_need_to_setup = 'You have yet to set up your network device and connection. Would you like to do so now?'
net_status_need_to_setup_dialup = 'You have yet to set up your connection settings. Would you like to do so now?'
net_status_nat_neg_failed = 'Failed to connect to host. Refresh your game list and try again.'
net_status_need_to_choose_combo = 'You have yet to choose Your Network Configuration. Would you like to do so now?'
net_modem_state_dialing = 'Dialing'
net_modem_state_connected = 'Authenticating user ID and password...'
net_modem_state_logged_in = 'Connected'
net_modem_state_disconnecting = 'Disconnecting from network...'
net_modem_state_hanging_up = 'Disconnecting from network...'
net_modem_state_disconnected = 'Disconnected.'
net_modem_state_conencting = 'Connecting to network...'
net_modem_state_redial_pause = 'The line was busy. Trying an alternate phone number...'
net_modem_error_no_modem = 'No compatible modems are attached.'
net_modem_error_timeout = 'Could not authenticate user ID and password. Please check your network configuration and try again.'
net_modem_error_busy = 'The phone number you dialed is busy.'
net_modem_error_no_connect = 'Could not authenticate user ID and password. Please check your network configuration and try again.'
net_modem_error_no_dialtone = 'No dialtone detected. Make sure your phone line is properly connected.'
net_modem_error_during_connect = 'Could not authenticate user ID and password. Please check your network configuration and try again.'
net_modem_error_during_connect_ync = 'Could not authenticate user ID and password. Please check your network configuration and try again.'
net_friends_list = 'Friends List'
homie_status_online = 'Online'
homie_status_logging_in = 'Logging in...'
homie_status_offline = 'Offline'
homie_status_chatting = 'Chatting'
homie_status_observing = 'Observing'
homie_status_playing = 'Playing'
homie_status_hosting = 'Hosting'
lobby_status_joined = 'joined the room'
lobby_status_left = 'left the room'
score_title_trick_attack = "Score"
score_title_graffiti = "Tags"
score_title_king = "Time"
score_title_slap = "Slaps"
net_lobby_full = 'FULL'
sort_title_list = "Server List"
sort_title_name = "Name"
sort_title_ping = "Ping"
sort_title_players = "Players"
sort_title_observers = "Observers"
sort_title_mode = "Mode"
sort_title_level = "Level"
sort_title_skill = "Skill"
sort_title_ranked = "Ranked"
lobby_full_title = "Full"
lobby_lan_title = "LAN Games"
net_lobby_chat_msg = "%s0"
team_1_name = 'Red'
team_2_name = 'Blue'
team_3_name = 'Green'
team_4_name = 'Yellow'
total_str = 'Total'
category_all_levels = 'All Levels'
manual_settings_str = 'Manual Settings'
net_error_file_not_found = 'The file was not found, please verify that you have entered your key correctly.'
net_error_server_error = 'Could not download the selected file. The server may be down. Please try again later.'
net_error_general = 'The server is not granting access to the file.'
net_auth_msg = 'Authenticating DNAS data...'
net_auth_error_server_busy = 'The network authentication server is busy. Please try again later.'
net_auth_error_before_service = 'This software title is not in service.'
net_auth_error_out_of_service = 'This software title is not in service.'
net_auth_error_end_of_service = 'The network authentication server is not in service.'
net_auth_error_time_out = 'Connection to the network authentication server has timed out. Please try again later.'
net_auth_error_invalid_server = 'A network authentication system error has occurred.'
net_auth_error_internal = 'A network authentication system error has occurred.'
net_auth_error_external = 'A network authentication system error has occurred.'
net_auth_error_download = 'A network error has occurred.'
net_auth_error_machine = 'A PlayStation®2 hardware information error has occurred.'
net_auth_error_disc = 'A PlayStation®2 disc information error has occurred.'
net_auth_err_glue_abort = 'Network connection has been aborted.'
net_auth_err_net_proxy = 'Error in proxy setting.'
net_auth_err_net_timeout = 'Connection timed out. Please try connecting again at a later time.'
net_auth_err_net_dns_host_not_found = 'There was an error in the reponse from the DNS server. Please check your network configuration.'
net_auth_err_net_dns_try_again = 'There was no response from the DNS server. Please check your network configuration.'
net_auth_err_net_dns_others = 'There was a DNS error.  Please check your network configuration.'
net_auth_err_net_conn_failed = 'Connection to the DNAS server failed.'
net_auth_error_network = 'There was a connection error.'
net_auth_error_unique = 'A software category error has occurred.'
net_auth_error_generic = 'An authentication error has occurred.'
net_auth_footer_contact = 'Please write down the error code number, and contact SCEA at 1-866-466-5333 or via SCEA\'s website, www.us.playstation.com.'
net_auth_footer_network = 'Please double check your network connection and/or Your Network Configuration.'
net_auth_footer_empty = ''
net_auth_footer_service_pal = 'Please check the start and end dates for this online title at PlayStation.com.'
net_auth_footer_central_pal = 'Please go to PlayStation.com for more information.'
net_auth_footer_cont_customer_pal = 'If you continue to experience the same problem please contact your local PlayStation Customer Care line on the number provided in the software manual.'
net_auth_footer_customer_pal = 'Please contact your local PlayStation Customer Care line on the number provided in the software manual for assistance.'
net_auth_footer_clean_pal = 'Try cleaning the disc using an approved method as detailed on Central Station (access using Network Access Disc) and PlayStation.com. If the problem continues to occur please contact your local PlayStation Customer Care line on the number provided in the software manual.'
net_auth_footer_network_pal = 'Please check your network connection and/or Your Network Configuration. Further information is provided on the Network Access Disc.'
net_auth_header_dnas = 'DNAS Error'
net_auth_header_network = 'Network Error'

script joined_team_you 
    printf \{ 'join team you' }
    FormatText textname = msg_text 'You have joined the %s team.' s = <string0>
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
    FormatText textname = msg_text '%s has joined the %w team.' s = <string0> w = <string1>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript
