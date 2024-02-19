isolate_2d_render = 0

script HiResScreenshot Scale = 1
    GetCurrentCameraObject
    <cameraid> = <camid>
    printstruct <...> 
    <i> = 0
    pausegame
    root_window ::DoMorph alpha = 0
    wait 30 frames
    begin 
    <j> = 0
    begin 
    FormatText textname = text 'hi_res_screen_%a_%b_' a = <i> b = <j>
    Sub = ((<i> * <Scale>)+ <j>)
    <cameraid> ::setsubfrustum res = <Scale> subimage = <Sub>
    wait 16 frames
    ScreenShot filename = <text>
    wait 16 frames
    <j> = (<j> + 1)
    repeat <Scale>
    <i> = (<i> + 1)
    repeat <Scale>
    <cameraid> ::setsubfrustum res = 1 subimage = 0
    root_window ::DoMorph alpha = 1
    if GotParam Do2D
        if isPC
            change isolate_2d_render = 1
            wait 3 frames
            <i> = 0
            begin 
            <j> = 0
            begin 
            FormatText textname = text 'hi_res_screen_2d_%a_%b_' a = <i> b = <j>
            Sub = ((<i> * <Scale>)+ <j>)
            <cameraid> ::setsubfrustum res = <Scale> subimage = <Sub>
            wait 16 frames
            ScreenShot filename = <text>
            wait 16 frames
            <j> = (<j> + 1)
            repeat <Scale>
            <i> = (<i> + 1)
            repeat <Scale>
            <cameraid> ::setsubfrustum res = 1 subimage = 0
            change isolate_2d_render = 0
        endif
    endif
    UnPauseGame
endscript

script SpawnHiResScreenshot 
    SpawnScriptLater HiResScreenshot params = <...> 
endscript
