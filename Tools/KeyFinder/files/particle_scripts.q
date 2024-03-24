
force_particle_update_time = 1.0

script CreateFlexibleParticleSystem 
    if NOT GotParam name
        script_assert 'No <name> parameter'
    endif
    if NOT GotParam params_script
        script_assert 'No <params_script> parameter'
    endif
    if NOT globalexists name = <params_script> type = structure
        FormatText textname = msg '\'%s\' could not be found. Typo?' s = <params_script>
        script_assert <msg>
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
        alloc_flexible_particle params_script = (<params_script>)name = <mangled_id> ObjID = <ObjID> bone = <bone>
    endif
endscript


script GetFlexibleParticleSystem 
    if NOT GotParam name
        script_assert 'No <name> parameter'
    endif
    if NOT GotParam ObjID
        obj_getid
    endif
    MangleChecksums a = <name> b = <ObjID>
    if ObjectExists id = <mangled_id>
        return system = <mangled_id>
    endif
endscript


script DestroyFlexibleParticleSystem 
    if NOT GotParam name
        script_assert 'No <name> parameter'
    endif
    if NOT GotParam ObjID
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


script alloc_flexible_particle groupid = 0
    if StructureContains structure = <params_script> suspenddistance
        CreateCompositeObject {
            Components = [
                {
                    Component = Suspend
                    suspenddistance = (<params_script>.suspenddistance)
                }
                {
                    (<params_script>)
                    Component = lockobj
                    id = <ObjID>
                    bone = <bone>
                }
                {
                    (<params_script>)
                    Component = flexibleparticle
                    groupid = <groupid>
                }
            ]
            params = {
                name = <name>
                params = {(<params_script>.params)name = <name> ObjID = <ObjID>}
            }
        }
    else
        CreateCompositeObject {
            Components = [
                {
                    (<params_script>)
                    Component = lockobj
                    id = <ObjID>
                    bone = <bone>
                }
                {
                    (<params_script>)
                    Component = flexibleparticle
                    groupid = <groupid>
                }
            ]
            params = {
                name = <name>
                params = {(<params_script>.params)name = <name> ObjID = <ObjID>}
            }
        }
    endif
    if ObjectExists id = <name>
        <name> ::emiton
    else
        script_assert 'alloc_flexible_particle failed!'
    endif
endscript


script CreateGlobalFlexParticlesystem 
    if NOT GotParam name
        script_assert 'No <name> parameter'
    endif
    if NOT GotParam params_script
        script_assert 'No <params_script> parameter'
    endif
    if NOT globalexists name = <params_script> type = structure
        FormatText textname = msg '\'%s\' could not be found. Typo?' s = <params_script>
        script_assert <msg>
    endif
    if NOT ObjectExists id = <name>
        
        if CutsceneDestroyListActive
            AddToCutsceneDestroyList {
                destroy_func = DestroyGlobalFlexParticleSystem
                name = <name>
                destroy_params = { name = <name> }
            }
        endif
        if StructureContains structure = <params_script> suspenddistance
            CreateCompositeObject {
                Components = [
                    {
                        Component = Suspend
                        suspenddistance = (<params_script>.suspenddistance)
                    }
                    {
                        Component = flexibleparticle
                        groupid = 0
                        (<params_script>)
                    }
                ]
                params = {
                    name = <name>
                    params = {(<params_script>.params)name = <name>}
                }
            }
        else
            CreateCompositeObject {
                Components = [
                    {
                        Component = flexibleparticle
                        groupid = 0
                        (<params_script>)
                    }
                ]
                params = {
                    name = <name>
                    params = {(<params_script>.params)name = <name>}
                }
            }
        endif
        if ObjectExists id = <name>
            <name> ::emiton
        else
            script_assert 'CreateGlobalFlexParticleSystem failed!'
        endif
    endif
endscript


script DestroyGlobalFlexParticleSystem 
    if NOT GotParam name
        script_assert 'No <name> parameter'
    endif
    if ObjectExists id = <name>
        if CutsceneDestroyListActive
            RemoveFromCutsceneDestroyList name = <name>
        endif
        <name> ::destroyparticles
    endif
endscript


script CreateFastParticleSystem 
    if NOT GotParam name
        script_assert 'No <name> parameter'
    endif
    if NOT GotParam params_script
        script_assert 'No <params_script> parameter'
    endif
    if GotParam attachobjid
        MangleChecksums a = <name> b = <attachobjid>
    else
        <mangled_id> = <name>
    endif
    if NOT ObjectExists id = <mangled_id>
        if CutsceneDestroyListActive
            AddToCutsceneDestroyList {
                destroy_func = DestroyFastParticleSystem
                name = <mangled_id>
                destroy_params = {name = <name> attachobjid = <attachobjid>}
            }
        endif
        alloc_fast_particle {params_script = (<params_script>)name = <mangled_id> attachobjid = <attachobjid>
            emit_script = <emit_script> emit_params = <emit_params>}
    endif
endscript


script DestroyFastParticleSystem 
    if NOT GotParam name
        script_assert 'No <name> parameter'
    endif
    if GotParam attachobjid
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
    if GotParam wait_frames
        wait <wait_frames> frames
    else
        wait <wait_seconds> seconds
    endif
    setemitrate 0
    begin 
    if NOT isemitting
        break 
    endif
    wait 1 frame
    repeat 
    Die
endscript


script alloc_fast_particle groupid = 0
    if StructureContains structure = <params_script> EmitDelay
        wait (<params_script>.EmitDelay)seconds
    endif
    if NOT ObjectExists id = <name>
        if GotParam attachobjid
            if StructureContains structure = <params_script> suspenddistance
                CreateCompositeObject {
                    Components = [
                        {
                            Component = Suspend
                            suspenddistance = (<params_script>.suspenddistance)
                        }
                        {
                            Component = lockobj
                            id = <attachobjid>
                            (<params_script>)
                            bone = <bone>
                        }
                        {
                            Component = particle
                            name = <name>
                            groupid = <groupid>
                            (<params_script>)
                            systemLifetime = <systemLifetime>
                        }
                    ]
                    params = {
                        name = <name>
                        LocalSpace
                    }
                }
            else
                CreateCompositeObject {
                    Components = [
                        {
                            Component = lockobj
                            id = <attachobjid>
                            (<params_script>)
                            bone = <bone>
                        }
                        {
                            Component = particle
                            name = <name>
                            groupid = <groupid>
                            (<params_script>)
                            systemLifetime = <systemLifetime>
                        }
                    ]
                    params = {
                        name = <name>
                        LocalSpace
                    }
                }
            endif
        else
            if StructureContains structure = <params_script> suspenddistance
                CreateCompositeObject {
                    Components = [
                        {
                            Component = Suspend
                            suspenddistance = (<params_script>.suspenddistance)
                        }
                        {
                            Component = particle
                            name = <name>
                            groupid = <groupid>
                            (<params_script>)
                        }
                    ]
                    params = {
                        name = <name>
                    }
                }
            else
                CreateCompositeObject {
                    Components = [
                        {
                            Component = particle
                            name = <name>
                            groupid = <groupid>
                            (<params_script>)
                        }
                    ]
                    params = {
                        name = <name>
                    }
                }
            endif
            if StructureContains structure = <params_script> LocalSpace
                if NOT StructureContains structure = <params_script> Pos
                    
                    script_assert 'No <pos> parameter...  system should not have been defined in LocalSpace'
                endif
                if ObjectExists id = <name>
                    <name> ::SetStartPos ((<params_script>).Pos)
                endif
            endif
        endif
    endif
    if ObjectExists id = <name>
        if StructureContains structure = <params_script> emitduration
            <name> ::obj_spawnscript EmitFastParticles params = {wait_seconds = ((<params_script>).emitduration)}
        endif
        if GotParam emit_script
            <name> ::obj_spawnscript <emit_script> params = <emit_params>
        endif
    endif
endscript


script JOW_RGBAToVector rgba = [0 , 0 , 0 , 0]
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

