Veh_NO_Heli_NodeArray = 
[
    {
        Pos = (1.9541929960250854, 8.762638092041016, 0.3549039959907532)
        angles = (0.0, 0.0, 0.0)
        name = Veh_NO_Heli
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (-55.630462646484375, -70.89020538330078, 16.228302001953125)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Heli_Rail01
        class = RailNode
        type = Metal
        createdatstart
        hangright
        terraintype = TERRAIN_GRINDMETAL
        triggerscript = TRG_Veh_Heli_Rail01Script
        links = [ 2 ]
    }
    {
        Pos = (-56.290985107421875, -71.68228149414062, 78.64667510986328)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Heli_Rail02
        class = RailNode
        type = Metal
        createdatstart
        hangright
        terraintype = TERRAIN_GRINDMETAL
        links = [ 3 ]
    }
    {
        Pos = (-56.290985107421875, -71.99434661865234, 231.60321044921875)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Heli_Rail03
        class = RailNode
        type = Metal
        createdatstart
        hangright
        terraintype = TERRAIN_GRINDMETAL
        links = [ 4 ]
    }
    {
        Pos = (-53.570960998535156, -69.85643005371094, 276.41143798828125)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Heli_Rail04
        class = RailNode
        type = Metal
        createdatstart
        hangright
        terraintype = TERRAIN_GRINDMETAL
    }
    {
        Pos = (53.65544128417969, -68.631591796875, 18.0560302734375)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Heli_Rail05
        class = RailNode
        type = generic
        createdatstart
        hangleft
        terraintype = terrain_default
        triggerscript = TRG_Veh_Heli_Rail05Script
        links = [ 6 ]
    }
    {
        Pos = (55.55355453491211, -71.68228149414062, 78.64667510986328)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Heli_Rail06
        class = RailNode
        type = Metal
        createdatstart
        hangleft
        terraintype = TERRAIN_GRINDMETAL
        links = [ 7 ]
    }
    {
        Pos = (55.55355453491211, -71.99434661865234, 231.60321044921875)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Heli_Rail07
        class = RailNode
        type = Metal
        createdatstart
        hangleft
        terraintype = TERRAIN_GRINDMETAL
        links = [ 8 ]
    }
    {
        Pos = (52.662933349609375, -69.85643005371094, 276.41143798828125)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Heli_Rail08
        class = RailNode
        type = Metal
        createdatstart
        hangleft
        terraintype = TERRAIN_GRINDMETAL
    }
]

script TRG_Veh_Heli_Rail01Script 
    NO_heli_lip
endscript


script TRG_Veh_Heli_Rail05Script 
    NO_heli_lip
endscript

