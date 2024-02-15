
script align_scale_to_vel_update ObjID = skater bone = Bone_Board_Tail update_pos = 0 emit_offset = (0.0, 0.5, 0.0) emit_scale = -1.0 pos_offset = (0.0, -2.0, 0.0) base_vel = 800.0 min_vel_range = 4 max_vel_range = 8 base_emit_rate = 0.0
    pos0_offset = <pos_offset>
    begin 
    if shouldemit
        <ObjID> ::obj_getvelocity
        NormalizeVector <vel>
        <Length> = (<Length> / <base_vel>)
        setemittarget target = (<emit_offset> + (<emit_scale> * <norm>))
        setspeedrange min = (<min_vel_range> * <Length>)max = (<max_vel_range> * <Length>)
        emitrate rate = (<Length> * <base_emit_rate>)
        if NOT (<update_pos> = 0)
            <x> = 0
            <y> = 0
            <z> = 0
            if GotParam get_bone_script
                <get_bone_script> ObjID = <ObjID>
            endif
            <ObjID> ::obj_getboneposition bone = <bone>
            <pos_offset> = (<pos0_offset> + <x> * (1.0, 0.0, 0.0))
            <pos_offset> = (<pos_offset> + <y> * (0.0, 1.0, 0.0))
            <pos_offset> = (<pos_offset> + <z> * (0.0, 0.0, 1.0))
            setpos Pos = <pos_offset>
        endif
    else
        if (<base_emit_rate> > 0.0)
            <ObjID> ::obj_getvelocity
            NormalizeVector <vel>
            <Length> = (<Length> / <base_vel>)
            emitrate rate = (<Length> * <base_emit_rate>)
        endif
    endif
    wait 1 gameframe
    repeat 
endscript

script align_scale_size_to_vel_update ObjID = skater bone = Bone_Board_Tail update_pos = 0 emit_offset = (0.0, 0.5, 0.0) emit_scale = -1.0 pos_offset = (0.0, -2.0, 0.0) base_vel = 800.0 min_vel_range = 4 max_vel_range = 8 base_emit_rate = 0.0
    pos0_offset = <pos_offset>
    begin 
    if shouldemit
        <ObjID> ::obj_getvelocity
        NormalizeVector <vel>
        <Length> = (<Length> / <base_vel>)
        setemittarget target = (<emit_offset> + (<emit_scale> * <norm>))
        setspeedrange min = (<min_vel_range> * <Length>)max = (<max_vel_range> * <Length>)
        emitrate rate = (<Length> * <base_emit_rate>)
        setparticlesizescale scalesize = <Length>
        if NOT (<update_pos> = 0)
            <x> = 0
            <y> = 0
            <z> = 0
            if GotParam get_bone_script
                <get_bone_script> ObjID = <ObjID>
            endif
            <ObjID> ::obj_getboneposition bone = <bone>
            <pos_offset> = (<pos0_offset> + <x> * (1.0, 0.0, 0.0))
            <pos_offset> = (<pos_offset> + <y> * (0.0, 1.0, 0.0))
            <pos_offset> = (<pos_offset> + <z> * (0.0, 0.0, 1.0))
            setpos Pos = <pos_offset>
        endif
    else
        if (<base_emit_rate> > 0.0)
            <ObjID> ::obj_getvelocity
            NormalizeVector <vel>
            <Length> = (<Length> / <base_vel>)
            emitrate rate = (<Length> * <base_emit_rate>)
        endif
    endif
    wait 1 gameframe
    repeat 
endscript

script align_to_vel_update ObjID = skater bone = Bone_Board_Tail update_pos = 0 emit_offset = (0.0, 0.5, 0.0) emit_scale = -1.0 pos_offset = (0.0, -2.0, 0.0)
    pos0_offset = <pos_offset>
    begin 
    if shouldemit
        if CompositeObjectExists name = <ObjID>
            <ObjID> ::obj_getvelocity
            NormalizeVector <vel>
            setemittarget target = (<emit_offset> + (<emit_scale> * <norm>))
            if NOT (<update_pos> = 0)
                <x> = 0
                <y> = 0
                <z> = 0
                if GotParam get_bone_script
                    <get_bone_script> ObjID = <ObjID>
                endif
                <ObjID> ::obj_getboneposition bone = <bone>
                <pos_offset> = (<pos0_offset> + <x> * (1.0, 0.0, 0.0))
                <pos_offset> = (<pos_offset> + <y> * (0.0, 1.0, 0.0))
                <pos_offset> = (<pos_offset> + <z> * (0.0, 0.0, 1.0))
                setpos Pos = <pos_offset>
            endif
        endif
    endif
    wait 1 gameframe
    repeat 
endscript

script align_to_obj_orient ObjID = skater bone = Bone_Board_Tail update_pos = 0 pos_offset = (0.0, -2.0, 0.0) emit_scale = 1.0
    pos0_offset = <pos_offset>
    begin 
    if shouldemit
        <ObjID> ::obj_getorientation
        <orient> = ((<x> * (1.0, 0.0, 0.0))+ (<y> * (0.0, 1.0, 0.0))+ (<z> * (0.0, 0.0, 1.0)))
        NormalizeVector <orient>
        setemittarget target = ((<emit_scale> * <norm>))
        if NOT (<update_pos> = 0)
            <x> = 0
            <y> = 0
            <z> = 0
            <ObjID> ::obj_getboneposition bone = <bone>
            <pos_offset> = (<pos0_offset> + <x> * (1.0, 0.0, 0.0))
            <pos_offset> = (<pos_offset> + <y> * (0.0, 1.0, 0.0))
            <pos_offset> = (<pos_offset> + <z> * (0.0, 0.0, 1.0))
            setpos Pos = <pos_offset>
        endif
    endif
    wait 1 gameframe
    repeat 
endscript

script fast_align_to_vel_update ObjID = skater bone = Bone_Board_Tail update_pos = 0 emit_offset = (0.0, 0.5, 0.0) emit_scale = -1.0 pos_offset = (0.0, -2.0, 0.0)
    pos0_offset = <pos_offset>
    begin 
    <ObjID> ::obj_getvelocity
    NormalizeVector <vel>
    obj_setorientation dir = <norm>
    if NOT (<update_pos> = 0)
        <x> = 0
        <y> = 0
        <z> = 0
        if GotParam get_bone_script
            <get_bone_script> ObjID = <ObjID>
        endif
        <ObjID> ::obj_getboneposition bone = <bone>
        <pos_offset> = (<pos0_offset> + <x> * (1.0, 0.0, 0.0))
        <pos_offset> = (<pos_offset> + <y> * (0.0, 1.0, 0.0))
        <pos_offset> = (<pos_offset> + <z> * (0.0, 0.0, 1.0))
        obj_setposition position = <pos_offset>
    endif
    wait 1 gameframe
    repeat 
endscript

script fast_change_color endStartRGBA = [0 , 0 , 255 , 128] endMidRGBA = [0 , 0 , 255 , 128] endEndRGBA = [0 , 0 , 255 , 128] delayStart = 0.0 changetime = 2.0 stepTime = 0.1000
    wait <delayStart> seconds
    getparticleparams
    JOW_RGBAToVector rgba = (<particleparams>.startRGBA)
    beginStartRGB = <rgb>
    beginStartAlpha = <a>
    JOW_RGBAToVector rgba = <endStartRGBA>
    endStartRGB = <rgb>
    endStartAlpha = <a>
    JOW_RGBAToVector rgba = (<particleparams>.midRGBA)
    beginMidRGB = <rgb>
    beginMidAlpha = <a>
    JOW_RGBAToVector rgba = <endMidRGBA>
    endMidRGB = <rgb>
    endMidAlpha = <a>
    JOW_RGBAToVector rgba = (<particleparams>.endRGBA)
    beginEndRGB = <rgb>
    beginEndAlpha = <a>
    JOW_RGBAToVector rgba = <endEndRGBA>
    endEndRGB = <rgb>
    endEndAlpha = <a>
    curStartRGB = <beginStartRGB>
    curStartAlpha = <beginStartAlpha>
    curMidRGB = <beginMidRGB>
    curMidAlpha = <beginMidAlpha>
    curEndRGB = <beginEndRGB>
    curEndAlpha = <beginEndAlpha>
    step = ((<stepTime> / <changetime>))
    stepStartRGB = ((<endStartRGB> - <beginStartRGB>)* <step>)
    stepStartAlpha = ((<endStartAlpha> - <beginStartAlpha>)* <step>)
    stepMidRGB = ((<endMidRGB> - <beginMidRGB>)* <step>)
    stepMidAlpha = ((<endMidAlpha> - <beginMidAlpha>)* <step>)
    stepEndRGB = ((<endEndRGB> - <beginEndRGB>)* <step>)
    stepEndAlpha = ((<endEndAlpha> - <beginEndAlpha>)* <step>)
    curTime = <step>
    begin 
    if (<curTime> > -1 & <curTime> < <changetime>)
        curStartRGB = (<curStartRGB> + <stepStartRGB>)
        curStartAlpha = (<curStartAlpha> + <stepStartAlpha>)
        curMidRGB = (<curMidRGB> + <stepMidRGB>)
        curMidAlpha = (<curMidAlpha> + <stepMidAlpha>)
        curEndRGB = (<curEndRGB> + <stepEndRGB>)
        curEndAlpha = (<curEndAlpha> + <stepEndAlpha>)
        JOW_VectorToRGBA rgb = <curStartRGB> a = <curStartAlpha>
        setStartColor <rgba>
        JOW_VectorToRGBA rgb = <curMidRGB> a = <curMidAlpha>
        setMidColor <rgba>
        JOW_VectorToRGBA rgb = <curEndRGB> a = <curEndAlpha>
        setEndColor <rgba>
        curTime = (<curTime> + <stepTime>)
        wait <stepTime> seconds
    else
        JOW_VectorToRGBA rgb = <endStartRGB> a = <endStartAlpha>
        setStartColor <rgba>
        JOW_VectorToRGBA rgb = <endMidRGB> a = <endMidAlpha>
        setMidColor <rgba>
        JOW_VectorToRGBA rgb = <endEndRGB> a = <endEndAlpha>
        setEndColor <rgba>
        break 
    endif
    repeat 
endscript
