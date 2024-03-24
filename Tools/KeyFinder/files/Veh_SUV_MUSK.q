Veh_SUV_MUSK_NodeArray = 
[
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = Car_Shadow
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (-0.43566200137138367, 17.04511260986328, 3.364650011062622)
        angles = (0.0, 0.0, 0.0)
        name = car
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (35.47169494628906, 19.321802139282227, 127.31204223632812)
        angles = (0.0, 0.0009190000128000975, 0.0)
        name = Car_Wheel01
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (-37.65467834472656, 19.321802139282227, 127.31204223632812)
        angles = (0.0, 0.0009190000128000975, 0.0)
        name = Car_Wheel02
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (35.47169494628906, 19.321807861328125, -0.9189680218696594)
        angles = (0.0, 0.0009190000128000975, 0.0)
        name = Car_Wheel03
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (-37.65468215942383, 19.321807861328125, -0.9189680218696594)
        angles = (0.0, 0.0009190000128000975, 0.0)
        name = Car_Wheel04
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_SUV_MUSK01
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_SUV_MUSK01Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_SUV_MUSK02
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_SUV_MUSK02Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_SUV_MUSK03
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_SUV_MUSK03Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_SUV_MUSK04
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_SUV_MUSK04Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = SUV_MUSK_Col
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (26.823463439941406, 77.28548431396484, -39.961158752441406)
        angles = (0.0, 0.0, 0.0)
        name = TRG_SUV_MUSK_Rail01
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 12 ]
    }
    {
        Pos = (26.823463439941406, 77.28548431396484, 92.66769409179688)
        angles = (0.0, 0.0, 0.0)
        name = TRG_SUV_MUSK_Rail02
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
    }
    {
        Pos = (-28.695213317871094, 77.28548431396484, -39.961151123046875)
        angles = (0.0, 0.0, 0.0)
        name = TRG_SUV_MUSK_Rail03
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 14 ]
    }
    {
        Pos = (-28.695213317871094, 77.28548431396484, 92.66768646240234)
        angles = (0.0, 0.0, 0.0)
        name = TRG_SUV_MUSK_Rail04
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
    }
    {
        Pos = (-43.66873550415039, 22.596343994140625, -45.93701934814453)
        angles = (0.0, 0.0, 0.0)
        name = TRG_SUV_MUSK_Rail05
        class = objecthook
        createdatstart
    }
    {
        Pos = (42.40907287597656, 22.59634780883789, -45.93702697753906)
        angles = (0.0, 0.0, 0.0)
        name = TRG_SUV_MUSK_Rail06
        class = objecthook
        createdatstart
    }
]
Veh_SUV_MUSKTriggerScripts = 
[
    TRGP_SUV_MUSK01Script
    TRGP_SUV_MUSK02Script
    TRGP_SUV_MUSK03Script
    TRGP_SUV_MUSK04Script
]

script TRGP_SUV_MUSK01Script 
    Gap_CarHop StartGapID = CarHop04 EndGapID = CarHop03
endscript


script TRGP_SUV_MUSK02Script 
    Gap_CarHop StartGapID = CarHop03 EndGapID = CarHop04
endscript


script TRGP_SUV_MUSK03Script 
    Gap_CarHop StartGapID = CarHop01 EndGapID = CarHop02
endscript


script TRGP_SUV_MUSK04Script 
    Gap_CarHop StartGapID = CarHop02 EndGapID = CarHop01
endscript

