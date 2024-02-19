debugcomplexstreams = 25395205
allstreamsets = {
    templates = {
        default = [
            { '%a%b' }
            { '%a%b?' }
        ]
    }
    substitutions = {
        a = [
            'Bonk'
            'Grind'
            'Land'
            'Ollie'
            'Przewrót'
            'lizg'
        ]
        b = [
            'Car'
            'Metal'
            'Pipe'
            'Plastic'
            'Wood'
            'Wire'
            'Woda'
            'Tile'
            'Snow'
            'Skylights'
            'Piasek'
            'Sidewalk'
            'Ska³a'
            'Plexiglass'
            'Mulch'
            'Mud'
            'Leaves'
            'Ice'
            'Gravel'
            'Trawa'
            'Glass'
        ]
    }
    streamparams = { vol = 150 dropoff = 100 id = PedVOStream }
    streamsets = [
        { 'Shotgun_vx_tohell??' }
    ]
    Killed = {
        streamparams = { vol = 350 dropoff = 500 id = PedVOStream2 }
        streamsets = [
            { 'Shotgun_vx_tohell??' weight = 31 }
        ]
        miner = {
            streamparams = { vol = 238 dropoff = 100 id = PedVOStream }
            streamsets = [
                { 'Miner_VX_Ouch_?' }
            ]
            apache = {
                streamparams = { vol = 200 dropoff = 100 id = PedVOStream }
                streamsets = [
                    { 'Miner_VX_Shouts_?' }
                    { 'Miner_VX_Shouts_??' }
                    { 'Miner_VX_Shouts_21' weight = 0 }
                    { 'Shotgun_vx_tohell??' }
                    { 'Shotgun_vx_tohell02' }
                ]
            }
        }
    }
}
