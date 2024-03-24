
defaultmovingobjectsuspenddistance = 80
X_AXIS = 1
Y_AXIS = 2
Z_AXIS = 4
XY_AXIS = 3
XZ_AXIS = 5
YZ_AXIS = 6
BOUNCEOBJ_REST_TOP_OR_BOTTOM = 1
BOUNCEOBJ_REST_ANY_SIDE = 2
BOUNCEOBJ_REST_TRAFFIC_CONE = 3
GameObjExceptions = 
[
    SkaterLanded
    SkaterBailed
    objectinradius
    objectoutofradius
    anyobjectinradius
]
CarExceptions = 
[
    objectinradius
    objectoutofradius
]
BouncyObjExceptions = 
[
    objectinradius
    objectoutofradius
    Bounce
    DoneBouncing
]

script Obj_CycleAnim numCycles = 1
    begin 
    Obj_PlayAnim <...> 
    Obj_WaitAnimFinished
    repeat <numCycles>
endscript


script GetGap 
    StartGap GapID = GetGap_DefaultID flags = <flags> TrickText = <TrickText> TrickScript = <TrickScript>
    endgap GapID = GetGap_DefaultID Score = <Score> text = <text> gapscript = <gapscript>
endscript


script EmptyScript 
endscript

