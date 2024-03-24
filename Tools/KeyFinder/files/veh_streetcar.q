veh_streetcar_NodeArray = 
[
    {
        Pos = (-0.000003999999989900971, -0.000003999999989900971, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = Veh_StreetCar
        class = LevelObject
        type = normal
        createdatstart
        collisionmode = geometry
        suspenddistance = 10000
        lod_dist1 = 500
        lod_dist2 = 501
        triggerscript = Veh_StreetCarScript
    }
    {
        Pos = (-44.121829986572266, 174.07432556152344, -120.21749877929688)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Rail_StreetCar02
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 2 ]
    }
    {
        Pos = (-44.121829986572266, 174.07432556152344, 263.7825012207031)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Rail_StreetCar03
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
    }
    {
        Pos = (44.120845794677734, 174.07432556152344, 263.7825012207031)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Rail_StreetCar06
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
    }
    {
        Pos = (44.120845794677734, 174.07432556152344, -120.21749877929688)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Rail_StreetCar07
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 3 ]
    }
    {
        Pos = (-0.000003999999989900971, -0.000003999999989900971, 95.78250122070312)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_Gap_End_Streetcar
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_Gap_End_StreetcarScript
    }
    {
        Pos = (0.000003999999989900971, 0.000003999999989900971, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = Car_Shadow
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (9.999999974752427e-7, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = car
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (-0.0000019999999949504854, 17.078964233398438, 196.97198486328125)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel01
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (-0.000003000000106112566, 17.078964233398438, 130.5155792236328)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel02
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (0.000004999999873689376, 17.07897186279297, -52.42601776123047)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel03
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (0.000006000000212225132, 17.07897186279297, 14.030391693115234)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel04
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
]

script Veh_StreetCarScript 
    StartGap GapID = StreetCar flags = [ REQUIRE_WALLRIDE ] TrickText = 'Wallie' TrickScript = NO_Gap_StreetCar
endscript


script TRGP_Gap_End_StreetcarScript 
    endgap GapID = StreetCar Score = 100 text = 'Streetcar Ride'
endscript

