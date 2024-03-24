UI_bg_NodeArray = 
[
    {
        Pos = (1.4662699699401855, 9.97067642211914, 0.0)
        Angles = (1.570796012878418, 0.0, 0.0)
        Name = Plane_new
        ncomp_level_geometry
    }
]
UI_bgTriggerScripts = 
[ 
 ]
ncomp_occlusion = {
    Class = LevelGeometry
    Occluder
    CreatedAtStart
    CollisionMode = Geometry
}
ncomp_occlusion_notcreated = {
    Class = LevelGeometry
    Occluder
    CollisionMode = Geometry
}
ncomp_conc_rail = {
    Class = RailNode
    Type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
}
ncomp_metal_rail = {
    Class = RailNode
    Type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
}
ncomp_wood_rail = {
    Class = RailNode
    Type = Wood
    CreatedAtStart
    TerrainType = TERRAIN_WOO
}
ncomp_default_rail = {
    Class = RailNode
    Type = Generic
    CreatedAtStart
    TerrainType = TERRAIN_DEFAULT
}
ncomp_wire_rail = {
    Class = RailNode
    Type = Wire
    CreatedAtStart
    TerrainType = TERRAIN_GRINDWIRE
}
ncomp_LO_default = {
    Class = LevelObject
    Type = Normal
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 200
    lod_dist2 = 201
}
ncomp_LO_default2 = {
    Class = LevelObject
    Type = Normal
    CollisionMode = Geometry
    SuspendDistance = 0
}
ncomp_waypoint_default = {
    Class = Waypoint
    Type = Default
    CreatedAtStart
}
ncomp_PedAI_default = {
    Class = Waypoint
    Type = PedAI
    CreatedAtStart
    Continue
    PedType = Skate
    Priority = Normal
    ContinueWeight = 1.0
    AdjustSpeedPercent = 50.0
    Acceleration = 500.0
    SkateAction = Continue
    JumpHeight = 60.0
}
ncomp_proxim_box = {
    Class = ProximNode
    Type = Camera
    ProximObject
    RenderToViewport
    SelectRenderOnly
    Shape = BoundingBox
}
ncomp_proxim_defaults = {
    Class = ProximNode
    Type = Camera
    ProximObject
    RenderToViewport
    SelectRenderOnly
}
ncomp_goal_arrow = {
    Class = GameObject
    Type = Goal_Arrow
    AbsentInNetGames
    Model = 'goalarrow\goalarrow.mdl'
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
}
ncomp_ped_stuff = {
    AbsentInNetGames
    SkeletonName = THPS5_human
    AnimName = animload_THPS5_human
}
ncomp_level_light = {
    Class = LevelLight
    CreatedAtStart
    Brightness = 0
}
ncomp_level_light2 = {
    Class = LevelLight
    CreatedAtStart
}
ncomp_car_waypoint = {
    Class = Waypoint
    Type = DecelForTurn
    CreatedAtStart
    SpawnObjScript = Car_DecelForTurn01
}
ncomp_car_waypoint2 = {
    Class = Waypoint
    Type = DecelForTurn
    CreatedAtStart
}
ncomp_bouncy_defaults = {
    coeff_restitution = 0.3000
    coeff_friction = 1.0
    skater_collision_impulse_factor = 0.7000
    skater_collision_rotation_factor = 0
    skater_collision_assent = 5
}
ncomp_emitter_box = {
    Class = EmitterObject
    Type = BoundingBox
}
ncomp_LO = {
    Class = LevelObject
    Type = Normal
    CreatedAtStart
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
}
ncomp_LO_2 = {
    Class = LevelObject
    Type = Normal
    CreatedAtStart
    CollisionMode = Geometry
}
ncomp_ghost_401 = {
    Class = GameObject
    Type = Ghost
    CreatedAtStart
    AbsentInNetGames
    Model = 'none'
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
}
ncomp_ghost_obj = {
    Class = GameObject
    Type = Ghost
    CreatedAtStart
    AbsentInNetGames
    Model = 'none'
}
ncomp_simple_waypoint = {
    Class = Waypoint
    CreatedAtStart
}
ncomp_proxim_shpere = {
    Class = ProximNode
    Type = Camera
    CreatedAtStart
    RenderToViewport
    SelectRenderOnly
    Shape = Sphere
}
ncomp_lod_suspend_dist1_200 = {
    SuspendDistance = 0
    lod_dist1 = 200
    lod_dist2 = 201
}
ncomp_lod_dist1_200 = {
    lod_dist1 = 200
    lod_dist2 = 201
}
ncomp_level_geometry = {
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
}
ncomp_level_geometry_NC = {
    Class = LevelGeometry
    CollisionMode = Geometry
}
ncomp_collision_mode_geometry = {
    CollisionMode = Geometry
}
