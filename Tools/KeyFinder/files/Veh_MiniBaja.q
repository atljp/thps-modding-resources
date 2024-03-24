veh_MiniBaja_NodeArray = 
[
    {
        Pos = (0.8920149803161621, 1.0133750438690186, 0.6249139904975891)
        angles = (0.0, 0.0, 0.0)
        name = Car_Shadow
        ncomp_level_geometry
    }
    {
        Pos = (0.12745699286460876, 12.427629470825195, -3.754232883453369)
        angles = (0.0, 0.0, 0.0)
        name = car
        ncomp_level_geometry
    }
    {
        Pos = (32.275962829589844, 15.260847091674805, 33.36018371582031)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel01
        ncomp_level_geometry
    }
    {
        Pos = (-31.78724479675293, 15.260843276977539, 33.36018753051758)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel02
        ncomp_level_geometry
    }
    {
        Pos = (32.27595901489258, 15.260846138000488, -36.242549896240234)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel03
        ncomp_level_geometry
    }
    {
        Pos = (-31.787233352661133, 15.260849952697754, -36.2425537109375)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel04
        ncomp_level_geometry
    }
    {
        Pos = (23.942346572875977, 63.73612594604492, -25.722373962402344)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_MiniBaja_Rail01
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 7 ]
    }
    {
        Pos = (23.94234848022461, 63.73612594604492, 10.29665756225586)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_MiniBaja_Rail02
        class = RailNode
        type = Metal
        createdatstart
        noclimbing
        terraintype = TERRAIN_GRINDMETAL
        links = [ 8 ]
    }
    {
        Pos = (23.94234848022461, 68.73612976074219, 22.29665756225586)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_MiniBaja_Rail03
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
    }
    {
        Pos = (23.942346572875977, 68.73612976074219, -37.722373962402344)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_MiniBaja_Rail04
        class = RailNode
        type = Metal
        createdatstart
        noclimbing
        terraintype = TERRAIN_GRINDMETAL
        links = [ 6 ]
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_MiniBaja01
        ncomp_level_geometry
        triggerscript = TRGP_MiniBaja01Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_MiniBaja02
        ncomp_level_geometry
        triggerscript = TRGP_MiniBaja02Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_MiniBaja03
        ncomp_level_geometry
        triggerscript = TRGP_MiniBaja03Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_MiniBaja04
        ncomp_level_geometry
        triggerscript = TRGP_MiniBaja04Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = MiniBaja_Col
        ncomp_level_geometry
    }
    {
        Pos = (-24.065711975097656, 68.73612976074219, 22.296646118164062)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_MiniBaja_Rail05
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
    }
    {
        Pos = (-24.065711975097656, 63.73612594604492, 10.296645164489746)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_MiniBaja_Rail06
        class = RailNode
        type = Metal
        createdatstart
        noclimbing
        terraintype = TERRAIN_GRINDMETAL
        links = [ 15 ]
    }
    {
        Pos = (-24.06571388244629, 68.73612976074219, -37.72238540649414)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_MiniBaja_Rail07
        class = RailNode
        type = Metal
        createdatstart
        noclimbing
        terraintype = TERRAIN_GRINDMETAL
        links = [ 18 ]
    }
    {
        Pos = (-24.06571388244629, 63.73612594604492, -25.72238540649414)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_MiniBaja_Rail08
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 16 ]
    }
]
veh_MiniBajaTriggerScripts = 
[
    TRGP_MiniBaja01Script
    TRGP_MiniBaja02Script
    TRGP_MiniBaja03Script
    TRGP_MiniBaja04Script
]

script TRGP_MiniBaja01Script 
    Gap_CarHop StartGapID = CarHop02 EndGapID = CarHop01
endscript


script TRGP_MiniBaja02Script 
    Gap_CarHop StartGapID = CarHop01 EndGapID = CarHop02
endscript


script TRGP_MiniBaja03Script 
    Gap_CarHop StartGapID = CarHop03 EndGapID = CarHop04
endscript


script TRGP_MiniBaja04Script 
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
