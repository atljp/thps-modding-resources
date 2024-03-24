
script Veh_TaxiUS_TOD 
endscript


script Veh_Generic_TOD 
    switch <current_tod>
        case Morning
        ReplaceCarTextures {
            array = [
                {
                    src = 'JKU_LightCircle_Transparent.png' dest = 'textures/cars/JKU_LightCircle_Transparent'
                }
                {
                    src = 'JKU_HeadlightGlow_Transparent.png' dest = 'textures/cars/JKU_HeadlightGlow'
                }
            ]
        }
        case day
        ReplaceCarTextures {
            array = [
                {
                    src = 'JKU_LightCircle_Transparent.png' dest = 'textures/cars/JKU_LightCircle_Transparent'
                }
                {
                    src = 'JKU_HeadlightGlow_Transparent.png' dest = 'textures/cars/JKU_HeadlightGlow_Transparent'
                }
            ]
        }
        case Evening
        ReplaceCarTextures {
            array = [
                {
                    src = 'JKU_LightCircle_Transparent.png' dest = 'textures/cars/JKU_LightCircle_Transparent'
                }
                {
                    src = 'JKU_HeadlightGlow_Transparent.png' dest = 'textures/cars/JKU_HeadlightGlow'
                }
            ]
        }
        case Night
        ReplaceCarTextures {
            array = [
                {
                    src = 'JKU_LightCircle_Transparent.png' dest = 'textures/cars/JKU_LightCircle'
                }
                {
                    src = 'JKU_HeadlightGlow_Transparent.png' dest = 'textures/cars/JKU_HeadlightGlow'
                }
            ]
        }
        default 
        
    endswitch
endscript

