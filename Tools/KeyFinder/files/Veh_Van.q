veh_Van_NodeArray = 
[
    {
        Pos = (0.0, 2.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = Car_Shadow
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (0.0000019999999949504854, 45.53102111816406, 43.03546142578125)
        angles = (0.0, 0.0, 0.0)
        name = car
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (-26.75312042236328, 14.034177780151367, 80.92337036132812)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel02
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (-26.753116607666016, 14.034184455871582, 0.0895019993185997)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel04
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (26.801158905029297, 14.034184455871582, 0.09676600247621536)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel03
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (26.80115509033203, 14.034177780151367, 80.93063354492188)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel01
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (-0.0000019999999949504854, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = Box01
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (-27.45817756652832, 79.04638671875, -12.92591667175293)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_van_Rail01
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 8 ]
    }
    {
        Pos = (-27.45817756652832, 79.04638671875, 78.56385803222656)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_van_Rail02
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 11 ]
    }
    {
        Pos = (27.340147018432617, 79.04638671875, -12.92591667175293)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_van_Rail03
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 10 ]
    }
    {
        Pos = (27.340147018432617, 79.04638671875, 78.56385803222656)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_van_Rail04
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 12 ]
    }
    {
        Pos = (-27.45817756652832, 81.04638671875, 90.56385803222656)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_van_Rail05
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
    }
    {
        Pos = (27.340147018432617, 81.04638671875, 90.56385803222656)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_van_Rail06
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
    }
    {
        Pos = (27.340147018432617, 81.04638671875, -24.92591667175293)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_van_Rail07
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 9 ]
    }
    {
        Pos = (-27.45817756652832, 81.04638671875, -24.92591667175293)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_van_Rail08
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 7 ]
    }
    {
        Pos = (36.316925048828125, 19.698726654052734, -28.45024871826172)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_van_Skitch01
        class = objecthook
        createdatstart
    }
    {
        Pos = (-36.31782531738281, 19.6987247467041, -28.45024871826172)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_van_Skitch02
        class = objecthook
        createdatstart
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_Van01
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_Van01Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_Van02
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_Van02Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_Van03
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_Van03Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_Van04
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_Van04Script
    }
]

script TRGP_Van01Script 
    Gap_CarHop StartGapID = CarHop02 EndGapID = CarHop01
endscript


script TRGP_Van02Script 
    Gap_CarHop StartGapID = CarHop03 EndGapID = CarHop04
endscript


script TRGP_Van03Script 
    Gap_CarHop StartGapID = CarHop01 EndGapID = CarHop02
endscript


script TRGP_Van04Script 
    Gap_CarHop StartGapID = CarHop04 EndGapID = CarHop03
endscript

