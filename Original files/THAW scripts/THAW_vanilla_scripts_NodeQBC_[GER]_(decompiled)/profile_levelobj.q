bouncy_default_profile = {
    bouncy
    center_of_mass = (0.0, 0.0, 0.0)
    coeff_restitution = 0.4000
    coeff_friction = 0.5000
    skater_collision_impulse_factor = 1.0
    skater_collision_rotation_factor = 1.0
    skater_collision_assent = 25.0
    skater_collision_radius = 48.0
}
bouncy_barrier_profile = {
    bouncy
    center_of_mass = (0.0, 0.0, 0.0)
    coeff_restitution = 0.3000
    coeff_friction = 0.8500
    skater_collision_impulse_factor = 0.7000
    skater_collision_rotation_factor = 1.0
    skater_collision_assent = 5
    skater_collision_radius = 64
}
bouncy_barrier_small_profile = {
    bouncy
    center_of_mass = (0.0, 0.0, 0.0)
    coeff_restitution = 0.3000
    coeff_friction = 0.8500
    skater_collision_impulse_factor = 0.7000
    skater_collision_rotation_factor = 1.0
    skater_collision_assent = 5
    skater_collision_radius = 64
}
bouncy_bottle_profile = {
    bouncy
    center_of_mass = (0.0, 0.0, 0.0)
    coeff_restitution = 0.4000
    coeff_friction = 0.5000
    skater_collision_impulse_factor = 0.8000
    skater_collision_rotation_factor = 3.0
    skater_collision_assent = 25.0
    skater_collision_radius = 24
}
bouncy_cone_profile = {
    bouncy
    center_of_mass = (0.0, 0.0, 0.0)
    coeff_restitution = 0.4000
    coeff_friction = 0.5000
    skater_collision_impulse_factor = 0.7000
    skater_collision_rotation_factor = 2.500
    skater_collision_assent = 15
    skater_collision_radius = 28
}
bouncy_soccerball_profile = {
    bouncy
    center_of_mass = (0.0, 0.0, 0.0)
    coeff_restitution = 0.6000
    coeff_friction = 0.3000
    skater_collision_impulse_factor = 0.9000
    skater_collision_rotation_factor = 4.500
    skater_collision_assent = 30
    skater_collision_radius = 20
}
bouncy_trashCan_profile = {
    bouncy
    center_of_mass = (0.0, 0.0, 0.0)
    coeff_restitution = 0.4000
    coeff_friction = 0.4500
    skater_collision_impulse_factor = 0.6000
    skater_collision_rotation_factor = 0.5000
    skater_collision_assent = 10
    skater_collision_radius = 55
}
cardboard_box01 = {
    Model = 'Props\cardboard_box01\cardboard_box01.mdl'
    ShadowType = volume
    ShadowVolumeModels = [ 'models\Props\cardboard_box01\cardboard_box01_shadow.shd' ]
    collisionmode = geometry
    contacts = [
        (18.0, 36.43339920043945, -18.0)
        (18.0, 36.43339920043945, 18.0)
        (-18.0, 36.43339920043945, 18.0)
        (-18.0, 36.43339920043945, -18.0)
        (18.0, 0.4334309995174408, -18.0)
        (18.0, 0.4334309995174408, 18.0)
        (-18.0, 0.4334309995174408, 18.0)
        (-18.0, 0.4334309995174408, -18.0)
    ]
    center_of_mass = (0.0, 0.0, 0.0)
    coeff_restitution = 0.2000
    coeff_friction = 5
    skater_collision_impulse_factor = 0.5000
    skater_collision_rotation_factor = 0.4000
    skater_collision_assent = 8.0
    skater_collision_radius = 66
    SoundType = cardboard_box
}
metal_barrel01 = {
    Model = 'Props\metal_barrel01\metal_barrel01.mdl'
    ShadowType = volume
    ShadowVolumeModels = [ 'models\Props\metal_barrel01\metal_barrel01_Shadow.shd' ]
    collisionmode = geometry
    contacts = [
        (18.873199462890625, 0.5793470144271851, -0.5087249875068665)
        (13.769499778747559, 0.5793470144271851, -12.830100059509277)
        (0.9069390296936035, 0.5793470144271851, -18.475000381469727)
        (-12.179800033569336, 0.5793470144271851, -13.371299743652344)
        (-17.82469940185547, 0.5793470144271851, -0.5087220072746277)
        (-12.504199981689453, 0.5793470144271851, 12.90250015258789)
        (0.5242589712142944, 0.5793470144271851, 18.298999786376953)
        (13.552800178527832, 0.5793470144271851, 12.90250015258789)
        (18.873199462890625, 48.11240005493164, -0.5087270140647888)
        (13.769499778747559, 48.11240005493164, -12.830100059509277)
        (0.9069380164146423, 48.11240005493164, -18.475000381469727)
        (-12.179800033569336, 48.11240005493164, -13.371299743652344)
        (-17.82469940185547, 48.11240005493164, -0.5087270140647888)
        (-12.504199981689453, 48.11240005493164, 12.90250015258789)
        (0.5242589712142944, 48.11240005493164, 18.298999786376953)
        (13.552800178527832, 48.11240005493164, 12.90250015258789)
    ]
    center_of_mass = (0.0, 0.0, 0.0)
    coeff_restitution = 0.1000
    coeff_friction = 0.9000
    skater_collision_impulse_factor = 0.8000
    skater_collision_rotation_factor = 0.4000
    skater_collision_assent = 5
    skater_collision_radius = 66
    SoundType = Metal50GalDrum
}
flowerPot_DT_01 = {
    Model = 'Props\flowerPot_DT_01\flowerPot_DT_01.mdl'
    collisionmode = geometry
    contacts = [
        (9.138500213623047, 19.71540069580078, 6.9050397872924805)
        (-9.14072036743164, 19.71540069580078, 6.905029773712158)
        (-9.14070987701416, 19.71540069580078, -9.70680046081543)
        (9.138509750366211, 19.71540069580078, -9.70678997039795)
        (6.396629810333252, 0.47338399291038513, -7.215159893035889)
        (-6.398839950561523, 0.47338399291038513, -7.215169906616211)
        (-6.398839950561523, 0.47338399291038513, 4.41310977935791)
        (6.396629810333252, 0.47338399291038513, 4.413119792938232)
    ]
    center_of_mass = (0.0, 0.0, 0.0)
    coeff_restitution = 0.5000
    coeff_friction = 0.9000
    skater_collision_impulse_factor = 0.8000
    skater_collision_rotation_factor = 0.4000
    skater_collision_assent = 5
    skater_collision_radius = 55
    SoundType = Plant_Big
}
flowerPot_DT_02 = {
    Model = 'Props\flowerPot_DT_02\flowerPot_DT_02.mdl'
    collisionmode = geometry
    contacts = [
        (9.138500213623047, 19.71540069580078, 6.9050397872924805)
        (-9.14072036743164, 19.71540069580078, 6.905029773712158)
        (-9.14070987701416, 19.71540069580078, -9.70680046081543)
        (9.138509750366211, 19.71540069580078, -9.70678997039795)
        (6.396629810333252, 0.47338399291038513, -7.215159893035889)
        (-6.398839950561523, 0.47338399291038513, -7.215169906616211)
        (-6.398839950561523, 0.47338399291038513, 4.41310977935791)
        (6.396629810333252, 0.47338399291038513, 4.413119792938232)
    ]
    center_of_mass = (0.0, 0.0, 0.0)
    coeff_restitution = 0.5000
    coeff_friction = 0.9000
    skater_collision_impulse_factor = 0.8000
    skater_collision_rotation_factor = 0.4000
    skater_collision_assent = 22
    skater_collision_radius = 55
    SoundType = Plant_Big
}
flowerPot_DT_03 = {
    Model = 'Props\flowerPot_DT_03\flowerPot_DT_03.mdl'
    collisionmode = geometry
    contacts = [
        (9.138500213623047, 19.71540069580078, 6.9050397872924805)
        (-9.14072036743164, 19.71540069580078, 6.905029773712158)
        (-9.14070987701416, 19.71540069580078, -9.70680046081543)
        (9.138509750366211, 19.71540069580078, -9.70678997039795)
        (6.396629810333252, 0.47338399291038513, -7.215159893035889)
        (-6.398839950561523, 0.47338399291038513, -7.215169906616211)
        (-6.398839950561523, 0.47338399291038513, 4.41310977935791)
        (6.396629810333252, 0.47338399291038513, 4.413119792938232)
    ]
    center_of_mass = (0.0, 0.0, 0.0)
    coeff_restitution = 0.5000
    coeff_friction = 0.9000
    skater_collision_impulse_factor = 0.8000
    skater_collision_rotation_factor = 0.4000
    skater_collision_assent = 22
    skater_collision_radius = 66
    SoundType = Plant_Big
}
flowerPot_DT_04 = {
    Model = 'Props\flowerPot_DT_04\flowerPot_DT_04.mdl'
    collisionmode = geometry
    contacts = [
        (9.138500213623047, 19.71540069580078, 6.9050397872924805)
        (-9.14072036743164, 19.71540069580078, 6.905029773712158)
        (-9.14070987701416, 19.71540069580078, -9.70680046081543)
        (9.138509750366211, 19.71540069580078, -9.70678997039795)
        (6.396629810333252, 0.47338399291038513, -7.215159893035889)
        (-6.398839950561523, 0.47338399291038513, -7.215169906616211)
        (-6.398839950561523, 0.47338399291038513, 4.41310977935791)
        (6.396629810333252, 0.47338399291038513, 4.413119792938232)
    ]
    center_of_mass = (0.0, 0.0, 0.0)
    coeff_restitution = 0.5000
    coeff_friction = 0.8000
    skater_collision_impulse_factor = 0.5000
    skater_collision_rotation_factor = 0.4000
    skater_collision_assent = 22
    skater_collision_radius = 66
    BounceScript = dirthit01
    hitscript = dirthit01
    SoundType = Plant_Big
}
AC_Unit01 = {
    Model = 'Props\AC_unit01\AC_unit01.mdl'
    ShadowType = volume
    ShadowVolumeModels = [ 'models\Props\AC_unit01\AC_unit01_shadow.shd' ]
    collisionmode = geometry
    contacts = [
        (-22.680299758911133, 52.312599182128906, -23.5757999420166)
        (22.680299758911133, 52.312599182128906, 23.5757999420166)
        (22.680299758911133, 52.312599182128906, -23.5757999420166)
        (-22.680299758911133, 52.312599182128906, 23.5757999420166)
        (25.680299758911133, 1.790179967880249, 23.5757999420166)
        (25.680299758911133, 1.790179967880249, -23.5757999420166)
        (-22.680299758911133, 1.790179967880249, -26.5757999420166)
        (-25.680299758911133, 1.790179967880249, 23.5757999420166)
    ]
    center_of_mass = (0.0, 0.0, 0.0)
    coeff_restitution = 0.2000
    coeff_friction = 0.9000
    skater_collision_impulse_factor = 0.5000
    skater_collision_rotation_factor = 0.4000
    skater_collision_assent = 8.0
    skater_collision_radius = 66
    SoundType = Aircon
}
Plant_bh_01 = {
    Model = 'Props\plant_bh_01\plant_bh_01.mdl'
    collisionmode = geometry
    contacts = [
        (7.966829776763916, 29.444000244140625, 13.799599647521973)
        (7.154789924621582, 1.9899799823760986, 12.393199920654297)
        (13.896300315856934, 2.0901200771331787, 0.0989060029387474)
        (15.934100151062012, 29.444000244140625, 0.0)
        (7.966859817504883, 29.444000244140625, -13.799699783325195)
        (6.780819892883301, 2.0901200771331787, -12.317099571228027)
        (-7.52947998046875, 2.0901200771331787, -12.362899780273438)
        (-8.337019920349121, 29.544200897216797, -13.772000312805176)
        (-14.724300384521484, 2.0901200771331787, 0.00730718020349741)
        (-16.348400115966797, 29.544200897216797, 0.002109060063958168)
        (-7.144239902496338, 2.1135599613189697, 12.373499870300293)
        (-8.425350189208984, 29.544200897216797, 13.827199935913086)
        (3.4318199157714844, 68.00650024414062, -0.030580999329686165)
    ]
    center_of_mass = (1.0, 15.0, 0.0)
    coeff_restitution = 0.5000
    coeff_friction = 0.7000
    skater_collision_impulse_factor = 0.6000
    skater_collision_rotation_factor = 0.8000
    skater_collision_assent = 6.0
    skater_collision_radius = 44
    BounceScript = dirthit01
    SoundType = Plant_Big
}
plant_bh_02 = {
    Model = 'Props\plant_bh_02\plant_bh_02.mdl'
    collisionmode = geometry
    contacts = [
        (7.966829776763916, 29.444000244140625, 13.799599647521973)
        (7.154789924621582, 1.9899799823760986, 12.393199920654297)
        (13.896300315856934, 2.0901200771331787, 0.0989060029387474)
        (15.934100151062012, 29.444000244140625, 0.0)
        (7.966859817504883, 29.444000244140625, -13.799699783325195)
        (6.780819892883301, 2.0901200771331787, -12.317099571228027)
        (-7.52947998046875, 2.0901200771331787, -12.362899780273438)
        (-8.337019920349121, 29.544200897216797, -13.772000312805176)
        (-14.724300384521484, 2.0901200771331787, 0.00730718020349741)
        (-16.348400115966797, 29.544200897216797, 0.002109060063958168)
        (-7.144239902496338, 2.1135599613189697, 12.373499870300293)
        (-8.425350189208984, 29.544200897216797, 13.827199935913086)
        (3.4318199157714844, 40.006500244140625, -0.030580999329686165)
    ]
    center_of_mass = (1.0, 15.0, 0.0)
    coeff_restitution = 0.5000
    coeff_friction = 0.9000
    skater_collision_impulse_factor = 0.6000
    skater_collision_rotation_factor = 0.8000
    skater_collision_assent = 6.0
    skater_collision_radius = 44
    BounceScript = dirthit01
    SoundType = Plant_Big
}
Red_Pylon_01 = {
    Model = 'Props\Red_Pylon_01\Red_Pylon_01.mdl'
    ShadowType = volume
    ShadowVolumeModels = [ 'models\Props\Red_Pylon_01\Red_Pylon_01_shadow.shd' ]
    collisionmode = geometry
    contacts = [
        (-5.347970008850098, 1.9772499799728394, -9.26278018951416)
        (5.347970008850098, 1.9772499799728394, -9.26278018951416)
        (10.695899963378906, 1.9772499799728394, 0.00018265900143887848)
        (-10.695899963378906, 1.9772499799728394, 0.00018359400564804673)
        (-5.347970008850098, 1.9772499799728394, 9.263139724731445)
        (5.347970008850098, 1.9772499799728394, 9.263139724731445)
        (0.037477001547813416, 52.0, -0.025877799838781357)
    ]
    center_of_mass = (1.0, 6.0, 0.0)
    coeff_restitution = 0.5000
    coeff_friction = 0.8000
    skater_collision_impulse_factor = 0.6000
    skater_collision_rotation_factor = 0.8000
    skater_collision_assent = 6.0
    skater_collision_radius = 44
    SoundType = PlasticPileon
}
Chair_Iron_01 = {
    Model = 'Props\Chair_Iron_01\Chair_Iron_01.mdl'
    collisionmode = geometry
    contacts = [
        (-10.586799621582031, 26.055999755859375, 12.091899871826172)
        (12.253399848937988, 24.364500045776367, -11.127599716186523)
        (-10.767999649047852, 24.365299224853516, -10.992899894714355)
        (12.46500015258789, 26.055999755859375, 11.910499572753906)
        (11.664299964904785, 48.32400131225586, -18.0)
        (-10.203700065612793, 48.32509994506836, -18.0)
        (-10.001500129699707, 2.0464398860931396, 15.65880012512207)
        (13.050600051879883, 2.0464398860931396, 15.47760009765625)
        (12.812600135803223, 2.2455999851226807, -14.81719970703125)
        (-10.239399909973145, 2.2455999851226807, -14.63599967956543)
    ]
    center_of_mass = (0.0, 32.0, -10.0)
    coeff_restitution = 0.5000
    coeff_friction = 0.8000
    skater_collision_impulse_factor = 0.6000
    skater_collision_rotation_factor = 0.8000
    skater_collision_assent = 6.0
    skater_collision_radius = 44
    SoundType = Chair_Iron
}
Table_Iron_01 = {
    Model = 'Props\Table_Iron_01\Table_Iron_01.mdl'
    collisionmode = geometry
    contacts = [
        (-28.454599380493164, 38.183101654052734, -28.50779914855957)
        (28.460500717163086, 38.183101654052734, 28.432199478149414)
        (28.49020004272461, 38.183101654052734, -28.478700637817383)
        (-28.483600616455078, 38.183101654052734, 28.47920036315918)
        (-0.6496580243110657, 27.833099365234375, -17.521299362182617)
        (17.769899368286133, 27.83300018310547, 9.912969589233398)
        (-17.805299758911133, 27.83300018310547, 10.018899917602539)
        (17.770599365234375, 0.7756069898605347, 9.912969589233398)
        (-0.6498630046844482, 0.7756010293960571, -17.521799087524414)
        (-17.805400848388672, 0.7755669951438904, 10.019000053405762)
    ]
    center_of_mass = (0.0, 30.0, 0.0)
    coeff_restitution = 0.5000
    coeff_friction = 0.8000
    skater_collision_impulse_factor = 0.6000
    skater_collision_rotation_factor = 0.8000
    skater_collision_assent = 6.0
    skater_collision_radius = 44
    SoundType = Table_Iron
}
barricade_01 = {
    Model = 'Props\barricade_01\barricade_01.mdl'
    ShadowType = volume
    ShadowVolumeModels = [ 'models\Props\barricade_01\barricade_01_shadow.shd' ]
    collisionmode = geometry
    contacts = [
        (34.547000885009766, 3.476490020751953, -23.18899917602539)
        (2.981980085372925, 60.97999954223633, -23.344100952148438)
        (2.7817599773406982, 60.99599838256836, 23.32830047607422)
        (34.3468017578125, 3.492460012435913, 23.483299255371094)
        (-37.68769836425781, 3.365799903869629, 23.190900802612305)
        (-37.48740005493164, 3.3498198986053467, -23.48150062561035)
        (-6.5954999923706055, 60.97999954223633, -23.344100952148438)
        (-6.7925801277160645, 60.99599838256836, 23.32830047607422)
    ]
    center_of_mass = (0.0, 30.0, 0.0)
    coeff_restitution = 0.5000
    coeff_friction = 0.7000
    skater_collision_impulse_factor = 0.6000
    skater_collision_rotation_factor = 0.8000
    skater_collision_assent = 6.0
    skater_collision_radius = 55
    SoundType = Barricade
}
Plant_big_01 = {
    Model = 'Props\Plant_big_01\Plant_big_01.mdl'
    collisionmode = geometry
    contacts = [
        (0.0, 142.55499267578125, 0.0)
        (25.025699615478516, 117.4010009765625, -14.448599815368652)
        (25.025699615478516, 117.4010009765625, 14.448599815368652)
        (0.0, 117.4010009765625, 28.897199630737305)
        (-25.025699615478516, 117.4010009765625, 14.448599815368652)
        (-25.025699615478516, 117.4010009765625, -14.448599815368652)
        (0.0, 117.4010009765625, -28.897199630737305)
        (29.257099151611328, 80.0260009765625, -16.891599655151367)
        (29.257099151611328, 80.0260009765625, 16.891599655151367)
        (0.0, 80.0260009765625, 33.783199310302734)
        (-29.257200241088867, 80.0260009765625, 16.891599655151367)
        (-29.257099151611328, 80.0260009765625, -16.891599655151367)
        (0.0, 80.0260009765625, -33.783199310302734)
        (21.649599075317383, 1.4997999668121338, -12.49940013885498)
        (21.649599075317383, 1.4997999668121338, 12.49940013885498)
        (0.0, 1.4997999668121338, 24.99880027770996)
        (-21.649599075317383, 1.4997999668121338, 12.49940013885498)
        (-21.649599075317383, 1.4997999668121338, -12.49940013885498)
        (0.0, 1.4997999668121338, -24.99880027770996)
    ]
    center_of_mass = (0.0, 80.0, 0.0)
    coeff_restitution = 0.5000
    coeff_friction = 0.6000
    skater_collision_impulse_factor = 0.5000
    skater_collision_rotation_factor = 0.8000
    skater_collision_assent = 6.0
    skater_collision_radius = 66
    BounceScript = dirthit02
    SoundType = Plant_Big
}
grbg_pizza01 = {
    Model = 'Props\grbg_pizza01\grbg_pizza01.mdl'
    collisionmode = geometry
    contacts = [
        (-22.94420051574707, 8.001999855041504, 22.944499969482422)
        (22.94420051574707, 8.001999855041504, 22.944499969482422)
        (-22.94420051574707, 8.001999855041504, -22.943899154663086)
        (22.94420051574707, 8.001999855041504, -22.943899154663086)
        (-23.90019989013672, 0.0, 26.829500198364258)
        (23.90019989013672, 0.0, 26.829500198364258)
        (26.829200744628906, 0.0, -23.900400161743164)
        (-23.90019989013672, 0.0, -26.829299926757812)
    ]
    center_of_mass = (0.0, 2.0, 0.0)
    coeff_restitution = 0.5000
    coeff_friction = 0.6000
    skater_collision_impulse_factor = 0.5000
    skater_collision_rotation_factor = 0.8000
    skater_collision_assent = 6.0
    skater_collision_radius = 66
    SoundType = PizzaBox
}
grbg_paper_bag01 = {
    Model = 'Props\grbg_paper_bag01\grbg_paper_bag01.mdl'
    collisionmode = geometry
    contacts = [
        (0.0, -2.3220999240875244, 3.3266899585723877)
        (0.0, 8.752079963684082, 3.3266899585723877)
        (-12.458200454711914, -0.3481009900569916, 20.588300704956055)
        (12.458200454711914, -0.3481009900569916, 20.588300704956055)
        (12.923100471496582, -0.33167698979377747, -13.590700149536133)
        (-12.458200454711914, -0.3481009900569916, -13.9350004196167)
        (-14.949799537658691, 5.632080078125, 23.205400466918945)
        (14.949799537658691, 5.632080078125, 23.205400466918945)
        (14.949799537658691, 5.632080078125, -20.45400047302246)
        (-14.949799537658691, 5.632080078125, -20.45400047302246)
    ]
    center_of_mass = (0.0, 2.0, 0.0)
    coeff_restitution = 0.5000
    coeff_friction = 0.6000
    skater_collision_impulse_factor = 0.5000
    skater_collision_rotation_factor = 0.8000
    skater_collision_assent = 12.0
    skater_collision_radius = 66
}
grbg_plastic_bag01 = {
    Model = 'Props\grbg_plastic_bag01\grbg_plastic_bag01.mdl'
    collisionmode = geometry
    contacts = [
        (0.0, 2.3220999240875244, 3.3266899585723877)
        (-12.458200454711914, 0.0, 20.588300704956055)
        (12.458200454711914, 0.0, 20.588300704956055)
        (12.923100471496582, 0.0, -13.590700149536133)
        (-12.458200454711914, 0.0, -13.9350004196167)
    ]
    center_of_mass = (0.0, 2.0, 0.0)
    coeff_restitution = 0.5000
    coeff_friction = 0.4000
    skater_collision_impulse_factor = 0.5000
    skater_collision_rotation_factor = 0.8000
    skater_collision_assent = 25.0
    skater_collision_radius = 44
}
grbg_styro_meal01 = {
    Model = 'Props\grbg_styro_meal01\grbg_styro_meal01.mdl'
    collisionmode = geometry
    contacts = [
        (-8.236800193786621, -2.3701999187469482, 8.236800193786621)
        (8.236800193786621, -2.3701999187469482, 8.236800193786621)
        (-8.236800193786621, -2.3701999187469482, -8.236800193786621)
        (8.236800193786621, -2.3701999187469482, -8.236800193786621)
        (-8.236800193786621, 10.493800163269043, 8.236800193786621)
        (8.236800193786621, 10.493800163269043, 8.236800193786621)
        (-8.236800193786621, 10.493800163269043, -8.236800193786621)
        (8.236800193786621, 10.493800163269043, -8.236800193786621)
    ]
    center_of_mass = (0.0, 2.0, 0.0)
    coeff_restitution = 0.5000
    coeff_friction = 0.6000
    skater_collision_impulse_factor = 0.5000
    skater_collision_rotation_factor = 0.8000
    skater_collision_assent = 12.0
    skater_collision_radius = 44
}
grbg_chinese01 = {
    Model = 'Props\grbg_chinese01\grbg_chinese01.mdl'
    collisionmode = geometry
    contacts = [
        (-6.476439952850342, 17.791099548339844, 6.476650238037109)
        (6.476439952850342, 17.791099548339844, 6.476650238037109)
        (-6.476439952850342, 17.791099548339844, -6.476230144500732)
        (6.476439952850342, 17.791099548339844, -6.476230144500732)
        (-4.293099880218506, 0.10142199695110321, 6.854619979858398)
        (7.258019924163818, 0.180758997797966, -3.902679920196533)
    ]
    center_of_mass = (0.0, 2.0, 0.0)
    coeff_restitution = 0.5000
    coeff_friction = 0.6000
    skater_collision_impulse_factor = 0.5000
    skater_collision_rotation_factor = 0.8000
    skater_collision_assent = 12.0
    skater_collision_radius = 44
}
grbg_40oz01 = {
    Model = 'Props\grbg_40oz01\grbg_40oz01.mdl'
    collisionmode = geometry
    contacts = [
        (-1.0863900184631348, 26.752899169921875, -0.627232015132904)
        (2.195310115814209, 14.910599708557129, -3.8023900985717773)
        (-3.8023900985717773, 14.910599708557129, -2.195310115814209)
        (-2.195310115814209, 14.910599708557129, 3.8023900985717773)
        (-2.195310115814209, 0.8028079867362976, 3.8023900985717773)
        (-1.4055999517440796, 0.06830599904060364, -0.918349027633667)
        (2.195310115814209, 0.8028069734573364, -3.8023900985717773)
        (3.8023900985717773, 14.910599708557129, 2.195310115814209)
        (3.8023900985717773, 0.8028069734573364, 2.195310115814209)
    ]
    center_of_mass = (0.0, 12.0, 0.0)
    coeff_restitution = 0.5000
    coeff_friction = 0.6000
    skater_collision_impulse_factor = 0.6000
    skater_collision_rotation_factor = 0.8000
    skater_collision_assent = 22.0
    skater_collision_radius = 44
    SoundType = BeerBottle
}
chair_plastic01 = {
    Model = 'Props\chair_plastic01\chair_plastic01.mdl'
    collisionmode = geometry
    contacts = [
        (-13.566499710083008, 49.60430145263672, -13.90149974822998)
        (-0.00376725010573864, 50.432498931884766, -17.302799224853516)
        (13.559200286865234, 49.60430145263672, -13.90149974822998)
        (14.82979965209961, 37.64929962158203, 10.188199996948242)
        (14.812399864196777, 0.9942520260810852, 13.389800071716309)
        (-14.819700241088867, 0.9942520260810852, 13.389800071716309)
        (-14.829899787902832, 37.64929962158203, 10.188199996948242)
        (-0.11616100370883942, 23.67770004272461, 17.30299949645996)
        (-13.361599922180176, 0.9942520260810852, -13.99269962310791)
        (13.354299545288086, 0.9942520260810852, -13.99269962310791)
    ]
    center_of_mass = (0.0, 33.0, -12.0)
    coeff_restitution = 0.5000
    coeff_friction = 0.6000
    skater_collision_impulse_factor = 0.6000
    skater_collision_rotation_factor = 0.8000
    skater_collision_assent = 12.0
    skater_collision_radius = 44
    SoundType = BA_PlasticMetalChair
}
tire01 = {
    Model = 'Props\tire01\tire01.mdl'
    collisionmode = geometry
    contacts = [
        (0.2402379959821701, 13.304400444030762, 24.84149932861328)
        (-21.320499420166016, 13.304400444030762, 12.393400192260742)
        (-21.320499420166016, 13.304400444030762, -12.502799987792969)
        (0.24023300409317017, 13.304400444030762, -24.950899124145508)
        (21.801000595092773, 13.304400444030762, -12.502799987792969)
        (21.801000595092773, 13.304400444030762, 12.393400192260742)
        (12.688300132751465, 1.1253600120544434, 21.506000518798828)
        (25.13640022277832, 1.1253600120544434, -0.0546875)
        (12.688300132751465, 1.1253600120544434, -21.615400314331055)
        (-12.207900047302246, 1.1253600120544434, -21.615400314331055)
        (-24.6560001373291, 1.1253600120544434, -0.05468529835343361)
        (-12.207900047302246, 1.1253600120544434, 21.506000518798828)
    ]
    center_of_mass = (0.0, 5.0, 0.0)
    coeff_restitution = 0.5000
    coeff_friction = 0.6000
    skater_collision_impulse_factor = 0.5000
    skater_collision_rotation_factor = 0.8000
    skater_collision_assent = 25
    skater_collision_radius = 44
    SoundType = tire
}
umbrella_G_01 = {
    Model = 'Props\umbrella_G_01\umbrella_G_01.mdl'
    collisionmode = geometry
    contacts = [
        (0.0, 153.06300354003906, 0.0)
        (0.0, 118.23899841308594, -77.41889953613281)
        (-67.04669952392578, 118.23899841308594, -38.70940017700195)
        (-67.04669952392578, 118.23899841308594, 38.70949935913086)
        (0.0, 118.23899841308594, 77.41889953613281)
        (67.04669952392578, 118.23899841308594, 38.70940017700195)
        (67.04669952392578, 118.23899841308594, -38.70949935913086)
        (31.773300170898438, 3.1669299602508545, -1.636680006980896)
        (0.6902689933776855, 3.1669299602508545, -32.939701080322266)
        (-30.3927001953125, 3.1669299602508545, -1.636680006980896)
        (0.6902620196342468, 3.1669299602508545, 29.66629981994629)
    ]
    center_of_mass = (0.0, 33.0, 0.0)
    coeff_restitution = 0.3000
    coeff_friction = 0.7000
    skater_collision_impulse_factor = 0.6000
    skater_collision_rotation_factor = 0.5000
    skater_collision_assent = 11
    skater_collision_radius = 44
    SoundType = NO_Umbrella
}
Table_little01 = {
    Model = 'Props\Table_little01\Table_little01.mdl'
    collisionmode = geometry
    contacts = [
        (29.700000762939453, 40.0, 29.700000762939453)
        (29.700000762939453, 40.0, -29.700000762939453)
        (-29.700000762939453, 40.0, 29.700000762939453)
        (-29.700000762939453, 40.0, -29.700000762939453)
        (17.141599655151367, 3.6080501079559326, 16.661699295043945)
        (-17.141599655151367, 3.6080501079559326, 16.661300659179688)
        (-17.141599655151367, 3.6080501079559326, -16.661699295043945)
        (17.141599655151367, 3.6080501079559326, -16.661699295043945)
    ]
    center_of_mass = (0.0, 33.0, 0.0)
    coeff_restitution = 0.3000
    coeff_friction = 0.7000
    skater_collision_impulse_factor = 0.6000
    skater_collision_rotation_factor = 0.5000
    skater_collision_assent = 11
    skater_collision_radius = 44
    SoundType = Bouncy_Wooden_Tables
}
