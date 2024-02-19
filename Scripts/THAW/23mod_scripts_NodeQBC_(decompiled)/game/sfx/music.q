locked_track1 = -1
locked_track2 = -2

script LoadPermSongs 
    if ((IsTrue TestMusicFromHost)|| (cd)|| (isPC))
        LoadMusicHeader 'music\music'
        GetArraySize playlist_tracks
        index = 0
        begin 
        path = ((playlist_tracks [ <index> ]).path)
        FormatText textname = tracktitle '%b: %t' b = ((playlist_tracks [ <index> ]).band)t = ((playlist_tracks [ <index> ]).track_title)
        AddMusicTrack <path> FLAG_PERM tracktitle = <tracktitle>
        index = (<index> + 1)
        repeat <array_size>
        GetArraySize ambient_tracks
        index = 0
        begin 
        AddMusicTrack (ambient_tracks [ <index> ])
        index = (<index> + 1)
        repeat <array_size>
    endif
endscript
playlist_genres = [ 'PUNK' 'HIP HOP' 'ROCK/INNE' ]
playlist_tracks = [
    { band = '7 Seconds' track_title = 'We\'re Gonna Fight' genre = 0 path = 'music\vag\songs\7seconds' }
    { band = 'Alkaline Trio' track_title = 'Wash Away' genre = 0 path = 'music\vag\songs\wash' }
    { band = 'An Endless Sporadic' track_title = 'Sun of Pearl' genre = 2 path = 'music\vag\songs\Pearl' }
    { band = 'From Autumn to Ashes' track_title = 'Let\'s Have a War' genre = 0 path = 'music\vag\songs\Autumn' }
    { band = 'Bad Religion' track_title = 'We\'re Only Gonna Die' genre = 0 path = 'music\vag\songs\Bad' }
    { band = 'Black Flag' track_title = 'Rise Above' genre = 0 path = 'music\vag\songs\blackf' }
    { band = 'The Bled' track_title = 'House of Suffering' genre = 0 path = 'music\vag\songs\Bled' }
    { band = 'Bloc Party' track_title = 'Like Eating Glass' genre = 2 path = 'music\vag\songs\Bloc' }
    { band = 'Bobot Adrenaline' track_title = 'Penalty Box' genre = 2 path = 'music\vag\songs\Bobot' }
    { band = 'The Bravery' track_title = 'Unconditional' genre = 2 path = 'music\vag\songs\bravery' }
    { band = 'Breakestra' track_title = 'Champ' genre = 2 path = 'music\vag\songs\breakstra' }
    { band = 'The Casualties' track_title = 'Get Off My Back' genre = 0 path = 'music\vag\songs\casualties' }
    { band = 'Circle Jerks' track_title = 'Wild in the Streets' genre = 0 path = 'music\vag\songs\Circle' }
    { band = 'Dead Kennedys' track_title = 'California Uber Alles' genre = 0 path = 'music\vag\songs\California' }
    { band = 'Death From Above' track_title = 'Little Girl' genre = 2 path = 'music\vag\songs\Death' }
    { band = 'Del' track_title = 'Burnt' genre = 1 path = 'music\vag\songs\Del' }
    { band = 'The Doors' track_title = 'Peace Frog' genre = 2 path = 'music\vag\songs\doors' }
    { band = 'Dropkick Murphys' track_title = 'Who is Who' genre = 0 path = 'music\vag\songs\Who' }
    { band = 'D.R.I' track_title = 'CouchSlouch' genre = 0 path = 'music\vag\songs\couch' }
    { band = 'El P' track_title = 'Jukie Skate Rock' genre = 1 path = 'music\vag\songs\El' }
    { band = 'Emanuel' track_title = 'Search and Destroy' genre = 0 path = 'music\vag\songs\Emanuel' }
    { band = 'Fall Out Boy' track_title = 'Start Today' genre = 0 path = 'music\vag\songs\Fallout' }
    { band = 'The Faint' track_title = 'I Disappear' genre = 2 path = 'music\vag\songs\faint' }
    { band = 'Fatlip' track_title = 'What\'s Up Fatlip' genre = 1 path = 'music\vag\songs\Fat' }
    { band = 'Felix da Housecat' track_title = 'Everyone is Someone in LA' genre = 2 path = 'music\vag\songs\Everyone' }
    { band = 'Frank Black' track_title = 'Los Angeles' genre = 2 path = 'music\vag\songs\Frank' }
    { band = 'The God Awfuls' track_title = 'Watch It Fall' genre = 0 path = 'music\vag\songs\godawful' }
    { band = 'Good Riddance' track_title = '30 Day Wonder' genre = 0 path = 'music\vag\songs\good' }
    { band = 'Green Day' track_title = 'Holiday' genre = 2 path = 'music\vag\songs\green' }
    { band = 'High on Fire' track_title = 'Devilution' genre = 2 path = 'music\vag\songs\High' }
    { band = 'Hot Snakes' track_title = 'Time to Escape' genre = 0 path = 'music\vag\songs\Hot' }
    { band = 'Lair of the Minotaur' track_title = 'Warlord' genre = 2 path = 'music\vag\songs\warlord' }
    { band = 'Mastodon' track_title = 'Iron Tusk' genre = 2 path = 'music\vag\songs\iron' }
    { band = 'Molemen' track_title = 'Put Your Quarter Up' genre = 1 path = 'music\vag\songs\mfdoom' }
    { band = 'Mike V and the Rats' track_title = 'Vendetta' genre = 0 path = 'music\vag\songs\mike' }
    { band = 'Motley Crue' track_title = 'Live Wire' genre = 2 path = 'music\vag\songs\motley' }
    { band = 'My Chem Romance' track_title = 'Astro Zombies' genre = 0 path = 'music\vag\songs\astro' }
    { band = 'Nassim' track_title = 'Rawhide' genre = 2 path = 'music\vag\songs\Rawhide' }
    { band = 'The Network' track_title = 'Teenagers from Mars' genre = 2 path = 'music\vag\songs\Mars' }
    { band = 'Oingo Boingo' track_title = 'Who Do You Want To Be' genre = 2 path = 'music\vag\songs\oingo' }
    { band = 'Pig Destroyer' track_title = 'Gravedancer' genre = 2 path = 'music\vag\songs\Pig' }
    { band = 'Pest' track_title = 'Duke Kerb Crawler' genre = 1 path = 'music\vag\songs\pest' }
    { band = 'Prefuse 73' track_title = 'One Word Extinguisher' genre = 1 path = 'music\vag\songs\Prefuse' }
    { band = 'Public Enemy' track_title = 'Burn Hollywood Burn' genre = 1 path = 'music\vag\songs\public' }
    { band = 'Rise Against' track_title = 'Fix me' genre = 0 path = 'music\vag\songs\fix' }
    { band = 'Riverboat Gamblers' track_title = 'Hey! Hey! Hey!' genre = 0 path = 'music\vag\songs\riverboat' }
    { band = 'Rob Sonic' track_title = 'Sniper Picnic' genre = 1 path = 'music\vag\songs\Robsonic' }
    { band = 'Saves The Day' track_title = 'Sonic Reducer' genre = 0 path = 'music\vag\songs\Saves' }
    { band = 'Scissor Sisters' track_title = 'Filthy/Gorgeous' genre = 2 path = 'music\vag\songs\Scissor' }
    { band = 'Senses Fail' track_title = 'Institutionalized' genre = 0 path = 'music\vag\songs\Senses' }
    { band = 'Sham 69' track_title = 'Borstal Breakout' genre = 0 path = 'music\vag\songs\Sham' }
    { band = 'SNFU' track_title = 'Better Homes and Gardens' genre = 0 path = 'music\vag\songs\SNFU' }
    { band = 'Spirit Caravan' track_title = 'Dove-Tongued Agressor' genre = 2 path = 'music\vag\songs\spirit' }
    { band = 'Strike Anywhere' track_title = 'Question the Answer' genre = 0 path = 'music\vag\songs\strike' }
    { band = 'Taking Back Sunday' track_title = 'Suburban Home/I Like Food' genre = 0 path = 'music\vag\songs\suburban' }
    { band = 'The Thunderlords' track_title = 'I Like Dirt' genre = 2 path = 'music\vag\songs\dirt' }
    { band = 'Thrice' track_title = 'Image' genre = 0 path = 'music\vag\songs\image' }
    { band = 'Thrice' track_title = 'Seeing Red/Screaming' genre = 0 path = 'music\vag\songs\thrice' }
    { band = 'Thursday' track_title = 'Ever Fallen in Love?' genre = 0 path = 'music\vag\songs\ever' }
    { band = 'Tommy Guerrero' track_title = 'Organism' genre = 1 path = 'music\vag\songs\Tommy' }
    { band = 'Ungh!' track_title = 'Skate Afrikkana' genre = 2 path = 'music\vag\songs\ungh' }
    { band = 'USSR' track_title = 'Live Near Death' genre = 2 path = 'music\vag\songs\USSR' }
    { band = 'Venom' track_title = 'Black Metal' genre = 2 path = 'music\vag\songs\venom' }
]
ambient_tracks = [
    { path = 'music\vag\backgrounds\z_at_bg' }
    { path = 'music\vag\backgrounds\z_bh_bg' }
    { path = 'music\vag\backgrounds\z_ch_bg' }
    { path = 'music\vag\backgrounds\z_dn_bg' }
    { path = 'music\vag\backgrounds\z_ho_bg' }
    { path = 'music\vag\backgrounds\z_ja_bg' }
    { path = 'music\vag\backgrounds\z_lv_bg' }
    { path = 'music\vag\backgrounds\z_ma_bg' }
    { path = 'music\vag\backgrounds\z_ms_bg' }
    { path = 'music\vag\backgrounds\z_oi_bg' }
    { path = 'music\vag\backgrounds\z_sm_bg' }
    { path = 'music\vag\backgrounds\z_sr_bg' }
    { path = 'music\vag\backgrounds\z_sv_bg' }
    { path = 'music\vag\backgrounds\z_sv2_bg' }
    { path = 'music\vag\backgrounds\z_sz_bg' }
]
