Veh_ST_Zip_2_NodeArray = 
[
    {
        Pos = (-21.95099639892578, 0.017980000004172325, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Zip2_Rail01
        class = RailNode
        type = Metal
        createdatstart
        hangright
        terraintype = TERRAIN_GRINDMETAL
        triggerscript = TRG_Veh_Zip2_Rail01Script
        links = [ 1 ]
    }
    {
        Pos = (27.721664428710938, 0.017980000004172325, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Zip2_Rail02
        class = RailNode
        type = Metal
        createdatstart
        hangright
        terraintype = TERRAIN_GRINDMETAL
        triggerscript = TRG_Veh_Zip2_Rail02Script
    }
    {
        Pos = (3.035325050354004, 14.619853973388672, 2.704617977142334)
        angles = (0.0, 0.0, 0.0)
        name = JG_ZipMotor02_A
        class = LevelObject
        type = normal
        createdatstart
        collisionmode = geometry
        suspenddistance = 0
        lod_dist1 = 100
        lod_dist2 = 200
        triggerscript = JG_ZipMotor02_AScript
    }
    {
        Pos = (3.035325050354004, 38.567893981933594, 2.7046170234680176)
        angles = (0.0, 1.570796012878418, 0.0)
        name = JG_ZipMotorSmokeB_Start
        class = particleobject
        type = default
        BoxDimsStart = (20.0, 20.0, 20.0)
        MidPosition = (4.267897129058838, 31.46800994873047, 2.1184229850769043)
        BoxDimsMid = (7.319907188415527, 7.319911003112793, 9.638909339904785)
        EndPosition = (16.152606964111328, 37.12471008300781, 2.464040994644165)
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
    {
        Pos = (3.035325050354004, 14.619853973388672, 2.704617977142334)
        angles = (0.0, 0.0, 0.0)
        name = JG_ZipMotor02_B
        class = LevelObject
        type = normal
        createdatstart
        collisionmode = geometry
        suspenddistance = 0
        lod_dist1 = 100
        lod_dist2 = 200
        triggerscript = JG_ZipMotor02_BScript
    }
]

script TRG_Veh_Zip2_Rail01Script 
    ST_zipline2_init
endscript


script TRG_Veh_Zip2_Rail02Script 
    ST_zipline2_init
endscript


script JG_ZipMotor02_AScript 
    ST_zip_engines1
endscript


script JG_ZipMotor02_BScript 
    ST_zip_engines2
endscript

