veh_HippyVan_NodeArray = 
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
        Pos = (0.001917000045068562, 48.2013053894043, 41.49544906616211)
        angles = (0.0, 0.0, 0.0)
        name = car
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (-32.564510345458984, 13.880331993103027, 68.9563980102539)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel02
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (-32.56450653076172, 13.880335807800293, 1.792472004890442)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel04
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (31.811052322387695, 13.880335807800293, 1.7997369766235352)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel03
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (31.81104850769043, 13.880331993103027, 68.96366119384766)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel01
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = HippyVan_Col
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (-32.78447723388672, 85.81322479248047, -31.954235076904297)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_HippyVan_Rail01
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 8 ]
    }
    {
        Pos = (-32.78446960449219, 85.81324005126953, 103.84053039550781)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_HippyVan_Rail02
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
    }
    {
        Pos = (32.905696868896484, 85.81322479248047, -31.954235076904297)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_HippyVan_Rail03
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 10 ]
    }
    {
        Pos = (32.90569305419922, 85.81324005126953, 103.84053039550781)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_HippyVan_Rail04
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
    }
    {
        Pos = (49.02634048461914, 19.119953155517578, -29.766979217529297)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_HippyVan_Skitch01
        class = objecthook
        createdatstart
    }
    {
        Pos = (-49.0665397644043, 19.119951248168945, -29.766979217529297)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_HippyVan_Skitch02
        class = objecthook
        createdatstart
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_HippyVan01
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_HippyVan01Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_HippyVan02
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_HippyVan02Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_HippyVan03
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_HippyVan03Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_HippyVan04
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_HippyVan04Script
    }
]

script TRGP_HippyVan01Script 
    Gap_CarHop StartGapID = CarHop02 EndGapID = CarHop01
endscript


script TRGP_HippyVan02Script 
    Gap_CarHop StartGapID = CarHop03 EndGapID = CarHop04
endscript


script TRGP_HippyVan03Script 
    Gap_CarHop StartGapID = CarHop01 EndGapID = CarHop02
endscript


script TRGP_HippyVan04Script 
    Gap_CarHop StartGapID = CarHop04 EndGapID = CarHop03
endscript

