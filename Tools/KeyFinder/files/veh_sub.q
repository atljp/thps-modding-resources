veh_sub_NodeArray = 
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
        Pos = (0.000003000000106112566, 32.79828643798828, 50.16942596435547)
        angles = (1.570796012878418, -1.570796012878418, 0.0)
        name = car
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (49.171669006347656, 18.84769058227539, 145.7267303466797)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel01
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (-49.07914352416992, 18.84769058227539, 145.7267303466797)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel02
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (49.171669006347656, 18.847700119018555, -24.108896255493164)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel03
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (-49.07914352416992, 18.847700119018555, -24.108896255493164)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel04
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (9.999999974752427e-7, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = Sub_Col
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_Sub01
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_Sub01Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_Sub02
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_Sub02Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_Sub03
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_Sub03Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_Sub04
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_Sub04Script
    }
    {
        Pos = (-47.03782272338867, 90.97222137451172, -85.16856384277344)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Sub_Rail01
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 12 ]
    }
    {
        Pos = (-47.03782653808594, 90.97222137451172, 83.49365234375)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Sub_Rail02
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 13 ]
    }
    {
        Pos = (-52.262306213378906, 65.07534790039062, 108.55545043945312)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Sub_Rail03
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 14 ]
    }
    {
        Pos = (-47.03782653808594, 63.99767303466797, 190.93031311035156)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Sub_Rail04
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
    }
    {
        Pos = (47.03782272338867, 90.97221374511719, -85.16854858398438)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Sub_Rail05
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 16 ]
    }
    {
        Pos = (47.03782272338867, 90.97221374511719, 83.49365234375)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Sub_Rail06
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 17 ]
    }
    {
        Pos = (47.03782272338867, 70.40377044677734, 104.87531280517578)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Sub_Rail07
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
        links = [ 18 ]
    }
    {
        Pos = (47.03782272338867, 67.99767303466797, 190.93031311035156)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Sub_Rail08
        class = RailNode
        type = Metal
        createdatstart
        terraintype = TERRAIN_GRINDMETAL
    }
    {
        Pos = (62.41993713378906, 23.020912170410156, -85.83153533935547)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Sub_Skitch01
        class = objecthook
        createdatstart
    }
    {
        Pos = (-62.473079681396484, 25.505807876586914, -84.51422119140625)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_Sub_Skitch02
        class = objecthook
        createdatstart
    }
]

script TRGP_Sub01Script 
    Gap_CarHop StartGapID = CarHop02 EndGapID = CarHop01
endscript


script TRGP_Sub02Script 
    Gap_CarHop StartGapID = CarHop03 EndGapID = CarHop04
endscript


script TRGP_Sub03Script 
    Gap_CarHop StartGapID = CarHop01 EndGapID = CarHop02
endscript


script TRGP_Sub04Script 
    Gap_CarHop StartGapID = CarHop04 EndGapID = CarHop03
endscript

