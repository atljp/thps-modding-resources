
facemapping_instructions_steps = [
    {step = 1 text = [ 'Take a digital photo of\nyour face. Make sure\nit\'s front-on with flat lighting.' ]
        pos = (403.0, 320.0)
        enter_script = show_pic_example
        exit_script = hide_pic_example}
    {step = 2 text = [ 'Email the picture to\nfaces@thug2online.com\nYou\'ll get an e-mail reply with your password.' ]
        pos = (403.0, 320.0)}
    {step = 3 text = [ 'From the menu here,\nselect \'Download Face\'\nand then enter your password.' ]
        pos = (403.0, 320.0)
        last_instruction = last_instruction}
]
facemapping_instructions_steps_phone = [
    {step = 1 text = [ 'Make sure your phone\nhas a camera feature,\nand the ability to send\nand receive e-mail or multimedia messages.' ]
        pos = (403.0, 320.0)
        enter_script = show_pic_phone
        exit_script = hide_pic_phone}
    {step = 2 text = [ 'Take a digital photo of yourself using a phone.\nMake sure it\'s front-on, with flat lighting.' ]
        pos = (403.0, 320.0)
        enter_script = show_pic_example
        exit_script = hide_pic_example}
    {step = 3 text = [ 'Email the picture to\nfaces@thug2online.com\nYou\'ll get an e-mail reply with your password.' ]
        pos = (403.0, 320.0)}
    {step = 4 text = [ 'From the menu here,\nselect \'Download Face\'\nand then enter your password.' ]
        pos = (403.0, 320.0)
        last_instruction = last_instruction}
]
facemapping_instructions_steps_eye_toy = [
    {step = 1 text = [ 'Connect your EyeToy®\nUSB camera (for PlayStation®2) to either\nUSB connector on the console.' ]
        pos = (403.0, 320.0)}
    {step = 2 text = [ 'From the menu select\n\'Grab with EyeToy® USB\nCamera (for PlayStation®2)\'\nand then follow the\ninstructions to take a\npicture of your face.' ]
        pos = (403.0, 320.0)
        last_instruction = last_instruction}
]

script PlayInstructionSet end_target = sub_menu start_index = 0
    GetArraySize <instruction_set>
    FireEvent type = unfocus target = <end_target>
    create_helper_text {helper_text_elements = [{ text = '\bn=Back' }
            { text = '\bm=Continue' }]}
    if NOT (<start_index> = -1)
        <index> = <start_index>
        CreateInstructionBlock {
            instruction_set = <instruction_set>
            instruction = ((<instruction_set> [ <index> ]))
        }
        WaitForEvent type = instructions_done
    endif
    wait 0.2000 seconds
    FireEvent type = focus target = <end_target>
    create_helper_text generic_helper_text
    if GotParam exit_script
        <exit_script> <exit_params>
    endif
endscript


script exit_caf_instructions 
    if GotParam from_phone
        <times> = 2
    else
        if GotParam from_eye_toy
            <times> = 1
        else
            <times> = 3
        endif
    endif
    change disable_menu_sounds = 1
    begin 
    FireEvent type = pad_down target = sub_vmenu
    create_helper_text generic_helper_text_cas
    repeat <times>
    change disable_menu_sounds = 0
endscript


script CreateInstructionBlock 
    step_num_map = ['A' 'A' 'B' 'C' 'D' 'E' 'F' 'G']
    FormatText textName = title_text 'Step %c:' c = ((<step_num_map> [((<instruction>).step)]))
    create_instruction_box {
        no_pad_start
        title_text = <title_text>
        text = ((<instruction>).text)
        style = speech_box_style
        pos = ((<instruction>).pos)
        z_priority = 20
        instruction_set = <instruction_set>
        instruction_step = ((<instruction>).step)
        last_instruction = ((<instruction>).last_instruction)
        enter_script = ((<instruction>).enter_script)
        exit_script = ((<instruction>).exit_script)
    }
endscript


script exit_instruction_block 
    speech_box_exit anchor_id = <anchor_id>
endscript


script InstructionBlockForward 
    if GotParam exit_script
        if NOT (<exit_script> = None)
            <exit_script>
        endif
    endif
    exit_instruction_block anchor_id = <anchor_id>
    <index> = <current_step>
    <end> = ((<instruction_set> [(<index> -1)]).last_instruction)
    if NOT GotParam end
        <current_step> = (<current_step> + 1)
        CreateInstructionBlock {
            instruction_set = <instruction_set>
            instruction = ((<instruction_set> [ <index> ]))
        }
    else
        FireEvent type = instructions_done
    endif
endscript


script InstructionBlockBack 
    if GotParam exit_script
        if NOT (<exit_script> = None)
            <exit_script>
        endif
    endif
    exit_instruction_block anchor_id = <anchor_id>
    if (<current_step> > 1)
        <current_step> = (<current_step> - 1)
        <index> = (<current_step> -1)
        CreateInstructionBlock {
            instruction_set = <instruction_set>
            instruction = ((<instruction_set> [ <index> ]))
        }
    else
        FireEvent type = instructions_done
    endif
endscript


script create_instruction_box {pos = (320.0, 340.0)
        text_rgba = [ 128 128 128 128 ]
        anchor_id = speech_box_anchor
        scale = 1
        pad_choose_script = InstructionBlockForward
        pad_choose_params = { anchor_id = <anchor_id> }
        pad_back_script = InstructionBlockBack
        pad_back_params = { anchor_id = <anchor_id> }
        parent = root_window
        font = dialog
        bg_x_scale = 1
        pause_input_time = 1000
    }
    Theme_GetSpeechBoxColor return_value = bg_rgba
    Theme_GetHighlightedTextColor return_value = on_rgba
    Theme_GetUnhighlightedTextColor return_value = off_rgba
    if ObjectExists id = <anchor_id>
        DestroyScreenElement id = <anchor_id>
    endif
    SetScreenElementLock id = root_window off
    CreateScreenElement {
        type = ContainerElement
        parent = <parent>
        id = <anchor_id>
        pos = <pos>
        dims = (640.0, 480.0)
        scale = <scale>
        z_priority = <z_priority>
    }
    if NOT GotParam no_pad_choose
        SetScreenElementProps {
            id = <anchor_id>
            event_handlers = [{pad_choose <pad_choose_script> params = {current_step = <instruction_step> instruction_set = <instruction_set> exit_script = <exit_script> instruction_last = <instruction_last> <pad_choose_params>}}]
            replace_handlers
        }
    endif
    if GotParam pad_back_script
        SetScreenElementProps {
            id = <anchor_id>
            event_handlers = [{pad_back generic_menu_pad_back params = {callback = <pad_back_script> current_step = <instruction_step> instruction_set = <instruction_set> anchor_id = <anchor_id> exit_script = <exit_script> <pad_back_params>}}]
            replace_handlers
        }
    endif
    if NOT GotParam no_pad_start
        SetScreenElementProps {
            id = root_window
            event_handlers = [{pad_start <pad_choose_script> params = {current_step = <instruction_step> instruction_set = <instruction_set> exit_script = <exit_script> instruction_last = <instruction_last> <pad_choose_params>}}]
            replace_handlers
        }
    endif
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        pos = <pos>
        just = [ center bottom ]
        texture = dialog_frame_b
        scale = ((1.0, 0.0) * <bg_x_scale> + (0.0, 1.0))
        rgba = <bg_rgba>
    }
    CreateScreenElement {
        type = TextElement
        parent = <anchor_id>
        font = dialog
        pos = (320.0, 240.0)
        just = [ center top ]
        text = <title_text>
        internal_scale = 0.8500
        internal_just = [ center bottom ]
        rgba = <off_rgba>
        scale = 1.500
        allow_expansion
    }
    <title_textblock> = <id>
    GetScreenElementDims id = <title_textblock>
    <title_height> = <height>
    CreateScreenElement {
        type = TextBlockElement
        parent = <anchor_id>
        shadow
        shadow_offs = (1.0, 1.0)
        shadow_rgba = [ 10 10 10 100 ]
        font = <font>
        dims = ((249.0, 0.0) * <bg_x_scale>)
        pos = (0.0, 0.0)
        just = [ center top ]
        text = <text>
        internal_scale = 0.8500
        internal_just = [ center bottom ]
        rgba = <text_rgba>
        scale = 1
        allow_expansion
    }
    <speech_text> = <id>
    GetScreenElementDims id = <speech_text>
    SetScreenElementProps {
        id = <speech_text>
        pos = (<pos> - (0.0, 16.0) - ((0.0, 1.0) * <height>))
    }
    GetScreenElementPosition id = <speech_text>
    SetScreenElementProps {
        id = <title_textblock>
        pos = (<pos> - (0.0, 1.0) * (<height> + <title_height>)- (0.0, 16.0))
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        texture = dialog_middle
        pos = (<pos> - (0.0, 16.0))
        scale = (((1.0, 0.0) * <bg_x_scale>)+ (0.0, 1.0) * (<height> + <title_height>)/ 16)
        just = [ center bottom ]
        rgba = <bg_rgba>
    }
    CreateScreenElement {
        type = SpriteElement
        parent = <anchor_id>
        pos = (<pos> - (0.0, 16.0) - (0.0, 1.0) * (<height> + <title_height>))
        just = [ center bottom ]
        texture = dialog_frame
        scale = ((1.0, 0.0) * <bg_x_scale> + (0.0, 1.0))
        rgba = <bg_rgba>
    }
    if GotParam style
        RunScriptOnScreenElement id = <anchor_id> <style> params = <...> 
    endif
    if GotParam enter_script
        <enter_script> parent = <anchor_id> <...> 
    endif
    FireEvent type = focus target = <anchor_id>
    if GotParam pause_input
        SpawnScript TemporarilyDisableInput params = { time = <pause_input_time> }
    endif
endscript


script DrawInstructionLine 
    if ScreenElementExists id = instruction_line
        KillSpawnedScript name = DrawInstructionLine
        DestroyScreenElement id = instruction_line
    endif
    Theme_GetHighlightedTextColor return_value = on_rgba
    SetScreenElementLock off id = <parent>
    CreateScreenElement {
        type = SpriteElement
        parent = <parent>
        id = instruction_line
        texture = streak_2
        rgba = <on_rgba>
        just = [ left center ]
        pos = (0.0, 0.0)
        scale = 1
        z_priority = 30
        rot_angle = 0
        alpha = 0
    }
    wait 1 gameframe
    begin 
    relative_pos = (<to> - <from>)
    rel_x = (<relative_pos>.(1.0, 0.0))
    rel_y = (<relative_pos>.(0.0, 1.0))
    if NOT (<rel_x> = 0)
        atan (<rel_y> / <rel_x>)
        line_angle = ((<atan> * 1))
        sin (<atan>)
        line_length = (<rel_y> / <sin>)
        line_scale = ((<line_length> / 64)* (1.0, 0.0) + (0.0, 1.0))
        DoScreenElementMorph {
            id = instruction_line
            pos = <to>
            scale = <line_scale>
            rot_angle = <line_angle>
            alpha = 0.6000
        }
    endif
    wait 1 gameframe
    repeat 
endscript


script show_pic_example parent = speech_box_anchor
    Theme_GetHighlightedTextColor return_value = on_rgba
    Theme_GetUnhighlightedTextColor return_value = off_rgba
    CreateScreenElement {
        type = ContainerElement
        parent = <parent>
        id = pic_anchor
        pos = (<pos> + (234.0, 243.0))
        dims = (640.0, 480.0)
        z_priority = 20
    }
    get_default_face_texture_name
    <head_test> = <textureName>
    CreateScreenElement {
        type = SpriteElement
        parent = pic_anchor
        pos = (0.0, 0.0)
        texture = white2
        scale = 12.50
        rgba = <on_rgba>
    }
    CreateScreenElement {
        type = SpriteElement
        parent = pic_anchor
        pos = (0.0, 0.0)
        texture = cas_texture_from_profile
        scale = 0.7500
        z_priority = 30
    }
    GetScreenElementPosition id = pic_anchor
endscript


script hide_pic_example 
    if ObjectExists id = pic_anchor
        DestroyScreenElement id = pic_anchor
    endif
endscript


script show_pic_phone parent = speech_box_anchor
    Theme_GetHighlightedTextColor return_value = on_rgba
    Theme_GetUnhighlightedTextColor return_value = off_rgba
    CreateScreenElement {
        type = ContainerElement
        parent = <parent>
        id = pic_anchor
        pos = (<pos> + (242.0, 240.0))
        dims = (640.0, 480.0)
        z_priority = 20
    }
    FormatText ChecksumName = phone 'nokia_phone'
    CreateScreenElement {
        type = SpriteElement
        parent = pic_anchor
        pos = (0.0, 0.0)
        texture = <phone>
        scale = 1.100
        z_priority = 29
        rot_angle = -15
        rgba = <on_rgba>
    }
    CreateScreenElement {
        type = SpriteElement
        parent = pic_anchor
        pos = (0.0, 0.0)
        texture = <phone>
        scale = 1.0
        z_priority = 30
        rot_angle = -15
    }
    GetScreenElementPosition id = pic_anchor
endscript


script hide_pic_phone 
    if ObjectExists id = pic_anchor
        DestroyScreenElement id = pic_anchor
    endif
endscript

