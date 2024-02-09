force_particle_update_time = 1.0

script CreateFlexibleParticleSystem 
    if GotParam perm
        perm = 1
    else
        perm = 0
    endif
    if NOT GotParam name
        script_assert 'No <name> parameter'
    endif
    if NOT GotParam params_script
        script_assert 'No <params_script> parameter'
    endif
    if NOT GotParam ObjID
        obj_getid
    endif
    MangleChecksums a = <name> b = <ObjID>
    if NOT ObjectExists id = <mangled_id>
        if CutsceneDestroyListActive
            AddToCutsceneDestroyList {
                destroy_func = DestroyFlexibleParticleSystem
                name = <mangled_id>
                destroy_params = {name = <name> ObjID = <ObjID>}
            }
        endif
        alloc_flexible_particle params_script = (<params_script>)name = <mangled_id> ObjID = <ObjID> attachnode = <attachnode> bone = <bone> perm = <perm>
    endif
endscript

script GetFlexibleParticleSystem 
    if NOT GotParam \{ name }
        script_assert \{ 'No <name> parameter' }
    endif
    if NOT GotParam \{ ObjID }
        obj_getid
    endif
    MangleChecksums a = <name> b = <ObjID>
    if ObjectExists id = <mangled_id>
        return system = <mangled_id>
    endif
endscript

script DestroyFlexibleParticleSystem 
    if NOT GotParam \{ name }
        script_assert \{ 'No <name> parameter' }
    endif
    if NOT GotParam \{ ObjID }
        obj_getid
    endif
    MangleChecksums a = <name> b = <ObjID>
    if ObjectExists id = <mangled_id>
        if CutsceneDestroyListActive
            RemoveFromCutsceneDestroyList name = <mangled_id>
        endif
        <mangled_id> ::destroyparticles
    endif
endscript
LockableSuspendibleFlexibleParticleComponents = [
    { Component = Suspend }
    { Component = lockobj }
    { Component = flexibleparticle }
]
LockableFlexibleParticleComponents = [
    { Component = lockobj }
    { Component = flexibleparticle }
]

script alloc_flexible_particle groupid = 0
    if GotParam perm
        if (<perm> = 1)
            priority = coim_priority_permanent
            heap = gameobj
        else
            priority = coim_priority_effects
            heap = particle
        endif
    else
        priority = coim_priority_effects
        heap = particle
    endif
    if StructureContains structure = params_script suspenddistance
        CreateGameObject priority = <priority> heap = <heap> Components = LockableSuspendibleFlexibleParticleComponents params = {
            name = <name>
            <params_script>
            id = <ObjID>
            ignorelockdie
            parent_object = <ObjID>
            bone = <bone>
            groupid = <groupid>
            attachnode = <attachnode>
        }
    else
        CreateGameObject priority = <priority> heap = <heap> Components = LockableFlexibleParticleComponents params = {
            name = <name>
            <params_script>
            ignorelockdie
            id = <ObjID>
            parent_object = <ObjID>
            bone = <bone>
            groupid = <groupid>
            attachnode = <attachnode>
        }
    endif
endscript
SuspendibleFlexibleParticleComponents = [
    { Component = Suspend }
    { Component = flexibleparticle }
]
flexibleparticlecomponents = [
    { Component = flexibleparticle }
]

script CreateGlobalFlexParticlesystem 
    if GotParam perm
        priority = coim_priority_permanent
        heap = gameobj
    else
        priority = coim_priority_effects
        heap = particle
    endif
    if NOT GotParam name
        script_assert 'No <name> parameter'
    endif
    if NOT GotParam params_script
        script_assert 'No <params_script> parameter'
    endif
    if NOT ObjectExists id = <name>
        if CutsceneDestroyListActive
            AddToCutsceneDestroyList {
                destroy_func = DestroyGlobalFlexParticleSystem
                name = <name>
                destroy_params = { name = <name> }
            }
        endif
        if StructureContains structure = params_script suspenddistance
            CreateGameObject priority = <priority> heap = <heap> Components = SuspendibleFlexibleParticleComponents params = {
                name = <name>
                <params_script>
                groupid = 0
                Pos = <Pos>
            }
        else
            CreateGameObject priority = <priority> heap = <heap> Components = flexibleparticlecomponents params = {
                name = <name>
                <params_script>
                groupid = 0
                Pos = <Pos>
            }
        endif
    endif
endscript

script DestroyGlobalFlexParticleSystem 
    if NOT GotParam \{ name }
        script_assert \{ 'No <name> parameter' }
    endif
    if ObjectExists id = <name>
        if CutsceneDestroyListActive
            RemoveFromCutsceneDestroyList name = <name>
        endif
        <name> ::destroyparticles
    endif
endscript

script CreateFastParticleSystem 
    if GotParam perm
        perm = 1
    else
        perm = 0
    endif
    if NOT GotParam name
        script_assert 'No <name> parameter'
    endif
    if NOT GotParam params_script
        script_assert 'No <params_script> parameter'
    endif
    if GotParam attachobjid
        <ObjID> = <attachobjid>
    endif
    if GotParam ObjID
        attachobjid = <ObjID>
    endif
    if GotParam ObjID
        MangleChecksums a = <name> b = <attachobjid>
    else
        <mangled_id> = <name>
    endif
    if NOT IsCreated <mangled_id>
        if CutsceneDestroyListActive
            AddToCutsceneDestroyList {
                destroy_func = DestroyFastParticleSystem
                name = <mangled_id>
                destroy_params = {name = <name> attachobjid = <attachobjid>}
            }
        endif
        alloc_fast_particle {params_script = <params_script> name = <mangled_id> attachobjid = <attachobjid>
            attachnode = <attachnode> emit_script = <emit_script> emit_params = <emit_params> perm = <perm> creation_node = <creation_node>}
    endif
    if ((IsCreated <mangled_id>)& (GotParam ObjID)& (StructureContains structure = params_script ApplyEnvBrightness))
        <mangled_id> ::ApplyEnvBrightness from = <ObjID>
    endif
endscript
SuspendibleFastParticleComponents = [
    { Component = Suspend }
    { Component = particle }
]
fastparticlecomponents = [
    { Component = particle }
]

script CreateGlobalFastParticleSystem 
    if GotParam perm
        priority = coim_priority_permanent
        heap = gameobj
    else
        priority = coim_priority_effects
        heap = particle
    endif
    if NOT GotParam name
        script_assert 'No <name> parameter'
    endif
    if NOT GotParam params_script
        script_assert 'No <params_script> parameter'
    endif
    if StructureContains structure = params_script EmitDelay
        wait (<params_script>.EmitDelay)seconds
    endif
    if NOT IsCreated <name>
        if CutsceneDestroyListActive
            AddToCutsceneDestroyList {
                destroy_func = DestroyGlobalFastParticleSystem
                name = <name>
                destroy_params = { name = <name> }
            }
        endif
        if StructureContains structure = params_script suspenddistance
            CreateGameObject priority = <priority> heap = <heap> Components = SuspendibleFastParticleComponents params = {
                name = <name>
                parent_object = <ObjID>
                groupid = 0
                <params_script>
                Pos = <Pos>
            }
        else
            CreateGameObject priority = <priority> heap = <heap> Components = fastparticlecomponents params = {
                name = <name>
                parent_object = <ObjID>
                groupid = 0
                <params_script>
                Pos = <Pos>
            }
        endif
    endif
    if IsCreated <name>
        if GotParam emit_script
            <name> ::obj_spawnscriptlater <emit_script> params = <emit_params>
        endif
    endif
endscript

script DestroyGlobalFastParticleSystem 
    if NOT GotParam \{ name }
        script_assert \{ 'No <name> parameter' }
    endif
    if ObjectExists id = <name>
        if CutsceneDestroyListActive
            RemoveFromCutsceneDestroyList name = <name>
        endif
        <name> ::Die
    endif
endscript

script DestroyFastParticleSystem 
    if NOT GotParam \{ name }
        script_assert \{ 'No <name> parameter' }
    endif
    if GotParam \{ ObjID }
        attachobjid = <ObjID>
    endif
    if GotParam \{ attachobjid }
        MangleChecksums a = <name> b = <attachobjid>
    else
        <mangled_id> = <name>
    endif
    if ObjectExists id = <mangled_id>
        if CutsceneDestroyListActive
            RemoveFromCutsceneDestroyList name = <mangled_id>
        endif
        <mangled_id> ::Die
    endif
endscript

script EmitFastParticles 
    if GotParam \{ wait_frames }
        wait <wait_frames> frames
    else
        wait <wait_seconds> seconds
    endif
    setemitrate \{ 0 }
    begin 
    if NOT isemitting
        break 
    endif
    wait \{ 1 frame }
    repeat 
    Die
endscript

script alloc_fast_particle groupid = 0
    if GotParam perm
        if (<perm> = 1)
            priority = coim_priority_permanent
            heap = gameobj
        else
            priority = coim_priority_effects
            heap = particle
        endif
    else
        priority = coim_priority_effects
        heap = particle
    endif
    if StructureContains structure = params_script EmitDelay
        wait (<params_script>.EmitDelay)seconds
    endif
    if NOT ObjectExists id = <name>
        if GotParam attachobjid
            CreateGameObject priority = <priority> heap = <heap> {
                Components = [
                    {
                        Component = lockobj
                        id = <attachobjid>
                        <params_script>
                        bone = <bone>
                        ignorelockdie
                    }
                    {
                        Component = particle
                        name = <name>
                        groupid = <groupid>
                        parent_object = <attachobjid>
                        <params_script>
                        systemLifetime = (<params_script>.emitduration)
                        systemLifetime = <systemLifetime>
                    }
                ]
                params = {
                    name = <name>
                    LocalSpace
                    creation_node = <creation_node>
                }
            }
        else
            CreateGameObject priority = <priority> heap = <heap> {
                Components = [
                    {
                        Component = particle
                        name = <name>
                        groupid = <groupid>
                        <params_script>
                    }
                ]
                params = {
                    name = <name>
                    creation_node = <creation_node>
                }
            }
            if StructureContains structure = params_script LocalSpace
                if NOT StructureContains structure = params_script boxPositions
                    printstruct <params_script>
                    script_assert 'No <boxPositions> parameter...  system should not have been defined in LocalSpace'
                endif
                if ObjectExists id = <name>
                    <name> ::SetStartPos (<params_script>.boxPositions [ 1 ])
                endif
            endif
        endif
    endif
    if ObjectExists id = <name>
        if GotParam emit_script
            <name> ::obj_spawnscriptlater <emit_script> params = <emit_params>
        endif
    endif
endscript

script CreateGameObject 
    if IsCompositeObjectManagerEnabled
        CreateCompositeObject <...> 
    else
        CreateCompositeObjectInstance <...> 
    endif
endscript

script JOW_RGBAToVector \{rgba = [ 0 0 0 0 ]}
    return rgb = (<rgba> [ 0 ] * (1.0, 0.0, 0.0) + <rgba> [ 1 ] * (0.0, 1.0, 0.0) + <rgba> [ 2 ] * (0.0, 0.0, 1.0))a = (<rgba> [ 3 ])
endscript

script JOW_VectorToRGBA rgb = (0.0, 0.0, 0.0) a = 0
    rgba = [ 0 0 0 0 ]
    val = (<rgb>.(1.0, 0.0, 0.0))
    CastToInteger val
    SetArrayElement arrayName = rgba index = 0 newValue = <val>
    val = (<rgb>.(0.0, 1.0, 0.0))
    CastToInteger val
    SetArrayElement arrayName = rgba index = 1 newValue = <val>
    val = (<rgb>.(0.0, 0.0, 1.0))
    CastToInteger val
    SetArrayElement arrayName = rgba index = 2 newValue = <val>
    CastToInteger a
    SetArrayElement arrayName = rgba index = 3 newValue = <a>
    return rgba = <rgba>
endscript

script Hero_ContinuousTerrainParticles_Off 
    cleareventhandlergroup
    SetExceptionHandler \{ Ex = NewTerrainType scr = Hero_ContinuousTerrainParticles_On }
    Block
endscript

script Hero_ContinuousTerrainParticles_On 
    GetTerrainTypeParam param = treadActions terrain_id = <terraintype>
    if NOT StructureContains structure = treadActions HeroContinuousParticleParams
        goto Hero_ContinuousTerrainParticles_Off
    endif
    GetUniqueCompositeObjectID preferredid = Hero_ContinuousTerrainParticles
    cleareventhandlergroup
    SetExceptionHandler Ex = NewTerrainType scr = Hero_ContinuousTerrainParticles_Switch params = { ParticleId = <uniqueid> }
    begin 
    if NOT CompositeObjectExists <uniqueid>
        CreateGameObject priority = coim_priority_effects heap = particle oldheap = com Components = [
            { Component = flexibleparticle }
        ] params = {
            name = <uniqueid>
            (<treadActions>.HeroContinuousParticleParams)
            novisibilitytest
        }
    endif
    obj_getposition
    if CompositeObjectExists <uniqueid>
        <uniqueid> ::obj_setposition position = (((1.0, 0.0, 1.0) & <Pos>)+ (0.0, 1.0, 0.0) * <TerrainParticleHeight>)
    endif
    wait 1 gameframe
    repeat 
endscript

script Hero_ContinuousTerrainParticles_Switch 
    if CompositeObjectExists <ParticleId>
        <ParticleId> ::emitrate rate = 0
        <ParticleId> ::destroy ifempty = 1
    endif
    goto Hero_ContinuousTerrainParticles_On params = <...> 
endscript
