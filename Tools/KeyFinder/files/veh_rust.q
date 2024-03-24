veh_rust_NodeArray = 
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
        Pos = (-0.0000019999999949504854, 28.174516677856445, 40.823089599609375)
        angles = (1.570796012878418, -1.570796012878418, 0.0)
        name = car
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (32.855289459228516, 14.643051147460938, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel03
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (-32.85529327392578, 14.643051147460938, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel04
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (32.855289459228516, 14.643047332763672, 136.15342712402344)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel01
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (-32.855289459228516, 14.643047332763672, 136.15342712402344)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel02
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (0.000011000000085914508, 1.9837219715118408, 0.007660000119358301)
        angles = (0.0, 0.0, 0.0)
        name = Rust_Col
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (33.08577346801758, 97.51493835449219, -42.995018005371094)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Rust_Rail0101
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 8 ]
    }
    {
        Pos = (34.42842483520508, 95.42955017089844, 141.4453887939453)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Rust_Rail0102
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
    }
    {
        Pos = (-33.08578109741211, 97.51493072509766, -42.99501037597656)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Rust_Rail0103
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 10 ]
    }
    {
        Pos = (-34.428428649902344, 95.4295425415039, 141.4453887939453)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Rust_Rail0104
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
    }
    {
        Pos = (43.62800979614258, 25.614404678344727, -36.09769821166992)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Rust_Skitch0101
        class = objecthook
        createdatstart
    }
    {
        Pos = (-43.82939147949219, 25.614402770996094, -36.09769058227539)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Rust_Skitch0102
        class = objecthook
        createdatstart
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_Rust01
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_Rust01Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_Rust02
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_Rust02Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_Rust03
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_Rust03Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_Rust04
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_Rust04Script
    }
]

script TRGP_Rust01Script 
    Gap_CarHop StartGapID = CarHop02 EndGapID = CarHop01
endscript


script TRGP_Rust02Script 
    Gap_CarHop StartGapID = CarHop03 EndGapID = CarHop04
endscript


script TRGP_Rust03Script 
    Gap_CarHop StartGapID = CarHop01 EndGapID = CarHop02
endscript


script TRGP_Rust04Script 
    Gap_CarHop StartGapID = CarHop04 EndGapID = CarHop03
endscript

