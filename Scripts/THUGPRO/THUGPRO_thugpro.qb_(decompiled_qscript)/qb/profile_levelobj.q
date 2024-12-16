
bouncy_default_profile = { 
	bouncy 
	center_of_mass = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	coeff_restitution = 0.40000000596 
	coeff_friction = 0.50000000000 
	skater_collision_impulse_factor = 1.00000000000 
	skater_collision_rotation_factor = 1.00000000000 
	skater_collision_assent = 25.00000000000 
	skater_collision_radius = 48.00000000000 
} 
bouncy_barrier_profile = { 
	bouncy 
	center_of_mass = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	coeff_restitution = 0.30000001192 
	coeff_friction = 0.85000002384 
	skater_collision_impulse_factor = 0.69999998808 
	skater_collision_rotation_factor = 1.00000000000 
	skater_collision_assent = 5 
	skater_collision_radius = 64 
} 
bouncy_barrier_small_profile = { 
	bouncy 
	center_of_mass = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	coeff_restitution = 0.30000001192 
	coeff_friction = 0.85000002384 
	skater_collision_impulse_factor = 0.69999998808 
	skater_collision_rotation_factor = 1.00000000000 
	skater_collision_assent = 5 
	skater_collision_radius = 64 
} 
bouncy_bottle_profile = { 
	bouncy 
	center_of_mass = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	coeff_restitution = 0.40000000596 
	coeff_friction = 0.50000000000 
	skater_collision_impulse_factor = 0.80000001192 
	skater_collision_rotation_factor = 3.00000000000 
	skater_collision_assent = 25.00000000000 
	skater_collision_radius = 24 
} 
bouncy_cone_profile = { 
	bouncy 
	center_of_mass = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	coeff_restitution = 0.40000000596 
	coeff_friction = 0.50000000000 
	skater_collision_impulse_factor = 0.69999998808 
	skater_collision_rotation_factor = 2.50000000000 
	skater_collision_assent = 15 
	skater_collision_radius = 28 
} 
bouncy_soccerball_profile = { 
	bouncy 
	center_of_mass = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	coeff_restitution = 0.60000002384 
	coeff_friction = 0.30000001192 
	skater_collision_impulse_factor = 0.89999997616 
	skater_collision_rotation_factor = 4.50000000000 
	skater_collision_assent = 30 
	skater_collision_radius = 20 
} 
bouncy_trashCan_profile = { 
	bouncy 
	center_of_mass = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	coeff_restitution = 0.40000000596 
	coeff_friction = 0.44999998808 
	skater_collision_impulse_factor = 0.60000002384 
	skater_collision_rotation_factor = 0.50000000000 
	skater_collision_assent = 10 
	skater_collision_radius = 55 
} 
cardboard_box01 = { 
	model = "Props\\cardboard_box01\\cardboard_box01.mdl" 
	CollisionMode = Geometry 
	contacts = [ 
		VECTOR(18.00000000000, 36.43339920044, -18.00000000000) 
		VECTOR(18.00000000000, 36.43339920044, 18.00000000000) 
		VECTOR(-18.00000000000, 36.43339920044, 18.00000000000) 
		VECTOR(-18.00000000000, 36.43339920044, -18.00000000000) 
		VECTOR(18.00000000000, 0.43343099952, -18.00000000000) 
		VECTOR(18.00000000000, 0.43343099952, 18.00000000000) 
		VECTOR(-18.00000000000, 0.43343099952, 18.00000000000) 
		VECTOR(-18.00000000000, 0.43343099952, -18.00000000000) 
	] 
	center_of_mass = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	coeff_restitution = 0.20000000298 
	coeff_friction = 5 
	skater_collision_impulse_factor = 0.50000000000 
	skater_collision_rotation_factor = 0.40000000596 
	skater_collision_assent = 8.00000000000 
	skater_collision_radius = 66 
	SoundType = CardboardBox 
} 
metal_barrel01 = { 
	model = "Props\\metal_barrel01\\metal_barrel01.mdl" 
	CollisionMode = Geometry 
	contacts = [ 
		VECTOR(18.87319946289, 0.57934701443, -0.50872498751) 
		VECTOR(13.76949977875, 0.57934701443, -12.83010005951) 
		VECTOR(0.90693902969, 0.57934701443, -18.47500038147) 
		VECTOR(-12.17980003357, 0.57934701443, -13.37129974365) 
		VECTOR(-17.82469940186, 0.57934701443, -0.50872200727) 
		VECTOR(-12.50419998169, 0.57934701443, 12.90250015259) 
		VECTOR(0.52425897121, 0.57934701443, 18.29899978638) 
		VECTOR(13.55280017853, 0.57934701443, 12.90250015259) 
		VECTOR(18.87319946289, 48.11240005493, -0.50872701406) 
		VECTOR(13.76949977875, 48.11240005493, -12.83010005951) 
		VECTOR(0.90693801641, 48.11240005493, -18.47500038147) 
		VECTOR(-12.17980003357, 48.11240005493, -13.37129974365) 
		VECTOR(-17.82469940186, 48.11240005493, -0.50872701406) 
		VECTOR(-12.50419998169, 48.11240005493, 12.90250015259) 
		VECTOR(0.52425897121, 48.11240005493, 18.29899978638) 
		VECTOR(13.55280017853, 48.11240005493, 12.90250015259) 
	] 
	center_of_mass = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	coeff_restitution = 0.10000000149 
	coeff_friction = 0.89999997616 
	skater_collision_impulse_factor = 0.80000001192 
	skater_collision_rotation_factor = 0.40000000596 
	skater_collision_assent = 5 
	skater_collision_radius = 66 
	SoundType = Metal50GalDrum 
} 
flowerPot_DT_01 = { 
	model = "Props\\flowerPot_DT_01\\flowerPot_DT_01.mdl" 
	CollisionMode = Geometry 
	contacts = [ 
		VECTOR(9.13850021362, 19.71540069580, 6.90503978729) 
		VECTOR(-9.14072036743, 19.71540069580, 6.90502977371) 
		VECTOR(-9.14070987701, 19.71540069580, -9.70680046082) 
		VECTOR(9.13850975037, 19.71540069580, -9.70678997040) 
		VECTOR(6.39662981033, 0.47338399291, -7.21515989304) 
		VECTOR(-6.39883995056, 0.47338399291, -7.21516990662) 
		VECTOR(-6.39883995056, 0.47338399291, 4.41310977936) 
		VECTOR(6.39662981033, 0.47338399291, 4.41311979294) 
	] 
	center_of_mass = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	coeff_restitution = 0.50000000000 
	coeff_friction = 0.89999997616 
	skater_collision_impulse_factor = 0.80000001192 
	skater_collision_rotation_factor = 0.40000000596 
	skater_collision_assent = 5 
	skater_collision_radius = 55 
	SoundType = BE_LargePlanter 
} 
flowerPot_DT_02 = { 
	model = "Props\\flowerPot_DT_02\\flowerPot_DT_02.mdl" 
	CollisionMode = Geometry 
	contacts = [ 
		VECTOR(9.13850021362, 19.71540069580, 6.90503978729) 
		VECTOR(-9.14072036743, 19.71540069580, 6.90502977371) 
		VECTOR(-9.14070987701, 19.71540069580, -9.70680046082) 
		VECTOR(9.13850975037, 19.71540069580, -9.70678997040) 
		VECTOR(6.39662981033, 0.47338399291, -7.21515989304) 
		VECTOR(-6.39883995056, 0.47338399291, -7.21516990662) 
		VECTOR(-6.39883995056, 0.47338399291, 4.41310977936) 
		VECTOR(6.39662981033, 0.47338399291, 4.41311979294) 
	] 
	center_of_mass = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	coeff_restitution = 0.50000000000 
	coeff_friction = 0.89999997616 
	skater_collision_impulse_factor = 0.80000001192 
	skater_collision_rotation_factor = 0.40000000596 
	skater_collision_assent = 22 
	skater_collision_radius = 55 
	SoundType = BE_LargePlanter 
} 
flowerPot_DT_03 = { 
	model = "Props\\flowerPot_DT_03\\flowerPot_DT_03.mdl" 
	CollisionMode = Geometry 
	contacts = [ 
		VECTOR(9.13850021362, 19.71540069580, 6.90503978729) 
		VECTOR(-9.14072036743, 19.71540069580, 6.90502977371) 
		VECTOR(-9.14070987701, 19.71540069580, -9.70680046082) 
		VECTOR(9.13850975037, 19.71540069580, -9.70678997040) 
		VECTOR(6.39662981033, 0.47338399291, -7.21515989304) 
		VECTOR(-6.39883995056, 0.47338399291, -7.21516990662) 
		VECTOR(-6.39883995056, 0.47338399291, 4.41310977936) 
		VECTOR(6.39662981033, 0.47338399291, 4.41311979294) 
	] 
	center_of_mass = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	coeff_restitution = 0.50000000000 
	coeff_friction = 0.89999997616 
	skater_collision_impulse_factor = 0.80000001192 
	skater_collision_rotation_factor = 0.40000000596 
	skater_collision_assent = 22 
	skater_collision_radius = 66 
	SoundType = BE_LargePlanter 
} 
flowerPot_DT_04 = { 
	model = "Props\\flowerPot_DT_04\\flowerPot_DT_04.mdl" 
	CollisionMode = Geometry 
	contacts = [ 
		VECTOR(9.13850021362, 19.71540069580, 6.90503978729) 
		VECTOR(-9.14072036743, 19.71540069580, 6.90502977371) 
		VECTOR(-9.14070987701, 19.71540069580, -9.70680046082) 
		VECTOR(9.13850975037, 19.71540069580, -9.70678997040) 
		VECTOR(6.39662981033, 0.47338399291, -7.21515989304) 
		VECTOR(-6.39883995056, 0.47338399291, -7.21516990662) 
		VECTOR(-6.39883995056, 0.47338399291, 4.41310977936) 
		VECTOR(6.39662981033, 0.47338399291, 4.41311979294) 
	] 
	center_of_mass = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	coeff_restitution = 0.50000000000 
	coeff_friction = 0.80000001192 
	skater_collision_impulse_factor = 0.50000000000 
	skater_collision_rotation_factor = 0.40000000596 
	skater_collision_assent = 22 
	skater_collision_radius = 66 
	BounceScript = dirthit01 
	HitScript = dirthit01 
	SoundType = BE_LargePlanter 
} 
AC_Unit01 = { 
	model = "Props\\AC_unit01\\AC_unit01.mdl" 
	CollisionMode = Geometry 
	contacts = [ 
		VECTOR(-22.68029975891, 52.31259918213, -23.57579994202) 
		VECTOR(22.68029975891, 52.31259918213, 23.57579994202) 
		VECTOR(22.68029975891, 52.31259918213, -23.57579994202) 
		VECTOR(-22.68029975891, 52.31259918213, 23.57579994202) 
		VECTOR(25.68029975891, 1.79017996788, 23.57579994202) 
		VECTOR(25.68029975891, 1.79017996788, -23.57579994202) 
		VECTOR(-22.68029975891, 1.79017996788, -26.57579994202) 
		VECTOR(-25.68029975891, 1.79017996788, 23.57579994202) 
	] 
	center_of_mass = VECTOR(0.00000000000, 0.00000000000, 0.00000000000) 
	coeff_restitution = 0.20000000298 
	coeff_friction = 0.89999997616 
	skater_collision_impulse_factor = 0.50000000000 
	skater_collision_rotation_factor = 0.40000000596 
	skater_collision_assent = 8.00000000000 
	skater_collision_radius = 66 
	SoundType = BE_LargeACUnits 
} 
Plant_bh_01 = { 
	model = "Props\\plant_bh_01\\plant_bh_01.mdl" 
	CollisionMode = Geometry 
	contacts = [ 
		VECTOR(7.96682977676, 29.44400024414, 13.79959964752) 
		VECTOR(7.15478992462, 1.98997998238, 12.39319992065) 
		VECTOR(13.89630031586, 2.09012007713, 0.09890600294) 
		VECTOR(15.93410015106, 29.44400024414, 0.00000000000) 
		VECTOR(7.96685981750, 29.44400024414, -13.79969978333) 
		VECTOR(6.78081989288, 2.09012007713, -12.31709957123) 
		VECTOR(-7.52947998047, 2.09012007713, -12.36289978027) 
		VECTOR(-8.33701992035, 29.54420089722, -13.77200031281) 
		VECTOR(-14.72430038452, 2.09012007713, 0.00730699999) 
		VECTOR(-16.34840011597, 29.54420089722, 0.00210899999) 
		VECTOR(-7.14423990250, 2.11355996132, 12.37349987030) 
		VECTOR(-8.42535018921, 29.54420089722, 13.82719993591) 
		VECTOR(3.43181991577, 68.00650024414, -0.03058099933) 
	] 
	center_of_mass = VECTOR(1.00000000000, 15.00000000000, 0.00000000000) 
	coeff_restitution = 0.50000000000 
	coeff_friction = 0.69999998808 
	skater_collision_impulse_factor = 0.60000002384 
	skater_collision_rotation_factor = 0.80000001192 
	skater_collision_assent = 6.00000000000 
	skater_collision_radius = 44 
	BounceScript = dirthit01 
	SoundType = BE_LargePlanter 
} 
plant_bh_02 = { 
	model = "Props\\plant_bh_02\\plant_bh_02.mdl" 
	CollisionMode = Geometry 
	contacts = [ 
		VECTOR(7.96682977676, 29.44400024414, 13.79959964752) 
		VECTOR(7.15478992462, 1.98997998238, 12.39319992065) 
		VECTOR(13.89630031586, 2.09012007713, 0.09890600294) 
		VECTOR(15.93410015106, 29.44400024414, 0.00000000000) 
		VECTOR(7.96685981750, 29.44400024414, -13.79969978333) 
		VECTOR(6.78081989288, 2.09012007713, -12.31709957123) 
		VECTOR(-7.52947998047, 2.09012007713, -12.36289978027) 
		VECTOR(-8.33701992035, 29.54420089722, -13.77200031281) 
		VECTOR(-14.72430038452, 2.09012007713, 0.00730699999) 
		VECTOR(-16.34840011597, 29.54420089722, 0.00210899999) 
		VECTOR(-7.14423990250, 2.11355996132, 12.37349987030) 
		VECTOR(-8.42535018921, 29.54420089722, 13.82719993591) 
		VECTOR(3.43181991577, 40.00650024414, -0.03058099933) 
	] 
	center_of_mass = VECTOR(1.00000000000, 15.00000000000, 0.00000000000) 
	coeff_restitution = 0.50000000000 
	coeff_friction = 0.89999997616 
	skater_collision_impulse_factor = 0.60000002384 
	skater_collision_rotation_factor = 0.80000001192 
	skater_collision_assent = 6.00000000000 
	skater_collision_radius = 44 
	BounceScript = dirthit01 
	SoundType = BE_LargePlanter 
} 
Red_Pylon_01 = { 
	model = "Props\\Red_Pylon_01\\Red_Pylon_01.mdl" 
	CollisionMode = Geometry 
	contacts = [ 
		VECTOR(-5.34797000885, 1.97724997997, -9.26278018951) 
		VECTOR(5.34797000885, 1.97724997997, -9.26278018951) 
		VECTOR(10.69589996338, 1.97724997997, 0.00018300000) 
		VECTOR(-10.69589996338, 1.97724997997, 0.00018400000) 
		VECTOR(-5.34797000885, 1.97724997997, 9.26313972473) 
		VECTOR(5.34797000885, 1.97724997997, 9.26313972473) 
		VECTOR(0.03747700155, 52.00000000000, -0.02587799914) 
	] 
	center_of_mass = VECTOR(1.00000000000, 6.00000000000, 0.00000000000) 
	coeff_restitution = 0.50000000000 
	coeff_friction = 0.80000001192 
	skater_collision_impulse_factor = 0.60000002384 
	skater_collision_rotation_factor = 0.80000001192 
	skater_collision_assent = 6.00000000000 
	skater_collision_radius = 44 
	SoundType = PlasticTrashCan 
} 
Chair_Iron_01 = { 
	model = "Props\\Chair_Iron_01\\Chair_Iron_01.mdl" 
	CollisionMode = Geometry 
	contacts = [ 
		VECTOR(-10.58679962158, 26.05599975586, 12.09189987183) 
		VECTOR(12.25339984894, 24.36450004578, -11.12759971619) 
		VECTOR(-10.76799964905, 24.36529922485, -10.99289989471) 
		VECTOR(12.46500015259, 26.05599975586, 11.91049957275) 
		VECTOR(11.66429996490, 48.32400131226, -18.00000000000) 
		VECTOR(-10.20370006561, 48.32509994507, -18.00000000000) 
		VECTOR(-10.00150012970, 2.04643988609, 15.65880012512) 
		VECTOR(13.05060005188, 2.04643988609, 15.47760009766) 
		VECTOR(12.81260013580, 2.24559998512, -14.81719970703) 
		VECTOR(-10.23939990997, 2.24559998512, -14.63599967957) 
	] 
	center_of_mass = VECTOR(0.00000000000, 32.00000000000, -10.00000000000) 
	coeff_restitution = 0.50000000000 
	coeff_friction = 0.80000001192 
	skater_collision_impulse_factor = 0.60000002384 
	skater_collision_rotation_factor = 0.80000001192 
	skater_collision_assent = 6.00000000000 
	skater_collision_radius = 44 
	SoundType = MetalChair 
} 
Table_Iron_01 = { 
	model = "Props\\Table_Iron_01\\Table_Iron_01.mdl" 
	CollisionMode = Geometry 
	contacts = [ 
		VECTOR(-28.45459938049, 38.18310165405, -28.50779914856) 
		VECTOR(28.46050071716, 38.18310165405, 28.43219947815) 
		VECTOR(28.49020004272, 38.18310165405, -28.47870063782) 
		VECTOR(-28.48360061646, 38.18310165405, 28.47920036316) 
		VECTOR(-0.64965802431, 27.83309936523, -17.52129936218) 
		VECTOR(17.76989936829, 27.83300018311, 9.91296958923) 
		VECTOR(-17.80529975891, 27.83300018311, 10.01889991760) 
		VECTOR(17.77059936523, 0.77560698986, 9.91296958923) 
		VECTOR(-0.64986300468, 0.77560102940, -17.52179908752) 
		VECTOR(-17.80540084839, 0.77556699514, 10.01900005341) 
	] 
	center_of_mass = VECTOR(0.00000000000, 30.00000000000, 0.00000000000) 
	coeff_restitution = 0.50000000000 
	coeff_friction = 0.80000001192 
	skater_collision_impulse_factor = 0.60000002384 
	skater_collision_rotation_factor = 0.80000001192 
	skater_collision_assent = 6.00000000000 
	skater_collision_radius = 44 
	SoundType = HI_Table 
} 
barricade_01 = { 
	model = "Props\\barricade_01\\barricade_01.mdl" 
	CollisionMode = Geometry 
	contacts = [ 
		VECTOR(34.54700088501, 3.47649002075, -23.18899917603) 
		VECTOR(2.98198008537, 60.97999954224, -23.34410095215) 
		VECTOR(2.78175997734, 60.99599838257, 23.32830047607) 
		VECTOR(34.34680175781, 3.49246001244, 23.48329925537) 
		VECTOR(-37.68769836426, 3.36579990387, 23.19090080261) 
		VECTOR(-37.48740005493, 3.34981989861, -23.48150062561) 
		VECTOR(-6.59549999237, 60.97999954224, -23.34410095215) 
		VECTOR(-6.79258012772, 60.99599838257, 23.32830047607) 
	] 
	center_of_mass = VECTOR(0.00000000000, 30.00000000000, 0.00000000000) 
	coeff_restitution = 0.50000000000 
	coeff_friction = 0.69999998808 
	skater_collision_impulse_factor = 0.60000002384 
	skater_collision_rotation_factor = 0.80000001192 
	skater_collision_assent = 6.00000000000 
	skater_collision_radius = 55 
	SoundType = MetalTrashCan 
} 
Plant_big_01 = { 
	model = "Props\\Plant_big_01\\Plant_big_01.mdl" 
	CollisionMode = Geometry 
	contacts = [ 
		VECTOR(0.00000000000, 142.55499267578, 0.00000000000) 
		VECTOR(25.02569961548, 117.40100097656, -14.44859981537) 
		VECTOR(25.02569961548, 117.40100097656, 14.44859981537) 
		VECTOR(0.00000000000, 117.40100097656, 28.89719963074) 
		VECTOR(-25.02569961548, 117.40100097656, 14.44859981537) 
		VECTOR(-25.02569961548, 117.40100097656, -14.44859981537) 
		VECTOR(0.00000000000, 117.40100097656, -28.89719963074) 
		VECTOR(29.25709915161, 80.02600097656, -16.89159965515) 
		VECTOR(29.25709915161, 80.02600097656, 16.89159965515) 
		VECTOR(0.00000000000, 80.02600097656, 33.78319931030) 
		VECTOR(-29.25720024109, 80.02600097656, 16.89159965515) 
		VECTOR(-29.25709915161, 80.02600097656, -16.89159965515) 
		VECTOR(0.00000000000, 80.02600097656, -33.78319931030) 
		VECTOR(21.64959907532, 1.49979996681, -12.49940013885) 
		VECTOR(21.64959907532, 1.49979996681, 12.49940013885) 
		VECTOR(0.00000000000, 1.49979996681, 24.99880027771) 
		VECTOR(-21.64959907532, 1.49979996681, 12.49940013885) 
		VECTOR(-21.64959907532, 1.49979996681, -12.49940013885) 
		VECTOR(0.00000000000, 1.49979996681, -24.99880027771) 
	] 
	center_of_mass = VECTOR(0.00000000000, 80.00000000000, 0.00000000000) 
	coeff_restitution = 0.50000000000 
	coeff_friction = 0.60000002384 
	skater_collision_impulse_factor = 0.50000000000 
	skater_collision_rotation_factor = 0.80000001192 
	skater_collision_assent = 6.00000000000 
	skater_collision_radius = 66 
	BounceScript = dirthit02 
	SoundType = BE_LargePlanter 
} 
grbg_pizza01 = { 
	model = "Props\\grbg_pizza01\\grbg_pizza01.mdl" 
	CollisionMode = Geometry 
	contacts = [ 
		VECTOR(-22.94420051575, 8.00199985504, 22.94449996948) 
		VECTOR(22.94420051575, 8.00199985504, 22.94449996948) 
		VECTOR(-22.94420051575, 8.00199985504, -22.94389915466) 
		VECTOR(22.94420051575, 8.00199985504, -22.94389915466) 
		VECTOR(-23.90019989014, 0.00000000000, 26.82950019836) 
		VECTOR(23.90019989014, 0.00000000000, 26.82950019836) 
		VECTOR(26.82920074463, 0.00000000000, -23.90040016174) 
		VECTOR(-23.90019989014, 0.00000000000, -26.82929992676) 
	] 
	center_of_mass = VECTOR(0.00000000000, 2.00000000000, 0.00000000000) 
	coeff_restitution = 0.50000000000 
	coeff_friction = 0.60000002384 
	skater_collision_impulse_factor = 0.50000000000 
	skater_collision_rotation_factor = 0.80000001192 
	skater_collision_assent = 6.00000000000 
	skater_collision_radius = 66 
	SoundType = CardboardBox 
} 
grbg_paper_bag01 = { 
	model = "Props\\grbg_paper_bag01\\grbg_paper_bag01.mdl" 
	CollisionMode = Geometry 
	contacts = [ 
		VECTOR(0.00000000000, -2.32209992409, 3.32668995857) 
		VECTOR(0.00000000000, 8.75207996368, 3.32668995857) 
		VECTOR(-12.45820045471, -0.34810099006, 20.58830070496) 
		VECTOR(12.45820045471, -0.34810099006, 20.58830070496) 
		VECTOR(12.92310047150, -0.33167698979, -13.59070014954) 
		VECTOR(-12.45820045471, -0.34810099006, -13.93500041962) 
		VECTOR(-14.94979953766, 5.63208007812, 23.20540046692) 
		VECTOR(14.94979953766, 5.63208007812, 23.20540046692) 
		VECTOR(14.94979953766, 5.63208007812, -20.45400047302) 
		VECTOR(-14.94979953766, 5.63208007812, -20.45400047302) 
	] 
	center_of_mass = VECTOR(0.00000000000, 2.00000000000, 0.00000000000) 
	coeff_restitution = 0.50000000000 
	coeff_friction = 0.60000002384 
	skater_collision_impulse_factor = 0.50000000000 
	skater_collision_rotation_factor = 0.80000001192 
	skater_collision_assent = 12.00000000000 
	skater_collision_radius = 66 
} 
grbg_plastic_bag01 = { 
	model = "Props\\grbg_plastic_bag01\\grbg_plastic_bag01.mdl" 
	CollisionMode = Geometry 
	contacts = [ 
		VECTOR(0.00000000000, 2.32209992409, 3.32668995857) 
		VECTOR(-12.45820045471, 0.00000000000, 20.58830070496) 
		VECTOR(12.45820045471, 0.00000000000, 20.58830070496) 
		VECTOR(12.92310047150, 0.00000000000, -13.59070014954) 
		VECTOR(-12.45820045471, 0.00000000000, -13.93500041962) 
	] 
	center_of_mass = VECTOR(0.00000000000, 2.00000000000, 0.00000000000) 
	coeff_restitution = 0.50000000000 
	coeff_friction = 0.40000000596 
	skater_collision_impulse_factor = 0.50000000000 
	skater_collision_rotation_factor = 0.80000001192 
	skater_collision_assent = 25.00000000000 
	skater_collision_radius = 44 
} 
grbg_styro_meal01 = { 
	model = "Props\\grbg_styro_meal01\\grbg_styro_meal01.mdl" 
	CollisionMode = Geometry 
	contacts = [ 
		VECTOR(-8.23680019379, -2.37019991875, 8.23680019379) 
		VECTOR(8.23680019379, -2.37019991875, 8.23680019379) 
		VECTOR(-8.23680019379, -2.37019991875, -8.23680019379) 
		VECTOR(8.23680019379, -2.37019991875, -8.23680019379) 
		VECTOR(-8.23680019379, 10.49380016327, 8.23680019379) 
		VECTOR(8.23680019379, 10.49380016327, 8.23680019379) 
		VECTOR(-8.23680019379, 10.49380016327, -8.23680019379) 
		VECTOR(8.23680019379, 10.49380016327, -8.23680019379) 
	] 
	center_of_mass = VECTOR(0.00000000000, 2.00000000000, 0.00000000000) 
	coeff_restitution = 0.50000000000 
	coeff_friction = 0.60000002384 
	skater_collision_impulse_factor = 0.50000000000 
	skater_collision_rotation_factor = 0.80000001192 
	skater_collision_assent = 12.00000000000 
	skater_collision_radius = 44 
} 
grbg_chinese01 = { 
	model = "Props\\grbg_chinese01\\grbg_chinese01.mdl" 
	CollisionMode = Geometry 
	contacts = [ 
		VECTOR(-6.47643995285, 17.79109954834, 6.47665023804) 
		VECTOR(6.47643995285, 17.79109954834, 6.47665023804) 
		VECTOR(-6.47643995285, 17.79109954834, -6.47623014450) 
		VECTOR(6.47643995285, 17.79109954834, -6.47623014450) 
		VECTOR(-4.29309988022, 0.10142199695, 6.85461997986) 
		VECTOR(7.25801992416, 0.18075899780, -3.90267992020) 
	] 
	center_of_mass = VECTOR(0.00000000000, 2.00000000000, 0.00000000000) 
	coeff_restitution = 0.50000000000 
	coeff_friction = 0.60000002384 
	skater_collision_impulse_factor = 0.50000000000 
	skater_collision_rotation_factor = 0.80000001192 
	skater_collision_assent = 12.00000000000 
	skater_collision_radius = 44 
} 
grbg_40oz01 = { 
	model = "Props\\grbg_40oz01\\grbg_40oz01.mdl" 
	CollisionMode = Geometry 
	contacts = [ 
		VECTOR(-1.08639001846, 26.75289916992, -0.62723201513) 
		VECTOR(2.19531011581, 14.91059970856, -3.80239009857) 
		VECTOR(-3.80239009857, 14.91059970856, -2.19531011581) 
		VECTOR(-2.19531011581, 14.91059970856, 3.80239009857) 
		VECTOR(-2.19531011581, 0.80280798674, 3.80239009857) 
		VECTOR(-1.40559995174, 0.06830599904, -0.91834902763) 
		VECTOR(2.19531011581, 0.80280697346, -3.80239009857) 
		VECTOR(3.80239009857, 14.91059970856, 2.19531011581) 
		VECTOR(3.80239009857, 0.80280697346, 2.19531011581) 
	] 
	center_of_mass = VECTOR(0.00000000000, 12.00000000000, 0.00000000000) 
	coeff_restitution = 0.50000000000 
	coeff_friction = 0.60000002384 
	skater_collision_impulse_factor = 0.60000002384 
	skater_collision_rotation_factor = 0.80000001192 
	skater_collision_assent = 22.00000000000 
	skater_collision_radius = 44 
	SoundType = BottleNonBreak 
} 
chair_plastic01 = { 
	model = "Props\\chair_plastic01\\chair_plastic01.mdl" 
	CollisionMode = Geometry 
	contacts = [ 
		VECTOR(-13.56649971008, 49.60430145264, -13.90149974823) 
		VECTOR(-0.00376700005, 50.43249893188, -17.30279922485) 
		VECTOR(13.55920028687, 49.60430145264, -13.90149974823) 
		VECTOR(14.82979965210, 37.64929962158, 10.18819999695) 
		VECTOR(14.81239986420, 0.99425202608, 13.38980007172) 
		VECTOR(-14.81970024109, 0.99425202608, 13.38980007172) 
		VECTOR(-14.82989978790, 37.64929962158, 10.18819999695) 
		VECTOR(-0.11616100371, 23.67770004272, 17.30299949646) 
		VECTOR(-13.36159992218, 0.99425202608, -13.99269962311) 
		VECTOR(13.35429954529, 0.99425202608, -13.99269962311) 
	] 
	center_of_mass = VECTOR(0.00000000000, 33.00000000000, -12.00000000000) 
	coeff_restitution = 0.50000000000 
	coeff_friction = 0.60000002384 
	skater_collision_impulse_factor = 0.60000002384 
	skater_collision_rotation_factor = 0.80000001192 
	skater_collision_assent = 12.00000000000 
	skater_collision_radius = 44 
	SoundType = BA_PlasticMetalChair 
} 
tire01 = { 
	model = "Props\\tire01\\tire01.mdl" 
	CollisionMode = Geometry 
	contacts = [ 
		VECTOR(0.24023799598, 13.30440044403, 24.84149932861) 
		VECTOR(-21.32049942017, 13.30440044403, 12.39340019226) 
		VECTOR(-21.32049942017, 13.30440044403, -12.50279998779) 
		VECTOR(0.24023300409, 13.30440044403, -24.95089912415) 
		VECTOR(21.80100059509, 13.30440044403, -12.50279998779) 
		VECTOR(21.80100059509, 13.30440044403, 12.39340019226) 
		VECTOR(12.68830013275, 1.12536001205, 21.50600051880) 
		VECTOR(25.13640022278, 1.12536001205, -0.05468799919) 
		VECTOR(12.68830013275, 1.12536001205, -21.61540031433) 
		VECTOR(-12.20790004730, 1.12536001205, -21.61540031433) 
		VECTOR(-24.65600013733, 1.12536001205, -0.05468500033) 
		VECTOR(-12.20790004730, 1.12536001205, 21.50600051880) 
	] 
	center_of_mass = VECTOR(0.00000000000, 5.00000000000, 0.00000000000) 
	coeff_restitution = 0.50000000000 
	coeff_friction = 0.60000002384 
	skater_collision_impulse_factor = 0.50000000000 
	skater_collision_rotation_factor = 0.80000001192 
	skater_collision_assent = 25 
	skater_collision_radius = 44 
	SoundType = ST_Tire 
} 
umbrella_G_01 = { 
	model = "Props\\umbrella_G_01\\umbrella_G_01.mdl" 
	CollisionMode = Geometry 
	contacts = [ 
		VECTOR(0.00000000000, 153.06300354004, 0.00000000000) 
		VECTOR(0.00000000000, 118.23899841309, -77.41889953613) 
		VECTOR(-67.04669952393, 118.23899841309, -38.70940017700) 
		VECTOR(-67.04669952393, 118.23899841309, 38.70949935913) 
		VECTOR(0.00000000000, 118.23899841309, 77.41889953613) 
		VECTOR(67.04669952393, 118.23899841309, 38.70940017700) 
		VECTOR(67.04669952393, 118.23899841309, -38.70949935913) 
		VECTOR(31.77330017090, 3.16692996025, -1.63668000698) 
		VECTOR(0.69026899338, 3.16692996025, -32.93970108032) 
		VECTOR(-30.39270019531, 3.16692996025, -1.63668000698) 
		VECTOR(0.69026201963, 3.16692996025, 29.66629981995) 
	] 
	center_of_mass = VECTOR(0.00000000000, 33.00000000000, 0.00000000000) 
	coeff_restitution = 0.30000001192 
	coeff_friction = 0.69999998808 
	skater_collision_impulse_factor = 0.60000002384 
	skater_collision_rotation_factor = 0.50000000000 
	skater_collision_assent = 11 
	skater_collision_radius = 44 
	SoundType = NO_Umbrella 
} 
Table_little01 = { 
	model = "Props\\Table_little01\\Table_little01.mdl" 
	CollisionMode = Geometry 
	contacts = [ 
		VECTOR(29.70000076294, 40.00000000000, 29.70000076294) 
		VECTOR(29.70000076294, 40.00000000000, -29.70000076294) 
		VECTOR(-29.70000076294, 40.00000000000, 29.70000076294) 
		VECTOR(-29.70000076294, 40.00000000000, -29.70000076294) 
		VECTOR(17.14159965515, 3.60805010796, 16.66169929504) 
		VECTOR(-17.14159965515, 3.60805010796, 16.66130065918) 
		VECTOR(-17.14159965515, 3.60805010796, -16.66169929504) 
		VECTOR(17.14159965515, 3.60805010796, -16.66169929504) 
	] 
	center_of_mass = VECTOR(0.00000000000, 33.00000000000, 0.00000000000) 
	coeff_restitution = 0.30000001192 
	coeff_friction = 0.69999998808 
	skater_collision_impulse_factor = 0.60000002384 
	skater_collision_rotation_factor = 0.50000000000 
	skater_collision_assent = 11 
	skater_collision_radius = 44 
	SoundType = AU_WoodTable 
} 

