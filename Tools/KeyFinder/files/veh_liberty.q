veh_liberty_NodeArray = 
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
        Pos = (30.855289459228516, 14.67970085144043, 117.48665618896484)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel01
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (-30.855289459228516, 14.67970085144043, 117.48665618896484)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel02
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (30.855289459228516, 14.679706573486328, 0.0901079997420311)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel03
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (-30.85529327392578, 14.679706573486328, 0.0901079997420311)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel04
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (9.64349365234375, 34.168701171875, 62.72509765625)
        angles = (0.0, 0.0, 0.0)
        name = car
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (0.0000019999999949504854, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = Liberty_Col
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (-28.2122859954834, 73.91698455810547, -39.016761779785156)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Liberty_Rail0101
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 8 ]
    }
    {
        Pos = (-29.272567749023438, 71.151123046875, 65.2391586303711)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Liberty_Rail0102
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 9 ]
    }
    {
        Pos = (-34.4501953125, 48.502925872802734, 89.62975311279297)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Liberty_Rail0103
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 10 ]
    }
    {
        Pos = (-33.70417022705078, 42.58005142211914, 135.37525939941406)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Liberty_Rail0104
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
    }
    {
        Pos = (28.212289810180664, 73.91698455810547, -39.016761779785156)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Liberty_Rail0105
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 12 ]
    }
    {
        Pos = (29.272571563720703, 71.151123046875, 65.2391586303711)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Liberty_Rail0106
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 13 ]
    }
    {
        Pos = (34.4501953125, 48.502925872802734, 89.62975311279297)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Liberty_Rail0107
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 14 ]
    }
    {
        Pos = (35.37360382080078, 42.58005142211914, 135.37525939941406)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Liberty_Rail0108
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
    }
    {
        Pos = (14.49418830871582, 23.809873580932617, -44.812477111816406)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Liberty_Skitch0101
        class = objecthook
        createdatstart
    }
    {
        Pos = (-14.52666187286377, 23.809877395629883, -44.81248092651367)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Liberty_Skitch0102
        class = objecthook
        createdatstart
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_Liberty04
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_Liberty04Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_Liberty01
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_Liberty01Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_Liberty02
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_Liberty02Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_Liberty03
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_Liberty03Script
    }
]

script TRGP_Liberty04Script 
    Gap_CarHop StartGapID = CarHop02 EndGapID = CarHop01
endscript


script TRGP_Liberty01Script 
    Gap_CarHop StartGapID = CarHop03 EndGapID = CarHop04
endscript


script TRGP_Liberty02Script 
    Gap_CarHop StartGapID = CarHop01 EndGapID = CarHop02
endscript


script TRGP_Liberty03Script 
    Gap_CarHop StartGapID = CarHop04 EndGapID = CarHop03
endscript

