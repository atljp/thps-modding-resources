
UNHIGHLIGHTED_TEXT_COLOR = DE_UNHIGHLIGHTED_TEXT_COLOR 
HIGHLIGHTED_TEXT_COLOR = DE_HIGHLIGHTED_TEXT_COLOR 
HIGHLIGHT_BAR_COLOR = DE_HIGHLIGHT_BAR_COLOR 
MENU_TITLE_COLOR = DE_MENU_TITLE_COLOR 
DE_FONT_COLORS = [ 
	[ 88 105 112 128 ] 
	[ 110 30 15 108 ] 
	[ 50 80 112 100 ] 
	[ 9 107 36 100 ] 
	[ 123 99 3 100 ] 
	[ 0 128 128 100 ] 
	[ 128 0 128 100 ] 
	[ 30 50 80 100 ] 
	[ 88 105 112 128 ] 
	[ 50 80 112 100 ] 
	[ 120 45 4 128 ] 
] 
DE_HUD_COLOR = [ 125 107 34 128 ] 
DE_BALANCE_METER_COLOR = [ 15 82 117 128 ] 
DE_BALANCE_ARROW_COLOR = [ 125 107 34 128 ] 
DE_HUD_SPECIAL_COLOR = [ 15 82 117 128 ] 
DE_SPECIAL_BAR_COLORS = [ 
	[ 8 81 121 128 ] 
	[ 124 122 23 128 ] 
	[ 8 81 121 128 ] 
] 
DE_ICON_ON_VALUE = [ 122 65 12 120 ] 
DE_BOX_ICON_COLOR = [ 128 128 128 128 ] 
DE_ICON_TWITCH_VALUE = [ 90 8 10 98 ] 
DE_SUBMENU_TITLE_ICON_COLOR = [ 0 0 0 88 ] 
DE_GRADIENT_VALUE = [ 0 0 20 40 ] 
DE_BG_PARTS_COLOR = [ 35 57 107 128 ] 
DE_TEXT_TWITCH_VALUE = [ 90 8 10 128 ] 
DE_HIGHLIGHTED_TEXT_COLOR = [ 128 123 20 128 ] 
DE_UNHIGHLIGHTED_TEXT_COLOR = [ 128 128 128 120 ] 
DE_ALT_COLOR = [ 17 67 92 128 ] 
DE_HIGHLIGHT_BAR_COLOR = [ 35 57 107 128 ] 
DE_MENU_TITLE_COLOR = [ 120 45 4 128 ] 
DE_STAT_ON = [ 122 65 12 60 ] 
DE_STAT_OFF = [ 11 36 51 100 ] 
DE_DEF_STAT_ON = [ 60 0 0 60 ] 
DE_DEF_STAT_OFF = [ 11 36 51 50 ] 
DE_SPEECH_BOX_COLOR = [ 128 109 9 128 ] 
DE_KEY_COLOR = [ 11 36 51 100 ] 
DE_PAUSEBAR_COLOR = [ 128 109 9 128 ] 
DE_HIGHLIGHTED_TEXT_COLOR_NEW = [ 0 0 0 118 ] 
DE_UNHIGHLIGHTED_TEXT_COLOR_NEW = [ 128 128 128 118 ] 
DE_SUPPORTPIECE_COLOR = [ 52 30 78 128 ] 
DE_SUPPORTTEXT_COLOR = [ 0 0 0 0 ] 
current_theme_prefix = 0 
stored_theme_prefix = 0 
last_theme_prefix = 99 
THEME_COLOR_PREFIXES = [ "DE" ] 
THEME_PREFIXES = [ "DE" ] 
SCRIPT unload_current_theme 
	IF ScreenElementExists id = generic_sponsor_logo 
		Setscreenelementprops id = generic_sponsor_logo texture = white2 
	ENDIF 
	IF ScreenElementExists id = ( generic_sponsor_logo + 1 ) 
		Setscreenelementprops id = ( generic_sponsor_logo + 1 ) texture = white2 
	ENDIF 
	IF ( ( ScreenElementExists id = current_menu_anchor ) | ( GotParam loading_career ) ) 
		IF ScreenElementExists id = current_menu_anchor 
			DestroyScreenElement id = current_menu_anchor 
		ENDIF 
		pause_menu_gradient off 
		dialog_box_exit 
		wait 5 gameframes 
	ENDIF 
	load_theme_textures_to_main_memory unload_current 
ENDSCRIPT

SCRIPT reload_current_theme 
	load_theme_textures_to_main_memory 
	
	Theme_GetHUDColor return_value = hud_color 
	Theme_GetHUDSpecialColor return_value = special_color 
	FormatText ChecksumName = sponsor_texture "%i_sponsor" i = ( THEME_COLOR_PREFIXES [ current_theme_prefix ] ) 
	IF ScreenElementExists id = generic_sponsor_logo 
		Setscreenelementprops id = generic_sponsor_logo texture = <sponsor_texture> 
	ENDIF 
	IF ScreenElementExists id = ( generic_sponsor_logo + 1 ) 
		Setscreenelementprops id = ( generic_sponsor_logo + 1 ) texture = <sponsor_texture> 
	ENDIF 
	FireEvent type = theme_change_done 
ENDSCRIPT


