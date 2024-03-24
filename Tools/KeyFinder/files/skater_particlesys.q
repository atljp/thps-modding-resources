

script InitSkaterParticles 
endscript

SkaterParticleHandlerExceptionTable = [
    {event Ex = OnSkaterStateChange scr = SkaterParticles_OnSkaterStateChange}
    {event Ex = OnSkaterPhysicsStateChange scr = SkaterParticles_OnSkaterPhysicsStateChange}
    {event Ex = OnSkaterTerrainChange scr = SkaterParticles_OnSkaterTerrainChange}
]

script set_skater_particle_handlers 
    ResetEventHandlersFromTable SkaterParticleHandlerExceptionTable group = flexpartsys
endscript


script destroy_particle_object 
    obj_getid
    MangleChecksums a = <a> b = <ObjID>
    if GotParam b
        MangleChecksums a = <mangled_id> b = <b>
    endif
    if ObjectExists id = <mangled_id>
        <mangled_id> ::destroyparticles
        <mangled_id> ::Die
    else
        
    endif
endscript


script DestroySkaterParticles 
    ResetSkaterParticleSystems
    obj_getid
    <ObjID> ::destroy_particle_object a = skater_blood_system b = Bone_Head
    flushdeadobjects
endscript


script ResetSkaterParticleSystems 
    SkaterParticles_DestroySkatingGfx
    SkaterParticles_DestroyStepGfx
    SkaterParticles_DestroyGrindGfx
    SkaterParticles_DestroySlideGfx
    CleanUp_SpecialTrickParticles
    BloodParticlesOff
    SprayPaintOff
    SkaterSplashOff
    SparksOff
endscript


script SkaterParticles_SparksOn type = grind
    if (<type> = grind)
        SkaterParticles_CreateGrindGfx
    else
        SkaterParticles_CreateSlideGfx
    endif
endscript


script SkaterParticles_SparksOff 
    SkaterParticles_DestroyGrindGfx
    SkaterParticles_DestroySlideGfx
endscript


script SetSparksTruckFromNollie 
    if innollie
        SetSparksPos front
    else
        SetSparksPos rear
    endif
endscript


script SkaterSplashOn 
    obj_getid
    CreateFlexibleParticleSystem name = skatersplash ObjID = <ObjID> params_script = apm_Skater_splash01_particle_params
    CreateFastParticleSystem name = skatersplash2 attachobjid = <ObjID> params_script = apm_Skater_splash01f_fast_particle_params
    CreateFastParticleSystem name = skatersplash3 attachobjid = <ObjID> params_script = apm_Skater_splash02f_fast_particle_params
endscript


script SkaterSplashOff 
    obj_getid
    DestroyFlexibleParticleSystem name = skatersplash ObjID = <ObjID>
    DestroyFastParticleSystem name = skatersplash2 attachobjid = <ObjID>
    DestroyFastParticleSystem name = skatersplash3 attachobjid = <ObjID>
endscript


script SprayPaintOn 
    obj_getid
    CreateFlexibleParticleSystem name = skater_SprayPaint_system ObjID = <ObjID> params_script = apm_spray03_particle_params bone = <bone>
endscript


script SprayPaintOff 
    obj_getid
    DestroyFlexibleParticleSystem name = skater_SprayPaint_system ObjID = <ObjID>
endscript


script AcidParticlesOn 
    if IsSkaterOnVehicle
        return 
    endif
    begin 
    if onrail
        break 
    endif
    if walking
        break 
    endif
    if OnGround
        obj_getid
        CreateFastParticleSystem name = skater_acid_system02 params_script = apm_ACID_DROP02_fast_particle_params attachobjid = <ObjID>
        CreateFastParticleSystem name = skater_acid_system03 params_script = apm_ACID_DROP03_fast_particle_params attachobjid = <ObjID>
        ShakeCamera {
            duration = 0.2500
            vert_amp = 25
            horiz_amp = 10
            vert_vel = 10
            horiz_vel = 10.92
        }
        vibrate actuator = 0 , percent = 1 , duration = 1 , 
        vibrate actuator = 1 , percent = 1 , duration = 1 , 
        wait 2 seconds
        break 
    endif
    wait 1 gameframe
    repeat 
endscript


script AcidParticlesOff 
    DestroyFlexibleParticleSystem name = skater_acid_system
endscript


script BloodParticlesOn bone = Bone_Head
    obj_getid
    MangleChecksums a = skater_blood_system b = <ObjID>
    MangleChecksums a = <mangled_id> b = <bone>
    obj_spawnscript SkaterBloodOn params = {name = <mangled_id> num = <num>}
endscript


script SkaterBloodOn num = 10
    if NOT GotParam name
        script_assert 'No name parameter'
    endif
    alloc_blood_system name = <name>
    if NOT GetGlobalFlag flag = CHEAT_SUPER_BLOOD
        if ObjectExists id = <name>
            <name> ::setemitscript name = <name> emitscript = skater_blood_emit
        endif
    else
        if ObjectExists id = <name>
            <name> ::setemitscript name = <name> emitscript = skater_blood_emit_super
        endif
    endif
    begin 
    if ObjectExists id = <name>
        <name> ::emiton
    endif
    wait 1 gameframe
    repeat <num>
    if ObjectExists id = <name>
        <name> ::emitoff
    endif
endscript


script BloodParticlesOff bone = Bone_Head
    obj_getid
    MangleChecksums a = skater_blood_system b = <ObjID>
    MangleChecksums a = <mangled_id> b = Bone_Head
    SkaterBloodOff name = <mangled_id>
    if ObjectExists id = <mangled_id>
        <mangled_id> ::emptysystem
    endif
endscript


script SkaterBloodOff 
    if NOT GotParam name
        script_assert 'No name parameter'
    endif
    if ObjectExists id = <name>
        <name> ::destroyparticles
    endif
endscript


script alloc_blood_system bone = Bone_Head
    obj_getid
    if NOT GotParam name
        script_assert 'No <name> parameter'
    endif
    if NOT ObjectExists id = <name>
        CreateCompositeObject {
            Components = [
                { Component = Suspend }
                { Component = lockobj }
                { Component = flexibleparticle }
            ]
            params = {
                name = <name>
                LocalSpace
                vel = <vel>
                params = {ObjID = <ObjID> bone = <bone> name = <name>}
                max = 25
                emitscript = skater_blood_emit
                texture = particle_test02
                BlendMode = Blend
                perm = 1
            }
        }
        <name> ::obj_locktoobject bone = <bone> id = <ObjID> add_vel
    endif
endscript


script SkaterParticles_OnSkaterStateChange 
    SkaterParticles_DestroySkatingGfx
    SkaterParticles_DestroyGrindGfx
    SkaterParticles_DestroySlideGfx
    if OnGround
        SkaterParticles_CreateSkatingGfx
    endif
endscript


script SkaterParticles_OnSkaterPhysicsStateChange 
    SkaterParticles_DestroySkatingGfx
    SkaterParticles_DestroyGrindGfx
    SkaterParticles_DestroySlideGfx
    if skating
        SkaterParticles_CreateSkatingGfx
    endif
endscript


script SkaterParticles_OnSkaterTerrainChange 
    SkaterParticles_DestroySkatingGfx
    if skating
        SkaterParticles_CreateSkatingGfx
    endif
endscript


script SkaterParticles_OnRightFootstep 
    SkaterParticles_CreateStepGfx bone = Bone_Ankle_R
endscript


script SkaterParticles_OnLeftFootstep 
    SkaterParticles_CreateStepGfx bone = Bone_Ankle_L
endscript


script SkaterParticles_CreateSkatingGfx 
    obj_getid
    GetTerrain
    if GetTerrainTypeParam param = treadActions terrain_id = <terrain>
        begin 
        if GetNextArrayElement (<treadActions>.SkaterSkatingParticleParms)
            FormatText checksumname = tag 'terrain_skating%d' d = <index>
            MangleChecksums a = <tag> b = <ObjID>
            <name> = <mangled_id>
            if NOT ObjectExists id = <name>
                MangleChecksums a = terrain_skating b = <ObjID>
                <groupid> = <mangled_id>
                <type> = flexible
                if StructureContains structure = (<element>)class
                    if ((<element>.class)= particleobject)
                        <type> = fast
                    endif
                endif
                if (<type> = flexible)
                    alloc_flexible_particle params_script = (<element>)name = <name> ObjID = <ObjID> groupid = <groupid>
                else
                    alloc_fast_particle params_script = (<element>)name = <name> attachobjid = <ObjID> groupid = <groupid>
                endif
            endif
        else
            break 
        endif
        repeat 
    endif
endscript


script SkaterParticles_DestroySkatingGfx 
    obj_getid
    MangleChecksums a = terrain_skating b = <ObjID>
    DestroyParticlesByGroupID groupid = <mangled_id>
endscript


script SkaterParticles_CreateStepGfx bone = Bone_Ankle_L systemLifetime = 400
    obj_getid
    GetTerrain
    if GetTerrainTypeParam param = treadActions terrain_id = <terrain>
        begin 
        if GetNextArrayElement (<treadActions>.SkaterStepParticleParms)
            GetUniqueCompositeObjectID preferredid = footstepParticleSystem
            <name> = <uniqueid>
            MangleChecksums a = terrain_step b = <ObjID>
            <groupid> = <mangled_id>
            <type> = flexible
            if StructureContains structure = (<element>)class
                if ((<element>.class)= particleobject)
                    <type> = fast
                endif
            endif
            if (<type> = flexible)
                alloc_flexible_particle params_script = (<element>)name = <name> ObjID = <ObjID> groupid = <groupid> bone = <bone>
            else
                if StructureContains structure = (<element>)emitduration
                    systemLifetime = (1000 * (<element>.emitduration))
                    CastToInteger systemLifetime
                endif
                alloc_fast_particle params_script = (<element>)name = <name> groupid = <groupid> bone = <bone> systemLifetime = <systemLifetime>
                orient object = <uniqueid> relativeto = <ObjID> bone = <bone>
            endif
        else
            break 
        endif
        repeat 
    endif
endscript


script SkaterParticles_DestroyStepGfx 
    obj_getid
    MangleChecksums a = terrain_step b = <ObjID>
    DestroyParticlesByGroupID groupid = <mangled_id>
endscript


script SkaterParticles_CreateGrindGfx 
    obj_getid
    GetTerrain
    if GetTerrainTypeParam param = treadActions terrain_id = <terrain>
        begin 
        if GetNextArrayElement (<treadActions>.SkaterGrindParticleParms)
            FormatText checksumname = tag 'terrain_grind%d' d = <index>
            MangleChecksums a = <tag> b = <ObjID>
            <name> = <mangled_id>
            if NOT ObjectExists id = <name>
                MangleChecksums a = terrain_grind b = <ObjID>
                <groupid> = <mangled_id>
                <type> = flexible
                if StructureContains structure = (<element>)class
                    if ((<element>.class)= particleobject)
                        <type> = fast
                    endif
                endif
                if (<type> = flexible)
                    alloc_flexible_particle params_script = (<element>)name = <name> ObjID = <ObjID> groupid = <groupid>
                else
                    alloc_fast_particle params_script = (<element>)name = <name> attachobjid = <ObjID> groupid = <groupid>
                endif
            endif
        else
            break 
        endif
        repeat 
    endif
endscript


script SkaterParticles_DestroyGrindGfx 
    obj_getid
    MangleChecksums a = terrain_grind b = <ObjID>
    DestroyParticlesByGroupID groupid = <mangled_id>
endscript


script SkaterParticles_CreateSlideGfx 
    obj_getid
    GetTerrain
    if GetTerrainTypeParam param = treadActions terrain_id = <terrain>
        begin 
        if GetNextArrayElement (<treadActions>.SkaterSlideParticleParms)
            FormatText checksumname = tag 'terrain_slide%d' d = <index>
            MangleChecksums a = <tag> b = <ObjID>
            <name> = <mangled_id>
            if NOT ObjectExists id = <name>
                MangleChecksums a = terrain_slide b = <ObjID>
                <groupid> = <mangled_id>
                <type> = flexible
                if StructureContains structure = (<element>)class
                    if ((<element>.class)= particleobject)
                        <type> = fast
                    endif
                endif
                if (<type> = flexible)
                    alloc_flexible_particle params_script = (<element>)name = <name> ObjID = <ObjID> groupid = <groupid>
                else
                    alloc_fast_particle params_script = (<element>)name = <name> attachobjid = <ObjID> groupid = <groupid>
                endif
            endif
        else
            break 
        endif
        repeat 
    endif
endscript


script SkaterParticles_DestroySlideGfx 
    obj_getid
    MangleChecksums a = terrain_slide b = <ObjID>
    DestroyParticlesByGroupID groupid = <mangled_id>
endscript

skater_particle_composite_structure = 
[
    { Component = Suspend }
    { Component = particle }
    { Component = lockobj }
]

script CleanUp_SpecialTrickParticles 
    obj_getid
    MangleChecksums a = <ObjID> b = SpecialTrickParticles
    particle_id = <mangled_id>
    if ObjectExists id = <particle_id>
        <particle_id> ::Die
    endif
endscript


script Emit_SpecialTrickParticles bone = Bone_Head specialtrick_particles = barf_particles
    obj_spawnscript Emit_SpecialTrickParticles2 params = { <...>  }
endscript


script Emit_SpecialTrickParticles2 
    obj_getid
    MangleChecksums a = <ObjID> b = SpecialTrickParticles
    particle_id = <mangled_id>
    if ObjectExists id = <particle_id>
        <particle_id> ::Die
    endif
    wait 1 Game frame
    
    if NOT GotParam dont_orient_toskater
        GetSkaterVelocity
        vel = (<vel_x> * (1.0, 0.0, 0.0) + <vel_y> * (0.0, 1.0, 0.0) + <vel_z> * (0.0, 0.0, 1.0))
        CreateCompositeObject {
            Components = skater_particle_composite_structure
            params = {
                name = <particle_id>
                LocalSpace
                enablerotate
                vel = <vel>
                <specialtrick_particles>
            }
        }
    else
        
        CreateCompositeObject {
            Components = skater_particle_composite_structure
            params = {
                name = <particle_id>
                LocalSpace
                <specialtrick_particles>
            }
        }
    endif
    <particle_id> ::obj_locktoobject bone = <bone> id = <ObjID>
    if GotParam StopEmitAt
        wait <StopEmitAt> seconds
        if ObjectExists id = <particle_id>
            <particle_id> ::setemitrate 0
        endif
    endif
endscript

fire_particles = 
{
    class = particleobject
    type = default
    BoxDimsStart = (20.41944122314453, 20.246089935302734, 0.3510749936103821)
    MidPosition = (-10.002134323120117, -10.852688789367676, -10.05867862701416)
    BoxDimsMid = (20.41944122314453, 20.246089935302734, 0.3510749936103821)
    EndPosition = (-20.015867233276367, -20.33533477783203, -20.058679580688477)
    BoxDimsEnd = (20.41944122314453, 20.246089935302734, 0.3510749936103821)
    texture = dt_generic_particle01
    createdatstart
    absentinnetgames
    UseMidPoint
    UseColorMidTime
    type = NewFlat
    BlendMode = Add
    FixedAlpha = 128
    alphacutoff = 1
    maxstreams = 2
    suspenddistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    emitrate = 160.0
    lifetime = 0.4000
    MidPointPCT = 50
    startradius = 7.0
    MidRadius = 5.0
    endradius = 3.500
    StartRadiusSpread = 1.0
    MidRadiusSpread = 1.0
    EndRadiusSpread = 1.0
    startRGB = [150 , 72 , 25]
    startAlpha = 85
    ColorMidTime = 50
    midRGB = [150 , 67 , 18]
    midAlpha = 85
    endRGB = [150 , 67 , 18]
    endAlpha = 0
}
barf_particles = 
{
    class = particleobject
    type = default
    BoxDimsStart = (1.4013780355453491, 1.4013780355453491, 1.4013780355453491)
    MidPosition = (-0.009089999832212925, -17.076101303100586, -0.03491999953985214)
    BoxDimsMid = (4.443863868713379, 4.443863868713379, 4.443863868713379)
    EndPosition = (-0.0644799992442131, -64.39933013916016, -0.03492100164294243)
    BoxDimsEnd = (6.6673197746276855, 6.6673197746276855, 6.6673197746276855)
    texture = dt_barf02
    createdatstart
    absentinnetgames
    UseMidPoint
    UseColorMidTime
    type = NewFlat
    BlendMode = Blend
    FixedAlpha = 128
    alphacutoff = 1
    maxstreams = 2
    suspenddistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    emitrate = 100.0
    lifetime = 0.3000
    MidPointPCT = 50
    startradius = 1.0
    MidRadius = 2.0
    endradius = 3.0
    StartRadiusSpread = 1.0
    MidRadiusSpread = 1.0
    EndRadiusSpread = 1.0
    startRGB = [105 , 111 , 96]
    startAlpha = 122
    ColorMidTime = 50
    midRGB = [105 , 111 , 96]
    midAlpha = 160
    endRGB = [105 , 111 , 96]
    endAlpha = 50
}
barf2_particles = 
{
    class = particleobject
    type = default
    BoxDimsStart = (1.4013780355453491, 1.4013780355453491, 1.4013780355453491)
    MidPosition = (-0.009089999832212925, 0.0, -17.076101303100586)
    BoxDimsMid = (1.4013780355453491, 1.4013780355453491, 1.4013780355453491)
    EndPosition = (-0.0644799992442131, 0.0, -34.399330139160156)
    BoxDimsEnd = (1.4013780355453491, 1.4013780355453491, 1.4013780355453491)
    texture = dt_barf02
    createdatstart
    absentinnetgames
    UseMidPoint
    UseColorMidTime
    type = NewFlat
    BlendMode = Blend
    FixedAlpha = 128
    alphacutoff = 1
    maxstreams = 2
    suspenddistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    emitrate = 100.0
    lifetime = 0.3000
    MidPointPCT = 50
    startradius = 1.0
    MidRadius = 2.0
    endradius = 3.0
    StartRadiusSpread = 1.0
    MidRadiusSpread = 1.0
    EndRadiusSpread = 1.0
    startRGB = [105 , 111 , 96]
    startAlpha = 122
    ColorMidTime = 50
    midRGB = [105 , 111 , 96]
    midAlpha = 160
    endRGB = [105 , 111 , 96]
    endAlpha = 50
}
firebreath_particles = 
{
    class = particleobject
    type = default
    BoxDimsStart = (0.699999988079071, 0.699999988079071, 0.699999988079071)
    MidPosition = (-0.0021379999816417694, 10.16623592376709, -0.05867899954319)
    BoxDimsMid = (4.542354106903076, 4.542354106903076, 4.542354106903076)
    EndPosition = (-0.015876000747084618, 38.1252555847168, -0.05867600068449974)
    BoxDimsEnd = (9.063875198364258, 9.063875198364258, 9.063875198364258)
    texture = dt_generic_particle01
    createdatstart
    absentinnetgames
    UseMidPoint
    UseColorMidTime
    type = NewFlat
    BlendMode = Add
    FixedAlpha = 128
    alphacutoff = 1
    maxstreams = 2
    suspenddistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    emitrate = 250.0
    lifetime = 0.2000
    MidPointPCT = 50
    startradius = 4.0
    MidRadius = 4.0
    endradius = 6.0
    StartRadiusSpread = 1.0
    MidRadiusSpread = 1.0
    EndRadiusSpread = 1.0
    startRGB = [150 , 93 , 59]
    startAlpha = 82
    ColorMidTime = 50
    midRGB = [150 , 67 , 18]
    midAlpha = 109
    endRGB = [150 , 67 , 18]
    endAlpha = 0
}

script skater_blood_emit 
    setlife min = 0.2500 max = 1
    setanglespread spread = 0.1000
    setspeedrange min = 4 max = 8
    setforce force = (0.0, -0.5, 0.0)
    setparticlesize sw = 2 sh = 2 ew = 2 eh = 2
    setcolor corner = 0 sr = 100 sg = 0 sb = 0 sa = 255 er = 80 eg = 0 eb = 0 ea = 0
    setcolor corner = 1 sr = 100 sg = 0 sb = 0 sa = 255 er = 80 eg = 0 eb = 0 ea = 0
    setcolor corner = 2 sr = 100 sg = 0 sb = 0 sa = 255 er = 80 eg = 0 eb = 0 ea = 0
    setcolor corner = 3 sr = 100 sg = 0 sb = 0 sa = 255 er = 80 eg = 0 eb = 0 ea = 0
    begin 
    if <name> ::shouldemit
        emit num = 1
    endif
    wait 1 gameframe
    repeat 
endscript


script skater_blood_emit_super 
    setlife min = 0.2500 max = 1
    setanglespread spread = 0.3000
    setspeedrange min = 4 max = 10
    setforce force = (0.0, -0.5, 0.0)
    setparticlesize sw = 2 sh = 2 ew = 6 eh = 6
    setcolor corner = 0 sr = 50 sg = 0 sb = 0 sa = 255 er = 50 eg = 0 eb = 0 ea = 0
    setcolor corner = 1 sr = 50 sg = 0 sb = 0 sa = 255 er = 50 eg = 0 eb = 0 ea = 0
    setcolor corner = 2 sr = 50 sg = 0 sb = 0 sa = 255 er = 50 eg = 0 eb = 0 ea = 0
    setcolor corner = 3 sr = 50 sg = 0 sb = 0 sa = 255 er = 50 eg = 0 eb = 0 ea = 0
    begin 
    if <name> ::shouldemit
        emit num = 1
    endif
    wait 1 gameframe
    repeat 
endscript

skater_sparks_params = {
    bone = Bone_Board_Tail
    LocalSpace
    add_vel
    max = 8
    emitscript = skater_sparks_emit
    updatescript = align_scale_size_to_vel_update
    params = {update_pos = 1
        base_vel = 700
        pos_offset = (0.0, -5.0, 0.0)
        emit_offset = (0.0, 1.5, 0.0)
        base_emit_rate = 60
        get_bone_script = GetBoardGrindBone
    }
    type = FlatRibbonTail
    texture = apm_spark_4
    History = 3
    BlendMode = Add
}

script skater_sparks_emit 
    setlife min = 0.01000 max = 0.2500
    setanglespread spread = 0.5000
    setspeedrange min = 8 max = 12
    setforce force = (0.0, -0.75, 0.0)
    setparticlesize sw = 1 sh = 1 ew = 0.2500 eh = 0.2500
    setcolor corner = 0 sr = 255 sg = 100 sb = 64 sa = 255 ma = 255 er = 255 eg = 64 eb = 0 ea = 255
    setcolor corner = 1 sr = 255 sg = 128 sb = 64 sa = 0 ma = 255 er = 255 eg = 64 eb = 0 ea = 255
    setcolor corner = 2 sr = 255 sg = 128 sb = 64 sa = 0 ma = 255 er = 255 eg = 64 eb = 0 ea = 128
    setcolor corner = 3 sr = 255 sg = 128 sb = 64 sa = 0 ma = 255 er = 255 eg = 64 eb = 0 ea = 128
    setcolor corner = 4 sr = 255 sg = 128 sb = 64 sa = 0 ma = 128 er = 255 eg = 64 eb = 0 ea = 0
endscript

skater_elec_sparks_params = {
    bone = Bone_Board_Tail
    LocalSpace
    add_vel
    params = {update_pos = 1
        get_bone_script = GetBoardGrindBone
    }
    max = 40
    emitscript = skater_elec_sparks_emit
    updatescript = align_scale_size_to_vel_update
    type = FlatRibbonTail
    texture = apm_spark_01
    History = 2
    BlendMode = Blend
    perm = 1
}

script skater_elec_sparks_emit 
    setlife min = 0.2500 max = 0.3000
    setanglespread spread = 0.2500
    setspeedrange min = 4 max = 8
    setforce force = (0.0, -0.30000001192092896, 0.0)
    setparticlesize sw = 1.250 sh = 1.250 ew = 0.7500 eh = 0.7500
    setcolor corner = 0 sr = 255 sg = 255 sb = 255 sa = 255 ma = 255 er = 255 eg = 255 eb = 255 ea = 0
    setcolor corner = 1 sr = 124 sg = 255 sb = 255 sa = 128 ma = 128 er = 124 eg = 64 eb = 255 ea = 0
    setcolor corner = 2 sr = 124 sg = 64 sb = 255 sa = 0 ma = 0 er = 124 eg = 64 eb = 255 ea = 0
    setcolor corner = 3 sr = 124 sg = 255 sb = 255 sa = 80 ma = 80 er = 124 eg = 128 eb = 255 ea = 0
    setcolor corner = 4 sr = 124 sg = 255 sb = 255 sa = 64 ma = 64 er = 124 eg = 128 eb = 255 ea = 0
    setcolor corner = 5 sr = 124 sg = 255 sb = 255 sa = 0 ma = 0 er = 124 eg = 128 eb = 255 ea = 0
    begin 
    if <name> ::shouldemit
        emit num = randomrange (1.0, 2.0)
    endif
    wait 1 gameframe
    repeat 
endscript

