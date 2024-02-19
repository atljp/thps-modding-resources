splat_critical_remaining_polys_pcnt = 0.5000
splat_alpha_degen_rate = 8
SplatIgnoreFlags = [ mFD_NON_COLLIDABLE mFD_INVISIBLE mFD_NOT_TAGGABLE ]

script PreAllocSplats 
    printf \{ 'Initializing SplatHeap' }
    if IsCreated \{ skater }
        skater ::PreAllocTags
    endif
    PreAllocTextureSplat \{ name = 'blood_01' }
    PreAllocTextureSplat \{ name = 'apm_searchlight_spat01_x' }
    if ((IsXbox)|| (isPC))
        PreAllocTextureSplat \{ name = 'skidtrail' }
    else
        PreAllocTextureSplat \{ name = 'skidtrail_ps2' }
    endif
endscript
