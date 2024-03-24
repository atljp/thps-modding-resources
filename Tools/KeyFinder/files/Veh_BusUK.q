Veh_BusUK_NodeArray = 
[
    {
        position = (-43.36437225341797, 161.10655212402344, 79.02188110351562)
        angles = (0.0, 0.0, 0.0)
        name = TRG_BusUK_Rail01
        class = RailNode
        type = Metal
        createdatstart
        terraintype = terrain_metalsmooth
        links = [ 1 ]
    }
    {
        position = (-43.36437225341797, 161.10655212402344, -207.145263671875)
        angles = (0.0, 0.0, 0.0)
        name = TRG_BusUK_Rail02
        class = RailNode
        type = Metal
        createdatstart
        terraintype = terrain_metalsmooth
    }
    {
        position = (43.936222076416016, 161.10655212402344, -207.145263671875)
        angles = (0.0, 0.0, 0.0)
        name = TRG_BusUK_Rail03
        class = RailNode
        type = Metal
        createdatstart
        terraintype = terrain_metalsmooth
    }
    {
        position = (43.936222076416016, 161.10655212402344, 79.02188110351562)
        angles = (0.0, 0.0, 0.0)
        name = TRG_BusUK_Rail04
        class = RailNode
        type = Metal
        createdatstart
        terraintype = terrain_metalsmooth
        links = [ 2 ]
    }
    {
        position = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = BUS_UK_Col
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = BUS_UK_ColScript
    }
    {
        position = (45.936222076416016, 54.88689422607422, 79.02188110351562)
        angles = (0.0, 0.0, 0.0)
        name = TRG_BusUK_Skitch02
        class = objecthook
        createdatstart
    }
    {
        position = (-45.364376068115234, 54.88689422607422, 79.02188110351562)
        angles = (0.0, 0.0, 0.0)
        name = TRG_BusUK_Skitch03
        class = objecthook
        createdatstart
    }
    {
        position = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = Car_Shadow
        class = levelgeometry
        collisionmode = geometry
    }
    {
        position = (-0.7989619970321655, -1.6163500547409058, -59.209014892578125)
        angles = (0.0, 0.0, 0.0)
        name = car
        class = levelgeometry
        collisionmode = geometry
    }
    {
        position = (-35.17543029785156, 19.400827407836914, -180.24435424804688)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel02
        class = levelgeometry
        collisionmode = geometry
    }
    {
        position = (34.071319580078125, 19.400827407836914, -180.24435424804688)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel01
        class = levelgeometry
        collisionmode = geometry
    }
    {
        position = (-35.175437927246094, 19.796701431274414, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel04
        class = levelgeometry
        collisionmode = geometry
    }
    {
        position = (34.07130432128906, 19.796701431274414, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel03
        class = levelgeometry
        collisionmode = geometry
    }
]
Veh_BusUKTriggerScripts = 
[ 
BUS_UK_ColScript
 ]

script BUS_UK_ColScript 
    if triggertype TRIGGER_LAND_ON
        Lon_BusWallride_Gap <...> 
    endif
endscript

