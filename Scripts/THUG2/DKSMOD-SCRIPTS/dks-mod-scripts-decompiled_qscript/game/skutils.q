
%0xf7ecd937% = 0 
%0x64d2270b% = 0 
%0x77a5662c% = 0 
%0x33c09f3c% = 0 
%0x86cc8fc9% = 0 
%0x67cd98a2% = 0 
%0x406acebc% = %0x7149b753% 
%0x33c03e02% = [ 
	%0xdea3057b% 
	%0xb38ed6b% 
	%0x65bbe12b% 
	%0xb1058546% 
	%0x1310920e% 
	%0x9d9002ef% 
	%0xb38edd56% 
	%0xa94f07f7% 
] 
SCRIPT %0xd5461f5b% 
	IF %0x3527fc07% 
		%0x2de8c60e% "In air" 
	ENDIF 
	IF %0x5ea287f2% 
		%0x2de8c60e% "On ground" 
	ENDIF 
	IF %0xa32c1a15% 
		%0x2de8c60e% "On wall" 
	ENDIF 
	IF %0x5cb1fbd8% 
		%0x2de8c60e% "On lip" 
	ENDIF 
	IF %0xe9851e62% 
		%0x2de8c60e% "OnRail" 
	ENDIF 
ENDSCRIPT

SCRIPT %0x541a2485% 
	IF %0x5fc81d6% %0xd8bfbfa9% 
		%0xb0b28e7f% %0xd8bfbfa9% 
	ENDIF 
	%0x5151b2b1% %0xfc492cb6% %0x40c698af% = %0xd8bfbfa9% 
	IF %0xf2813ee5% 
		IF %0x5ea287f2% 
			%0xdc70f33f% = 1 
		ENDIF 
	ELSE 
		IF %0x57bfbae8% 
			%0xdc70f33f% = 1 
		ELSE 
			IF %0xee584cbc% 
				%0xdc70f33f% = 1 
			ENDIF 
		ENDIF 
	ENDIF 
	IF %0xcf66717b% %0xdc70f33f% 
		%0xc068ea59% 
		IF ( <0xffe7e02c> = 0 ) 
			%0xff426ddf% 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT %0xd73dfe2e% %0xe288a7cb% = 3 
	IF ( <0xe288a7cb> = 0 ) 
		%0x2de8c60e% "* Clearing Stats Override" 
	ELSE 
		%0x2de8c60e% "* Overriding Stats to %d" %0x6722b533% = <0xe288a7cb> 
	ENDIF 
	%0x245aedf5% <0xe288a7cb> 
ENDSCRIPT

SCRIPT %0x36b05079% 
	%0x36d89318% %0xe0e4dae1% = %0x1f1135ad% 
	%0x36d89318% %0xe0e4dae1% = %0x44a08e2e% 
	%0x36d89318% %0xe0e4dae1% = %0x15c1c563% 
	%0x36d89318% %0xe0e4dae1% = %0x1f6bb627% 
	%0x36d89318% %0xe0e4dae1% = %0x25bd4a44% 
	%0x36d89318% %0xe0e4dae1% = %0x4c98575a% 
	%0x36d89318% %0xe0e4dae1% = %0x88b2100f% 
	%0x36d89318% %0xe0e4dae1% = %0x11bb41b5% 
	%0x36d89318% %0xe0e4dae1% = %0xa735068b% 
	%0x36d89318% %0xe0e4dae1% = %0x90daf43c% 
	%0x36d89318% %0xe0e4dae1% = %0x897e8113% 
	%0x36d89318% %0xe0e4dae1% = %0xfc372ceb% 
	%0x36d89318% %0xe0e4dae1% = %0xbbbb8e76% 
ENDSCRIPT

SCRIPT %0x18b3b291% 
	%0x82117c1a% 1 %0xb99ae3d6% 
ENDSCRIPT

SCRIPT %0x64df5e4c% 
	BEGIN 
		%0x9d58f25% 
		IF %0xcf66717b% %0xf82bc1d2% 
			%0x788f9a4e% 
		ENDIF 
		IF %0x76cc99d5% 
			BREAK 
		ENDIF 
		%0x82117c1a% 1 %0xfc37df05% 
	REPEAT 
ENDSCRIPT

SCRIPT %0x603ea7f3% 
	%0x2de8c60e% "WaitAnimFinished is deprecated...  use Obj_WaitanimFinished instead" 
	%0xb628a959% 
ENDSCRIPT

SCRIPT %0x4bb2e406% 
	%0xce5c2938% 
	BEGIN 
		%0x9d58f25% 
		IF %0xcf66717b% %0xf82bc1d2% 
			%0x788f9a4e% 
		ENDIF 
		%0x82117c1a% 1 %0xfc37df05% 
		%0x590f686f% %0xd16b61e6% = <0xd16b61e6> 
		IF ( <0x3eb3566b> > <0x79a07f3f> ) 
			BREAK 
		ENDIF 
	REPEAT 
ENDSCRIPT

SCRIPT %0x55886ee8% 
	%0xb1e7291% %0x98549ba4% = %0x230ccbf4% %0x46e55e8f% = %0x230ccbf4% %0x28782d3b% = 0 
ENDSCRIPT

%0x8622b03f% = 0 
SCRIPT %0xb9055e76% 
	%0xbfa801df% %0x8622b03f% = 0 
	IF ( <0x651533ec> = %0xa368b4f1% ) 
		%0xbfa801df% %0x8622b03f% = 1 
		%0x651533ec% = %0xe92ecafe% 
	ENDIF 
	IF ( <0x651533ec> = %0x9f2bafb7% ) 
		%0x2de8c60e% "!!! Warning !!! \'load_skateshop\' is obsolete. Please use \'load_mainmenu\'" 
		<0x651533ec> = %0xe92ecafe% 
	ENDIF 
	RETURN %0x651533ec% = <0x651533ec> 
ENDSCRIPT

SCRIPT %0x5f52b6d% 
	IF NOT %0xba297025% 
		%0xbfa801df% %0xe9eed631% = 1 
	ENDIF 
	IF %0xcf66717b% %0xdcd4ce73% 
		%0xd6f4a573% <0xdcd4ce73> 
	ELSE 
		%0xd6f4a573% %0x4da4937b% 
	ENDIF 
	%0xe46f078d% 
	IF %0x20985922% %0x1ded1ea4% 
		%0x3374bb72% %0x651533ec% = <0x651533ec> 
	ENDIF 
	%0xb9055e76% %0x651533ec% = <0x651533ec> 
	%0x38028fc9% %0x651533ec% = <0x651533ec> 
	%0x65ed88da% 
	%0xc0b30cf9% 
ENDSCRIPT

SCRIPT %0x39c58ea1% 
	%0x5556b614% %0x651533ec% = <0x651533ec> 
	%0x5b8ab877% : %0xdf8a5f0a% %0xd443a2bc% 
	IF %0x9cb87e60% 
		IF %0x437b2131% %0x40c698af% = %0x6ed3fa7% 
			%0x6ed3fa7% : %0xdf8a5f0a% %0xd443a2bc% 
		ENDIF 
	ENDIF 
	%0x39b5c4b0% %0x33c03e02% 
	<0x7f8c98fe> = 0 
	BEGIN 
		%0xcd0dc02d% %0xa1dc81f9% = ( %0x33c03e02% [ <0x7f8c98fe> ] ) 
		<0x7f8c98fe> = ( <0x7f8c98fe> + 1 ) 
	REPEAT <0x7f5b3d4d> 
	%0xbfa801df% %0xe997db9f% = 1 
	%0xbfa801df% %0xaae2353a% = 0 
	%0xb9055e76% %0x651533ec% = <0x651533ec> 
	IF %0x3028488b% %0xe92ecafe% 
		%0xd4ebe522% %0x37923003% %0x3d92465e% 
		%0x51b870ee% %0x37923003% %0x3d92465e% 
	ENDIF 
	IF %0x3028488b% %0xe8b4b836% 
		%0x32428a49% 
	ENDIF 
	%0x67647c6d% 
	%0x6d2b1f93% 0 
	%0xec6d1e5a% 
	IF NOT %0x94da6b4b% 
		%0x5b8ab877% : %0xe9b3067a% 
	ENDIF 
	IF %0x437b2131% %0x40c698af% = %0x6ed3fa7% 
		%0x6ed3fa7% : %0xe9b3067a% 
	ENDIF 
	%0xbfa801df% %0x77a5662c% = 0 
	IF %0xcf66717b% %0x4dc7198e% 
		%0xbfa801df% %0x4dc7198e% = <0x4dc7198e> 
	ENDIF 
	IF NOT %0x94da6b4b% 
		%0x5b8ab877% : %0x11ca5c42% 
	ENDIF 
	IF NOT %0xcf66717b% %0x4d650102% 
		%0x2de8c60e% "performing LevelUnload" 
		%0x95982e0e% 
	ENDIF 
	%0x67647c6d% 
	%0x68a661b2% 
	%0x53610aa4% 
	%0x95982e0e% 
	%0x6ab610c2% 
	IF NOT %0x94da6b4b% 
		%0x5b8ab877% : %0xf1745991% 
	ENDIF 
	%0xf8a56e54% 
	IF NOT %0xa1da6fe9% 
		%0xf4251a06% 
	ENDIF 
	%0xbda66e7d% 
	IF %0x9cb87e60% 
		%0xdd956d70% 
	ENDIF 
	IF %0x86d7838a% 
		%0xd02e396f% %0xb96e0be5% 
	ENDIF 
	%0x5be70a4c% <...> 
ENDSCRIPT

SCRIPT %0x31e223dd% 
	%0x2de8c60e% "Running quickscript...." 
	%0xd4d50cdb% 
	IF %0xab9e5a4c% %0x1ccd4d52% 
		%0x1ccd4d52% 
	ENDIF 
	%0xd11fae1c% 
ENDSCRIPT

SCRIPT %0x179bb868% 
	%0x5b8ab877% : %0x42832375% %0x19ebda23% 
	IF %0xcf66717b% %0x26861025% 
		IF %0xc640561c% <...> 
			%0x35b7cb26% 
			IF NOT %0xa1da6fe9% 
				%0xa340e9af% 
			ENDIF 
			%0x9277f428% %0x76fa7a8f% = %0xd936cb0b% "level_%s" %0xe4f130f4% = <0x26861025> 
			%0x47ba1751% <0xd936cb0b> 
			IF %0xcf66717b% %0xf9d98b10% 
				%0xb95392c% %0x26861025% = <0xf9d98b10> 
			ENDIF 
			%0xb95392c% <...> 
			IF %0xcf66717b% %0xc8f97ae8% 
				%0xdfa7e9cd% <0xc8f97ae8> 
			ELSE 
				%0xdfa7e9cd% <0x651533ec> 
			ENDIF 
			IF %0xcf66717b% %0x2bbea5c3% 
				%0x8e17a2dc% <0x2bbea5c3> 
			ENDIF 
			IF %0xcf66717b% %0x2bbea5c3% 
				%0xdd20131a% 
			ENDIF 
			%0x8d0a28d% %0x10c6f3db% = <0x10c6f3db> 
			IF %0xcf66717b% %0xcb368934% 
				%0x73b5cab8% <0xcb368934> %0x6dd1decf% 
			ENDIF 
			IF %0xcf66717b% %0xf0bc6b42% 
				%0x73b5cab8% <0xf0bc6b42> %0x6dd1decf% 
			ENDIF 
			IF %0xcf66717b% %0x6c88871e% 
				IF NOT %0x96254f72% <0x6c88871e> 
					%0x2eccf8ae% "more_level_qbs is not an array" 
				ENDIF 
				%0x39b5c4b0% <0x6c88871e> 
				<0x7f8c98fe> = 0 
				BEGIN 
					<0x57a9609b> = ( <0x6c88871e> [ <0x7f8c98fe> ] ) 
					%0x986c1c3e% <0x57a9609b> 
					%0x73b5cab8% <0x57a9609b> %0x6dd1decf% 
					<0x7f8c98fe> = ( <0x7f8c98fe> + 1 ) 
				REPEAT <0x7f5b3d4d> 
			ENDIF 
			%0xa4f9a278% 
			IF %0xcf66717b% %0x94efe8f2% 
				<0x94efe8f2> 
			ENDIF 
			IF NOT %0xa1da6fe9% 
				%0xbf0b55a3% "Level Specific Anims" 
				%0xec682f87% 
				%0x8ba3ef43% 
			ENDIF 
			%0xbf0b55a3% "Level Cameras" 
			%0x7d0d6a3% 
			%0x8ba3ef43% 
			IF %0xab9e5a4c% %0x41f86e9b% 
				%0xbf0b55a3% "Object Anims" 
				%0x41f86e9b% 
				%0x8ba3ef43% 
			ENDIF 
			IF %0xab9e5a4c% %0x1ccd4d52% 
				%0x1ccd4d52% 
			ENDIF 
			IF %0xcf66717b% %0x46a640ce% 
				<0x46a640ce> 
			ENDIF 
			%0x74360b60% 
			%0x9277f428% %0x76fa7a8f% = %0xc5297ae% "%i_LoadingSounds" %0x1993c98e% = <0x15f818d0> 
			IF %0xab9e5a4c% <0xc5297ae> 
				<0xc5297ae> 
			ENDIF 
			%0xca96f343% <...> 
			%0x52b5d59f% 
			IF %0xcf66717b% %0x6765ddc1% 
				<0x6765ddc1> 
			ENDIF 
			%0x38b87d17% 
			%0x6cefbc8% ( <0xdf3d6451> . %0xea84c14d% ) 
			%0xe845db03% 
			IF ( %0x28e17f8b% ) 
				IF ( %0x7865b9f1% = 0 ) 
					%0x279a719c% 
				ENDIF 
			ENDIF 
		ELSE 
			%0x5f52b6d% %0x651533ec% = <0x26861025> 
		ENDIF 
	ELSE 
		%0x2eccf8ae% "No scene param specified for autolaunching" 
	ENDIF 
	%0x5b8ab877% : %0x5a3c19e9% 
	IF %0x30c0940% %0x33c09f3c% 
		%0x3781bbb5% %0x760337be% 
	ENDIF 
ENDSCRIPT

SCRIPT %0x89a0d75e% 
	IF %0xcf66717b% %0x2e58c18% 
	ELSE 
		%0x2e58c18% "update" 
	ENDIF 
	IF %0xcf66717b% %0x26861025% 
		%0x755bbdce% %0x26861025% = <0x26861025> %0x2e58c18% = <0x2e58c18> 
		%0xb2186f57% %0x26861025% = <0x26861025> %0x2e58c18% = <0x2e58c18> 
	ELSE 
		%0x2eccf8ae% "No scene param specified for autolaunching" 
	ENDIF 
ENDSCRIPT

%0x9a27e74d% = 1 
%0xc6362354% = 2 
%0xcd4decee% = 4 
%0x87e4e899% = 8 
%0x20e0d12b% = 16 
%0x78d5a029% = 32 
%0x2d03dae1% = 64 
%0x2a7a145a% = 128 
%0xa65d800% = 256 
%0xffc4ac25% = 510 
%0x4faa6460% = 509 
%0xec70841c% = 507 
%0xa6d9806b% = 503 
%0xa97c961f% = 495 
%0x149f1fd8% = 479 
%0x48e09189% = 447 
%0xb477ca8% = 383 
%0x6f869368% = 255 
%0xae0f7a14% = 65536 
%0xdfc901ab% = 131072 
%0xe056fc41% = 262144 
%0xaafff836% = 524288 
%0x391ff3d4% = 1048576 
%0xeae2e98f% = 2097152 
%0x192b47b8% = 4194304 
%0x76104f5% = 8388608 
%0x3e4d4559% = 16777216 
%0xa4721771% = 512 
%0x19807d3a% = 1024 
%0x678677cc% = 2048 
%0xe236b218% = 33554432 
%0x349b6d95% = 67108864 
%0x21c2d2a5% = 134217728 
%0xa79c0868% = 1 
%0xf0cb5476% = 2 
%0xc0e52efd% = 4 
%0x5a5aa1af% = 8 
%0x269ca1be% = 16 
%0x98d05925% = 32 
%0xd94f00fa% = 64 
%0x6b38943% = 128 
%0x589d0d5e% = 256 
%0x5de81d56% = 512 
%0x7a123d78% = 1024 
%0x9c0cf1bf% = 2048 
%0x454409b% = 4096 
%0xaf670c6e% = 8192 
SCRIPT %0xe53c820c% 
	%0xfaf402a8% 
ENDSCRIPT

SCRIPT %0x4865aefa% 
	%0xfaf402a8% %0xa6247730% = %0x5a5aa1af% 
ENDSCRIPT

SCRIPT %0xb160e800% 
	%0xfaf402a8% %0xa6247730% = %0xc0e52efd% 
ENDSCRIPT

SCRIPT %0xc467d22c% 
	%0xfaf402a8% %0xa6247730% = %0xc0e52efd% 
ENDSCRIPT

SCRIPT %0x82c6dd41% 
	%0xfaf402a8% %0xa6247730% = %0xd94f00fa% 
ENDSCRIPT

SCRIPT %0xfb07c208% 
	%0xfaf402a8% %0xa6247730% = %0x454409b% 
ENDSCRIPT

SCRIPT %0xc855975d% 
	%0x82c6dd41% 
ENDSCRIPT

SCRIPT %0x4b843e61% 
	%0xfaf402a8% %0xa6247730% = %0x4ffdcb3f% 
ENDSCRIPT

SCRIPT %0xd798520d% 
	%0xfaf402a8% %0xa6247730% = %0x6b38943% 
ENDSCRIPT

SCRIPT %0xfb74ebb1% 
	%0xfaf402a8% %0xa6247730% = %0xa79c0868% 
ENDSCRIPT

SCRIPT %0xf449a8a7% 
	%0xfaf402a8% %0xa6247730% = %0xf0cb5476% 
ENDSCRIPT

SCRIPT %0x747367c6% 
	%0xfaf402a8% %0xa6247730% = %0x589d0d5e% 
ENDSCRIPT

SCRIPT %0xac387de8% 
	%0xfaf402a8% %0xa6247730% = %0x5de81d56% 
ENDSCRIPT

SCRIPT %0x55b2d0ca% 
	%0xfaf402a8% %0xa6247730% = %0x7a123d78% 
ENDSCRIPT

SCRIPT %0xab4ef55% 
	%0xfaf402a8% %0xa6247730% = %0x269ca1be% 
ENDSCRIPT

SCRIPT %0x1fd64008% 
	%0xfaf402a8% %0xd12347a6% = %0x269ca1be% 
ENDSCRIPT

SCRIPT %0x15e32cf0% 
	%0xd16453c8% %0xe8e878f9% %0x7031f10c% = { %0x9f92ba78% = <0x9f92ba78> <...> } 
ENDSCRIPT

SCRIPT %0xe8e878f9% 
	IF %0xdef3e72f% <0x9f92ba78> 
		%0xe553a5b8% 
		%0x383b939b% 0 
		IF %0xcf66717b% %0x81a43b37% 
			%0x10c1c887% %0x424d9ea% = 10 
		ENDIF 
		%0x8819dd8b% %0xa1dc81f9% = <0x9f92ba78> %0x90a91232% %0xd607e2e6% 
		%0xad9fa37f% %0x3b1001b6% 
	ENDIF 
ENDSCRIPT

SCRIPT %0xf8a56e54% 
	%0x2de8c60e% "************ CLEANING UP SYSTEM ***************" 
	IF %0x437b2131% %0x40c698af% = %0x56a1eae3% 
		%0x3c15e9b6% %0x40c698af% = %0x56a1eae3% 
		%0x8ff6d21d% 
		%0x90356cb9% { 
			%0x40c698af% = %0x56a1eae3% 
			%0x475bf03c% = [ 
				{ %0x2e6ef8e7% %0x7a308ac6% } 
			] 
			%0x3f93a1ef% 
			%0x90436bd9% = { %0xcdc00e63% = %0xd443a2bc% } 
		} 
		%0x27690abe% %0x7321a8d6% = %0x9d3fb516% %0xb990d003% = %0x56a1eae3% 
		IF NOT %0xcf66717b% %0xec6ecc43% 
			%0xd10c7f04% 
		ENDIF 
	ENDIF 
	IF %0x86d7838a% 
		%0x7d5d29a9% %0x4f653b0b% 
	ENDIF 
ENDSCRIPT

SCRIPT %0xa66c1c31% 
	%0x82117c1a% 1 %0xfc37df05% 
	%0xc6870028% 
ENDSCRIPT

SCRIPT %0x55ff25ce% { 
		%0x5bffe255% = 12 
		%0xf0d90109% = 20 
		%0x2b0cfca1% = %0xe82ab15c% 
	} 
	<0x3989d7d6> : %0x82a0a873% <0x5bffe255> 
	%0x1127430c% %0xf5b2a042% 
	%0x1127430c% %0x91bcad1d% 
	%0x6ed6f8e8% %0xf8728bec% = %0xf5b2a042% %0xa6d2d890% = %0x4ed33534% %0x7031f10c% = <...> 
ENDSCRIPT

SCRIPT %0x4ed33534% 
	IF NOT <0xf79c90ae> : %0x7015bc33% 
		RETURN 
	ENDIF 
	%0x1127430c% %0xf5b2a042% 
	IF %0x437b2131% %0x40c698af% = %0xda864d4b% 
		<0x9e7d9864> = 0 
		IF %0x5b8ab877% : %0xa901a50c% 
			<0x9e7d9864> = 1 
		ENDIF 
		IF %0xe565465b% 0 
			<0x9e7d9864> = 1 
		ENDIF 
		IF <0xf79c90ae> : %0x58ad903f% 
			<0x9e7d9864> = 1 
		ENDIF 
		IF NOT %0x20d1f30e% 
			<0x9e7d9864> = 1 
		ENDIF 
		IF %0xf1c16c72% 
			<0x9e7d9864> = 1 
		ENDIF 
		IF ( <0x9e7d9864> = 1 ) 
			%0x3c15e9b6% %0x40c698af% = %0xda864d4b% 
		ENDIF 
		%0x6ed6f8e8% %0xf8728bec% = %0xf5b2a042% %0xa6d2d890% = %0x4ed33534% %0x7031f10c% = <...> 
	ELSE 
		IF %0x437b2131% %0x40c698af% = %0x56a1eae3% 
			%0x56a1eae3% : %0x3611c136% 
			IF %0xcf66717b% %0xcdc00e63% 
				IF ( <0xcdc00e63> = %0xf649d637% ) 
					%0x6ed6f8e8% %0xf8728bec% = %0xf5b2a042% %0xa6d2d890% = %0x4ed33534% %0x7031f10c% = <...> 
					RETURN 
				ENDIF 
			ENDIF 
		ENDIF 
		IF NOT %0x20d1f30e% 
			IF NOT %0xa1da6fe9% 
				%0x6ed6f8e8% %0xf8728bec% = %0xf5b2a042% %0xa6d2d890% = %0x4ed33534% %0x7031f10c% = <...> 
				RETURN 
			ENDIF 
		ENDIF 
		IF %0xf1c16c72% 
			%0x6ed6f8e8% %0xf8728bec% = %0xf5b2a042% %0xa6d2d890% = %0x4ed33534% %0x7031f10c% = <...> 
			RETURN 
		ENDIF 
		IF <0xf79c90ae> : %0x5ea287f2% 
			IF NOT <0xf79c90ae> : %0xa901a50c% 
				IF NOT <0xf79c90ae> : %0x58ad903f% 
					IF NOT %0xe565465b% 0 
						%0x8cb5d0c0% <0x5bffe255> 
						%0x6ed6f8e8% %0xf8728bec% = %0x91bcad1d% %0xa6d2d890% = %0x4ca0ddfb% %0x7031f10c% = <...> 
						IF NOT %0xcf66717b% %0x1e40141b% 
							IF NOT %0xcf66717b% %0x2ab66cb8% 
								<0x2ab66cb8> = "Ped" 
							ENDIF 
							%0x9277f428% %0xff0db407% = %0x1e40141b% "%s: \\m5 to talk." %0xe4f130f4% = <0x2ab66cb8> 
						ENDIF 
						IF %0x437b2131% %0x40c698af% = %0xda864d4b% 
							%0x3c15e9b6% %0x40c698af% = %0xda864d4b% 
						ENDIF 
						%0xe0c4da1a% { 
							%0x8a2283d9% = %0xda864d4b% 
							%0xc4745838% = <0x1e40141b> 
							%0xb75507ba% 
							%0xf9e22a0b% 
							%0xbc8e542c% = %0x2cc7781d% 
							%0x2fc1dde5% = <...> 
							%0x30d8f7ec% = [ 100 100 100 128 ] 
							%0x3815b38f% = [ 128 128 128 128 ] 
							%0x7f261953% = PAIR(320.00000000000, 400.00000000000) 
							%0x57710f31% = 5 
						} 
						%0xda864d4b% : %0x23a4e5c2% %0x3b0541b8% %0x7031f10c% = { %0x3989d7d6% = <0x3989d7d6> } 
					ELSE 
						%0x6ed6f8e8% %0xf8728bec% = %0xf5b2a042% %0xa6d2d890% = %0x4ed33534% %0x7031f10c% = <...> 
						RETURN 
					ENDIF 
				ELSE 
					%0x6ed6f8e8% %0xf8728bec% = %0xf5b2a042% %0xa6d2d890% = %0x4ed33534% %0x7031f10c% = <...> 
					RETURN 
				ENDIF 
			ELSE 
				%0x6ed6f8e8% %0xf8728bec% = %0xf5b2a042% %0xa6d2d890% = %0x4ed33534% %0x7031f10c% = <...> 
				RETURN 
			ENDIF 
		ELSE 
			%0x6ed6f8e8% %0xf8728bec% = %0xf5b2a042% %0xa6d2d890% = %0x4ed33534% %0x7031f10c% = <...> 
			RETURN 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT %0x2cc7781d% 
	IF <0xf79c90ae> : %0xa901a50c% 
		RETURN 
	ENDIF 
	IF <0xf79c90ae> : %0x58ad903f% 
		RETURN 
	ENDIF 
	%0xd7eda0a9% 
	IF NOT %0x437b2131% %0x40c698af% = <0x3989d7d6> 
		RETURN 
	ENDIF 
	%0x240cb86f% %0x7323e97c% %0x906b67ba% = 0.50000000000 
	IF <0xf79c90ae> : %0x5ea287f2% 
		IF NOT %0xe565465b% 0 
			%0x82117c1a% 5 %0x4a07c332% 
			IF <0xf79c90ae> : %0x5ea287f2% 
				%0xabfdfa21% <...> 
			ELSE 
				IF NOT <0xf79c90ae> : %0x1d604a9d% 
					IF NOT <0xf79c90ae> : %0x78238598% 
						IF NOT <0xf79c90ae> : %0x89aa9b5f% 
							IF NOT <0xf79c90ae> : %0x83028fc5% 
								%0xabfdfa21% <...> 
							ENDIF 
						ENDIF 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ELSE 
		IF NOT <0xf79c90ae> : %0x1d604a9d% 
			IF NOT <0xf79c90ae> : %0x78238598% 
				IF NOT <0xf79c90ae> : %0x89aa9b5f% 
					IF NOT <0xf79c90ae> : %0x83028fc5% 
						%0xabfdfa21% <...> 
					ENDIF 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT %0xabfdfa21% 
	IF NOT %0xcf66717b% %0xa2e6e9f3% 
		IF NOT %0x20985922% %0x7de8ca6c% 
			IF NOT %0x20985922% %0x5a2c589a% 
				%0x6ab610c2% 
			ENDIF 
		ENDIF 
	ENDIF 
	%0x15da80af% 
	%0x1127430c% %0xf5b2a042% 
	IF %0x437b2131% %0x40c698af% = %0xda864d4b% 
		%0x3c15e9b6% %0x40c698af% = %0xda864d4b% 
	ENDIF 
	IF %0xcf66717b% %0x27c20e35% 
		%0xcd0dc02d% %0xa1dc81f9% = %0xaf535f62% 
		%0xfb03ab35% 
		%0x9eb6e336% %0xaf535f62% %0x7031f10c% = { %0x906b67ba% = 250 } 
		%0x5b8ab877% : %0x23a4e5c2% %0x27c20e35% %0x7031f10c% = <0x85f0f1b7> 
	ENDIF 
	IF %0xcf66717b% %0x88fbaa12% 
		<0xf79c90ae> : %0x23a4e5c2% <0x88fbaa12> %0x7031f10c% = { %0x3989d7d6% = <0x3989d7d6> <0xb45e76f9> } 
	ENDIF 
	IF %0xcf66717b% %0xa1be3f46% 
		%0xe507281c% %0xa1dc81f9% = <0xa1be3f46> 
	ENDIF 
	IF %0xcf66717b% %0xc4745838% 
		%0xe0c4da1a% <...> %0xf9e22a0b% 
	ENDIF 
ENDSCRIPT

SCRIPT %0x4ca0ddfb% 
	IF %0xcf66717b% %0xdb1e28cd% 
		IF %0xcf66717b% %0x5f3602f5% 
			IF NOT ( <0x5f3602f5> = <0xdb1e28cd> ) 
				RETURN 
			ENDIF 
		ENDIF 
	ENDIF 
	IF %0xcf66717b% %0xda5f2bd3% 
		%0xb610332% <...> 
	ENDIF 
	%0x1127430c% %0x91bcad1d% 
	%0xd7eda0a9% %0x8a2283d9% = %0xda864d4b% 
	%0x786432d% <...> 
ENDSCRIPT

SCRIPT %0x786432d% 
	IF %0xcf66717b% %0xef02ee30% 
		<0xef02ee30> <0x7c4d67f9> 
	ENDIF 
	IF NOT %0xcf66717b% %0x4894884d% 
		%0x55ff25ce% <...> 
	ENDIF 
ENDSCRIPT

SCRIPT %0xe82ab15c% 
	%0x256d34c1% 
	%0xd7eda0a9% 
ENDSCRIPT

SCRIPT %0x3b0541b8% 
	IF NOT %0xcf66717b% %0x3989d7d6% 
		RETURN 
	ENDIF 
	%0xefc4a5ac% = 1 
	BEGIN 
		IF NOT %0xdef3e72f% <0x3989d7d6> 
			%0xefc4a5ac% = 0 
		ENDIF 
		IF NOT %0x2712fb96% %0xa1dc81f9% = <0x3989d7d6> 
			%0xefc4a5ac% = 0 
		ENDIF 
		IF ( <0xefc4a5ac> = 0 ) 
			%0x27690abe% %0x7321a8d6% = %0x85563a76% 
			%0xc6870028% 
			RETURN 
		ENDIF 
		%0x82117c1a% 1 %0xb99ae3d6% 
	REPEAT 
ENDSCRIPT

SCRIPT %0x2eccf8ae% <...> 
	%0x2de8c60e% "ASSERT MESSAGE:" 
	%0xa8ee7357% <...> 
ENDSCRIPT

SCRIPT %0x3425baa2% 
	IF %0xcf66717b% %0x7019d766% 
		%0x9dfb503% <...> 
	ELSE 
		IF %0xcf66717b% %0x7323e97c% 
			IF %0xcf66717b% %0x424d9ea% 
				%0x9dfb503% <...> 
			ELSE 
				%0x69f92875% <...> 
			ENDIF 
		ELSE 
			IF %0xcf66717b% %0x424d9ea% 
				%0x1efe18e3% <...> 
			ELSE 
				%0x2eccf8ae% "GetStackedScreenElementPos called without an axis" 
			ENDIF 
		ENDIF 
	ENDIF 
	RETURN %0x7f261953% = <0x7f261953> 
ENDSCRIPT

SCRIPT %0x69f92875% 
	%0xce4afdd9% %0x40c698af% = <0x40c698af> 
	%0x406dd761% %0x40c698af% = <0x40c698af> 
	<0x7a6300cc> = PAIR(1.00000000000, 0.00000000000) 
	IF %0xcf66717b% %0xd0771c81% 
		<0x7a6300cc> = PAIR(-1.00000000000, 0.00000000000) 
	ENDIF 
	IF %0xcf66717b% %0xa6f5352f% 
		RETURN %0x7f261953% = ( <0x62a4596> + ( <0x7a6300cc> * <0x73e5bad0> + <0xa6f5352f> ) ) 
	ELSE 
		RETURN %0x7f261953% = ( <0x62a4596> + ( <0x7a6300cc> * <0x73e5bad0> ) ) 
	ENDIF 
ENDSCRIPT

SCRIPT %0x1efe18e3% 
	%0xce4afdd9% %0x40c698af% = <0x40c698af> 
	%0x406dd761% %0x40c698af% = <0x40c698af> 
	<0x7a6300cc> = PAIR(0.00000000000, 1.00000000000) 
	IF %0xcf66717b% %0xd0771c81% 
		<0x7a6300cc> = PAIR(0.00000000000, -1.00000000000) 
	ENDIF 
	IF %0xcf66717b% %0xa6f5352f% 
		RETURN %0x7f261953% = ( <0x62a4596> + ( <0x7a6300cc> * <0xab21af0> + <0xa6f5352f> ) ) 
	ELSE 
		RETURN %0x7f261953% = ( <0x62a4596> + ( <0x7a6300cc> * <0xab21af0> ) ) 
	ENDIF 
ENDSCRIPT

SCRIPT %0x9dfb503% 
	%0xce4afdd9% %0x40c698af% = <0x40c698af> 
	%0x406dd761% %0x40c698af% = <0x40c698af> 
	<0xfb13cbfd> = PAIR(1.00000000000, 0.00000000000) 
	<0x3a9d143d> = PAIR(0.00000000000, 1.00000000000) 
	IF %0xcf66717b% %0xd0771c81% 
		<0xfb13cbfd> = PAIR(-1.00000000000, 0.00000000000) 
		<0x3a9d143d> = PAIR(0.00000000000, -1.00000000000) 
	ENDIF 
	IF %0xcf66717b% %0xa6f5352f% 
		RETURN %0x7f261953% = ( <0x62a4596> + ( <0x3a9d143d> * <0xab21af0> + <0xfb13cbfd> * <0x73e5bad0> + <0xa6f5352f> ) ) 
	ELSE 
		RETURN %0x7f261953% = ( <0x62a4596> + ( <0x3a9d143d> * <0xab21af0> + <0xfb13cbfd> * <0x73e5bad0> ) ) 
	ENDIF 
ENDSCRIPT

SCRIPT %0xbda66e7d% 
	IF NOT %0x9cb87e60% 
		%0xcd0dc02d% %0xa1dc81f9% = %0x457302c2% 
		%0xcd0dc02d% %0xa1dc81f9% = %0x3c9f2db9% 
		%0x44e22a1% <0x6086aa70> 
	ENDIF 
ENDSCRIPT

SCRIPT %0x457302c2% 
	IF %0xcf66717b% %0x75a6e539% 
		BEGIN 
			IF ( <0x6086aa70> < <0xff03cc4e> ) 
				%0x44e22a1% <0xff03cc4e> 
				BREAK 
			ENDIF 
			%0x44e22a1% <0x6086aa70> 
			<0x6086aa70> = ( <0x6086aa70> - <0xf0d90109> ) 
			%0x82117c1a% 1 %0xfc37df05% 
		REPEAT 
		RETURN 
	ENDIF 
	IF NOT %0x9cb87e60% 
		BEGIN 
			IF ( <0x6086aa70> < <0xff03cc4e> ) 
				%0x44e22a1% <0xff03cc4e> 
				BREAK 
			ENDIF 
			%0x44e22a1% <0x6086aa70> 
			<0x6086aa70> = ( <0x6086aa70> - <0xf0d90109> ) 
			%0x82117c1a% 1 %0xfc37df05% 
		REPEAT 
	ENDIF 
ENDSCRIPT

SCRIPT %0x3c9f2db9% 
	IF %0xcf66717b% %0x75a6e539% 
		BEGIN 
			IF ( <0x6086aa70> > <0xff03cc4e> ) 
				%0x44e22a1% <0xff03cc4e> 
				BREAK 
			ENDIF 
			%0x44e22a1% <0x6086aa70> 
			<0x6086aa70> = ( <0x6086aa70> + <0xf0d90109> ) 
			%0x82117c1a% 1 %0xfc37df05% 
		REPEAT 
		RETURN 
	ENDIF 
	IF NOT %0x9cb87e60% 
		BEGIN 
			IF ( <0x6086aa70> > <0xff03cc4e> ) 
				%0x44e22a1% <0xff03cc4e> 
				BREAK 
			ENDIF 
			%0x44e22a1% <0x6086aa70> 
			<0x6086aa70> = ( <0x6086aa70> + <0xf0d90109> ) 
			%0x82117c1a% 1 %0xfc37df05% 
		REPEAT 
	ENDIF 
ENDSCRIPT

SCRIPT %0xf7e902c% 
ENDSCRIPT

SCRIPT %0x5b8aea88% 
	%0xd05cbe31% 
	%0xb6ef4a79% 
	IF %0xcf66717b% %0xc9428a08% 
		<0xad46922> = <0xc9428a08> 
	ELSE 
		<0xad46922> = <0xb30d9965> 
	ENDIF 
	%0x875b712b% %0xc52d1a41% = <0x3c64476b> %0xb30d9965% = <0xad46922> 
	%0x9eb6e336% %0xcfe4921e% %0x7031f10c% = <...> 
	%0x78628abd% 
	%0xbfa801df% %0x77a5662c% = 1 
ENDSCRIPT

SCRIPT %0xcfe4921e% 
	%0x58b51f2% %0xcdc3d2fd% = <0x3c64476b> %0xb30d9965% = <0xad46922> 
ENDSCRIPT

SCRIPT %0x34f7ea8c% %0xb990d003% = 8421504 %0x9e497fc6% = 0 
	IF %0xcf66717b% %0xc7434d17% 
		IF %0xcf66717b% %0x40c698af% 
			%0x56e5babd% %0x9e497fc6% = <0xc7434d17> %0x40c698af% = <0x40c698af> %0x6c4e7971% = <0x6c4e7971> 
		ELSE 
			IF %0xcf66717b% %0x6c4e7971% 
				%0x56e5babd% %0x9e497fc6% = <0xc7434d17> %0x6c4e7971% = <0x6c4e7971> 
			ELSE 
				%0x56e5babd% %0x9e497fc6% = <0xc7434d17> %0x6c4e7971% = %0xc336047% 
			ENDIF 
		ENDIF 
	ENDIF 
	IF %0xcf66717b% %0x99a9b716% 
		IF NOT %0xcf66717b% %0xf9d98b10% 
			<0xf9d98b10> = <0x99a9b716> 
		ENDIF 
		%0xcae0a8de% %0x99a9b716% = <0x99a9b716> %0xf9d98b10% = <0xf9d98b10> %0x7e4813a7% = <0x7e4813a7> 
	ENDIF 
ENDSCRIPT

SCRIPT %0xda8f678f% 
	%0xae46a698% 
	%0x2de8c60e% 
	%0x2de8c60e% "Dumping Metrics Structure" 
	%0xbe304e86% <...> 
ENDSCRIPT

%0x67471688% = { 
	%0x9b10525c% = 0 
	%0x2c5ea34% = 0 
	%0xdd755518% = 0 
	%0x4a6bf967% = 0 
	%0xac30a9d% = 0 
	%0x969d3af6% = 0 
	%0x1e3061ee% = 0 
	%0x5714c480% = 0 
} 
%0x918e5ff4% = { 
	%0x286a8d26% = "gameobjects\\skate\\letter_a\\letter_a.mdl" 
} 
%0xf44da720% = [ 
	{ %0xb6015ea8% = %0x7713c7b% } 
	{ %0xb6015ea8% = %0xf1641e3% } 
] 
%0x735a20ba% = [ 
	{ %0xb6015ea8% = %0xce0ca665% } 
	{ %0xb6015ea8% = %0xa015e17% } 
	{ %0xb6015ea8% = %0x1d5b1ae6% } 
	{ %0xb6015ea8% = %0x7713c7b% } 
] 
SCRIPT %0xa98f5c63% 
	%0x406998a5% %0xb6015ea8% = %0xce0ca665% <...> 
	%0x406998a5% %0xb6015ea8% = %0xffb39248% <...> 
	IF %0xcf66717b% %0xbaa84d21% 
		%0x406998a5% %0xb6015ea8% = %0x1d5b1ae6% 
	ENDIF 
	%0x406998a5% %0xb6015ea8% = %0x286a8d26% <...> 
	%0x406998a5% %0xb6015ea8% = %0x7713c7b% <...> 
	IF %0xcf66717b% %0x6d09024a% 
		%0x406998a5% %0xb6015ea8% = %0x5cb5cb7e% 
	ENDIF 
ENDSCRIPT

%0xa04d4cba% = [ 
	{ %0xb6015ea8% = %0xce0ca665% } 
	{ %0xb6015ea8% = %0xa9db601e% } 
] 
%0x30670643% = [ 
	{ %0xb6015ea8% = %0xce0ca665% } 
	{ %0xb6015ea8% = %0xa015e17% } 
	{ %0xb6015ea8% = %0xa9db601e% } 
] 
%0x5cd45c53% = [ 
	{ %0xb6015ea8% = %0x81c7122d% } 
	{ %0xb6015ea8% = %0x5e43a604% } 
	{ %0xb6015ea8% = %0xc7d37ec2% } 
	{ %0xb6015ea8% = %0xc4e311fa% } 
	{ %0xb6015ea8% = %0x27d7cd28% } 
] 
%0xf8c09b21% = [ 
	{ %0xb6015ea8% = %0xc4e311fa% } 
] 
%0xf21683f4% = [ 
	{ %0xb6015ea8% = %0xc4e311fa% } 
] 
%0x5ca856af% = 
[ 
	{ %0xb6015ea8% = %0xc4e311fa% } 
] 
%0xfdb4af89% = 
[ 
	{ %0xb6015ea8% = %0xce0ca665% } 
	{ %0xb6015ea8% = %0xa9db601e% } 
] 
%0x5c1d3e59% = 
[ 
	{ %0xb6015ea8% = %0x41272956% } 
	{ %0xb6015ea8% = %0xce0ca665% } 
	{ %0xb6015ea8% = %0x6259b52b% } 
	{ %0xb6015ea8% = %0xa9db601e% } 
] 
SCRIPT %0x15674315% 
	IF NOT ( %0x968f7408% = 0 ) 
		%0x1f2cd2b% %0x40c698af% = %0xeb17151b% 
		RETURN 
	ENDIF 
	IF %0x94da6b4b% 
		%0x1f2cd2b% %0x40c698af% = %0x967c138c% 
	ELSE 
		IF NOT %0xe274eee1% 
			%0x1f2cd2b% %0x40c698af% = %0x967c138c% 
		ELSE 
			IF NOT %0x5b8ab877% : %0xee584cbc% 
				%0x1f2cd2b% %0x40c698af% = %0x967c138c% 
			ELSE 
				%0x1f2cd2b% %0x40c698af% = %0xf6124f01% 
			ENDIF 
		ENDIF 
	ENDIF 
	IF NOT %0x3028488b% %0xe92ecafe% 
		IF NOT %0x3028488b% %0xa368b4f1% 
			IF NOT %0x94da6b4b% 
				IF %0xe274eee1% 
					%0x5b8ab877% : %0x347ff11b% 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT %0xdf00bdff% 
	IF NOT %0x3028488b% %0xe92ecafe% 
		IF NOT %0x3028488b% %0xa368b4f1% 
			IF NOT %0x94da6b4b% 
				IF NOT %0x8e55af45% %0x2e0b1465% = %0x406e5a16% 
					%0x5b8ab877% : %0xf951aa64% 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT %0xb0d022f1% 
	IF NOT %0x437b2131% %0x40c698af% = %0x9d6bdaa5% 
		%0xeb117fd0% %0x62f3a0f3% 
		%0x2de8c60e% "Creating camera on front end heap" 
		%0x880d9f7c% { 
			%0x11b70a02% = %0x5ca856af% 
			%0x7031f10c% = { %0xa1dc81f9% = %0x9d6bdaa5% } 
		} 
		%0x3417c307% 
	ENDIF 
ENDSCRIPT

SCRIPT %0x6a8c4aa4% 
	%0x522de3e6% = %0x967c138c% 
	IF %0x9cb87e60% 
		IF %0x62be1f30% 
			%0x500eb224% 
			IF NOT %0x940cde9c% %0x174841bc% = <0x830ecaf> %0x8e411006% = 0 
				%0x522de3e6% = %0xe17b231a% 
			ENDIF 
		ENDIF 
	ENDIF 
	RETURN %0x75bb027a% = <0x522de3e6> 
ENDSCRIPT

SCRIPT %0x3d86e1fe% 
	%0x6a8c4aa4% 
	<0x75bb027a> : %0xb8f23899% <...> 
ENDSCRIPT

SCRIPT %0x360035a4% 
	%0x6a8c4aa4% 
	<0x75bb027a> : %0xe3b327c0% <...> 
ENDSCRIPT

SCRIPT %0xa4413b8b% 
	%0x6a8c4aa4% 
	<0x75bb027a> : %0x75a516d3% <...> 
ENDSCRIPT

SCRIPT %0x3f5cdb8a% 
ENDSCRIPT

SCRIPT %0xa2f33d42% 
	%0x41786af5% 
	%0x5b8ab877% : %0x5436a335% 
	%0x5b8ab877% : %0xc4c8c400% 
	%0x5b8ab877% : %0xbce85494% 
ENDSCRIPT

SCRIPT %0x7fa39d17% 
	%0x2de8c60e% "ResetLookAround is not currently working....." 
ENDSCRIPT

SCRIPT %0x272cdf9d% 
	SWITCH %0x3214c818% 
		CASE 0 
			%0xbfa801df% %0x3214c818% = 2 
		CASE 1 
			%0xbfa801df% %0x3214c818% = 2 
		CASE 2 
			%0xbfa801df% %0x3214c818% = 1 
	ENDSWITCH 
ENDSCRIPT

SCRIPT %0xbda17a2e% %0xffff9a1c% = %0x5b8ab877% %0xe169baad% = 0 %0x966e8a3b% = 0 %0xf67db81% = 0 
	<0xffff9a1c> : %0xe90aad2d% 
	<0xffff9a1c> : %0xb9ed09d2% 
	%0xabf5aabe% = ( VECTOR(1.00000000000, 0.00000000000, 0.00000000000) * <0x7323e97c> + VECTOR(0.00000000000, 1.00000000000, 0.00000000000) * <0x424d9ea> + VECTOR(0.00000000000, 0.00000000000, 1.00000000000) * <0x9d2d8850> ) 
	%0x45fbcb92% = ( VECTOR(0.00000000000, 1.00000000000, 0.00000000000) * <0xabf5aabe> ) 
	%0x32fcfb04% = ( <0xabf5aabe> * <0x45fbcb92> ) 
	%0x7f261953% = ( <0x7f261953> + <0xe169baad> * <0x45fbcb92> + <0x966e8a3b> * <0x32fcfb04> + <0xf67db81> * <0xabf5aabe> ) 
	RETURN %0x7323e97c% = ( <0x7f261953> . VECTOR(1.00000000000, 0.00000000000, 0.00000000000) ) %0x424d9ea% = ( <0x7f261953> . VECTOR(0.00000000000, 1.00000000000, 0.00000000000) ) %0x9d2d8850% = ( <0x7f261953> . VECTOR(0.00000000000, 0.00000000000, 1.00000000000) ) %0x7f261953% = <0x7f261953> 
ENDSCRIPT

SCRIPT %0x3119a96a% 
	IF %0xcf66717b% %0x6c4e7971% 
		%0xf8d6a996% %0x6c4e7971% = <0x6c4e7971> 
		%0x70291f04% %0x6c4e7971% = <0x6c4e7971> 
	ELSE 
		IF %0xcf66717b% %0xa1dc81f9% 
			IF %0xdef3e72f% <0xa1dc81f9> 
				%0xf8d6a996% %0xa1dc81f9% = <0xa1dc81f9> 
				%0x70291f04% %0xa1dc81f9% = <0xa1dc81f9> 
			ELSE 
				%0x2de8c60e% "### Forced_Create: %n does not exist" %0x87f75c2d% = <0xa1dc81f9> 
			ENDIF 
		ELSE 
			%0x2de8c60e% "### Forced_Create: Must specifiy a name or prefix" 
		ENDIF 
	ENDIF 
ENDSCRIPT

%0xf17b2f98% = 0 
%0xadcfedf9% = 0 
%0x2d1599e0% = 0 
%0x741874a5% = 0 
SCRIPT %0xf59d2e60% 
	IF ( %0xadcfedf9% ) 
	ELSE 
		IF %0x683b3904% 
			%0xa7684367% "anims.pre" 
			%0xbf0b55a3% "Permanent Anims" 
			%0xeb117fd0% %0x8fdb68af% 
			%0x4157c5d4% 
			%0x3417c307% 
			%0x8ba3ef43% 
			%0xa523c488% "anims.pre" 
		ELSE 
			%0x7195a6a5% 
			%0xbf0b55a3% "Permanent Anims" 
			%0xeb117fd0% %0x8fdb68af% 
			%0xf240ef57% 1 
			%0xbf0b55a3% "Permanent Anim Pipped PRE" 
			%0xb7d3ab43% "anims.pre" 
			%0x8ba3ef43% 
			%0x4157c5d4% %0x23028e29% 
			%0xf240ef57% 0 
			%0x3417c307% 
			%0x8ba3ef43% 
		ENDIF 
		%0xbfa801df% %0xadcfedf9% = 1 
	ENDIF 
ENDSCRIPT

SCRIPT %0x9e9aac42% 
	IF NOT %0x683b3904% 
		IF ( %0xadcfedf9% ) 
			%0x4157c5d4% %0xfa780c55% = %0x8bfbbcae% 
			%0x2de8c60e% " ------------------ UnloadPipPre anims.pre" 
			IF NOT %0x91c74e80% "anims.pre" 
				%0x2eccf8ae% "couldn\'t unload pip pre" 
			ENDIF 
			%0xbfa801df% %0xadcfedf9% = 0 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT %0xa49ee0c3% %0x43335e83% = 1 
	%0x2de8c60e% "**************************** do_load_unloadable" 
	IF %0xa1da6fe9% 
		%0x43335e83% = 0 
	ENDIF 
	IF ( <0x43335e83> = 1 ) 
		IF ( %0x2d1599e0% ) 
		ELSE 
			IF ( %0x741874a5% ) 
				%0x7195a6a5% 
			ENDIF 
			%0xf59d2e60% 
			IF %0x683b3904% 
				%0xa7684367% "unloadableanims.pre" 
				%0xbf0b55a3% "Unloadable Anims" 
				%0xeb117fd0% %0x8fdb68af% 
				%0x7da9431f% 
				%0x3417c307% 
				%0x8ba3ef43% 
				%0xa523c488% "unloadableanims.pre" 
			ELSE 
				%0xbf0b55a3% "Unloadable Anims" 
				%0xeb117fd0% %0x8fdb68af% 
				%0xbf0b55a3% "Unloadable Anims Pipped PRE" 
				%0xb7d3ab43% "unloadableanims.pre" 
				%0x8ba3ef43% 
				%0xf240ef57% 1 
				%0x7da9431f% %0x23028e29% 
				%0xf240ef57% 0 
				%0x3417c307% 
				%0x8ba3ef43% 
			ENDIF 
			%0xbfa801df% %0x2d1599e0% = 1 
		ENDIF 
	ELSE 
		IF NOT %0x683b3904% 
			IF ( %0x741874a5% ) 
			ELSE 
				IF ( %0x2d1599e0% ) 
					%0x7195a6a5% 
				ENDIF 
				%0x9e9aac42% 
				%0xbf0b55a3% "Net Anims" 
				%0xeb117fd0% %0x8fdb68af% 
				%0xb7d3ab43% "Netanims.pre" 
				%0xf240ef57% 1 
				%0x72ad2eb2% %0x23028e29% 
				%0xf240ef57% 0 
				%0x3417c307% 
				%0x8ba3ef43% 
				%0xbfa801df% %0x741874a5% = 1 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT %0x7195a6a5% 
	IF NOT %0x683b3904% 
		IF ( %0x2d1599e0% ) 
			%0x7da9431f% %0xfa780c55% = %0x8bfbbcae% 
			IF NOT %0x91c74e80% "unloadableanims.pre" 
			ENDIF 
			%0xbfa801df% %0x2d1599e0% = 0 
		ENDIF 
		IF ( %0x741874a5% ) 
			%0x72ad2eb2% %0xfa780c55% = %0x8bfbbcae% 
			IF NOT %0x91c74e80% "netanims.pre" 
				%0x2eccf8ae% "couldn\'t unload pip pre" 
			ENDIF 
			%0xbfa801df% %0x741874a5% = 0 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT %0xbdc2940b% 
	IF ( %0xadcfedf9% ) 
		%0x2de8c60e% "PERMANENT" 
	ENDIF 
	IF ( %0x2d1599e0% ) 
		%0x2de8c60e% "UNLOADABLE" 
	ENDIF 
	IF ( %0x741874a5% ) 
		%0x2de8c60e% "NET" 
	ENDIF 
ENDSCRIPT

SCRIPT %0xb64087d3% 
	%0x38b87d17% 
	<0x966014ff> = ( <0xdf3d6451> . %0x966014ff% ) 
	<0x5f727131> = ( <0xdf3d6451> . %0x5f727131% ) 
	<0x1c5d554e> = ( <0xdf3d6451> . %0x1c5d554e% ) 
	%0x413b766d% <...> %0x99a9b716% = ( %0x966014ff% + ( %0x5f727131% * 256 ) + ( %0x1c5d554e% * 65536 ) ) 
ENDSCRIPT

SCRIPT %0xc6b9075e% 
	%0x542f3182% 
	IF %0xcf66717b% %0x56765af9% 
		%0xf8d6a996% %0x6c4e7971% = <0x56765af9> 
	ELSE 
		%0x2de8c60e% " >>>>>>>> WARNING: NO GEO PREFIX SENT TO KillCreateSponsorGeo >>>>>>>>>>> " 
		RETURN 
	ENDIF 
	IF %0xcf66717b% %0xef90b5d5% 
		%0xf8d6a996% %0x6c4e7971% = <0xef90b5d5> 
	ENDIF 
	SWITCH <0x7e73362b> 
		CASE %0xc855f1c3% 
			%0x2de8c60e% "I\'m on Birdhouse!" 
			%0x70291f04% %0x6c4e7971% = <0x97df778b> 
		CASE %0xf4d1af84% 
			%0x2de8c60e% "I\'m on Element!" 
			%0x70291f04% %0x6c4e7971% = <0xde6c04b0> 
		CASE %0x85a3584a% 
			%0x2de8c60e% "I\'m on Flip!" 
			%0x70291f04% %0x6c4e7971% = <0x1a48bd91> 
		CASE %0x86e36a11% 
			%0x2de8c60e% "I\'m on Girl!" 
			%0x70291f04% %0x6c4e7971% = <0x386e51dd> 
		CASE %0xb4834d8d% 
			%0x2de8c60e% "I\'m on Zero!" 
			%0x70291f04% %0x6c4e7971% = <0xc9bf3f7c> 
		DEFAULT 
			IF %0xcf66717b% %0xef90b5d5% 
				%0x70291f04% %0x6c4e7971% = <0xef90b5d5> 
			ENDIF 
	ENDSWITCH 
ENDSCRIPT

SCRIPT %0xcc26a5e0% 
	%0x8ccda669% %0x17dae143% = %0x9f7b7843% %0x1cb2a6b0% 
	SWITCH <0x21902065> 
		CASE %0xf6c5d908% 
			RETURN %0x1cb2a6b0% = 2 
		CASE %0x81c2e99e% 
			RETURN %0x1cb2a6b0% = 3 
		CASE %0x1fa67c3d% 
			RETURN %0x1cb2a6b0% = 4 
		CASE %0x68a14cab% 
			RETURN %0x1cb2a6b0% = 5 
		CASE %0xf1a81d11% 
			RETURN %0x1cb2a6b0% = 6 
		CASE %0x86af2d87% 
			RETURN %0x1cb2a6b0% = 7 
		CASE %0x16103016% 
			RETURN %0x1cb2a6b0% = 8 
		DEFAULT 
			RETURN %0x1cb2a6b0% = 1 
	ENDSWITCH 
ENDSCRIPT

SCRIPT %0xe611bd5e% %0x3a6ebcfa% = 7.50000000000 
	%0xc8747ef4% %0xec5255f4% %0x7031f10c% = { %0x1acdd701% = <0x1acdd701> %0xf7b39199% = <0xf7b39199> } 
	IF %0xcf66717b% %0x43c00002% 
		%0xc0caac4a% 
		IF ( ( <0xf0d90109> * <0x3a6ebcfa> ) > <0x43c00002> ) 
			IF ( <0xf0d90109> < <0x43c00002> ) 
				<0x84f42d4> = <0x43c00002> 
			ELSE 
				RETURN 
			ENDIF 
		ELSE 
			<0x84f42d4> = ( <0xf0d90109> * <0x3a6ebcfa> ) 
		ENDIF 
		%0x7e5fab39% <0x84f42d4> 
	ELSE 
		IF %0xcf66717b% %0xf0d90109% 
			%0x7e5fab39% <0xf0d90109> 
		ELSE 
			%0x1a06158b% 
			%0x7e5fab39% %0x6187906d% = ( <0x6187906d> * <0x3a6ebcfa> ) %0x1680a0fb% = ( <0x1680a0fb> * <0x3a6ebcfa> ) %0x8f89f141% = ( <0x8f89f141> * <0x3a6ebcfa> ) 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT %0xb8bb83f0% %0x3a6ebcfa% = 7.50000000000 
	%0xc8747ef4% %0x5f2246fe% 
	%0x1a06158b% 
	IF %0xcf66717b% %0xf0d90109% 
		%0x7e5fab39% %0x6187906d% = <0x6187906d> %0x1680a0fb% = <0xf0d90109> %0x8f89f141% = <0x8f89f141> 
	ELSE 
		%0x7e5fab39% %0x6187906d% = <0x6187906d> %0x1680a0fb% = ( <0x1680a0fb> * <0x3a6ebcfa> ) %0x8f89f141% = <0x8f89f141> 
	ENDIF 
ENDSCRIPT

SCRIPT %0x724e68de% 
	%0x2de8c60e% "ForceToWalk" 
	IF %0xe168cfe0% 
		RETURN 
	ENDIF 
	%0x27fddeb7% 
	%0x82117c1a% 1 %0xfc37df05% 
	%0x1fe009c7% 
	IF %0xa901a50c% 
		%0x15036130% %0x7321a8d6% = %0xd5814c1c% 
	ENDIF 
	IF NOT %0x57bfbae8% 
		%0xd16453c8% %0x93a4e402% %0x7031f10c% = { %0x91d0d784% = %0x26f15aee% } 
	ELSE 
		%0xf236c375% 
		%0x57984723% 
		%0xdff61032% 
	ENDIF 
	%0xc4c8c400% 
ENDSCRIPT

SCRIPT %0xc94a0b8d% 
	%0x2de8c60e% "KillForceToWalk" 
	IF %0xe168cfe0% 
		RETURN 
	ENDIF 
	%0x174a6ad9% 
	%0xc4c8c400% 
	%0xf236c375% 
	%0x57984723% 
	%0xdff61032% 
ENDSCRIPT

SCRIPT %0x35b6ac59% 
	IF %0xcf66717b% %0x5ef31148% 
		%0xdb8e7f7a% %0x5ef31148% = <0x5ef31148> 
		RETURN %0x1b1d2788% = <0x1b1d2788> 
	ENDIF 
	%0x5ef31148% = [ -1 , -1 , -1 ] 
	%0x7f8c98fe% = 0 
	%0x5d8a93a5% = %0xda3403b0% 
	%0xc483c21f% = %0xda3403b0% 
	%0xb384f289% = %0xda3403b0% 
	IF %0xcf66717b% %0x726e85aa% 
		%0x5d8a93a5% = 14 
		%0x7f8c98fe% = ( <0x7f8c98fe> + 1 ) 
	ENDIF 
	IF %0xcf66717b% %0x54166acd% 
		SWITCH <0x7f8c98fe> 
			CASE 0 
				%0x5d8a93a5% = 1 
			CASE 1 
				%0xc483c21f% = 1 
		ENDSWITCH 
		%0x7f8c98fe% = ( <0x7f8c98fe> + 1 ) 
	ENDIF 
	IF %0xcf66717b% %0x584cf9e9% 
		SWITCH <0x7f8c98fe> 
			CASE 0 
				%0x5d8a93a5% = 2 
			CASE 1 
				%0xc483c21f% = 2 
			CASE 2 
				%0xb384f289% = 2 
		ENDSWITCH 
		%0x7f8c98fe% = ( <0x7f8c98fe> + 1 ) 
	ENDIF 
	IF %0xcf66717b% %0x69e9e1a7% 
		SWITCH <0x7f8c98fe> 
			CASE 0 
				%0x5d8a93a5% = 3 
			CASE 1 
				%0xc483c21f% = 3 
			CASE 2 
				%0xb384f289% = 3 
		ENDSWITCH 
		%0x7f8c98fe% = ( <0x7f8c98fe> + 1 ) 
	ELSE 
		IF %0xcf66717b% %0xf649d637% 
			SWITCH <0x7f8c98fe> 
				CASE 0 
					%0x5d8a93a5% = 3 
				CASE 1 
					%0xc483c21f% = 3 
				CASE 2 
					%0xb384f289% = 3 
			ENDSWITCH 
			%0x7f8c98fe% = ( <0x7f8c98fe> + 1 ) 
		ENDIF 
	ENDIF 
	IF %0xcf66717b% %0xd443a2bc% 
		SWITCH <0x7f8c98fe> 
			CASE 0 
				%0x5d8a93a5% = 4 
			CASE 1 
				%0xc483c21f% = 4 
			CASE 2 
				%0xb384f289% = 4 
		ENDSWITCH 
		%0x7f8c98fe% = ( <0x7f8c98fe> + 1 ) 
	ENDIF 
	IF %0xcf66717b% %0x83f07e5d% 
		SWITCH <0x7f8c98fe> 
			CASE 0 
				%0x5d8a93a5% = 5 
			CASE 1 
				%0xc483c21f% = 5 
			CASE 2 
				%0xb384f289% = 5 
		ENDSWITCH 
		%0x7f8c98fe% = ( <0x7f8c98fe> + 1 ) 
	ENDIF 
	IF %0xcf66717b% %0xcf74f6b7% 
		SWITCH <0x7f8c98fe> 
			CASE 0 
				%0x5d8a93a5% = 6 
			CASE 1 
				%0xc483c21f% = 6 
			CASE 2 
				%0xb384f289% = 6 
		ENDSWITCH 
		%0x7f8c98fe% = ( <0x7f8c98fe> + 1 ) 
	ENDIF 
	IF %0xcf66717b% %0xa549b57b% 
		SWITCH <0x7f8c98fe> 
			CASE 0 
				%0x5d8a93a5% = 7 
			CASE 1 
				%0xc483c21f% = 7 
			CASE 2 
				%0xb384f289% = 7 
		ENDSWITCH 
		%0x7f8c98fe% = ( <0x7f8c98fe> + 1 ) 
	ENDIF 
	IF %0xcf66717b% %0x57ff2a27% 
		SWITCH <0x7f8c98fe> 
			CASE 0 
				%0x5d8a93a5% = 8 
			CASE 1 
				%0xc483c21f% = 8 
			CASE 2 
				%0xb384f289% = 8 
		ENDSWITCH 
		%0x7f8c98fe% = ( <0x7f8c98fe> + 1 ) 
	ENDIF 
	IF %0xcf66717b% %0x2d016d8f% 
		SWITCH <0x7f8c98fe> 
			CASE 0 
				%0x5d8a93a5% = 9 
			CASE 1 
				%0xc483c21f% = 9 
			CASE 2 
				%0xb384f289% = 9 
		ENDSWITCH 
		%0x7f8c98fe% = ( <0x7f8c98fe> + 1 ) 
	ENDIF 
	IF %0xcf66717b% %0xa256a8f5% 
		SWITCH <0x7f8c98fe> 
			CASE 0 
				%0x5d8a93a5% = 10 
			CASE 1 
				%0xc483c21f% = 10 
			CASE 2 
				%0xb384f289% = 10 
		ENDSWITCH 
		%0x7f8c98fe% = ( <0x7f8c98fe> + 1 ) 
	ELSE 
		IF %0xcf66717b% %0x4194ecca% 
			SWITCH <0x7f8c98fe> 
				CASE 0 
					%0x5d8a93a5% = 10 
				CASE 1 
					%0xc483c21f% = 10 
				CASE 2 
					%0xb384f289% = 10 
			ENDSWITCH 
			%0x7f8c98fe% = ( <0x7f8c98fe> + 1 ) 
		ENDIF 
	ENDIF 
	IF %0xcf66717b% %0xc8a82b5a% 
		SWITCH <0x7f8c98fe> 
			CASE 0 
				%0x5d8a93a5% = 11 
			CASE 1 
				%0xc483c21f% = 11 
			CASE 2 
				%0xb384f289% = 11 
		ENDSWITCH 
		%0x7f8c98fe% = ( <0x7f8c98fe> + 1 ) 
	ENDIF 
	IF %0xcf66717b% %0xedf5db70% 
		SWITCH <0x7f8c98fe> 
			CASE 0 
				%0x5d8a93a5% = 12 
			CASE 1 
				%0xc483c21f% = 12 
			CASE 2 
				%0xb384f289% = 12 
		ENDSWITCH 
		%0x7f8c98fe% = ( <0x7f8c98fe> + 1 ) 
	ENDIF 
	IF %0xcf66717b% %0x255ed86f% 
		SWITCH <0x7f8c98fe> 
			CASE 0 
				%0x5d8a93a5% = 13 
			CASE 1 
				%0xc483c21f% = 13 
			CASE 2 
				%0xb384f289% = 13 
		ENDSWITCH 
		%0x7f8c98fe% = ( <0x7f8c98fe> + 1 ) 
	ENDIF 
	IF %0xcf66717b% %0xc304bd92% 
		SWITCH <0x7f8c98fe> 
			CASE 0 
				%0x5d8a93a5% = 14 
			CASE 1 
				%0xc483c21f% = 14 
			CASE 2 
				%0xb384f289% = 14 
		ENDSWITCH 
		%0x7f8c98fe% = ( <0x7f8c98fe> + 1 ) 
	ENDIF 
	IF NOT ( <0x5d8a93a5> = %0xda3403b0% ) 
		%0x8e10bb70% %0x8f61d602% = %0x5ef31148% %0x7f8c98fe% = 0 %0x4b40630d% = <0x5d8a93a5> 
	ENDIF 
	IF NOT ( <0xc483c21f> = %0xda3403b0% ) 
		%0x8e10bb70% %0x8f61d602% = %0x5ef31148% %0x7f8c98fe% = 1 %0x4b40630d% = <0xc483c21f> 
	ENDIF 
	IF NOT ( <0xb384f289> = %0xda3403b0% ) 
		%0x8e10bb70% %0x8f61d602% = %0x5ef31148% %0x7f8c98fe% = 2 %0x4b40630d% = <0xb384f289> 
	ENDIF 
	RETURN %0x1b1d2788% = <0x5ef31148> 
ENDSCRIPT

SCRIPT %0xdb8e7f7a% 
	IF NOT %0xcf66717b% %0x5ef31148% 
		%0x2de8c60e% "Where\'s your array?" 
	ENDIF 
	%0x38f91a2b% = [ [ 15 , 4 , 3 ] , [ 15 , 4 , 3 ] , [ 15 , 4 , 3 ] ] 
	%0x39b5c4b0% <0x5ef31148> 
	%0x7f8c98fe% = 0 
	BEGIN 
		%0x35b6ac59% ( <0x5ef31148> [ <0x7f8c98fe> ] ) 
		%0x8e10bb70% %0x8f61d602% = %0x38f91a2b% %0x7f8c98fe% = <0x7f8c98fe> %0x4b40630d% = <0x1b1d2788> 
		%0x7f8c98fe% = ( <0x7f8c98fe> + 1 ) 
	REPEAT <0x7f5b3d4d> 
	RETURN %0x1b1d2788% = <0x38f91a2b> 
ENDSCRIPT

SCRIPT %0xad786093% 
	IF %0xcf66717b% %0x935ab858% 
		%0x2de8c60e% "### stopping particle object name = %n" %0x87f75c2d% = <0xa1dc81f9> 
	ENDIF 
	<0xa1dc81f9> : %0xc6525c4e% 0 
	IF NOT %0xcf66717b% %0x2f373d3d% 
		BEGIN 
			IF NOT <0xa1dc81f9> : %0x2299a9f2% 
				%0xf8d6a996% %0xa1dc81f9% = <0xa1dc81f9> 
				BREAK 
			ENDIF 
			%0x82117c1a% 30 %0xb99ae3d6% 
		REPEAT 
	ENDIF 
ENDSCRIPT

SCRIPT %0x9d2bbf7a% 
	%0x90356cb9% { 
		%0x40c698af% = %0x56a1eae3% 
		%0x475bf03c% = [ { %0x2e6ef8e7% %0x7a308ac6% } ] 
		%0x3f93a1ef% 
	} 
	IF ( %0x7d4c43b9% = 1 ) 
		%0x90356cb9% { 
			%0x40c698af% = %0x56a1eae3% 
			%0x475bf03c% = [ { %0xda28fb8a% %0x219aa02b% } ] 
			%0x3f93a1ef% 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT %0xfb03ab35% 
	%0x90356cb9% { 
		%0x40c698af% = %0x56a1eae3% 
		%0x475bf03c% = [ { %0x2e6ef8e7% %0xc377c572% } ] 
		%0x3f93a1ef% 
	} 
	IF ( %0x7d4c43b9% = 1 ) 
		%0x90356cb9% { 
			%0x40c698af% = %0x56a1eae3% 
			%0x475bf03c% = [ { %0xda28fb8a% %0xc377c572% } ] 
			%0x3f93a1ef% 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT %0xa495a378% 
	<0xfa18296d> = [ 
		"Fonts and Bitmaps" 
		"Sprites - Fonts and Bitmaps" 
	] 
	%0x4bd714c3% %0xfa18296d% = <0xfa18296d> 
	<0x87e09dfa> = <0xbef75401> 
	%0x4bd714c3% %0x17140e6d% = "Menu 3D" 
	<0x9efbacbb> = <0xbef75401> 
	IF ( ( <0x87e09dfa> > -1 ) & ( <0x9efbacbb> > -1 ) ) 
		%0x2de8c60e% "" 
		%0x2de8c60e% "**********************************" 
		%0x2de8c60e% "\tUI Memory Usage:" 
		%0x2de8c60e% "\t2D - %iK" %0x1993c98e% = ( <0x87e09dfa> / 1024 ) 
		%0x2de8c60e% "\t3D - %jK" %0x809a9834% = ( <0x9efbacbb> / 1024 ) 
		%0x2de8c60e% "**********************************" 
		%0x2de8c60e% "" 
	ELSE 
		%0x2de8c60e% "Mem Profiler not active, probably overflowed, try restarting..." 
	ENDIF 
ENDSCRIPT

SCRIPT %0x3d102174% 
	<0xfa18296d> = [ 
		"Permanent Anims" 
		"Permanent & semi-permanent anims" 
	] 
	%0x4bd714c3% %0xfa18296d% = <0xfa18296d> 
	<0x575efbc4> = <0xbef75401> 
	%0x4bd714c3% %0x17140e6d% = "Level Specific Anims" 
	<0xedda5938> = <0xbef75401> 
	IF ( <0xbef75401> > -1 ) 
		%0x2de8c60e% "" 
		%0x2de8c60e% "**********************************" 
		%0x2de8c60e% "\tAnim Memory Usage:" 
		%0x2de8c60e% "\tPermanent - %iK" %0x1993c98e% = ( <0x575efbc4> / 1024 ) 
		%0x2de8c60e% "\tLevel-Specific - %jK" %0x809a9834% = ( <0xedda5938> / 1024 ) 
		%0x2de8c60e% "**********************************" 
		%0x2de8c60e% "" 
	ELSE 
		%0x2de8c60e% "Mem Profiler not active, probably overflowed, try restarting..." 
	ENDIF 
ENDSCRIPT

SCRIPT %0xfb922f2% { %0x4565a4f3% = "" 
		%0x6d853b88% = 1.14999997616 
		%0x1fe341d2% = 1 
		%0x7f261953% = PAIR(230.00000000000, 109.00000000000) 
		%0x34a68574% = PAIR(200.00000000000, 100.00000000000) 
		%0x67e093e4% = [ %0x85981897% %0xe126e035% ] 
		%0xc2719fb0% = %0x56a1eae3% 
		%0x8b60022f% = [ %0xbf0f14db% %0xbf0f14db% ] 
		%0xa77a67d0% = PAIR(0.00000000000, 10.00000000000) 
	} 
	<0x7f261953> = ( <0x7f261953> + PAIR(0.00000000000, 12.00000000000) ) 
	%0xa2907698% %0x40c698af% = <0xc2719fb0> %0xd443a2bc% 
	%0x73665140% { 
		%0x7321a8d6% = %0x5b9da842% 
		%0xc2719fb0% = <0xc2719fb0> 
		%0x40c698af% = <0x332816ed> 
		%0x2f6bf72d% = %0x8aba15ec% 
		%0x7f261953% = PAIR(320.00000000000, 240.00000000000) 
		%0x13b9da7b% = 1 
		%0x34a68574% = PAIR(640.00000000000, 480.00000000000) 
		%0xf1822b9c% = <0xa1598eed> 
	} 
	SWITCH <0x7321a8d6> 
		CASE %0x84298a3c% 
			IF %0xcf66717b% %0xe321b467% 
				%0x73665140% { 
					%0x7321a8d6% = %0x5200dfb6% 
					%0xc2719fb0% = <0x332816ed> 
					%0x40c698af% = <0xe321b467> 
					%0x2f6bf72d% = %0x8c95dd40% 
					%0xc4745838% = <0x4565a4f3> 
					%0x13b9da7b% = 1.39999997616 
					%0x7f261953% = <0x7f261953> 
					%0x8b60022f% = [ %0x85981897% %0xe126e035% ] 
					%0x3f6bcdba% = %0x31a41f2d% 
					%0x1d944426% 
				} 
				%0x3425baa2% %0x424d9ea% %0x40c698af% = <0x40c698af> %0xa6f5352f% = <0xa77a67d0> 
			ENDIF 
			%0x73665140% { 
				%0x7321a8d6% = %0x84298a3c% 
				%0xc2719fb0% = <0x332816ed> 
				%0x40c698af% = <0xdd3d171b> 
				%0x7f261953% = <0x7f261953> 
				%0x8b60022f% = [ %0x85981897% %0xe126e035% ] 
				%0x34a68574% = <0x34a68574> 
				%0x13b9da7b% = <0x13b9da7b> 
				%0x67e093e4% = [ %0x85981897% %0xe126e035% ] 
				%0xc855511c% = <0xc855511c> 
			} 
			<0xb4dd0126> = <0x40c698af> 
			%0x73665140% { 
				%0x7321a8d6% = %0x130ef802% 
				%0xc2719fb0% = <0xb4dd0126> 
				%0x40c698af% = <0xa1598eed> 
				%0x34a68574% = <0x34a68574> 
				%0x2f6bf72d% = %0x8aba15ec% 
				%0x8b60022f% = [ %0x85981897% %0xe126e035% ] 
				%0x7f261953% = PAIR(0.00000000000, 0.00000000000) 
				%0x13b9da7b% = <0x13b9da7b> 
				%0xf24adedb% = <0xf24adedb> 
				%0x6d853b88% = <0x6d853b88> 
				%0x1fe341d2% = <0x1fe341d2> 
				%0x67e093e4% = <0x67e093e4> 
				<0x5dea5c64> 
				%0x475bf03c% = [ { %0x30a4f836% %0x36e6f0b5% %0x7031f10c% = { %0xbc6b118f% } } 
					{ %0xfd1ac26% %0x36e6f0b5% %0x7031f10c% = { %0xe3006fc4% } } 
				] 
			} 
		DEFAULT 
			%0x73665140% { 
				%0x7321a8d6% = %0x130ef802% 
				%0xc2719fb0% = <0x332816ed> 
				%0x40c698af% = <0xa1598eed> 
				%0x2f6bf72d% = %0x8aba15ec% 
				%0x8b60022f% = [ %0x85981897% %0xe126e035% ] 
				%0x7f261953% = <0x7f261953> 
				%0x6d853b88% = <0x6d853b88> 
				%0x1fe341d2% = <0x1fe341d2> 
				%0x67e093e4% = <0x67e093e4> 
				<0x5dea5c64> 
				%0x475bf03c% = [ { %0x30a4f836% %0x36e6f0b5% %0x7031f10c% = { %0xbc6b118f% } } 
					{ %0xfd1ac26% %0x36e6f0b5% %0x7031f10c% = { %0xe3006fc4% } } 
				] 
			} 
			IF NOT %0xcf66717b% %0xec0e8672% 
				%0x73665140% { 
					%0x7321a8d6% = %0x5200dfb6% 
					%0xc2719fb0% = <0xa1598eed> 
					%0x2f6bf72d% = %0x8c95dd40% 
					%0xc4745838% = <0x4565a4f3> 
					%0x13b9da7b% = 1.39999997616 
					%0x3f6bcdba% = %0x31a41f2d% 
					%0x1d944426% 
				} 
			ENDIF 
	ENDSWITCH 
	IF NOT %0xcf66717b% %0xf8d488b8% 
		%0x4577fd38% %0x40c698af% = <0x332816ed> %0x1e93946b% = %0xf53d1d83% 
	ENDIF 
	%0x4577fd38% %0x40c698af% = <0xa1598eed> %0x1e93946b% = %0x4d49ac0a% 
	IF %0xcf66717b% %0x604efa33% 
		%0xc73a91e0% <0x604efa33> 
	ENDIF 
ENDSCRIPT

SCRIPT %0xd4a5a0a% %0x7f261953% = PAIR(215.00000000000, 15.00000000000) %0x8b60022f% = [ %0xbf0f14db% %0xbf0f14db% ] %0x13b9da7b% = 0.44999998808 
	IF %0xcf66717b% %0x40c698af% 
		%0x73665140% { 
			%0x7321a8d6% = %0xb12b510a% 
			%0xc2719fb0% = <0xc2719fb0> 
			%0x40c698af% = <0x40c698af> 
			%0x7d99f28d% = <0x7d99f28d> 
			%0x7f261953% = <0x7f261953> 
			%0x3f6bcdba% = [ 0 0 0 0 ] 
			%0x8b60022f% = <0x8b60022f> 
			%0x13b9da7b% = <0x13b9da7b> 
			%0x57710f31% = 2 
		} 
	ELSE 
		%0x73665140% { 
			%0x7321a8d6% = %0xb12b510a% 
			%0xc2719fb0% = <0xc2719fb0> 
			%0x7d99f28d% = <0x7d99f28d> 
			%0x7f261953% = <0x7f261953> 
			%0x3f6bcdba% = [ 0 0 0 0 ] 
			%0x8b60022f% = <0x8b60022f> 
			%0x13b9da7b% = <0x13b9da7b> 
			%0x57710f31% = 2 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT %0xbeed50b6% { %0x5a8c82db% = %0x97cc6e78% 
		%0x6a3b36b5% = %0x78475fb4% 
		%0x2b0cfca1% = %0xf7e902c% 
		%0xea6d2566% = %0x8aba15ec% 
		%0x416062ab% = %0x4d49ac0a% 
		%0x13b9da7b% = 1 
		%0x3f6bcdba% = [ 88 105 112 128 ] 
	} 
	IF %0xcf66717b% %0x1d944426% 
		%0x73665140% { 
			%0x7321a8d6% = %0x5200dfb6% 
			%0xc2719fb0% = <0x416062ab> 
			%0x40c698af% = <0x40c698af> 
			%0xc4745838% = <0xc4745838> 
			%0x2f6bf72d% = <0xea6d2566> 
			%0x3f6bcdba% = <0x3f6bcdba> 
			%0x13b9da7b% = <0x13b9da7b> 
			%0x475bf03c% = [ 
				{ %0x9d3fb516% <0x5a8c82db> %0x7031f10c% = <0xc9c30b12> } 
				{ %0x4adf0cd3% <0x6a3b36b5> %0x7031f10c% = <0xf974bf7c> } 
				{ %0x1e3e253b% <0x2b0cfca1> %0x7031f10c% = <0xb8437568> } 
				{ %0x2e6ef8e7% <0x2b0cfca1> %0x7031f10c% = <0xb8437568> } 
			] 
			%0x1d944426% 
		} 
	ELSE 
		IF %0xcf66717b% %0x5d1adb92% 
			%0x73665140% { 
				%0x7321a8d6% = %0x5200dfb6% 
				%0xc2719fb0% = <0x416062ab> 
				%0x40c698af% = <0x40c698af> 
				%0xc4745838% = <0xc4745838> 
				%0x2f6bf72d% = <0xea6d2566> 
				%0x3f6bcdba% = <0x3f6bcdba> 
				%0x13b9da7b% = <0x13b9da7b> 
				%0x475bf03c% = [ 
					{ %0x9d3fb516% <0x5a8c82db> %0x7031f10c% = <0xc9c30b12> } 
					{ %0x4adf0cd3% <0x6a3b36b5> %0x7031f10c% = <0xf974bf7c> } 
					{ %0x1e3e253b% <0x2b0cfca1> %0x7031f10c% = <0xb8437568> } 
					{ %0x2e6ef8e7% <0x2b0cfca1> %0x7031f10c% = <0xb8437568> } 
				] 
			} 
		ELSE 
			%0x73665140% { 
				%0x7321a8d6% = %0x5200dfb6% 
				%0xc2719fb0% = <0x416062ab> 
				%0x40c698af% = <0x40c698af> 
				%0xc4745838% = <0xc4745838> 
				%0x2f6bf72d% = <0xea6d2566> 
				%0x3f6bcdba% = <0x3f6bcdba> 
				%0x13b9da7b% = <0x13b9da7b> 
				%0x475bf03c% = [ 
					{ %0x9d3fb516% <0x5a8c82db> %0x7031f10c% = <0xc9c30b12> } 
					{ %0x4adf0cd3% <0x6a3b36b5> %0x7031f10c% = <0xf974bf7c> } 
					{ %0x1e3e253b% %0xbaf0a589% } 
					{ %0x2e6ef8e7% %0xbaf0a589% } 
					{ %0x1e3e253b% <0x2b0cfca1> %0x7031f10c% = <0xb8437568> } 
					{ %0x2e6ef8e7% <0x2b0cfca1> %0x7031f10c% = <0xb8437568> } 
				] 
			} 
		ENDIF 
	ENDIF 
	IF %0xcf66717b% %0xbc8e542c% 
		%0x90356cb9% { %0x40c698af% = <0x40c698af> 
			%0x475bf03c% = [ 
				{ %0x456d7433% <0xbc8e542c> %0x7031f10c% = <0x2fc1dde5> } 
			] 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT %0x907238ff% 
	IF NOT %0xcf66717b% %0x86068bd9% 
		RETURN 
	ENDIF 
	%0xed1e4ff4% = <0x86068bd9> 
	%0x7056ed02% %0x86068bd9% 
	<0xed1e4ff4> <...> 
ENDSCRIPT

SCRIPT %0x1eda313f% 
	%0xd05cbe31% 
	%0x6d74b1f4% %0x67e6859a% = <0x3c64476b> 
	RETURN %0xa1dc81f9% = <0xa1dc81f9> 
ENDSCRIPT

SCRIPT %0x2d34330d% 
	IF %0xcf66717b% %0xe5312d08% 
		IF %0xcf66717b% %0xa1dc81f9% 
			%0x7ea855f0% = <0xa1dc81f9> 
		ELSE 
			%0xf612bd7d% %0x62ba3f6a% = %0x2d34330d% %0x7031f10c% = { <...> %0xc4cf5eb3% } 
			%0xb374084a% %0xc4e78e22% 
			RETURN 
		ENDIF 
	ELSE 
		IF NOT %0xcf66717b% %0x7ea855f0% 
			%0x2eccf8ae% "AwardNewSpecialTrickToProfile needs a profile param" 
		ENDIF 
	ENDIF 
	IF NOT %0xcf66717b% %0x270f56e1% 
		%0x2eccf8ae% "AwardNewSpecialTrickToProfile needs a trick param" 
	ENDIF 
	IF NOT %0xcf66717b% %0xacfdb27a% 
		%0x2eccf8ae% "AwardNewSpecialTrickToProfile needs a key_combo param" 
	ENDIF 
	%0x8a201db% %0x7ea855f0% = <0x7ea855f0> 
	IF %0xef157fab% %0x7ea855f0% = <0x7ea855f0> %0xb394c01c% %0xacfdb27a% = <0xacfdb27a> 
		%0x2de8c60e% "AwardNewSpecialTrickToProfile - key combo bound already for profile %p" %0x7df8614e% = <0x7ea855f0> 
		%0xab8c8c0b% { 
			%0x7ea855f0% = <0x7ea855f0> 
			%0xb394c01c% 
			%0x7f8c98fe% = <0xdb92effa> 
			%0xacfdb27a% = %0xf60c9090% 
			%0x270f56e1% = %0xf60c9090% 
			%0x2df34747% = 1 
		} 
		<0x7f8c98fe> = <0xdb92effa> 
	ENDIF 
	IF %0xf3183600% %0x7ea855f0% = <0x7ea855f0> %0xb394c01c% %0x270f56e1% = <0x270f56e1> %0xa75b8581% = <0x270f56e1> 
		%0x2de8c60e% "AwardNewSpecialTrickToProfile - trick bound already for profile %p" %0x7df8614e% = <0x7ea855f0> 
		%0xab8c8c0b% { 
			%0x7ea855f0% = <0x7ea855f0> 
			%0xb394c01c% 
			%0x7f8c98fe% = <0xdb92effa> 
			%0xacfdb27a% = %0xf60c9090% 
			%0x270f56e1% = %0xf60c9090% 
			%0x2df34747% = 1 
		} 
		<0x7f8c98fe> = <0xdb92effa> 
	ENDIF 
	%0xc96f98e6% %0xa1dc81f9% = <0x7ea855f0> 
	IF NOT %0xcf66717b% %0x7f8c98fe% 
		<0x7f8c98fe> = ( <0xac9b9eda> - 1 ) 
	ENDIF 
	%0xab8c8c0b% { 
		%0x7ea855f0% = <0x7ea855f0> 
		%0xb394c01c% 
		%0x7f8c98fe% = <0x7f8c98fe> 
		%0xacfdb27a% = <0xacfdb27a> 
		%0x270f56e1% = <0x270f56e1> 
		%0x2df34747% = 1 
	} 
	IF NOT %0xcf66717b% %0xc4cf5eb3% 
		%0xb374084a% %0xc4e78e22% 
	ENDIF 
	%0xd05cbe31% 
	%0xb70a21b6% %0x5b8ab877% = <0x3c64476b> 
ENDSCRIPT

SCRIPT %0x93ef0397% 
	IF %0x3028488b% %0x2a179957% 
		%0x5c01e5e9% 
	ENDIF 
ENDSCRIPT

SCRIPT %0x3a8d6ab2% 
	IF NOT %0x6df82e70% 
		%0x65011baa% 
	ELSE 
		%0x65011baa% 
		%0xe0f3a644% 
		IF %0x1eb61dce% 
			IF %0x2877b61a% %0x3eafa520% = "One Foot Nose Manual" 
				%0xd16453c8% %0x80c7c0f5% %0x7031f10c% = { %0xa1dc81f9% = #"One Foot Manual" %0xcd66c8ae% = 100 %0x54628ed7% = 0.10000000149 %0x4627d507% = %0x2bc136c% %0xd77b6ff9% = %0x1e6b8cdc% %0x47d44b84% = %0xbf2ee51a% %0x6e855102% = %0xbe2028ce% %0x26b7b5fd% = %0xd521469f% %0x7a16aca0% } 
			ELSE 
				IF %0x2877b61a% %0x3eafa520% = "Anti Casper" 
					%0xd16453c8% %0x80c7c0f5% %0x7031f10c% = { %0xa1dc81f9% = #"Casper" %0xcd66c8ae% = 100 %0x54628ed7% = 0.10000000149 %0x4627d507% = %0xece04b75% %0xe3f7db7% = %0xade47d7c% %0xd77b6ff9% = %0x1e6b8cdc% %0x47d44b84% = %0x918d4817% %0xedf3e7f4% = 0.50000000000 %0xe0f3a644% %0x6e855102% = %0xd521469f% %0x26b7b5fd% = %0xfbb20487% } 
				ELSE 
					%0xd16453c8% %0x80c7c0f5% %0x7031f10c% = { %0xa1dc81f9% = #"Manual" %0xcd66c8ae% = 100 %0x54628ed7% = 0.10000000149 %0x4627d507% = %0x2ebd3e15% %0x56f5e3f6% = %0xa5240855% %0x21f2d360% = %0xd22338c3% %0xd77b6ff9% = %0xbf2ee51a% %0x47d44b84% = %0x1e6b8cdc% %0x26b7b5fd% = %0xbe2028ce% %0x6e855102% = %0xd521469f% %0x2537162% %0x36882dfc% } 
				ENDIF 
			ENDIF 
		ELSE 
			IF %0x2877b61a% %0x3eafa520% = "One Foot Manual" 
				%0xd16453c8% %0x80c7c0f5% %0x7031f10c% = { %0xa1dc81f9% = #"One Foot Nose Manual" %0xcd66c8ae% = 100 %0x54628ed7% = 0 %0x4627d507% = %0x3e15d6a9% %0xde7bef2c% %0xd77b6ff9% = %0x918d4817% %0x47d44b84% = %0x1e6b8cdc% %0x7a16aca0% %0x6e855102% = %0xc416dcc5% %0x26b7b5fd% = %0xd521469f% } 
			ELSE 
				IF %0x2877b61a% %0x3eafa520% = "Casper" 
					%0xd16453c8% %0x80c7c0f5% %0x7031f10c% = { %0xa1dc81f9% = #"Anti Casper" %0xcd66c8ae% = 100 %0x54628ed7% = 0 %0x4627d507% = %0x394f6b27% %0xe3f7db7% = %0x76c7c64a% %0xd77b6ff9% = %0xbf2ee51a% %0x47d44b84% = %0x1e6b8cdc% %0xedf3e7f4% = 0.50000000000 %0xe0f3a644% %0xde7bef2c% %0x6e855102% = %0xd521469f% %0x26b7b5fd% = %0x4851ce36% } 
				ELSE 
					%0xd16453c8% %0x80c7c0f5% %0x7031f10c% = { %0xa1dc81f9% = #"Nose Manual" %0xcd66c8ae% = 100 %0x54628ed7% = 0 %0x4627d507% = %0x3374b1ae% %0x56f5e3f6% = %0xf98aabde% %0xde7bef2c% %0xd77b6ff9% = %0x1e6b8cdc% %0x47d44b84% = %0x918d4817% %0x26b7b5fd% = %0xc416dcc5% %0x6e855102% = %0xd521469f% %0x2537162% %0x36882dfc% } 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT %0x54d07462% %0x24ba57b9% = 0.00000000000 %0xf12971d4% = 200.00000000000 %0x394550db% = [ 50 50 50 ] %0xd39249a7% = [ 50 50 50 ] 
	IF %0xcf66717b% %0xd443a2bc% 
		%0xf649d637% = 0 
	ELSE 
		%0xf649d637% = 1 
	ENDIF 
	%0x7b0a810a% { 
		%0xf649d637% = <0xf649d637> 
		%0x73050dcf% = <0x24ba57b9> 
		%0x99d214b3% = <0xf12971d4> 
		%0xf1f603a6% = <0x394550db> 
		%0x86641c44% = <0xd39249a7> 
	} 
ENDSCRIPT

SCRIPT %0x74253bb% %0xf6a36814% = 190 
	IF %0xcf66717b% %0x8a68ab90% 
		BEGIN 
			IF %0xb32370c8% <0x8a68ab90> 
				BREAK 
			ENDIF 
			%0x82117c1a% 1 %0x4a07c332% 
		REPEAT 
	ENDIF 
	IF %0xcf66717b% %0x93516575% 
		%0x986d274e% %0x40c698af% = %0xc0ba0665% 
		%0x83654874% { 
			%0x7321a8d6% = %0x659bf355% 
			%0x40c698af% = %0xc0ba0665% 
			%0x6c2bfb7f% = <0x572ea28> 
			%0x46e55e8f% = %0x6086aa70% 
			%0x28782d3b% = %0xff03cc4e% 
			%0xf0d90109% = 1.00000000000 
		} 
	ENDIF 
	IF %0xcf66717b% %0x8a68ab90% 
		%0xdb27e0c1% { 
			%0x8a68ab90% = <0x8a68ab90> 
			%0x46653221% = <0xf6a36814> 
		} 
	ELSE 
		%0xdb05a233% { 
			<0x572ea28> 
			%0xf6a36814% = <0xf6a36814> 
			%0xff2020ec% = 300 
			%0xc9b0deb7% = <0xc9b0deb7> 
		} 
	ENDIF 
ENDSCRIPT

SCRIPT %0x18f77ea1% 
	%0x9eb6e336% %0x691e3580% 
ENDSCRIPT

SCRIPT %0x691e3580% 
	%0xa2907698% %0xd443a2bc% %0x40c698af% = %0x56a1eae3% 
	IF NOT %0xc5bc93ee% %0x40c698af% = %0xe5815171% 
		%0x73665140% { 
			%0x7321a8d6% = %0xb12b510a% 
			%0x40c698af% = %0xe5815171% 
			%0x7d99f28d% = %0x9f133c19% 
			%0xc2719fb0% = %0x56a1eae3% 
			%0x7f261953% = PAIR(570.00000000000, 240.00000000000) 
			%0x13b9da7b% = PAIR(1.00000000000, 1.00000000000) 
			%0x3f6bcdba% = [ 100 100 100 100 ] 
		} 
		%0x73665140% { 
			%0x7321a8d6% = %0xb12b510a% 
			%0x40c698af% = %0x9837a1ed% 
			%0x7d99f28d% = %0x34d3e9ce% 
			%0xc2719fb0% = %0x56a1eae3% 
			%0x7f261953% = PAIR(569.00000000000, 220.00000000000) 
			%0x13b9da7b% = PAIR(0.50000000000, 4.75000000000) 
			%0x3f6bcdba% = [ 100 0 0 100 ] 
		} 
		%0x73665140% { 
			%0x7321a8d6% = %0xb12b510a% 
			%0x40c698af% = %0xef30917b% 
			%0x7d99f28d% = %0x34d3e9ce% 
			%0xc2719fb0% = %0x56a1eae3% 
			%0x7f261953% = PAIR(568.00000000000, 220.00000000000) 
			%0x13b9da7b% = PAIR(0.75000000000, 5.00000000000) 
			%0x3f6bcdba% = [ 0 0 0 100 ] 
		} 
		%0x82117c1a% 0.50000000000 %0xd029f619% 
		IF %0xc5bc93ee% %0x40c698af% = %0xe5815171% 
			%0x3c15e9b6% %0x40c698af% = %0xe5815171% 
			%0x3c15e9b6% %0x40c698af% = %0xef30917b% 
			%0x3c15e9b6% %0x40c698af% = %0x9837a1ed% 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT %0x4de0ab5d% %0x114fc131% = 1 %0x9e497fc6% = 95 
	%0xf4c52f72% 
	IF %0x79116f06% %0xb30d9965% = 0 %0x5b8ab877% = <0xf3cf5755> 
		%0x8ac1fa3c% %0xbc6ea233% = 0 %0x114fc131% = <0x114fc131> %0x9e497fc6% = <0x9e497fc6> 
	ELSE 
		IF %0x79116f06% %0xb30d9965% = 1 %0x5b8ab877% = <0xf3cf5755> 
			%0x8ac1fa3c% %0xbc6ea233% = 1 %0x114fc131% = <0x114fc131> %0x9e497fc6% = <0x9e497fc6> 
		ELSE 
			IF %0x79116f06% %0xb30d9965% = 2 %0x5b8ab877% = <0xf3cf5755> 
				%0x8ac1fa3c% %0xbc6ea233% = 2 %0x114fc131% = <0x114fc131> %0x9e497fc6% = <0x9e497fc6> 
			ELSE 
				IF %0x79116f06% %0xb30d9965% = 3 %0x5b8ab877% = <0xf3cf5755> 
					%0x8ac1fa3c% %0xbc6ea233% = 3 %0x114fc131% = <0x114fc131> %0x9e497fc6% = <0x9e497fc6> 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT

SCRIPT %0x963363dc% %0x114fc131% = 1 %0x9e497fc6% = 95 %0xf3cf5755% = 0 
	IF %0x79116f06% %0xb30d9965% = 0 %0x5b8ab877% = <0xf3cf5755> 
		%0x8ac1fa3c% %0xbc6ea233% = 0 %0x114fc131% = <0x114fc131> %0x9e497fc6% = <0x9e497fc6> 
	ELSE 
		IF %0x79116f06% %0xb30d9965% = 1 %0x5b8ab877% = <0xf3cf5755> 
			%0x8ac1fa3c% %0xbc6ea233% = 1 %0x114fc131% = <0x114fc131> %0x9e497fc6% = <0x9e497fc6> 
		ELSE 
			IF %0x79116f06% %0xb30d9965% = 2 %0x5b8ab877% = <0xf3cf5755> 
				%0x8ac1fa3c% %0xbc6ea233% = 2 %0x114fc131% = <0x114fc131> %0x9e497fc6% = <0x9e497fc6> 
			ELSE 
				IF %0x79116f06% %0xb30d9965% = 3 %0x5b8ab877% = <0xf3cf5755> 
					%0x8ac1fa3c% %0xbc6ea233% = 3 %0x114fc131% = <0x114fc131> %0x9e497fc6% = <0x9e497fc6> 
				ENDIF 
			ENDIF 
		ENDIF 
	ENDIF 
ENDSCRIPT


