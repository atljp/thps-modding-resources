Veh_ST_Zip_NodeArray = 
[
    {
        Pos = (-36.0, 2.086548089981079, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Zip_Rail01
        class = RailNode
        type = Metal
        createdatstart
        hangright
        terraintype = TERRAIN_GRINDMETAL
        triggerscript = TRG_Veh_Zip_Rail01Script
        links = [ 1 ]
    }
    {
        Pos = (36.0, 2.086548089981079, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Zip_Rail02
        class = RailNode
        type = Metal
        createdatstart
        hangright
        terraintype = TERRAIN_GRINDMETAL
        triggerscript = TRG_Veh_Zip_Rail02Script
    }
    {
        Pos = (9.999999974752427e-7, -1.040405035018921, 0.5144739747047424)
        angles = (0.0, 0.0, 0.0)
        name = JG_ZipMotor01_B
        class = LevelObject
        type = normal
        createdatstart
        collisionmode = geometry
        suspenddistance = 0
        lod_dist1 = 100
        lod_dist2 = 200
        triggerscript = JG_ZipMotor01_BScript
    }
    {
        Pos = (-5.066102027893066, 0.0, 20.388246536254883)
        angles = (0.0, 0.0, 0.0)
        name = JG_ZipMotor01_A
        class = LevelObject
        type = normal
        createdatstart
        collisionmode = geometry
        suspenddistance = 0
        lod_dist1 = 100
        lod_dist2 = 200
        triggerscript = JG_ZipMotor01_AScript
    }
    {
        Pos = (0.0, 22.510433197021484, 12.598773956298828)
        angles = (0.0, 0.0, 0.0)
        name = JG_ZipMotorSmokeA_Start
        class = particleobject
        type = default
        BoxDimsStart = (20.0, 20.0, 20.0)
        MidPosition = (7.772064208984375, 25.74768829345703, 12.012580871582031)
        BoxDimsMid = (7.319907188415527, 7.319911003112793, 9.638909339904785)
        EndPosition = (15.214336395263672, 48.003028869628906, 12.358199119567871)
        BoxDimsEnd = (12.793999671936035, 12.794001579284668, 19.817424774169922)
        texture = dt_generic_particle01
        createdatstart
        absentinnetgames
        UseMidPoint
        UseColorMidTime
        type = NewFlat
        BlendMode = Blend
        FixedAlpha = 128
        alphacutoff = 0
        maxstreams = 2
        suspenddistance = 10
        lod_dist1 = 400
        lod_dist2 = 401
        emitrate = 10.0
        lifetime = 3.0
        MidPointPCT = 50
        startradius = 2.0
        MidRadius = 5.0
        endradius = 15.0
        StartRadiusSpread = 5.0
        MidRadiusSpread = 5.0
        EndRadiusSpread = 5.0
        startRGB = [42 , 36 , 30]
        startAlpha = 0
        ColorMidTime = 50
        midRGB = [42 , 40 , 36]
        midAlpha = 82
        endRGB = [42 , 42 , 40]
        endAlpha = 0
    }
]

script TRG_Veh_Zip_Rail01Script 
    ST_zipline_init
endscript


script TRG_Veh_Zip_Rail02Script 
    ST_zipline_init
endscript


script JG_ZipMotor01_BScript 
    ST_zip_engines2
endscript


script JG_ZipMotor01_AScript 
    ST_zip_engines1
endscript

