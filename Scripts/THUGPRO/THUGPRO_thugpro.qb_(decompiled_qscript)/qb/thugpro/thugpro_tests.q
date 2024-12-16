SCRIPT %0xe2895cdb% 
	%0x8968da7f% %0xd36debba% 
	%0x2de8c60e% "--- runing test sequence ---" 
	%0xc16e6321% <0xad7928d4> 
	%0x2de8c60e% "--- waiting ---" 
	%0x82117c1a% <0x79a07f3f> %0xd029f619% 
	%0x2de8c60e% "--- signal test sequence completed ---" 
	%0xa3de8f67% %0x43df7f67% %0x7031f10c% = { %0x7321a8d6% = %0xa671e15% } 
ENDSCRIPT

SCRIPT SkProTest_execute_test 
	IF NOT %0xcf66717b% %0xed9f03a1% 
		%0x2de8c60e% "ERROR: No test data received!" 
		RETURN 
	ENDIF 
	%0x39b5c4b0% <0xed9f03a1> 
	%0x74523ef5% = 0 
	%0xcd0dc02d% %0x40c698af% = %0x4921cdfc% 
	%0xcd0dc02d% %0x40c698af% = %0xd6d4aa49% 
	%0x9eb6e336% <0x29b1ef55> %0x40c698af% = %0xd6d4aa49% 
	BEGIN 
		%0x9277f428% %0xff0db407% = %0xb9ce4069% "Running \'%a\'" %0x174841bc% = ( ( <0xed9f03a1> [ <0x74523ef5> ] ) . %0xa1dc81f9% ) 
		%0x24f3f64f% %0x40c698af% = %0x37919b16% 
		%0xa1116237% { 
			%0xc4745838% = <0xb9ce4069> 
			%0x40c698af% = %0x37919b16% 
			%0xcc424795% = %0x5709e3d5% 
		} 
		%0x24f3f64f% %0x40c698af% = %0x2702c824% 
		%0xa1116237% { 
			%0xc4745838% = ( ( <0xed9f03a1> [ <0x74523ef5> ] ) . %0x921bbfd9% ) 
			%0x40c698af% = %0x2702c824% 
			%0xcc424795% = %0x17263433% 
		} 
		%0xcd0dc02d% %0xa1dc81f9% = ( ( <0xed9f03a1> [ <0x74523ef5> ] ) . %0x29b1ef55% ) 
		%0x9eb6e336% ( ( <0xed9f03a1> [ <0x74523ef5> ] ) . %0x29b1ef55% ) 
		%0x8968da7f% %0xd36debba% 
		%0x6ed6f8e8% { 
			%0xf8728bec% = ( ( <0xed9f03a1> [ <0x74523ef5> ] ) . %0xb104efa9% ) 
			%0x7031f10c% = ( <0xed9f03a1> [ <0x74523ef5> ] ) 
			%0xa6d2d890% = %0xe2895cdb% 
			%0x923fbb3a% = %0xd36debba% 
		} 
		%0x2de8c60e% "--- move skater to restart ---" 
		%0x2bed17bb% %0x66780c6f% = ( ( <0xed9f03a1> [ <0x74523ef5> ] ) . %0x3494f170% ) 
		%0x2de8c60e% "--- waiting for completed test signal ---" 
		%0x15036130% %0x7321a8d6% = %0xa671e15% 
		%0xcd0dc02d% %0xa1dc81f9% = ( ( <0xed9f03a1> [ <0x74523ef5> ] ) . %0x9365130d% ) 
		%0x9eb6e336% ( ( <0xed9f03a1> [ <0x74523ef5> ] ) . %0x9365130d% ) 
		%0x82117c1a% 20 %0xb99ae3d6% 
		<0x74523ef5> = ( <0x74523ef5> + 1 ) 
	REPEAT <0x7f5b3d4d> 
	%0x24f3f64f% %0x40c698af% = %0x37919b16% 
	%0x24f3f64f% %0x40c698af% = %0x2702c824% 
	%0xcd0dc02d% %0x40c698af% = %0x4921cdfc% 
	%0xcd0dc02d% %0x40c698af% = %0xd6d4aa49% 
	%0x9eb6e336% <0x9365130d> %0x40c698af% = %0x4921cdfc% 
	%0x7ce468dd% 
ENDSCRIPT

SCRIPT %0x5709e3d5% %0x906b67ba% = 1500 
	%0x6c63c7c5% %0x8b60022f% = [ %0xbf0f14db% %0xbf0f14db% ] %0x3f6bcdba% = [ 115 115 115 128 ] %0x2f6bf72d% = %0xba9e279d% 
	%0x6c63c7c5% %0x8a897dd2% %0x1e7bb1f5% = [ 0 0 0 128 ] %0x2a1fe0cc% = PAIR(0.50000000000, 0.50000000000) 
	%0xdd0c8df3% %0x7f261953% = PAIR(320.00000000000, 80.00000000000) %0x13b9da7b% = 6 %0x2f1fc695% = 0 %0x906b67ba% = 0 
	%0xdd0c8df3% %0x7f261953% = PAIR(320.00000000000, 80.00000000000) %0x13b9da7b% = 0.75000000000 %0x2f1fc695% = 1 %0x906b67ba% = 0.10000000149 
	%0x82117c1a% 1 %0x4a07c332% 
	%0xdd0c8df3% %0x7f261953% = PAIR(320.00000000000, 80.00000000000) %0x13b9da7b% = 1.60000002384 %0x2f1fc695% = 1 %0x906b67ba% = 0.10000000149 
	%0x82117c1a% 1 %0x4a07c332% 
	%0xdd0c8df3% %0x7f261953% = PAIR(320.00000000000, 80.00000000000) %0x13b9da7b% = 1.29999995232 %0x2f1fc695% = 1 %0x906b67ba% = 0.10000000149 
ENDSCRIPT

SCRIPT %0x17263433% %0x906b67ba% = 1500 
	%0x6c63c7c5% %0x8b60022f% = [ %0xbf0f14db% %0xbf0f14db% ] %0x3f6bcdba% = [ 115 115 115 128 ] %0x2f6bf72d% = %0xba9e279d% 
	%0x6c63c7c5% %0x8a897dd2% %0x1e7bb1f5% = [ 0 0 0 128 ] %0x2a1fe0cc% = PAIR(0.50000000000, 0.50000000000) 
	%0xdd0c8df3% %0x7f261953% = PAIR(320.00000000000, 100.00000000000) %0x13b9da7b% = 2 %0x2f1fc695% = 0 %0x906b67ba% = 0 
	%0xdd0c8df3% %0x7f261953% = PAIR(320.00000000000, 100.00000000000) %0x13b9da7b% = 0.50000000000 %0x2f1fc695% = 1 %0x906b67ba% = 0.10000000149 
	%0x82117c1a% 1 %0x4a07c332% 
	%0xdd0c8df3% %0x7f261953% = PAIR(320.00000000000, 100.00000000000) %0x13b9da7b% = 1.00000000000 %0x2f1fc695% = 1 %0x906b67ba% = 0.10000000149 
	%0x82117c1a% 1 %0x4a07c332% 
	%0xdd0c8df3% %0x7f261953% = PAIR(320.00000000000, 100.00000000000) %0x13b9da7b% = 0.80000001192 %0x2f1fc695% = 1 %0x906b67ba% = 0.10000000149 
ENDSCRIPT

SCRIPT %0x8686ecd7% %0x906b67ba% = 1500 
	%0x6c63c7c5% %0x8b60022f% = [ %0xbf0f14db% %0xbf0f14db% ] %0x3f6bcdba% = [ 115 0 0 128 ] %0x2f6bf72d% = %0xba9e279d% 
	%0xdd0c8df3% %0x7f261953% = PAIR(320.00000000000, 200.00000000000) %0x13b9da7b% = 6 %0x2f1fc695% = 0 %0x906b67ba% = 0 
	%0xdd0c8df3% %0x7f261953% = PAIR(320.00000000000, 200.00000000000) %0x13b9da7b% = 0.75000000000 %0x2f1fc695% = 1 %0x906b67ba% = 0.10000000149 
	%0x82117c1a% 1 %0x4a07c332% 
	%0xdd0c8df3% %0x7f261953% = PAIR(320.00000000000, 200.00000000000) %0x13b9da7b% = 1.79999995232 %0x2f1fc695% = 1 %0x906b67ba% = 0.10000000149 
	%0x82117c1a% 1 %0x4a07c332% 
	%0xdd0c8df3% %0x7f261953% = PAIR(320.00000000000, 200.00000000000) %0x13b9da7b% = 1.50000000000 %0x2f1fc695% = 1 %0x906b67ba% = 0.10000000149 
ENDSCRIPT

SCRIPT %0xc1ac3966% %0x906b67ba% = 1500 
	%0x6c63c7c5% %0x8b60022f% = [ %0xbf0f14db% %0xbf0f14db% ] %0x3f6bcdba% = [ 0 115 0 128 ] %0x2f6bf72d% = %0xba9e279d% 
	%0xdd0c8df3% %0x7f261953% = PAIR(320.00000000000, 200.00000000000) %0x13b9da7b% = 6 %0x2f1fc695% = 0 %0x906b67ba% = 0 
	%0xdd0c8df3% %0x7f261953% = PAIR(320.00000000000, 200.00000000000) %0x13b9da7b% = 0.75000000000 %0x2f1fc695% = 1 %0x906b67ba% = 0.10000000149 
	%0x82117c1a% 1 %0x4a07c332% 
	%0xdd0c8df3% %0x7f261953% = PAIR(320.00000000000, 200.00000000000) %0x13b9da7b% = 1.79999995232 %0x2f1fc695% = 1 %0x906b67ba% = 0.10000000149 
	%0x82117c1a% 1 %0x4a07c332% 
	%0xdd0c8df3% %0x7f261953% = PAIR(320.00000000000, 200.00000000000) %0x13b9da7b% = 1.50000000000 %0x2f1fc695% = 1 %0x906b67ba% = 0.10000000149 
ENDSCRIPT

%0x5fdfe5aa% = { 
	%0xa1dc81f9% = #"_tech_test_boostplant_01" 
	%0x29b1ef55% = %0x5f83a16a% 
	%0x9365130d% = %0xa58395ff% 
	%0xed9f03a1% = [ 
		{ 
			%0xa1dc81f9% = BOOSTPLANT_TEST_01 
			%0x921bbfd9% = "perform x2 thug11bp (double tap)" 
			%0xad7928d4% = "test_seq_boostplant_ug1_hard_x2" 
			%0x3494f170% = %0x127672fb% 
			%0xb104efa9% = %0xc98ba111% 
			%0x29b1ef55% = %0xf7e902c% 
			%0x9365130d% = %0xf7e902c% 
			%0x79a07f3f% = 4 
		} 
		{ 
			%0xa1dc81f9% = BOOSTPLANT_TEST_02 
			%0x921bbfd9% = "perform x3 thug11bp (double tap)" 
			%0xad7928d4% = "test_seq_boostplant_ug1_hard_x3" 
			%0x3494f170% = %0x127672fb% 
			%0xb104efa9% = %0xc98ba111% 
			%0x29b1ef55% = %0xf7e902c% 
			%0x9365130d% = %0xf7e902c% 
			%0x79a07f3f% = 5 
		} 
		{ 
			%0xa1dc81f9% = BOOSTPLANT_TEST_03 
			%0x921bbfd9% = "perform x4 thug11bp (double tap)" 
			%0xad7928d4% = "test_seq_boostplant_ug1_hard_x4" 
			%0x3494f170% = %0x127672fb% 
			%0xb104efa9% = %0xc98ba111% 
			%0x29b1ef55% = %0xf7e902c% 
			%0x9365130d% = %0x3a821693% 
			%0x79a07f3f% = 6 
		} 
		{ 
			%0xa1dc81f9% = BOOSTPLANT_TEST_04 
			%0x921bbfd9% = "perform x5 thug11bp (double tap)" 
			%0xad7928d4% = "test_seq_boostplant_ug1_hard_x5" 
			%0x3494f170% = %0x127672fb% 
			%0xb104efa9% = %0xc98ba111% 
			%0x29b1ef55% = %0xf7e902c% 
			%0x9365130d% = %0xf7e902c% 
			%0x79a07f3f% = 7 
		} 
	] 
} 
SCRIPT %0x5f83a16a% 
	%0x21e734cf% %0xa1dc81f9% = JowGBench04 
	%0x21e734cf% %0xa1dc81f9% = Collision_Gym_Benches03 
	%0x21e734cf% %0xa1dc81f9% = JowGBenchShadow04 
	%0x21e734cf% %0xa1dc81f9% = JowGBench01 
	%0x21e734cf% %0xa1dc81f9% = JowGBench03 
	%0x21e734cf% %0xa1dc81f9% = Collision_Gym_Benches01 
	%0x21e734cf% %0xa1dc81f9% = Collision_Gym_Benches02 
	%0x21e734cf% %0xa1dc81f9% = JowGBenchShadow03 
	%0x21e734cf% %0xa1dc81f9% = Gym_Banks_Handrail04 
	%0x21e734cf% %0xa1dc81f9% = Gym_Banks_Handrail05 
	%0x21e734cf% %0xa1dc81f9% = Gym_Banks_Handrail06 
	%0x21e734cf% %0xa1dc81f9% = JowGRailShadow01 
	%0x21e734cf% %0xa1dc81f9% = Gym_Banks_Handrail01 
	%0x21e734cf% %0xa1dc81f9% = Gym_Banks_Handrail02 
	%0x21e734cf% %0xa1dc81f9% = Gym_Banks_Handrail03 
	%0x21e734cf% %0xa1dc81f9% = JowGRailShadow02 
	%0x21e734cf% %0xa1dc81f9% = JowGGymPillar01 
	%0x21e734cf% %0xa1dc81f9% = JowGGymPillar02 
	%0x21e734cf% %0xa1dc81f9% = JowGGymPillarShadow02 
	%0x21e734cf% %0xa1dc81f9% = JowGGymRoof01 
	%0x857ea1d0% %0xa1dc81f9% = Gym_Doors01 
	%0x8546ac84% %0xf649d637% 
	%0x8eb55c2d% %0x756f5456% = "WallieplantInputMode" %0xe288a7cb% = 1 %0x5f177ef8% 
	%0x8eb55c2d% %0x756f5456% = "BoostplantOn" %0xe288a7cb% = 1 %0x5f177ef8% 
	%0xf7e902c% 
ENDSCRIPT

SCRIPT %0xa58395ff% 
	%0x857ea1d0% %0xa1dc81f9% = JowGBench04 
	%0x857ea1d0% %0xa1dc81f9% = Collision_Gym_Benches03 
	%0x857ea1d0% %0xa1dc81f9% = JowGBenchShadow04 
	%0x857ea1d0% %0xa1dc81f9% = JowGBench01 
	%0x857ea1d0% %0xa1dc81f9% = JowGBench03 
	%0x857ea1d0% %0xa1dc81f9% = Collision_Gym_Benches01 
	%0x857ea1d0% %0xa1dc81f9% = Collision_Gym_Benches02 
	%0x857ea1d0% %0xa1dc81f9% = JowGBenchShadow03 
	%0x857ea1d0% %0xa1dc81f9% = Gym_Banks_Handrail04 
	%0x857ea1d0% %0xa1dc81f9% = Gym_Banks_Handrail05 
	%0x857ea1d0% %0xa1dc81f9% = Gym_Banks_Handrail06 
	%0x857ea1d0% %0xa1dc81f9% = JowGRailShadow01 
	%0x857ea1d0% %0xa1dc81f9% = Gym_Banks_Handrail01 
	%0x857ea1d0% %0xa1dc81f9% = Gym_Banks_Handrail02 
	%0x857ea1d0% %0xa1dc81f9% = Gym_Banks_Handrail03 
	%0x857ea1d0% %0xa1dc81f9% = JowGRailShadow02 
	%0x857ea1d0% %0xa1dc81f9% = JowGGymPillar01 
	%0x857ea1d0% %0xa1dc81f9% = JowGGymPillar02 
	%0x857ea1d0% %0xa1dc81f9% = JowGGymPillarShadow02 
	%0x857ea1d0% %0xa1dc81f9% = JowGGymRoof01 
	%0x21e734cf% %0xa1dc81f9% = Gym_Doors01 
	%0x8546ac84% %0xd443a2bc% 
	%0xef3bb181% %0x756f5456% = "WallieplantInputMode" %0x5f177ef8% 
	%0xef3bb181% %0x756f5456% = "BoostplantOn" %0x5f177ef8% 
	%0xf7e902c% 
ENDSCRIPT

SCRIPT %0x4cd21cb9% 
	%0xcd0dc02d% %0xa1dc81f9% = SkProTest_execute_test 
	%0x9eb6e336% SkProTest_execute_test %0x7031f10c% = %0x5fdfe5aa% 
ENDSCRIPT


