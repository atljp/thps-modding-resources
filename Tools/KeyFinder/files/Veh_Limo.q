veh_limo_NodeArray = 
[
    {
        Pos = (0.000014999999621068127, 0.22622500360012054, -0.000006000000212225132)
        angles = (0.0, 0.0, 0.0)
        name = Car_Shadow
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (-0.02102999947965145, 1.2932610511779785, 19.456039428710938)
        angles = (-9.999999974752427e-7, 0.0, 0.0)
        name = car
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (35.744895935058594, 16.686967849731445, 166.21910095214844)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel01
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (-33.356285095214844, 16.686967849731445, 166.21910095214844)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel02
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (35.744873046875, 16.686975479125977, -30.778297424316406)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel03
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (-33.356285095214844, 16.686975479125977, -30.77829933166504)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel04
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (25.06315040588379, 64.079345703125, -26.29864501953125)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_limo_Rail01
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 7 ]
    }
    {
        Pos = (25.06315040588379, 64.07933807373047, 112.98701477050781)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_limo_Rail02
        class = RailNode
        type = Metal
        createdatstart
        noclimbing
        terraintype = TERRAIN_GRINDMETAL
        links = [ 8 ]
    }
    {
        Pos = (25.06315040588379, 69.07933807373047, 124.98701477050781)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_limo_Rail03
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
    }
    {
        Pos = (25.06315040588379, 69.079345703125, -38.29864501953125)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_limo_Rail04
        class = RailNode
        type = Metal
        createdatstart
        noclimbing
        terraintype = TERRAIN_GRINDMETAL
        links = [ 6 ]
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_limo01
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_limo01Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_limo02
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_limo02Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_limo03
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_limo03Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_limo04
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_limo04Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = Limo_Col
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (-25.30206871032715, 69.07933807373047, 124.98701477050781)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_limo_Rail05
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
    }
    {
        Pos = (-25.30206871032715, 64.07933807373047, 112.98701477050781)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_limo_Rail06
        class = RailNode
        type = Metal
        createdatstart
        noclimbing
        terraintype = TERRAIN_GRINDMETAL
        links = [ 15 ]
    }
    {
        Pos = (-25.30206871032715, 64.079345703125, -26.29864501953125)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_limo_Rail07
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 16 ]
    }
    {
        Pos = (-25.30206871032715, 69.079345703125, -38.29864501953125)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_limo_Rail08
        class = RailNode
        type = Metal
        createdatstart
        noclimbing
        terraintype = TERRAIN_GRINDMETAL
        links = [ 17 ]
    }
]
veh_LimoTriggerScripts = 
[
    TRGP_limo01Script
    TRGP_limo02Script
    TRGP_limo03Script
    TRGP_limo04Script
]

script TRGP_limo01Script 
    Gap_CarHop StartGapID = CarHop02 EndGapID = CarHop01
endscript


script TRGP_limo02Script 
    Gap_CarHop StartGapID = CarHop01 EndGapID = CarHop02
endscript


script TRGP_limo03Script 
    Gap_CarHop StartGapID = CarHop03 EndGapID = CarHop04
endscript


script TRGP_limo04Script 
    Gap_CarHop StartGapID = CarHop04 EndGapID = CarHop03
endscript

