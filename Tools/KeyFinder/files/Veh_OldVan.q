Veh_OldVan_NodeArray = 
[
    {
        Pos = (-0.7243120074272156, 0.4468280076980591, -0.10440099984407425)
        angles = (0.0, 0.0, 0.0)
        name = Car_Shadow
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (-0.4606580138206482, 43.97429656982422, 23.249073028564453)
        angles = (0.0, 0.0, 0.0)
        name = car
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (26.169342041015625, 12.610526084899902, 65.80265808105469)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel01
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (-25.45408821105957, 12.610526084899902, 65.80265808105469)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel02
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (26.169334411621094, 12.610529899597168, -25.90521240234375)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel03
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (-25.4540958404541, 12.610529899597168, -25.90521240234375)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel04
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_OldVan01
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_OldVan01Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_OldVan02
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_OldVan02Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_OldVan03
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_OldVan03Script
    }
    {
        Pos = (0.0, 0.0, 24.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_OldVan04
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_OldVan04Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = OldVan_Col
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (-23.612895965576172, 76.06385040283203, -58.53609848022461)
        angles = (0.0, 0.0, 0.0)
        name = TRG_OldVan_Rail01
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 12 ]
    }
    {
        Pos = (-23.61285972595215, 76.06385040283203, 97.55474090576172)
        angles = (0.0, 0.0, 0.0)
        name = TRG_OldVan_Rail02
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
    }
    {
        Pos = (25.956462860107422, 76.06385040283203, -58.53611373901367)
        angles = (0.0, 0.0, 0.0)
        name = TRG_OldVan_Rail03
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 14 ]
    }
    {
        Pos = (25.956499099731445, 76.06385040283203, 97.55472564697266)
        angles = (0.0, 0.0, 0.0)
        name = TRG_OldVan_Rail04
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
    }
    {
        Pos = (-34.612876892089844, 43.009246826171875, -55.586578369140625)
        angles = (0.0, 0.0, 0.0)
        name = TRG_OldVan_Skitch01
        class = objecthook
        createdatstart
    }
    {
        Pos = (36.95647048950195, 43.009246826171875, -55.586578369140625)
        angles = (0.0, 0.0, 0.0)
        name = TRG_OldVan_Skitch02
        class = objecthook
        createdatstart
    }
]
Veh_OldVanTriggerScripts = 
[
    TRGP_OldVan01Script
    TRGP_OldVan02Script
    TRGP_OldVan03Script
    TRGP_OldVan04Script
]

script TRGP_OldVan01Script 
    Gap_CarHop StartGapID = CarHop04 EndGapID = CarHop03
endscript


script TRGP_OldVan02Script 
    Gap_CarHop StartGapID = CarHop03 EndGapID = CarHop04
endscript


script TRGP_OldVan03Script 
    Gap_CarHop StartGapID = CarHop01 EndGapID = CarHop02
endscript


script TRGP_OldVan04Script 
    Gap_CarHop StartGapID = CarHop02 EndGapID = CarHop01
endscript

