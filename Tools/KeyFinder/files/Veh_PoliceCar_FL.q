Veh_PoliceCar_FL_NodeArray = 
[
    {
        Pos = (0.000014999999621068127, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = Car_Shadow
        ncomp_LevelGeometry_1
    }
    {
        Pos = (0.7415540218353271, 34.08750915527344, 42.87480545043945)
        angles = (0.0, 0.0, 0.0)
        name = car
        ncomp_LevelGeometry_1
    }
    {
        Pos = (30.369901657104492, 14.194345474243164, 110.59237670898438)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel01
        ncomp_LevelGeometry_1
    }
    {
        Pos = (-30.962480545043945, 14.194345474243164, 110.59237670898438)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel02
        ncomp_LevelGeometry_1
    }
    {
        Pos = (30.36988639831543, 14.194350242614746, -10.286666870117188)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel03
        ncomp_LevelGeometry_1
    }
    {
        Pos = (-30.962480545043945, 14.194350242614746, -10.286666870117188)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel04
        ncomp_LevelGeometry_1
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_PoliceCar_FL01
        ncomp_LevelGeometry_1
        triggerscript = TRGP_PoliceCar_FL01Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_PoliceCar_FL02
        ncomp_LevelGeometry_1
        triggerscript = TRGP_PoliceCar_FL02Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_PoliceCar_FL03
        ncomp_LevelGeometry_1
        triggerscript = TRGP_PoliceCar_FL03Script
    }
    {
        Pos = (0.0, 0.0, 24.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_PoliceCar_FL04
        ncomp_LevelGeometry_1
        triggerscript = TRGP_PoliceCar_FL04Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = PoliceCar_FL_Col
        ncomp_LevelGeometry_1
    }
    {
        Pos = (-27.841459274291992, 54.460655212402344, -8.477798461914062)
        angles = (0.0, 0.0, 0.0)
        name = TRG_PoliceCar_FL_Rail01
        ncomp_RailNode_12
        links = [ 12 ]
    }
    {
        Pos = (-27.841421127319336, 54.460655212402344, 72.29329681396484)
        angles = (0.0, 0.0, 0.0)
        name = TRG_PoliceCar_FL_Rail02
        ncomp_RailNode_12
    }
    {
        Pos = (28.670560836791992, 54.460655212402344, -8.477813720703125)
        angles = (0.0, 0.0, 0.0)
        name = TRG_PoliceCar_FL_Rail03
        ncomp_RailNode_12
        links = [ 14 ]
    }
    {
        Pos = (28.67059898376465, 54.460655212402344, 72.29327392578125)
        angles = (0.0, 0.0, 0.0)
        name = TRG_PoliceCar_FL_Rail04
        ncomp_RailNode_12
    }
    {
        Pos = (-35.8414421081543, 35.2933349609375, -59.34326934814453)
        angles = (0.0, 0.0, 0.0)
        name = TRG_PoliceCar_FL_Skitch01
        ncomp_ObjectHook_16
    }
    {
        Pos = (36.67056655883789, 35.2933349609375, -59.34327697753906)
        angles = (0.0, 0.0, 0.0)
        name = TRG_PoliceCar_FL_Skitch02
        ncomp_ObjectHook_16
    }
]
Veh_PoliceCar_FLTriggerScripts = 
[
    TRGP_PoliceCar_FL01Script
    TRGP_PoliceCar_FL02Script
    TRGP_PoliceCar_FL03Script
    TRGP_PoliceCar_FL04Script
]

script TRGP_PoliceCar_FL01Script 
    Gap_CarHop StartGapID = CarHop04 EndGapID = CarHop03
endscript


script TRGP_PoliceCar_FL02Script 
    Gap_CarHop StartGapID = CarHop03 EndGapID = CarHop04
endscript


script TRGP_PoliceCar_FL03Script 
    Gap_CarHop StartGapID = CarHop01 EndGapID = CarHop02
endscript


script TRGP_PoliceCar_FL04Script 
    Gap_CarHop StartGapID = CarHop02 EndGapID = CarHop01
endscript

ncomp_LevelGeometry_1 = {
    class = levelgeometry
    createdatstart
    collisionmode = geometry
}
ncomp_RailNode_12 = {
    class = RailNode
    type = Metal
    createdatstart
    terraintype = TERRAIN_GRINDMETAL
}
ncomp_ObjectHook_16 = {
    class = objecthook
    createdatstart
}
