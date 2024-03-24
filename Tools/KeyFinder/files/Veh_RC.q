Veh_RC_NodeArray = 
[
    {
        Pos = (0.0, -0.07340099662542343, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = Car_Shadow
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (-0.053592000156641006, 1.5724079608917236, 2.3184239864349365)
        angles = (0.0, 0.0, 0.0)
        name = car
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (3.360848903656006, 1.2153589725494385, 10.142059326171875)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel01
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (-3.4552249908447266, 1.215358018875122, 10.142059326171875)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel02
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (3.3603360652923584, 1.2153600454330444, -0.05392000079154968)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel03
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (-3.4557080268859863, 1.2153589725494385, -0.05392000079154968)
        angles = (0.0, 0.0, 0.0)
        name = Car_Wheel04
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (0.0, -0.07340099662542343, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_Custom01
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_Custom01Script
    }
    {
        Pos = (0.0, -0.07340099662542343, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_Custom02
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_Custom02Script
    }
    {
        Pos = (0.0, -0.07340099662542343, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_Custom03
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_Custom03Script
    }
    {
        Pos = (0.0, -0.07340099662542343, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = TRGP_Custom04
        class = levelgeometry
        createdatstart
        collisionmode = geometry
        triggerscript = TRGP_Custom04Script
    }
    {
        Pos = (0.0, -0.07340099662542343, 0.0)
        angles = (0.0, 0.0, 0.0)
        name = Car_Collision
        class = levelgeometry
        createdatstart
        collisionmode = geometry
    }
    {
        Pos = (-36.753257751464844, 23.482580184936523, -19.259735107421875)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Custom_Skitch01
        class = objecthook
        createdatstart
    }
    {
        Pos = (35.98579025268555, 23.482580184936523, -19.194869995117188)
        angles = (0.0, 0.0, 0.0)
        name = TRG_Custom_Skitch02
        class = objecthook
        createdatstart
    }
]
Veh_RCTriggerScripts = 
[
    TRGP_Custom01Script
    TRGP_Custom02Script
    TRGP_Custom03Script
    TRGP_Custom04Script
]

script TRGP_Custom01Script 
    Gap_CarHop StartGapID = CarHop04 EndGapID = CarHop03
endscript


script TRGP_Custom02Script 
    Gap_CarHop StartGapID = CarHop03 EndGapID = CarHop04
endscript


script TRGP_Custom03Script 
    Gap_CarHop StartGapID = CarHop01 EndGapID = CarHop02
endscript


script TRGP_Custom04Script 
    Gap_CarHop StartGapID = CarHop02 EndGapID = CarHop01
endscript

