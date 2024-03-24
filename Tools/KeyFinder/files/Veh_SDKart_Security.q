Veh_SDKart_Security_NodeArray = 
[
    {
        Pos = (-0.07647199928760529, 0.8569390177726746, 9.999999974752427e-7)
        angles = (0.0, 0.0, 0.0)
        name = Car_Shadow
        ncomp_level_geometry
    }
    {
        Pos = (-0.07647199928760529, 0.8569390177726746, 9.999999974752427e-7)
        angles = (0.0, 0.0, 0.0)
        name = car
        ncomp_level_geometry
    }
    {
        Pos = (19.922046661376953, 10.083518981933594, 24.9016170501709)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel01
        ncomp_level_geometry
    }
    {
        Pos = (-20.448501586914062, 10.083518981933594, 24.9016170501709)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel04
        ncomp_level_geometry
    }
    {
        Pos = (19.922046661376953, 10.083521842956543, -40.53473663330078)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel02
        ncomp_level_geometry
    }
    {
        Pos = (-20.448501586914062, 10.083521842956543, -40.53473663330078)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel03
        ncomp_level_geometry
    }
    {
        Pos = (28.105594635009766, 32.19715118408203, -71.7120361328125)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_SDKartSec_Rail01
        class = RailNode
        type = Concrete
        createdatstart
        terraintype = TERRAIN_GRINDCONC
        links = [ 7 ]
    }
    {
        Pos = (28.105594635009766, 32.19715118408203, 20.640716552734375)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_SDKartSec_Rail02
        class = RailNode
        type = Concrete
        createdatstart
        terraintype = TERRAIN_GRINDCONC
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_SDKartSec01
        ncomp_level_geometry
        triggerscript = TRGP_SDKartSec01Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_SDKartSec02
        ncomp_level_geometry
        triggerscript = TRGP_SDKartSec02Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_SDKartSec03
        ncomp_level_geometry
        triggerscript = TRGP_SDKartSec03Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_SDKartSec04
        ncomp_level_geometry
        triggerscript = TRGP_SDKartSec04Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = SDKartSec_Col
        ncomp_level_geometry
    }
    {
        Pos = (26.105587005615234, 32.19715118408203, -59.467979431152344)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_SDKartSec_Skitch01
        class = objecthook
        createdatstart
    }
    {
        Pos = (-26.258544921875, 32.1971435546875, -59.46797561645508)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_SDKartSec_Skitch02
        class = objecthook
        createdatstart
    }
    {
        Pos = (-28.258544921875, 32.19715118408203, 20.640716552734375)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_SDKartSec_Rail06
        class = RailNode
        type = Concrete
        createdatstart
        terraintype = TERRAIN_GRINDCONC
    }
    {
        Pos = (-28.258544921875, 32.19715118408203, -71.7120361328125)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_SDKartSec_Rail07
        class = RailNode
        type = Concrete
        createdatstart
        terraintype = TERRAIN_GRINDCONC
        links = [ 15 ]
    }
]
Veh_SDKart_SecurityTriggerScripts = 
[
    TRGP_SDKartSec01Script
    TRGP_SDKartSec02Script
    TRGP_SDKartSec03Script
    TRGP_SDKartSec04Script
]

script TRGP_SDKartSec01Script 
    Gap_CarHop StartGapID = CarHop02 EndGapID = CarHop01
endscript


script TRGP_SDKartSec02Script 
    Gap_CarHop StartGapID = CarHop01 EndGapID = CarHop02
endscript


script TRGP_SDKartSec03Script 
    Gap_CarHop StartGapID = CarHop03 EndGapID = CarHop04
endscript


script TRGP_SDKartSec04Script 
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
