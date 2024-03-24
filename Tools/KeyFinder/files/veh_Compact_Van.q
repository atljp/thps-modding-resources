veh_Compact_Van_NodeArray = 
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
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = Compact_Van_Col
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (23.71509552001953, 75.48764038085938, -38.713680267333984)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Compact_Van_Rail01
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 8 ]
    }
    {
        Pos = (25.458187103271484, 75.33722686767578, 98.3607177734375)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Compact_Van_Rail02
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
    }
    {
        Pos = (-23.7150936126709, 75.48764038085938, -38.713680267333984)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Compact_Van_Rail03
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 10 ]
    }
    {
        Pos = (-25.458168029785156, 75.33722686767578, 98.3607177734375)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Compact_Van_Rail04
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
    }
    {
        Pos = (36.48162841796875, 19.698726654052734, -26.45024871826172)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Compact_Van_Skitch01
        class = objecthook
        createdatstart
    }
    {
        Pos = (-36.31782531738281, 19.6987247467041, -26.45024871826172)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Compact_Van_Skitch02
        class = objecthook
        createdatstart
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_CompactVan_04
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_CompactVan_04Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_CompactVan_01
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_CompactVan_01Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_CompactVan_02
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_CompactVan_02Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_CompactVan_03
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_CompactVan_03Script
    }
]

script TRGP_CompactVan_04Script 
    Gap_CarHop StartGapID = CarHop02 EndGapID = CarHop01
endscript


script TRGP_CompactVan_01Script 
    Gap_CarHop StartGapID = CarHop03 EndGapID = CarHop04
endscript


script TRGP_CompactVan_02Script 
    Gap_CarHop StartGapID = CarHop01 EndGapID = CarHop02
endscript


script TRGP_CompactVan_03Script 
    Gap_CarHop StartGapID = CarHop04 EndGapID = CarHop03
endscript

