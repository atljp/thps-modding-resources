Veh_APCart_NodeArray = 
[
    {
        Pos = (0.0, 0.0, 9.999999974752427e-7)
        angles = (0.0, 0.0, 0.0)
        name = Car_Shadow
        ncomp_level_geometry
    }
    {
        Pos = (-0.6377230286598206, 1.49898099899292, -0.5182170271873474)
        angles = (0.0, 0.0, 0.0)
        name = car
        ncomp_level_geometry
    }
    {
        Pos = (-20.29096221923828, 9.226580619812012, 24.9005126953125)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel02
        ncomp_level_geometry
    }
    {
        Pos = (19.998519897460938, 9.226580619812012, 24.9016170501709)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel01
        ncomp_level_geometry
    }
    {
        Pos = (19.868040084838867, 9.226170539855957, -40.35154724121094)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel03
        ncomp_level_geometry
    }
    {
        Pos = (-20.290958404541016, 9.226170539855957, -40.40269470214844)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel04
        ncomp_level_geometry
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = Veh_APCart_Col
        ncomp_level_geometry
    }
    {
        Pos = (-22.600093841552734, 74.61244201660156, -25.20083236694336)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_APCart_Rail01
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 8 ]
    }
    {
        Pos = (-22.600093841552734, 74.61244201660156, 51.76323699951172)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_APCart_Rail02
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 14 ]
    }
    {
        Pos = (18.0336971282959, 74.61244201660156, -25.200828552246094)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_APCart_Rail03
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 10 ]
    }
    {
        Pos = (18.03369903564453, 74.6903076171875, 52.3028450012207)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_APCart_Rail04
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 13 ]
    }
    {
        Pos = (18.0336971282959, 76.61244201660156, -37.200828552246094)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_APCart_Rail05
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 9 ]
    }
    {
        Pos = (-22.600093841552734, 76.61244201660156, -37.20083236694336)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_APCart_Rail06
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 7 ]
    }
    {
        Pos = (18.03369903564453, 76.6903076171875, 64.30284118652344)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_APCart_Rail07
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
    }
    {
        Pos = (-22.600093841552734, 76.61244201660156, 63.76323699951172)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_APCart_Rail08
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
    }
    {
        Pos = (24.18207550048828, 31.340211868286133, -61.712032318115234)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_APCart_Skitch01
        class = objecthook
        createdatstart
    }
    {
        Pos = (-21.212352752685547, 31.340211868286133, -59.82626724243164)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_APCart_Skitch02
        class = objecthook
        createdatstart
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_APcart01
        ncomp_level_geometry
        triggerscript = TRGP_APcart01Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_APcart02
        ncomp_level_geometry
        triggerscript = TRGP_APcart02Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_APcart03
        ncomp_level_geometry
        triggerscript = TRGP_APcart03Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_APcart04
        ncomp_level_geometry
        triggerscript = TRGP_APcart04Script
    }
]
Veh_APCartTriggerScripts = 
[
    TRGP_APcart01Script
    TRGP_APcart02Script
    TRGP_APcart03Script
    TRGP_APcart04Script
]

script TRGP_APcart01Script 
    Gap_CarHop StartGapID = CarHop02 EndGapID = CarHop01
endscript


script TRGP_APcart02Script 
    Gap_CarHop StartGapID = CarHop03 EndGapID = CarHop04
endscript


script TRGP_APcart03Script 
    Gap_CarHop StartGapID = CarHop01 EndGapID = CarHop02
endscript


script TRGP_APcart04Script 
    Gap_CarHop StartGapID = CarHop04 EndGapID = CarHop03
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
