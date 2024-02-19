// ----------------------------------------------
//
//  CONSTANTS
//      Constants.
//
// ----------------------------------------------

module.exports = {
    MESHFLAG_UNKG:                  1 << 31,
    MESHFLAG_UNKH:                  1 << 30,
    MESHFLAG_UNKI:                  1 << 29,
    MESHFLAG_UNKJ:                  1 << 28,
    MESHFLAG_LIGHTMAPPED:           1 << 27,
    MESHFLAG_LIGHTMAPPED_COMPR:     1 << 26,
    MESHFLAG_ALTLIGHTMAP:           1 << 25,
    MESHFLAG_ALTLIGHTMAP_COMPR:     1 << 24,

    MESHFLAG_4UVSET:                1 << 23,
    MESHFLAG_4UVSET_COMPR:          1 << 22,
    MESHFLAG_3UVSET:                1 << 21,
    MESHFLAG_3UVSET_COMPR:          1 << 20,
    MESHFLAG_2UVSET:                1 << 19,
    MESHFLAG_2UVSET_COMPR:          1 << 18,
    MESHFLAG_1UVSET:                1 << 17,
    MESHFLAG_1UVSET_COMPR:          1 << 16,

    MESHFLAG_UNKB:                  1 << 15,
    MESHFLAG_POSTCOLORUNK:          1 << 14,
    MESHFLAG_UNKD:                  1 << 13,
    MESHFLAG_BILLBOARDPIVOT:        1 << 12,      // Contains billboard pivot
    MESHFLAG_2TANGENT:              1 << 11,      // Contains double tangent
    MESHFLAG_1TANGENT:              1 << 10,      // Contains single tangent
    MESHFLAG_UNK9:                  1 << 9,
    MESHFLAG_PRECOLORUNK:           1 << 8,       // Single value before colors... what?

    MESHFLAG_HASWEIGHTS:            1 << 7,
    MESHFLAG_Q:                     1 << 6,
    MESHFLAG_R:                     1 << 5,
    MESHFLAG_HASVERTEXCOLORS:       1 << 4,
    MESHFLAG_S:                     1 << 3,
    MESHFLAG_T:                     1 << 2,
    MESHFLAG_U:                     1 << 1,
    MESHFLAG_NEVERUSED:             1,
    
    MESHFLAG_THAW_VERTEXCOLOR:      1 << 1,
    MESHFLAG_THAW_VERTEXNORMALS:    1 << 4,
    
    MATFLAG_UV_WIBBLE:                            (1 << 0),
    MATFLAG_VC_WIBBLE:                            (1 << 1),
    MATFLAG_TEXTURED:                             (1 << 2),
    MATFLAG_ENVIRONMENT:                          (1 << 3),
    MATFLAG_DECAL:                                (1 << 4),
    MATFLAG_SMOOTH:                               (1 << 5),
    MATFLAG_TRANSPARENT:                          (1 << 6),
    MATFLAG_PASS_COLOR_LOCKED:                    (1 << 7),
    MATFLAG_SPECULAR:                             (1 << 8),
    MATFLAG_BUMP_SIGNED_TEXTURE:                  (1 << 9),
    MATFLAG_BUMP_LOAD_MATRIX:                     (1 << 10),
    MATFLAG_PASS_TEXTURE_ANIMATES:                (1 << 11),
    MATFLAG_PASS_IGNORE_VERTEX_ALPHA:             (1 << 12),
    MATFLAG_EXPLICIT_UV_WIBBLE:                   (1 << 14),
    MATFLAG_WATER_EFFECT:                         (1 << 27),
    MATFLAG_NO_MAT_COL_MOD:                       (1 << 28),
    
    SECFLAGS_HAS_TEXCOORDS:                      (1 << 0),
    SECFLAGS_HAS_VERTEX_COLORS:                  (1 << 1),
    SECFLAGS_HAS_VERTEX_NORMALS:                 (1 << 2),
    SECFLAGS_HAS_VERTEX_WEIGHTS:                 (1 << 4),
    SECFLAGS_HAS_VERTEX_COLOR_WIBBLES:           (1 << 11),
    SECFLAGS_BILLBOARD_PRESENT:                  0x00800000,
    SECFLAGS_UNK:                                0x00000040,
    
    FACETYPE_TRIANGLES:             4,
    FACETYPE_TRISTRIP:              6,
    FACETYPE_QUADS:                 13,
    
    Reader: require('./Reader.js'),
    Writer: require('./Writer.js')
};
