

script create_helper_text {anchor_id = helper_text_anchor
        parent = current_menu_anchor
        helper_text_anchor = <helper_text_anchor>
        helper_pos = (320.0, 426.0)
        spacing_between = 3
        bg_rgba = [ 2 0 1 98 ]
    }
    <Scale> = 0.7900
    if ObjectExists id = <anchor_id>
        DestroyScreenElement id = <anchor_id>
    endif
    CreateScreenElement {
        type = ContainerElement
        parent = <parent>
        id = <anchor_id>
        Pos = (320.0, 240.0)
        dims = (640.0, 480.0)
    }
    if NOT GotParam no_bar
        CreateScreenElement {
            type = SpriteElement
            parent = <anchor_id>
            texture = white2
            Pos = <helper_pos>
            just = [ center bottom ]
            rgba = <bg_rgba>
            Scale = (200.5, 3.4000000953674316)
        }
        CreateScreenElement {
            type = SpriteElement
            parent = <anchor_id>
            texture = white3
            Scale = (40.0, 0.029999999329447746)
            rgba = [ 13 56 82 80 ]
            Pos = (<helper_pos> - (0.0, 29.0))
        }
        CreateScreenElement {
            type = SpriteElement
            parent = <anchor_id>
            texture = white3
            Scale = (40.0, 0.029999999329447746)
            rgba = [ 13 56 82 80 ]
            Pos = (<helper_pos> + (0.0, 2.0))
        }
    endif
    CreateScreenElement {
        type = hmenu
        parent = <anchor_id>
        Pos = (<helper_pos> - (0.0, 3.0))
        just = [ center bottom ]
        internal_just = [ center center ]
        padding_scale = 0.9000
        spacing_between = <spacing_between>
        Scale = <Scale>
    }
    <menu_id> = <id>
    if GotParam helper_text_elements
        ForEachIn <helper_text_elements> do = helper_text_update_element params = { menu_id = <menu_id> }
    endif
endscript


script helper_text_update_element 
    if GotParam id
        if ObjectExists <id>
            SetScreenElementProps {
                id = <id>
                text = <text>
            }
            return 
        endif
    endif
    CreateScreenElement {
        type = TextElement
        parent = <menu_id>
        id = <id>
        font = dialog
        text = <text>
        rgba = [ 70 70 70 108 ]
        Scale = 0.7900
        z_priority = 100
        not_focusable
    }
endscript

generic_helper_text = {helper_text_elements = [{ text = '\b7/\b4 = Select' }
        { text = '\bn = Back' }
        { text = '\bm = Accept' }
    ]
}
generic_helper_text_no_back = {helper_text_elements = [{ text = '\b7/\b4 = Select' }
        { text = '\bm = Accept' }
    ]
}
generic_helper_text_no_accept = {helper_text_elements = [{ text = '\b7/\b4 = Select' }
        { text = '\bn = Back' }
    ]
}
generic_helper_text_cas = {helper_text_elements = [{ text = '\b7/\b4 = Select' }
        { text = '\bn = Back' }
        { text = '\bm = Accept' }
        { text = '\bs/\bt = Rotate' }
    ]
}
generic_helper_text_cas_no_back = {helper_text_elements = [{ text = '\b7/\b4 = Select' }
        { text = '\bm = Accept' }
        { text = '\bs/\bt = Rotate' }
    ]
}
generic_helper_text_cas_z = {helper_text_elements = [{ text = '\b7/\b4 = Select' }
        { text = '\bn = Back' }
        { text = '\bm = Accept' }
        { text = '\bs/\bt = Rotate' }
        { text = '\bq = Zoom' }
    ]
}
generic_helper_text_left_right = {helper_text_elements = [{ text = '\b6/\b5 = Select' }
        { text = '\bn = Back' }
        { text = '\bm = Accept' }
    ]
}
generic_helper_text_up_down_left_right = {helper_text_elements = [{ text = '\b7/\b4/\b6/\b5 = Select' }
        { text = '\bn = Back' }
        { text = '\bm = Accept' }
    ]
}
generic_helper_text_up_down_adjust = {helper_text_elements = [{ text = '\b7/\b4 = Select' }
        { text = '\b6/\b5 = Adjust' }
        { text = '\bn = Back' }
        { text = '\bm = Accept' }
    ]
}
generic_helper_text_left_right_l_r = {helper_text_elements = [{ text = '\b6/\b5 = Select' }
        { text = '\bn = Back' }
        { text = '\bm = Accept' }
        { text = '\bs/\bt = Rotate' }
    ]
}
generic_helper_text_left_right_up_down = {helper_text_elements = [{ text = '\b7/\b4 = Select' }
        { text = '\b6/\b5=Adjust' }
        { text = '\bn = Back' }
        { text = '\bm = Accept' }
    ]
}
generic_helper_text_color_menu = {helper_text_elements = [{ text = '\b7/\b4=Select' }
        { text = '\b6/\b5=Adjust' }
        { text = '\bn=Back' }
        { text = '\bm=Accept' }
        { text = '\bs/\bt=Rotate' }
    ]
}
generic_helper_text_color_menu_z = {helper_text_elements = [{ text = '\b7/\b4=Select' }
        { text = '\b6/\b5=Adjust' }
        { text = '\bn=Back' }
        { text = '\bm=Accept' }
        { text = '\bs/\bt=Rotate' }
        { text = '\bq=Zoom' }
    ]
}
generic_helper_text_color_menu_reset = {helper_text_elements = [
        { text = '\bn=Back' }
        { text = '\bs/\bt=Rotate' }
        { text = '\br=Reset' }
        {}
    ]
}
generic_helper_text_color_menu_reset_ngc = {helper_text_elements = [
        { text = '\bn=Back' }
        { text = '\bs/\bt=Rotate' }
        { text = '\be+\bf=Reset' }
        { text = '\bq=Zoom' }
    ]
}
cag_helper_text = 
{
    helper_text_elements = 
    [
        { text = '\b8=Quit' }
        { text = '\bn=Back' }
        { text = '\bm=Place' }
        { text = '\be/\bg=Raise/Lower' }
        { text = '\bf/\bh=Zoom' }
    ]
}
cag_helper_text_xbox = 
{
    helper_text_elements = 
    [
        { text = '\bp=Back' }
        { text = '\bm=Place' }
        { text = '\bs/\bt=Lower/Raise' }
        { text = '\bq/\br=Zoom' }
    ]
}
cag_helper_text_ngc = 
{
    helper_text_elements = 
    [
        { text = '\b8=Quit' }
        { text = '\b0=Back' }
        { text = '\m0=Place' }
        { text = '\be/\bf=Raise/Lower' }
        { text = '\b9+\bs/\bt=Zoom' }
    ]
}
cag_helper_text_no_back = 
{
    helper_text_elements = 
    [
        { text = '\b8 = Quit' }
        { text = '\m0 = Place' }
        { text = '\be/\bg = Raise/Lower' }
        { text = '\bf/\bh = Zoom' }
    ]
}
cag_helper_text_no_back_xbox = 
{
    helper_text_elements = 
    [
        { text = '\bm = Place' }
        { text = '\bs/\bt = Lower/Raise' }
        { text = '\bq/\br = Zoom' }
    ]
}
cag_helper_text_no_back_ngc = 
{
    helper_text_elements = 
    [
        { text = '\b8 = Quit' }
        { text = '\m0 = Place' }
        { text = '\bs/\bt=Raise/Lower' }
        { text = '\bq+\br/\bf=Zoom' }
    ]
}
rail_editor_free_roam_helper_text = 
{
    helper_text_elements = 
    [
        { text = '\m1 = Delete' }
        { text = '\m0 = Place' }
        { text = '\b1 = Snap' }
        { text = '\b2 = Grab' }
        { text = '\be/\bg = Raise/Lower' }
        { text = '\bf/\bh = Zoom' }
    ]
}
rail_editor_layout_helper_text = 
{
    helper_text_elements = 
    [
        { text = '\m1 = End' }
        { text = '\m0 = Place' }
        { text = '\b1 = Snap' }
        { text = '\be/\bg = Raise/Lower' }
        { text = '\bf/\bh = Zoom' }
    ]
}
rail_editor_grab_helper_text = 
{
    helper_text_elements = 
    [
        { text = '\m1 = Undo' }
        { text = '\m0 = Place' }
        { text = '\b1 = Snap' }
        { text = '\be/\bg = Raise/Lower' }
        { text = '\bf/\bh = Zoom' }
    ]
}
rail_editor_free_roam_helper_text_xbox = 
{
    helper_text_elements = 
    [
        { text = '\b0 = Delete' }
        { text = '\m0 = Place' }
        { text = '\b1 = Snap' }
        { text = '\b2 = Grab' }
        { text = '\be/\bf = Lower/Raise' }
        { text = '\bg/\bh = Zoom' }
    ]
}
rail_editor_layout_helper_text_xbox = 
{
    helper_text_elements = 
    [
        { text = '\b0 = End' }
        { text = '\m0 = Place' }
        { text = '\b1 = Snap' }
        { text = '\be/\bf = Lower/Raise' }
        { text = '\bg/\bh = Zoom' }
    ]
}
rail_editor_grab_helper_text_xbox = 
{
    helper_text_elements = 
    [
        { text = '\b0 = Undo' }
        { text = '\m0 = Place' }
        { text = '\b1 = Snap' }
        { text = '\be/\bf = Lower/Raise' }
        { text = '\bg/\bh = Zoom' }
    ]
}
rail_editor_free_roam_helper_text_ngc = 
{
    helper_text_elements = 
    [
        { text = '\b1=Delete' }
        { text = '\m0=Place' }
        { text = '\b0=Snap' }
        { text = '\b2= Grab' }
        { text = '\be/\bf=Raise/Lower' }
        { text = '\b9+\bs/\bt=Zoom' }
    ]
}
rail_editor_layout_helper_text_ngc = 
{
    helper_text_elements = 
    [
        { text = '\b1=End' }
        { text = '\m0=Place' }
        { text = '\b0=Snap' }
        { text = '\be/\bf=Raise/Lower' }
        { text = '\b9+\bs/\bt=Zoom' }
    ]
}
rail_editor_grab_helper_text_ngc = 
{
    helper_text_elements = 
    [
        { text = '\b1=Undo' }
        { text = '\m0=Place' }
        { text = '\b0=Snap' }
        { text = '\be/\bf=Raise/Lower' }
        { text = '\b9+\bs/\bt=Zoom' }
    ]
}
park_editor_helper_text = {helper_text_elements = [{ text = '\bo = Delete' }
        { text = '\bm = Accept' }
        { text = '\bs/\bt = Rotate' }
        { text = '\be/\bg = Raise/Lower' }
        { text = '\bf/\bh = Zoom' }
    ]
}
park_editor_helper_text_xbox = {helper_text_elements = [{ text = '\b0 = Delete' }
        { text = '\m0 = Accept' }
        { text = '\b1/\b2 = Rotate' }
        { text = '\be/\bf = Lower/Raise' }
        { text = '\bg/\bh = Zoom' }
    ]
}
park_editor_helper_text_ngc = {helper_text_elements = [{ text = '\b1=Delete' }
        { text = '\m0=Accept' }
        { text = '\b0/\b2=Rotate' }
        { text = '\be/\bf=Raise/Lower' }
        { text = '\b9+\be/\bf=Zoom' }
    ]
}
gap_regular_helper_text = {helper_text_elements = [{ text = '\bn = Delete' }
        { text = '\bm = Accept' }
    ]
}
gap_regular_helper_text_xbox = {helper_text_elements = [{ text = '\b0 = Delete' }
        { text = '\bm = Accept' }
    ]
}
gap_regular_helper_text_ngc = {helper_text_elements = [{ text = '\b1 = Delete' }
        { text = '\bm = Accept' }
    ]
}
gap_adjust_helper_text = {helper_text_elements = [{ text = '\m1=Delete \b1/\b2=Rotate \be/\bg=Adjust Left \bf/\bh=Adjust Right' }
    ]
}
gap_adjust_helper_text_xbox = {helper_text_elements = [{ text = '\b0 = Delete' }
        { text = '\bs/\bt = Rotate' }
        { text = '\be/\bf/\bg/\bh = Adjust' }
    ]
}
gap_adjust_helper_text_ngc = {helper_text_elements = [{ text = '\b1 = Delete' }
        { text = '\bs/\bt = Rotate' }
        { text = '\be/\bf + \b7/\b4  = Adjust' }
    ]
}
resize_park_helper_text_lr = 
{
    helper_text_elements = 
    [
        { text = '\b6/\b5 = Adjust' }
        { text = '\m0 = Side' }
        { text = '\b2 = Expand' }
        { text = '\b1 = Contract' }
        { text = '\m1 = Back' }
    ]
}
resize_park_helper_text_ud = 
{
    helper_text_elements = 
    [
        { text = '\b7/\b4 = Adjust' }
        { text = '\m0 = Side' }
        { text = '\b2 = Expand' }
        { text = '\b1 = Contract' }
        { text = '\m1 = Back' }
    ]
}
resize_park_helper_text_lr_xbox = 
{
    helper_text_elements = 
    [
        { text = '\b6/\b5 = Adjust' }
        { text = '\bm = Side' }
        { text = '\bp = Expand' }
        { text = '\bo = Contract' }
        { text = '\bn = Back' }
    ]
}
resize_park_helper_text_ud_xbox = 
{
    helper_text_elements = 
    [
        { text = '\b7/\b4 = Adjust' }
        { text = '\bm = Side' }
        { text = '\bp = Expand' }
        { text = '\bo = Contract' }
        { text = '\bn = Back' }
    ]
}
resize_park_helper_text_lr_ngc = 
{
    helper_text_elements = 
    [
        { text = '\b6/\b5 = Adjust' }
        { text = '\m0 = Side' }
        { text = '\b2 = Expand' }
        { text = '\b0 = Contract' }
        { text = '\m1 = Back' }
    ]
}
resize_park_helper_text_ud_ngc = 
{
    helper_text_elements = 
    [
        { text = '\b7/\b4 = Adjust' }
        { text = '\m0 = Side' }
        { text = '\b2 = Expand' }
        { text = '\b0 = Contract' }
        { text = '\m1 = Back' }
    ]
}
generic_dialog_helper_text = {helper_text_elements = [{ text = '\bm = Accept' }]}
generic_dialog_helper_text2 = {helper_text_elements = [{ text = '\b7/\b4 = Select' }
        { text = '\bm = Accept' }
    ]
}
generic_dialog_helper_text3 = {helper_text_elements = [{ text = '\bn = Back' }
        { text = '\bm = Accept' }
    ]
}
generic_helper_text_toggle = {helper_text_elements = [{ text = '\b7/\b4 = Select' }
        { text = '\bn = Back' }
        { text = '\bm = Toggle' }
    ]
}
eye_toy_helper_text = {
    helper_text_elements = [
        { text = '\m9 = Toggle Low Light' }
        { text = '\m0 = Capture' }
        { text = '\m1 = Back' }
    ]
}
