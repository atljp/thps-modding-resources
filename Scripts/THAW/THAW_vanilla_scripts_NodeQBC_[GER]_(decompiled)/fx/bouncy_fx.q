
script dirthit01 
    obj_getid
    GetUniqueCompositeObjectID
    CreateFlexibleParticleSystem name = <uniqueid> ObjID = <ObjID> params_script = APM_dirttrail02_particle_params
endscript

script dirthit02 
    obj_getid
    GetUniqueCompositeObjectID
    CreateFlexibleParticleSystem name = <uniqueid> ObjID = <ObjID> params_script = APM_dirttrail03_particle_params
endscript
