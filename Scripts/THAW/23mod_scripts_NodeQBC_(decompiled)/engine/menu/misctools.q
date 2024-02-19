poly_count_on = 0

script show_poly_count 
    if (poly_count_on = 0)
        change poly_count_on = 1
        GetCurrentLevel
        if (<level> = load_sk5ed)
            KillSpawnedScript name = refresh_poly_count_repeatedly
            SpawnScriptLater refresh_poly_count_repeatedly
        else
            refresh_poly_count
        endif
        SpawnScriptLater refresh_map_data_repeatedly
    else
        change poly_count_on = 0
        KillSpawnedScript name = refresh_poly_count_repeatedly
        KillSpawnedScript name = refresh_map_data_repeatedly
        DestroyScreenElement id = poly_count_anchor
        DestroyScreenElement id = tex_count_anchor
        if ScreenElementExists id = map_data_anchor
            DestroyScreenElement id = map_data_anchor
        endif
        if ScreenElementExists id = texture_list
            DestroyScreenElement id = texture_list
        endif
    endif
endscript

script refresh_map_data_repeatedly 
    begin 
    refresh_map_data
    wait \{ 7 seconds }
    repeat 
endscript

script refresh_map_data 
    if NOT (poly_count_on = 1)
        return 
    endif
    if LevelIs load_default
        printf 'eh'
        GetUSGData level_default
    else
        if NOT IsTrue InStreamingLevel
            return 
        endif
        GetUSGData
    endif
    if ScreenElementExists id = map_data_anchor
        DestroyScreenElement id = map_data_anchor
    endif
    FormatText textname = polys 'Polys: %a' a = (<usg_data>.polys)
    FormatText textname = instance_polys 'Inst Polys: %a' a = (<usg_data>.instance_polys)
    FormatText textname = zone_file_size 'File: %a K' a = ((<usg_data>.file_size)/ 1024)
    FormatText textname = max_file_size 'Max File: %a K' a = ((<usg_data>.max_file_size)/ 1024)
    FormatText textname = texture_file_size 'Textures: %a K' a = ((<usg_data>.texture_size)/ 1024)
    FormatText textname = collision_size 'Collision: %a K' a = ((<usg_data>.collision_size)/ 1024)
    FormatText textname = geom_size 'Geom: %a K' a = ((<usg_data>.geom_size)/ 1024)
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = map_data_anchor
        Pos = (460.0, 40.0)
        just = [ center center ]
        internal_just = [ left center ]
        z_priority = 100
    }
    CreateScreenElement {
        type = TextElement
        parent = map_data_anchor
        Pos = (0.0, 45.0)
        text = (<usg_data>.name)
        font = dialog
        rgba = [ 60 60 100 100 ]
        just = [ left center ]
        Scale = 0.8000
        z_priority = 100
    }
    CreateScreenElement {
        type = TextElement
        parent = map_data_anchor
        Pos = (0.0, 60.0)
        text = <polys>
        font = dialog
        rgba = [ 58 108 58 100 ]
        just = [ left center ]
        Scale = 0.8000
        z_priority = 100
    }
    CreateScreenElement {
        type = TextElement
        parent = map_data_anchor
        Pos = (0.0, 75.0)
        text = <instance_polys>
        font = dialog
        rgba = [ 58 108 58 100 ]
        just = [ left center ]
        Scale = 0.8000
        z_priority = 100
    }
    CreateScreenElement {
        type = TextElement
        parent = map_data_anchor
        Pos = (0.0, 90.0)
        text = <zone_file_size>
        font = dialog
        rgba = [ 58 108 58 100 ]
        just = [ left center ]
        Scale = 0.8000
        z_priority = 100
    }
    CreateScreenElement {
        type = TextElement
        parent = map_data_anchor
        Pos = (0.0, 105.0)
        text = <max_file_size>
        font = dialog
        rgba = [ 58 108 58 100 ]
        just = [ left center ]
        Scale = 0.8000
        z_priority = 100
    }
    CreateScreenElement {
        type = TextElement
        parent = map_data_anchor
        Pos = (0.0, 120.0)
        text = <collision_size>
        font = dialog
        rgba = [ 58 108 58 100 ]
        just = [ left center ]
        Scale = 0.8000
        z_priority = 100
    }
    CreateScreenElement {
        type = TextElement
        parent = map_data_anchor
        Pos = (0.0, 135.0)
        text = <geom_size>
        font = dialog
        rgba = [ 58 108 58 100 ]
        just = [ left center ]
        Scale = 0.8000
        z_priority = 100
    }
    CreateScreenElement {
        type = TextElement
        parent = map_data_anchor
        Pos = (0.0, 150.0)
        text = <texture_file_size>
        font = dialog
        rgba = [ 58 108 58 100 ]
        just = [ left center ]
        Scale = 0.8000
        z_priority = 100
    }
    y_coord = 165
    if StructureContains structure = usg_data artists
        GetArraySize (<usg_data>.artists)
        index = 0
        begin 
        FormatText textname = artist_name '%a: %b K' a = (<usg_data>.artists [ <index> ].name)b = ((<usg_data>.artists [ <index> ].size)/ 1024)
        CreateScreenElement {
            type = TextElement
            parent = map_data_anchor
            Pos = (((0.0, 1.0) * <y_coord>)+ (10.0, 0.0))
            text = <artist_name>
            font = dialog
            rgba = [ 58 108 58 100 ]
            just = [ left center ]
            Scale = 0.8000
            z_priority = 100
        }
        y_coord = (<y_coord> + 15)
        index = (<index> + 1)
        repeat <array_size>
    endif
endscript

script refresh_poly_count 
    if (poly_count_on = 1)
        if ScreenElementExists id = poly_count_anchor
            DestroyScreenElement id = poly_count_anchor
        endif
        if ScreenElementExists id = tex_count_anchor
            DestroyScreenElement id = tex_count_anchor
        endif
        if ScreenElementExists id = texture_list
            DestroyScreenElement id = texture_list
        endif
        if ScreenElementExists id = goal_points_display
            DoScreenElementMorph {
                id = goal_points_display
                Scale = 0
            }
        endif
        DoScreenElementMorph {
            id = the_score_sprite
            Scale = 0
        }
        DoScreenElementMorph {
            id = the_score
            Scale = 0
        }
        DoScreenElementMorph {
            id = goal_points_text
            Scale = 0
        }
        GetMetrics
        FormatText textname = main_base 'First = %m' m = ((<metrics>.mainscene).basepolys)usecommas
        FormatText textname = main_other 'Other = %m' m = (((<metrics>.mainscene).polys)- ((<metrics>.mainscene).basepolys))usecommas
        FormatText textname = main_total 'Total = %m' m = ((<metrics>.mainscene).polys)usecommas
        FormatText textname = main_envmap 'EnvMap = %m' m = ((<metrics>.mainscene).envmappolys)usecommas
        FormatText textname = main_instance 'Instance = %m' m = ((<metrics>.mainscene).instancepolys)usecommas
        if StructureContains structure = <metrics> skyscene
            FormatText textname = sky_base 'Sky = %m' m = ((<metrics>.skyscene).basepolys)
        else
            sky_base = 'Sky = N/A'
        endif
        if ((<metrics>.scene).nullenginescene)
            rendered_objects = 'Obj   = N/A'
            rendered_meshes = 'Mesh = N/A'
            verts_per_poly = 'V/P  = N/A'
            polys_per_object = 'P/O  = N/A'
            polys_per_mesh = 'P/M  = N/A'
        else
            FormatText textname = rendered_objects 'Obj   = %m' m = ((<metrics>.scene).objects)
            FormatText textname = rendered_meshes 'Mesh = %m' m = ((<metrics>.scene).leaf)
            FormatText textname = verts_per_poly 'V/P  = %m' m = ((<metrics>.scene).verts_per_poly)
            FormatText textname = polys_per_object 'P/O  = %m' m = ((<metrics>.scene).polys_per_object)
            FormatText textname = polys_per_mesh 'P/M  = %m' m = ((<metrics>.scene).polys_per_mesh)
        endif
        lev_num = (((<metrics>.mainscene).texturememory)/ 1024)
        CastToInteger lev_num
        FormatText textname = lev_tex 'Lev = %m K' m = <lev_num>
        if StructureContains structure = <metrics> skyscene
            if StructureContains structure = (<metrics>.skyscene)texturememory
                sky_num = (((<metrics>.skyscene).texturememory)/ 1024)
                CastToInteger sky_num
                FormatText textname = sky_tex 'Sky = %m K' m = <sky_num>
            else
                sky_tex = 'Sky = N/A'
            endif
        else
            sky_tex = 'Sky = N/A'
        endif
        SetScreenElementLock id = root_window Off
        CreateScreenElement {
            type = ContainerElement
            parent = root_window
            id = poly_count_anchor
            Pos = (30.0, 40.0)
            just = [ center center ]
            internal_just = [ left center ]
        }
        CreateScreenElement {
            type = ContainerElement
            parent = root_window
            id = tex_count_anchor
            Pos = (460.0, 40.0)
            just = [ center center ]
            internal_just = [ left center ]
        }
        CreateScreenElement {
            type = TextElement
            parent = poly_count_anchor
            Pos = (0.0, -15.0)
            text = 'Poly Count'
            font = dialog
            rgba = [ 60 60 100 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = poly_count_anchor
            Pos = (0.0, 0.0)
            text = <main_base>
            font = dialog
            rgba = [ 58 108 58 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = poly_count_anchor
            Pos = (0.0, 15.0)
            text = <main_other>
            font = dialog
            rgba = [ 58 108 58 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = poly_count_anchor
            Pos = (0.0, 30.0)
            text = <main_total>
            font = dialog
            rgba = [ 58 108 58 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = poly_count_anchor
            Pos = (0.0, 45.0)
            text = <main_envmap>
            font = dialog
            rgba = [ 58 108 58 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = poly_count_anchor
            Pos = (0.0, 60.0)
            text = <main_instance>
            font = dialog
            rgba = [ 58 108 58 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = poly_count_anchor
            Pos = (0.0, 75.0)
            text = <sky_base>
            font = dialog
            rgba = [ 58 108 58 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = poly_count_anchor
            Pos = (0.0, 90.0)
            text = <rendered_objects>
            font = dialog
            rgba = [ 58 108 58 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = poly_count_anchor
            Pos = (0.0, 105.0)
            text = <rendered_meshes>
            font = dialog
            rgba = [ 58 108 58 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = poly_count_anchor
            Pos = (0.0, 120.0)
            text = <verts_per_poly>
            font = dialog
            rgba = [ 58 108 58 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = poly_count_anchor
            Pos = (0.0, 135.0)
            text = <polys_per_object>
            font = dialog
            rgba = [ 58 108 58 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = poly_count_anchor
            Pos = (0.0, 150.0)
            text = <polys_per_mesh>
            font = dialog
            rgba = [ 58 108 58 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = tex_count_anchor
            Pos = (0.0, -15.0)
            text = 'Texture Mem'
            font = dialog
            rgba = [ 60 60 100 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = tex_count_anchor
            Pos = (0.0, 0.0)
            text = <lev_tex>
            font = dialog
            rgba = [ 58 108 58 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        CreateScreenElement {
            type = TextElement
            parent = tex_count_anchor
            Pos = (0.0, 15.0)
            text = <sky_tex>
            font = dialog
            rgba = [ 58 108 58 100 ]
            just = [ left center ]
            Scale = 0.8000
        }
        RemoveParameter metrics
        RemoveParameter main_base
        RemoveParameter main_other
        RemoveParameter main_envmap
        RemoveParameter sky_base
        RemoveParameter lev_tex
        RemoveParameter sky_tex
    endif
endscript

script refresh_poly_count_repeatedly 
    begin 
    refresh_poly_count
    wait \{ 0.5000 seconds }
    repeat 
endscript

script switch_off_poly_count_refresh 
    change \{ poly_count_on = 0 }
    KillSpawnedScript \{ name = refresh_poly_count_repeatedly }
endscript

script screen_outline rgba = [ 255 255 255 255 ]
    if ScreenElementExists id = outline_anchor
        DestroyScreenElement id = outline_anchor
    endif
    if GotParam Die
        return 
    endif
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        type = ContainerElement
        id = outline_anchor
        parent = root_window
        z_priority = 999
        just = [ center center ]
        internal_just = [ left top ]
    }
    if NOT GotParam platform
        GetPlatform
    endif
    switch <platform>
        case xenon
        <borders> = {
            top = 23
            left = 34
            bottom = 425
            RIGHT = 607
        }
        case ps2
        <borders> = {
            top = 23
            left = 21
            bottom = 429
            RIGHT = 619
        }
        default 
        return 
    endswitch
    <bar_width> = 3
    <top_edge> = {
        Pos = ((<borders>.left)* (1.0, 0.0) + (<borders>.top)* (0.0, 1.0) - <bar_width> * (0.0, 1.0))
        dims = (((<borders>.RIGHT)- (<borders>.left))* (1.0, 0.0) + <bar_width> * (0.0, 1.0))
    }
    <bottom_edge> = {
        Pos = ((<borders>.left)* (1.0, 0.0) + (<borders>.bottom)* (0.0, 1.0))
        dims = (((<borders>.RIGHT)- (<borders>.left))* (1.0, 0.0) + <bar_width> * (0.0, 1.0))
    }
    <left_edge> = {
        Pos = ((<borders>.left)* (1.0, 0.0) + (<borders>.top)* (0.0, 1.0) - <bar_width> * (1.0, 0.0))
        dims = (((<borders>.bottom)- (<borders>.top))* (0.0, 1.0) + <bar_width> * (1.0, 0.0))
    }
    <right_edge> = {
        Pos = ((<borders>.RIGHT)* (1.0, 0.0) + (<borders>.top)* (0.0, 1.0))
        dims = (((<borders>.bottom)- (<borders>.top))* (0.0, 1.0) + <bar_width> * (1.0, 0.0))
    }
    CreateScreenElement {
        type = SpriteElement
        parent = outline_anchor
        just = [ left top ]
        rgba = <rgba>
        <top_edge>
    }
    CreateScreenElement {
        type = SpriteElement
        parent = outline_anchor
        just = [ left top ]
        rgba = <rgba>
        <bottom_edge>
    }
    CreateScreenElement {
        type = SpriteElement
        parent = outline_anchor
        just = [ left top ]
        rgba = <rgba>
        <left_edge>
    }
    CreateScreenElement {
        type = SpriteElement
        parent = outline_anchor
        just = [ left top ]
        rgba = <rgba>
        <right_edge>
    }
endscript
