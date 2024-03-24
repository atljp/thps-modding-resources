Veh_TransAM_NodeArray = 
[
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRANS_AM_Col
        ncomp_level_geometry
    }
    {
        Pos = (-36.84143829345703, 30.74346923828125, -38.32326889038086)
        angles = (0.0, 0.0, 0.0)
        name = TRG_TransAm_Skitch01
        class = objecthook
        createdatstart
    }
    {
        Pos = (37.67057800292969, 30.74346923828125, -38.32326889038086)
        angles = (0.0, 0.0, 0.0)
        name = TRG_TransAm_Skitch02
        class = objecthook
        createdatstart
    }
    {
        Pos = (0.0, 0.0, 0.000007999999979801942)
        angles = (0.0, 0.0, 0.0)
        name = Car_Shadow
        ncomp_level_geometry
    }
    {
        Pos = (0.2658019959926605, 26.284221649169922, 50.58549499511719)
        angles = (0.0, 0.0, 0.0)
        name = car
        ncomp_level_geometry
    }
    {
        Pos = (30.046955108642578, 12.596587181091309, 107.13988494873047)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel01
        ncomp_level_geometry
    }
    {
        Pos = (-29.700319290161133, 12.59019947052002, 107.08822631835938)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel02
        ncomp_level_geometry
    }
    {
        Pos = (30.04694938659668, 12.596590995788574, -0.8309550285339355)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel03
        ncomp_level_geometry
    }
    {
        Pos = (-29.700315475463867, 12.59019947052002, -0.7907609939575195)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel04
        ncomp_level_geometry
    }
    {
        Pos = (26.67055892944336, 47.80866622924805, -6.135894775390625)
        angles = (0.0, 0.0, 0.0)
        name = TRG_TransAm_Rail03
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 10 ]
    }
    {
        Pos = (26.670595169067383, 47.80866622924805, 62.88615417480469)
        angles = (0.0, 0.0, 0.0)
        name = TRG_TransAm_Rail04
        class = RailNode
        type = Metal
        createdatstart
        noclimbing
        terraintype = TERRAIN_GRINDMETAL
        links = [ 17 ]
    }
    {
        Pos = (-25.841459274291992, 47.80866241455078, -6.135876178741455)
        angles = (0.0, 0.0, 0.0)
        name = TRG_TransAm_Rail09
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 12 ]
    }
    {
        Pos = (-25.841426849365234, 47.80866241455078, 62.88616943359375)
        angles = (0.0, 0.0, 0.0)
        name = TRG_TransAm_Rail10
        class = RailNode
        type = Metal
        createdatstart
        noclimbing
        terraintype = TERRAIN_GRINDMETAL
        links = [ 18 ]
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_TransAm01
        ncomp_level_geometry
        triggerscript = TRGP_TransAm01Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_TransAm02
        ncomp_level_geometry
        triggerscript = TRGP_TransAm02Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_TransAm03
        ncomp_level_geometry
        triggerscript = TRGP_TransAm03Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_TransAm04
        ncomp_level_geometry
        triggerscript = TRGP_TransAm04Script
    }
    {
        Pos = (26.670595169067383, 50.80866622924805, 68.88615417480469)
        angles = (0.0, 0.0, 0.0)
        name = TRG_TransAm_Rail11
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
    }
    {
        Pos = (-25.841426849365234, 50.80866241455078, 68.88616943359375)
        angles = (0.0, 0.0, 0.0)
        name = TRG_TransAm_Rail12
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
    }
    {
        Pos = (26.670595169067383, 50.80866622924805, -12.135910034179688)
        angles = (0.0, 0.0, 0.0)
        name = TRG_TransAm_Rail13
        class = RailNode
        type = Metal
        createdatstart
        noclimbing
        terraintype = TERRAIN_GRINDMETAL
        links = [ 9 ]
    }
    {
        Pos = (-25.841426849365234, 50.80866241455078, -12.135894775390625)
        angles = (0.0, 0.0, 0.0)
        name = TRG_TransAm_Rail14
        class = RailNode
        type = Metal
        createdatstart
        noclimbing
        terraintype = TERRAIN_GRINDMETAL
        links = [ 11 ]
    }
]
Veh_TransAMTriggerScripts = 
[
    TRGP_TransAm01Script
    TRGP_TransAm02Script
    TRGP_TransAm03Script
    TRGP_TransAm04Script
]

script TRGP_TransAm01Script 
    Gap_CarHop StartGapID = CarHop04 EndGapID = CarHop03
endscript


script TRGP_TransAm02Script 
    Gap_CarHop StartGapID = CarHop03 EndGapID = CarHop04
endscript


script TRGP_TransAm03Script 
    Gap_CarHop StartGapID = CarHop01 EndGapID = CarHop02
endscript


script TRGP_TransAm04Script 
    Gap_CarHop StartGapID = CarHop02 EndGapID = CarHop01
endscript

ncomp_occlusion = {
    class = levelgeometry
    occluder
    createdatstart
    collisionmode = geometry
}
ncomp_occlusion_notcreated = {
    class = levelgeometry
    occluder
    collisionmode = geometry
}
ncomp_conc_rail = {
    class = RailNode
    type = Concrete
    createdatstart
    terraintype = TERRAIN_CONCSMOOTH
}
ncomp_metal_rail = {
    class = RailNode
    type = Metal
    createdatstart
    terraintype = terrain_metalsmooth
}
ncomp_wood_rail = {
    class = RailNode
    type = Wood
    createdatstart
    terraintype = TERRAIN_WOO
}
ncomp_default_rail = {
    class = RailNode
    type = generic
    createdatstart
    terraintype = terrain_default
}
ncomp_wire_rail = {
    class = RailNode
    type = Wire
    createdatstart
    terraintype = TERRAIN_GRINDWIRE
}
ncomp_LO_default = {
    class = LevelObject
    type = normal
    collisionmode = geometry
    suspenddistance = 0
    lod_dist1 = 200
    lod_dist2 = 201
}
ncomp_LO_default2 = {
    class = LevelObject
    type = normal
    collisionmode = geometry
    suspenddistance = 0
}
ncomp_waypoint_default = {
    class = waypoint
    type = default
    createdatstart
}
ncomp_PedAI_default = {
    class = waypoint
    type = pedai
    createdatstart
    continue
    pedtype = skate
    priority = normal
    ContinueWeight = 1.0
    adjustspeedpercent = 50.0
    acceleration = 500.0
    skateaction = continue
    jumpheight = 60.0
}
ncomp_proxim_box = {
    class = proximnode
    type = camera
    proximobject
    RenderToViewport
    SelectRenderOnly
    shape = BoundingBox
}
ncomp_proxim_defaults = {
    class = proximnode
    type = camera
    proximobject
    RenderToViewport
    SelectRenderOnly
}
ncomp_goal_arrow = {
    class = gameobject
    type = Goal_Arrow
    absentinnetgames
    Model = 'goalarrow\goalarrow.mdl'
    suspenddistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
}
ncomp_ped_stuff = {
    absentinnetgames
    SkeletonName = thps5_human
    AnimName = animload_THPS5_human
}
ncomp_level_light = {
    class = LevelLight
    createdatstart
    brightness = 0
}
ncomp_level_light2 = {
    class = LevelLight
    createdatstart
}
ncomp_car_waypoint = {
    class = waypoint
    type = DecelForTurn
    createdatstart
    spawnobjscript = Car_DecelForTurn01
}
ncomp_car_waypoint2 = {
    class = waypoint
    type = DecelForTurn
    createdatstart
}
ncomp_bouncy_defaults = {
    coeff_restitution = 0.3000
    coeff_friction = 1.0
    skater_collision_impulse_factor = 0.7000
    skater_collision_rotation_factor = 0
    skater_collision_assent = 5
}
ncomp_emitter_box = {
    class = emitterobject
    type = BoundingBox
}
ncomp_LO = {
    class = LevelObject
    type = normal
    createdatstart
    collisionmode = geometry
    suspenddistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
}
ncomp_LO_2 = {
    class = LevelObject
    type = normal
    createdatstart
    collisionmode = geometry
}
ncomp_ghost_401 = {
    class = gameobject
    type = Ghost
    createdatstart
    absentinnetgames
    Model = 'none'
    suspenddistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
}
ncomp_ghost_obj = {
    class = gameobject
    type = Ghost
    createdatstart
    absentinnetgames
    Model = 'none'
}
ncomp_simple_waypoint = {
    class = waypoint
    createdatstart
}
ncomp_proxim_shpere = {
    class = proximnode
    type = camera
    createdatstart
    RenderToViewport
    SelectRenderOnly
    shape = sphere
}
ncomp_lod_suspend_dist1_200 = {
    suspenddistance = 0
    lod_dist1 = 200
    lod_dist2 = 201
}
ncomp_lod_dist1_200 = {
    lod_dist1 = 200
    lod_dist2 = 201
}
ncomp_level_geometry = {
    class = levelgeometry
    createdatstart
    collisionmode = geometry
}
ncomp_level_geometry_NC = {
    class = levelgeometry
    collisionmode = geometry
}
ncomp_collision_mode_geometry = {
    collisionmode = geometry
}
