Sk5Ed3_Sky_NodeArray = 
[
    {
        Pos = (0.0000670000008540228, 142.02442932128906, -0.000024000000848900527)
        angles = (0.0, 0.0, 0.0)
        name = be_Sky
        ncomp_level_geometry
    }
]

script LoadAllParticleTextures 
endscript


script LoadTerrain 
    LoadTerrainSounds terrain = terrain_default
endscript


script load_level_anims 
endscript


script LoadCameras 
endscript


script LoadObjectAnims 
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
