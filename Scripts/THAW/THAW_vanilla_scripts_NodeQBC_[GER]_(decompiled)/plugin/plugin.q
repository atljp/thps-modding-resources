
script Plugin_Quickview 
    printstruct <...> 
    KillTextureSplats all
    PreAllocSplats
    switch <export_type>
        case scene
        reloadscene scene = <scene>
        case sky
        switch <project>
            case gun
            TOD_Change_Sky sky = <sky>
            case skate7
            Change_Sky sky = <sky>
            default 
            Change_Sky sky = <sky>
        endswitch
        case zone
        switch <project>
            case gun
            GetCurrentZoneName
            FormatText textname = zone '%z' z = <zone> DontAssertForChecksums
            if NOT (<zone_name> = <zone>)
                JumpToZone zone = <zone>
            else
                FinishPendingZoneLoads
                RefreshCurrentZones
            endif
            case skate7
            if NOT (<zone> = viewer)
                FormatText checksumname = zone 'load_%z' z = <zone> DontAssertForChecksums
            endif
            GetCurrentLevel
            if NOT (<level> = <zone>)
                BeginUnloadAllZones
                wait 2 gameframe
                EndUnloadAllZones
                change_level level = <zone>
            else
                FinishPendingZoneLoads
                RefreshCurrentZones
            endif
            default 
        endswitch
        case viewer
        switch <project>
            case gun
            GetMissionName
            if NOT (<mission> = viewer)
                load_new_mission mission_pak = <viewer> reload_zones
            else
                FinishPendingZoneLoads
                RefreshCurrentZones
            endif
            case skate7
            GetCurrentLevel
            if NOT (<level> = viewer)
                BeginUnloadAllZones
                wait 2 gameframe
                EndUnloadAllZones
                change_level level = viewer
            else
                FinishPendingZoneLoads
                RefreshCurrentZones
            endif
            default 
        endswitch
        case mission
        switch <project>
            case gun
            printf '######################### loading new mission'
            load_new_mission mission_pak = <mission> reload_zones
            case skate7
            FinishPendingZoneLoads
            RefreshCurrentZones
            default 
            FinishPendingZoneLoads
            RefreshCurrentZones
        endswitch
        case Model
        change view_mode = 0
        ToggleViewMode
        ToggleViewMode
        ToggleViewMode
        exit_view_models_menu
        toggle_model_viewer
        view_model modelname = <Model>
        case Skin
        change view_mode = 0
        ToggleViewMode
        ToggleViewMode
        ToggleViewMode
        exit_view_models_menu
        toggle_model_viewer
        view_model profile = Ped_BatMasterson animLoadScript = animload_ped_male extraAnim = animload_ped_male defaultanim = MV_Idle_Denton SkeletonName = gun
        default 
    endswitch
    kill_panel_message_if_it_exists id = quickview
endscript
