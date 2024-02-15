
script dismember bone = Bone_Head maxVel = 200 maxrotvel = 4
    obj_getid
    BodyChunkName = (<bone> + <ObjID>)
    if CompositeObjectExists name = <BodyChunkName>
        <BodyChunkName> ::Die
    endif
    obj_getposition
    obj_getboneposition bone = <bone>
    ModelOffset = (<Pos> - <x> * (1.0, 0.0, 0.0) - <y> * (0.0, 1.0, 0.0) - <z> * (0.0, 0.0, 1.0))
    Obj_GetQuat
    CreateCompositeObject Components = BodyChunkComponents params = {
        name = <BodyChunkName>
        Pos = <Pos>
        Orientation = <Quat>
        CloneFrom = <ObjID>
        copyskeletonfrom = <ObjID>
        model_offset = <ModelOffset>
    }
    vel = (<maxVel> * randomrange (-1.100000023841858, 1.100000023841858) * (1.0, 0.0, 0.0)
    + <maxVel> * randomrange (0.0, 1.100000023841858) * (0.0, 1.0, 0.0)
    + <maxVel> * randomrange (-1.100000023841858, 1.100000023841858) * (0.0, 0.0, 1.0)
    )
    rotvel = (<maxrotvel> * randomrange (-1.100000023841858, 1.100000023841858) * (1.0, 0.0, 0.0)
    + <maxrotvel> * randomrange (-1.100000023841858, 1.100000023841858) * (0.0, 1.0, 0.0)
    + <maxrotvel> * randomrange (-1.100000023841858, 1.100000023841858) * (0.0, 0.0, 1.0)
    )
    <BodyChunkName> ::rigidbody_kick vel = <vel> rotvel = <rotvel>
    <BodyChunkName> ::obj_setbonescale bone = <bone> Scale = 0.0 propagate_reverse force_update
    obj_setbonescale bone = <bone> Scale = 0.0 propagate
    <BodyChunkName> ::obj_updatemodel
endscript
BodyChunkComponents = [
    { Component = Suspend }
    { Component = waitanddie lifetime = 3 }
    { Component = rigidbody box Dimensions = (20.0, 20.0, 20.0) }
    { Component = skeleton }
    { Component = Model }
]

script make_skater_explode frames = 5
    GetCurrentSkaterProfileIndex
    GetSkaterNumber
    stored_scales = [
        {group = head_bone_group x = 100 y = 100 z = 100}
        {group = headtop_bone_group x = 100 y = 100 z = 100}
        {group = nose_bone_group x = 100 y = 100 z = 100}
        {group = jaw_bone_group x = 100 y = 100 z = 100}
        {group = stomach_bone_group x = 100 y = 100 z = 100}
        {group = torso_bone_group x = 100 y = 100 z = 100}
        {group = upper_arm_bone_group x = 100 y = 100 z = 100}
        {group = lower_arm_bone_group x = 100 y = 100 z = 100}
        {group = hands_bone_group x = 100 y = 100 z = 100}
        {group = upper_leg_bone_group x = 100 y = 100 z = 100}
        {group = lower_leg_bone_group x = 100 y = 100 z = 100}
        {group = feet_bone_group x = 100 y = 100 z = 100}
        {group = board_bone_group x = 100 y = 100 z = 100}
    ]
    GetArraySize <stored_scales>
    index = 0
    begin 
    scalingmenu_get_xyz part = (<stored_scales> [ <index> ].group)
    SetArrayElement arrayName = stored_scales index = <index> newValue = {group = (<stored_scales> [ <index> ].group)x = <x> y = <y> z = <z>}
    index = (<index> + 1)
    repeat <array_size>
    OnExitRun make_skater_explode_exit
    obj_spawnscriptlater make_skater_explode_cleanup params = <...> 
    dismember bone = Bone_Head
    dismember bone = Bone_Bicep_R
    dismember bone = Bone_Bicep_L
    dismember bone = Bone_Thigh_R
    dismember bone = Bone_Thigh_L
    wait <frames> gameframes
    dismember bone = Bone_Pelvis
    wait 2 seconds
endscript

script make_skater_explode_exit 
    obj_getid
    FireEvent type = CleanupSkaterExplode target = <ObjID>
endscript

script make_skater_explode_cleanup 
    WaitForEvent \{ type = CleanupSkaterExplode }
    index = 0
    begin 
    SetPlayerAppearanceScale {
        player = <currentSkaterProfileIndex>
        part = (<stored_scales> [ <index> ].group)
        x = ((<stored_scales> [ <index> ]).x)
        y = ((<stored_scales> [ <index> ]).y)
        z = ((<stored_scales> [ <index> ]).z)
    }
    index = (<index> + 1)
    repeat <array_size>
    RefreshSkaterScale skater = <skaternumber> profile = <currentSkaterProfileIndex>
endscript

script make_skater_lose_head 
    GetCurrentSkaterProfileIndex
    GetSkaterNumber
    stored_scales = [
        {group = head_bone_group x = 100 y = 100 z = 100}
        {group = headtop_bone_group x = 100 y = 100 z = 100}
        {group = nose_bone_group x = 100 y = 100 z = 100}
        {group = jaw_bone_group x = 100 y = 100 z = 100}
    ]
    GetArraySize <stored_scales>
    index = 0
    begin 
    scalingmenu_get_xyz part = (<stored_scales> [ <index> ].group)
    SetArrayElement arrayName = stored_scales index = <index> newValue = {group = (<stored_scales> [ <index> ].group)x = <x> y = <y> z = <z>}
    index = (<index> + 1)
    repeat <array_size>
    OnExitRun make_skater_lose_head_exit
    obj_spawnscriptlater make_skater_lose_head_cleanup params = <...> 
    dismember bone = Bone_Head
    Skater_WaitAnimFinished
    FireEvent type = SkaterLoseHeadCleanup
    OnExitRun
    Skater_Playanim anim = WStandIdle3 Speed = 2.0
endscript

script make_skater_lose_head_exit 
    obj_getid
    FireEvent type = SkaterLoseHeadCleanup target = <ObjID>
endscript

script make_skater_lose_head_cleanup 
    WaitForEvent type = SkaterLoseHeadCleanup
    Scale = 0.0
    begin 
    Scale = (<Scale> + 0.02000)
    if (<Scale> > 1.0)
        Scale = 1.0
    endif
    index = 0
    begin 
    SetPlayerAppearanceScale {
        player = <currentSkaterProfileIndex>
        part = (<stored_scales> [ <index> ].group)
        x = (<Scale> * ((<stored_scales> [ <index> ]).x))
        y = (<Scale> * ((<stored_scales> [ <index> ]).y))
        z = (<Scale> * ((<stored_scales> [ <index> ]).z))
    }
    index = (<index> + 1)
    repeat <array_size>
    RefreshSkaterScale skater = <skaternumber> profile = <currentSkaterProfileIndex>
    if (<Scale> = 1.0)
        break 
    endif
    wait 1 gameframes
    repeat 
    Skater_WaitAnimFinished
endscript
