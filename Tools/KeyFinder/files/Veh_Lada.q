veh_Lada_NodeArray = 
[
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = Lada_Col
        ncomp_level_geometry
    }
    {
        Pos = (-20.470848083496094, 56.11442565917969, -12.090534210205078)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Lada_Rail01
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 2 ]
    }
    {
        Pos = (-20.470848083496094, 55.36846160888672, 72.72758483886719)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Lada_Rail02
        class = RailNode
        type = Metal
        createdatstart
        noclimbing
        terraintype = TERRAIN_GRINDMETAL
        links = [ 18 ]
    }
    {
        Pos = (20.10145378112793, 56.11442565917969, -12.090534210205078)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Lada_Rail03
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 4 ]
    }
    {
        Pos = (20.101455688476562, 55.36846160888672, 72.72758483886719)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Lada_Rail04
        class = RailNode
        type = Metal
        createdatstart
        noclimbing
        terraintype = TERRAIN_GRINDMETAL
        links = [ 17 ]
    }
    {
        Pos = (-29.870851516723633, 33.30315399169922, -42.783599853515625)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Lada_Rail05
        class = objecthook
        createdatstart
    }
    {
        Pos = (29.50145149230957, 33.30315399169922, -42.783599853515625)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Lada_Rail06
        class = objecthook
        createdatstart
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_Lada01
        ncomp_level_geometry
        triggerscript = TRGP_Lada01Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_Lada02
        ncomp_level_geometry
        triggerscript = TRGP_Lada02Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_Lada03
        ncomp_level_geometry
        triggerscript = TRGP_Lada03Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_Lada04
        ncomp_level_geometry
        triggerscript = TRGP_Lada04Script
    }
    {
        Pos = (0.0, -1.6901040077209473, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = Car_Shadow
        ncomp_level_geometry
    }
    {
        Pos = (-0.5032539963722229, 9.98238754272461, 1.7155450582504272)
        angles = (0.0, 0.0, 0.0)
        name = car
        ncomp_level_geometry
    }
    {
        Pos = (24.307952880859375, 11.446491241455078, 94.75452423095703)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel01
        ncomp_level_geometry
    }
    {
        Pos = (-21.561248779296875, 11.446491241455078, 94.75452423095703)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel02
        ncomp_level_geometry
    }
    {
        Pos = (24.30794906616211, 11.446495056152344, -2.624756097793579)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel03
        ncomp_level_geometry
    }
    {
        Pos = (-22.751693725585938, 11.45968246459961, -2.76499605178833)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel04
        ncomp_level_geometry
    }
    {
        Pos = (20.101455688476562, 58.36846160888672, 78.72758483886719)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Lada_Rail07
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
    }
    {
        Pos = (-20.470848083496094, 58.36846160888672, 78.72758483886719)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Lada_Rail08
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
    }
    {
        Pos = (20.101455688476562, 58.36846160888672, -18.090526580810547)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Lada_Rail09
        class = RailNode
        type = Metal
        createdatstart
        noclimbing
        terraintype = TERRAIN_GRINDMETAL
        links = [ 3 ]
    }
    {
        Pos = (-20.470848083496094, 58.36846160888672, -18.090530395507812)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Lada_Rail10
        class = RailNode
        type = Metal
        createdatstart
        noclimbing
        terraintype = TERRAIN_GRINDMETAL
        links = [ 1 ]
    }
]
veh_LadaTriggerScripts = 
[
    TRGP_Lada01Script
    TRGP_Lada02Script
    TRGP_Lada03Script
    TRGP_Lada04Script
]

script TRGP_Lada01Script 
    Gap_CarHop StartGapID = CarHop03 EndGapID = CarHop04
endscript


script TRGP_Lada02Script 
    Gap_CarHop StartGapID = CarHop04 EndGapID = CarHop03
endscript


script TRGP_Lada03Script 
    Gap_CarHop StartGapID = CarHop02 EndGapID = CarHop01
endscript


script TRGP_Lada04Script 
    Gap_CarHop StartGapID = CarHop01 EndGapID = CarHop02
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
