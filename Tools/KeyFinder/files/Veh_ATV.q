Veh_ATV_NodeArray = 
[
    {
        Pos = (-0.3277890086174011, 0.0, 0.18213799595832825)
        angles = (0.0, 0.0, 0.0)
        name = Car_Shadow
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (0.04834099858999252, 28.176298141479492, 0.3919849991798401)
        angles = (0.0, 0.0, 0.0)
        name = car
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (21.379613876342773, 11.233098030090332, 30.579082489013672)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel01
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (-21.0524959564209, 11.233098030090332, 30.57907485961914)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel02
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (21.379621505737305, 11.233098030090332, -31.81818199157715)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel03
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (-21.052488327026367, 11.233098030090332, -31.81818962097168)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel04
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_ATV01
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_ATV01Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_ATV02
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_ATV02Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_ATV03
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_ATV03Script
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_ATV04
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_ATV04Script
    }
    {
        Pos = (28.60095977783203, 34.351951599121094, -36.97980880737305)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_ATV_Skitch01
        class = objecthook
        createdatstart
    }
    {
        Pos = (-28.69522476196289, 34.35194396972656, -36.97980499267578)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Veh_ATV_Skitch02
        class = objecthook
        createdatstart
    }
    {
        Pos = (0.0, 0.0, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = ATV_Col
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
]
Veh_ATVTriggerScripts = 
[
    TRGP_ATV01Script
    TRGP_ATV02Script
    TRGP_ATV03Script
    TRGP_ATV04Script
]

script TRGP_ATV01Script 
    Gap_CarHop StartGapID = CarHop02 EndGapID = CarHop01
endscript


script TRGP_ATV02Script 
    Gap_CarHop StartGapID = CarHop01 EndGapID = CarHop02
endscript


script TRGP_ATV03Script 
    Gap_CarHop StartGapID = CarHop03 EndGapID = CarHop04
endscript


script TRGP_ATV04Script 
    Gap_CarHop StartGapID = CarHop04 EndGapID = CarHop03
endscript

