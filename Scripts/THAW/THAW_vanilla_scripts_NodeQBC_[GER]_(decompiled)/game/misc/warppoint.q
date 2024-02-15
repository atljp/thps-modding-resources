
script warpskater 
    SpawnSkaterScript TeleportSkaterToNode params = { <...>  }
    UnPauseGame
    Debounce \{ x time = 0.3000 }
    RunScriptOnScreenElement \{ id = main_menu_anchor menu_offscreen }
endscript
