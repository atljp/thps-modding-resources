nodearray = 
[
    {
        Pos = (-0.000035000000934815034, -567.7260131835938, -0.00008499999967170879)
        angles = (3.141592025756836, -1.1414979696273804, -3.141592025756836)
        name = HI_sky01
        ncomp_LevelGeometry_1
    }
    {
        Pos = (-1922.1962890625, 0.0, -1809.5172119140625)
        angles = (0.0, -0.785398006439209, 0.0)
        name = HI_sky_clouds01
        ncomp_LevelGeometry_1
    }
]
triggerscripts = 
[ 
LoadTerrain
 ]

script LoadAllParticleTextures 
endscript


script LoadTerrain 
    SetTerrainDefault
endscript


script load_level_anims 
endscript


script LoadCameras 
endscript


script LoadObjectAnims 
endscript

ncomp_LevelGeometry_1 = {
    class = levelgeometry
    createdatstart
    collisionmode = geometry
}
