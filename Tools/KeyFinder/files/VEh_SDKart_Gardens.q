veh_SDKart_Gardens_NodeArray = 
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
        Pos = (-0.0764869973063469, -0.03614399954676628, 0.0)
        angles = (0.0, 0.0, -9.999999974752427e-7)
        name = car
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (19.91558074951172, 9.234644889831543, 24.90161895751953)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel01
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (-20.454971313476562, 9.234644889831543, 24.90161895751953)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel04
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (19.915573120117188, 9.234647750854492, -40.53473663330078)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel02
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (-20.454971313476562, 9.234647750854492, -40.53473663330078)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel03
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (26.105594635009766, 31.304065704345703, -71.7120361328125)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_SDKartGarden_Rail01
        class = RailNode
        type = Concrete
        createdatstart
        terraintype = TERRAIN_GRINDCONC
        links = [ 7 ]
    }
    {
        Pos = (26.105594635009766, 31.304065704345703, 20.640716552734375)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_SDKartGarden_Rail02
        class = RailNode
        type = Concrete
        createdatstart
        terraintype = TERRAIN_GRINDCONC
    }
    {
        Pos = (0.0, -0.8930850028991699, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_SDKartGarden01
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_SDKartGarden01Script
    }
    {
        Pos = (0.0, -0.8930850028991699, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_SDKartGarden02
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_SDKartGarden02Script
    }
    {
        Pos = (0.0, -0.8930850028991699, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_SDKartGarden03
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_SDKartGarden03Script
    }
    {
        Pos = (0.0, -0.8930850028991699, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_SDKartGarden04
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_SDKartGarden04Script
    }
    {
        Pos = (0.0, -0.8930850028991699, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = SDKartGarden_Col
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (26.105587005615234, 31.304065704345703, -59.467979431152344)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_SDKartGarden_Skitch01
        class = objecthook
        createdatstart
    }
    {
        Pos = (-26.258544921875, 31.304058074951172, -59.46797561645508)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_SDKartGarden_Skitch02
        class = objecthook
        createdatstart
    }
    {
        Pos = (-26.258544921875, 31.304065704345703, 20.640716552734375)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_SDKartGarden_Rail06
        class = RailNode
        type = Concrete
        createdatstart
        terraintype = TERRAIN_GRINDCONC
    }
    {
        Pos = (-26.258544921875, 31.304065704345703, -71.7120361328125)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_SDKartGarden_Rail07
        class = RailNode
        type = Concrete
        createdatstart
        terraintype = TERRAIN_GRINDCONC
        links = [ 15 ]
    }
]
veh_SDKart_GardensTriggerScripts = 
[
    TRGP_SDKartGarden01Script
    TRGP_SDKartGarden02Script
    TRGP_SDKartGarden03Script
    TRGP_SDKartGarden04Script
]

script TRGP_SDKartGarden01Script 
    Gap_CarHop StartGapID = CarHop02 EndGapID = CarHop01
endscript


script TRGP_SDKartGarden02Script 
    Gap_CarHop StartGapID = CarHop01 EndGapID = CarHop02
endscript


script TRGP_SDKartGarden03Script 
    Gap_CarHop StartGapID = CarHop03 EndGapID = CarHop04
endscript


script TRGP_SDKartGarden04Script 
    Gap_CarHop StartGapID = CarHop04 EndGapID = CarHop03
endscript

