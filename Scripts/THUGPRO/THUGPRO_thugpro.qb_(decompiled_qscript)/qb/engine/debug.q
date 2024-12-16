
METRIC_TIME = 1 
METRIC_ARENAUSAGE = 2 
METRIC_TOTALPOLYS = 4 
METRIC_POLYSPROC = 8 
METRIC_VERTS = 16 
METRIC_RESOURCEALLOCS = 32 
METRIC_TEXTUREUPLOADS = 64 
METRIC_VU1 = 128 
METRIC_DMA1 = 256 
METRIC_DMA2 = 512 
METRIC_VBLANKS = 1024 
METRIC_DRAWTIME = 2048 
METRIC_IHANDLERTIME = 4096 
METRIC_SKYCACHE = 8192 
METRIC_VIDEOMODE = 16384 
METRIC_VRAMUSAGE = 32768 
METRIC_MEMUSED = 65536 
METRIC_MEMFREE = 131072 
METRIC_REGIONINFO = 262144 
SCRIPT UpdateDebugMouseCursor 
	IF NOT ScreenElementExists id = mouse_cursor 
		SetScreenElementLock id = root_window off 
		CreateScreenElement { 
			type = SpriteElement 
			parent = root_window 
			id = mouse_cursor 
			texture = mouse_cursor 
			rgba = [ 128 128 128 85 ] 
			just = [ left top ] 
			z_priority = 3000001 
			scale = 0.50000000000 
		} 
	ENDIF 
	SetScreenElementProps id = mouse_cursor pos = ( PAIR(1.00000000000, 0.00000000000) * <x> + PAIR(0.00000000000, 1.00000000000) * <y> ) 
ENDSCRIPT


