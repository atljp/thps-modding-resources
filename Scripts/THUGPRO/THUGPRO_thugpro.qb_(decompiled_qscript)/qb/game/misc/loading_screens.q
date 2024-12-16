
SHOW_STARTUP_LOADING_SCREEN = 0 
SCRIPT startup_loading_screen 
ENDSCRIPT

SCRIPT parked_loading_screen_show 
ENDSCRIPT

SCRIPT parked_loading_screen_clear 
ENDSCRIPT

SCRIPT loadingscreen_container_destroy 
	DestroyScreenElement id = loadscreen_container 
ENDSCRIPT

SCRIPT loadingscreen_container_hide 
	DoScreenElementMorph id = loadscreen_container alpha = 0.00000000000 time = 0.50000000000 
ENDSCRIPT

SCRIPT SkProDisplayLoadingScreen 
	DisplayLoadingScreen <...> 
ENDSCRIPT

SCRIPT load_level_handle_loading_screen 
	IF IsTrue SHOW_STARTUP_LOADING_SCREEN 
		CreateScreenElement { 
			Type = ContainerElement 
			parent = root_window 
			id = loadscreen_container 
			pos = PAIR(320.00000000000, 240.00000000000) 
			dims = PAIR(640.00000000000, 480.00000000000) 
		} 
		CreateScreenElement { 
			Type = SpriteElement 
			parent = loadscreen_container 
			id = fade_in_box 
			texture = black 
			pos = PAIR(320.00000000000, 240.00000000000) 
			scale = PAIR(300.00000000000, 200.00000000000) 
			z_priority = 2100 
			rgba = [ 0 0 0 128 ] 
			no_zwrite 
		} 
		CreateScreenElement { 
			Type = SpriteElement 
			parent = loadscreen_container 
			id = wheel_loading 
			texture = thugpro_icon_text 
			pos = PAIR(320.00000000000, 340.00000000000) 
			scale = 0.30000001192 
			just = [ center center ] 
			z_priority = 2404 
			rgba = [ 123 123 123 0 ] 
		} 
		CreateScreenElement { 
			Type = SpriteElement 
			parent = loadscreen_container 
			id = wheel_bolt 
			texture = thugpro_icon_wheel_bolt 
			pos = PAIR(320.00000000000, 340.00000000000) 
			scale = 0.38999998569 
			just = [ center center ] 
			z_priority = 2402 
			rgba = [ 123 123 123 120 ] 
		} 
		CreateScreenElement { 
			Type = SpriteElement 
			parent = loadscreen_container 
			id = star_loading 
			texture = thugpro_icon_wheel_new 
			pos = PAIR(320.00000000000, 340.00000000000) 
			scale = 0.40000000596 
			just = [ center center ] 
			z_priority = 2400 
			rgba = [ 123 123 123 120 ] 
		} 
		CreateScreenElement { 
			Type = SpriteElement 
			parent = loadscreen_container 
			id = wheel_shadow 
			texture = thugpro_icon_wheel_shadow 
			pos = PAIR(320.00000000000, 340.00000000000) 
			scale = 1.00000000000 
			just = [ center center ] 
			z_priority = 2300 
			rgba = [ 123 123 123 120 ] 
		} 
		CreateScreenElement { 
			Type = SpriteElement 
			parent = loadscreen_container 
			id = logo_tp_ 
			texture = thugpro_logo_new 
			just = [ center center ] 
			scale = 0.40000000596 
			pos = PAIR(320.00000000000, 210.00000000000) 
			z_priority = 2402 
		} 
		CreateScreenElement { 
			Type = SpriteElement 
			parent = loadscreen_container 
			id = splashimage 
			scale = 1.00000000000 
			texture = ( ( splash_images_sprites ) [ ( GLOBAL_SPLASH_RAND ) ] ) 
			just = [ center center ] 
			pos = PAIR(320.00000000000, 240.00000000000) 
			z_priority = 2000 
		} 
		DoScreenElementMorph id = fade_in_box time = 0.30000001192 alpha = 0 
		RunScriptOnScreenElement id = star_loading spin_dialog_icon 
		Change SHOW_STARTUP_LOADING_SCREEN = 0 
	ENDIF 
ENDSCRIPT

GLOBAL_SPLASH_RAND = 0 
SCRIPT SHUFFLE_SPLASH_IMAGES 
	GetArraySize ( splash_images ) 
	GetRandomValue name = splash_rand a = 0 b = ( ( <array_size> ) -1 ) integer 
	Change GLOBAL_SPLASH_RAND = <splash_rand> 
ENDSCRIPT

splash_images_sprites = [ 
	SplashImage_A 
	SplashImage_B 
	SplashImage_C 
	SplashImage_D 
	SplashImage_E 
	SplashImage_F 
	SplashImage_G 
	SplashImage_H 
] 
splash_images = [ 
	"thugpro/SplashImage_A" 
	"thugpro/SplashImage_B" 
	"thugpro/SplashImage_C" 
	"thugpro/SplashImage_D" 
	"thugpro/SplashImage_E" 
	"thugpro/SplashImage_F" 
	"thugpro/SplashImage_G" 
	"thugpro/SplashImage_H" 
] 
SCRIPT Bootstrap_displayscreen 
ENDSCRIPT


