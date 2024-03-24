Veh_Blimp_NodeArray = 
[
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = Car_Shadow
        ncomp_LevelGeometry_1
    }
    {
        Pos = (1.7935500144958496, 26.95333480834961, -5.195003986358643)
        angles = (0.0, 0.0, 0.0)
        name = car
        class = LevelObject
        type = normal
        createdatstart
        collisionmode = geometry
        suspenddistance = 0
        lod_dist1 = 1500
        lod_dist2 = 1501
        triggerscript = CarScript
    }
    {
        Pos = (19.91558074951172, 9.234644889831543, 24.90161895751953)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel01
        ncomp_LevelGeometry_1
    }
    {
        Pos = (-20.454971313476562, 9.234644889831543, 24.90161895751953)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel04
        ncomp_LevelGeometry_1
    }
    {
        Pos = (19.915573120117188, 9.234647750854492, -40.53473663330078)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel02
        ncomp_LevelGeometry_1
    }
    {
        Pos = (-20.454971313476562, 9.234647750854492, -40.53473663330078)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel03
        ncomp_LevelGeometry_1
    }
]
Veh_BlimpTriggerScripts = 
[ 
CarScript
 ]

script CarScript 
    Sch_Blimp
endscript

ncomp_LevelGeometry_1 = {
    class = levelgeometry
    createdatstart
    collisionmode = geometry
}
