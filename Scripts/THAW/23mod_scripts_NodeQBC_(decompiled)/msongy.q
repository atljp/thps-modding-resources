
script startup 
    if NOT cd
        change \{ All_Levels_Unlocked = 1 }
        change \{ Show_Zone_Warnings = 1 }
    endif
    change \{ SkipDNASAuthentication = 1 }
    TODManager_SetActive \{ 0 }
    autolaunch \{ level = Load_Z_MainMenu Game = career }
endscript
