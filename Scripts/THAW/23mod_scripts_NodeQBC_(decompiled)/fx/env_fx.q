doupdatelensflare = 1
lensflare_morph_in = 0.1500
lensflare_morph_out = 0.1000

script DisableSun 
    change \{ doupdatelensflare = 0 }
    maybehidelensflare
    SetSunProps \{ size = 0 }
endscript

script EnableSun 
    change \{ doupdatelensflare = 1 }
    UnHideLensFlare
    SetSunProps \{ size = 7332.0 }
endscript

script createlensflare 
    return 
    SetScreenElementLock id = root_window Off
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = lens_flare_container
        dims = (640.0, 480.0)
        Pos = (0.0, 0.0)
        alpha = 0
        just = [ left top ]
    }
    GetArraySize lens_flare_data
    index = 0
    begin 
    CreateScreenElement {
        type = SpriteElement
        parent = lens_flare_container
        id = (lens_flare_data [ <index> ].id)
        Scale = (lens_flare_data [ <index> ].Scale)
        texture = (lens_flare_data [ <index> ].texture)
        rgba = (lens_flare_data [ <index> ].rgba)
        Pos = (0.0, 0.0)
        Blend = Add
    }
    <index> = (<index> + 1)
    repeat <array_size>
    SetScreenElementLock id = root_window on
endscript

script maybehidelensflare \{ morph_time = 0.0 }
    if ScreenElementExists \{ id = lens_flare_container }
        HideLensFlare <...> 
    else
        createlensflare
    endif
endscript
lens_flare_data = [
    {
        id = lf_sprite_1
        texture = APM_abberation02
        pos_scale = 0.8000
        Scale = 3.0
        rgba = [ 200 128 0 16 ]
    }
    {
        id = lf_sprite_2
        texture = APM_abberation02
        pos_scale = 0.7000
        Scale = 2.0
        rgba = [ 255 128 0 20 ]
    }
    {
        id = lf_sprite_3
        texture = APM_abberation01
        pos_scale = 0.6500
        Scale = 0.6000
        rgba = [ 255 128 100 32 ]
    }
    {
        id = lf_sprite_4
        texture = flare1
        pos_scale = 0.6300
        Scale = 0.7500
        rgba = [ 255 128 128 32 ]
    }
    {
        id = lf_sprite_5
        texture = flare1
        pos_scale = 0.5800
        Scale = 0.4500
        rgba = [ 200 128 0 32 ]
    }
    {
        id = lf_sprite_6
        texture = APM_abberation01
        pos_scale = 0.5700
        Scale = 0.7500
        rgba = [ 200 128 0 32 ]
    }
    {
        id = lf_sprite_7
        texture = flare1
        pos_scale = 0.4900
        Scale = 0.5000
        rgba = [ 255 128 128 64 ]
    }
    {
        id = lf_sprite_8
        texture = APM_abberation02
        pos_scale = 0.4500
        Scale = 1.300
        rgba = [ 200 128 0 20 ]
    }
    {
        id = lf_sprite_9
        texture = flare1
        pos_scale = 0.4300
        Scale = 0.8500
        rgba = [ 255 128 128 32 ]
    }
    {
        id = lf_sprite_10
        texture = APM_abberation01
        pos_scale = 0.1200
        Scale = 3.100
        rgba = [ 200 128 0 12 ]
    }
    {
        id = lf_sprite_11
        texture = APM_abberation02
        pos_scale = -0.4500
        Scale = 2.750
        rgba = [ 200 128 100 16 ]
    }
    {
        id = lf_sprite_12
        texture = APM_abberation02
        pos_scale = -0.4800
        Scale = 1.0
        rgba = [ 200 128 100 32 ]
    }
]
Lens_Flare_Data1 = [
    {
        id = lf_sprite_1
        texture = flare1
        pos_scale = 0.8000
        Scale = 1.0
        rgba = [ 128 128 196 64 ]
    }
    {
        id = lf_sprite_2
        texture = APM_abberation01
        pos_scale = 0.5000
        Scale = 0.7500
        rgba = [ 128 128 0 64 ]
    }
    {
        id = lf_sprite_3
        texture = flare1
        pos_scale = 0.3330
        Scale = 0.5000
        rgba = [ 128 128 128 64 ]
    }
    {
        id = lf_sprite_4
        texture = APM_abberation02
        pos_scale = 0.1250
        Scale = 2.0
        rgba = [ 128 64 128 64 ]
    }
    {
        id = lf_sprite_5
        texture = APM_abberation01
        pos_scale = -0.5000
        Scale = 0.8500
        rgba = [ 196 128 128 64 ]
    }
    {
        id = lf_sprite_6
        texture = flare1
        pos_scale = -0.2500
        Scale = 0.7500
        rgba = [ 128 128 128 64 ]
    }
    {
        id = lf_sprite_7
        texture = APM_abberation02
        pos_scale = -0.1818
        Scale = 0.8500
        rgba = [ 128 128 128 128 ]
    }
]
sunburst_out = 0.2500
