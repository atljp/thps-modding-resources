# Animation conversion (thug / thug2 -> thaw)

## Prerequisites

To load the animations into THAW, set up the Guitar Hero SDK as described here [TODO].<br>
**You need to install Node JS to use the converters!**<br><br>
An animation consists of multiple parts that need to be converted separately with the following tools:

- Extractor: ([PreTool](https://github.com/atljp/thps-modding-resources/blob/main/Tools/PreTool.exe)) - File ending: .pre/.prx
- Human Animation ([AnimConverter](https://github.com/atljp/thps-modding-resources/tree/main/Tools/AnimConverter)) - File ending: .ska.xbx
- Optional: Special Item Animation (also [AnimConverter](https://github.com/atljp/thps-modding-resources/tree/main/Tools/AnimConverter)) - File ending: .ska.xbx
- Skeleton ([SkelConverter](https://github.com/atljp/thps-modding-resources/tree/main/Tools/SkelConvert)) - File ending: .ske
- Skin ([SceneConverter](https://github.com/atljp/thps-modding-resources/tree/main/Tools/SceneConv)) - File ending: .skin

Animations and skeletons can be extracted from netanims.prx and skeletons.prx respectively (the ending may be .pre or .prx).<br>
For THUG and THUG2 these are at path: `Game/Data/pre`<br><br>
Only for animations with special items: The skin files are located at: `Game/Data/models/Specialitems/<Itemname>`<br>
While the data has to be in the right format at the right place, the tricks themselves also have to be described in the scripts. It's a good starting point to know which files are needed and what to name them.

## General info
There are three types of animations:
- Simple tricks with a single animation file (e.g., Kickflip, Pop Shove It, etc.)
- Multi-part tricks with 3 separate animations: *Init*, *Idle* and *Out* (e.g., holdable Grab tricks)
- SpecialItem tricks that spawn additional items (e.g., Pizzabox, Tongue, Chainsaw, Kite, etc.)

## Example part 1: Looking at the scripts of THUG SpecialItem trick *Chomp On This*

Since we are porting the trick from Tony Hawk's Underground, we can look at the [original scripts](https://github.com/atljp/thps-modding-resources/tree/main/Scripts/THUG/THUG_vanilla_scripts_(decompiled)) to see how the trick is embedded into the trick system there.
- Every trick, no matter the category, has to be in the `ConfigurableTricks` array in `game\skater\alltricks.qb`
- The files that contain the trick descriptions are in `airtricks.qb`, `groundtricks.qb`, `grindscripts.qb`, `manualtricks.qb` or `liptricks.qb` in the same folder.
- Special items are described in `specialitems.qb` in the same folder.

### General trick description

Looking at the description of *Chomp On This* in `game\skater\airtricks.qb` (formatted):

```
:i $Trick_ChompOnThis$ = :s{
    $Scr$ = $GrabTrick$$Params$ = :s{
        $Name$ = %sc(13,"Chomp On This")
        $Score$ = %i(1000,000003e8)
        $Anim$ = $ChompOnThis_Init$
        $Idle$ = $ChompOnThis_Idle$
        $OutAnim$ = $ChompOnThis_Out$
        $IsSpecial$
        $maxspeed$ = %f(0.900000)$ForceInit$
        $Stream$ = $ChompOnThis$
        $SpecialItem_details$ = $PizzaBox_details$
        $Speed$ = %f(0.900000)
    :s}
:s}
```

Note that `SpecialItem_details` links to `PizzaBox_details` which is another script found in `game\skater\specialitems.qb`:

```
:i $pizzabox_details$ = :s{
	:i $Position$ = %vec3(0.000000,0.000000,0.000000)
	:i $Angles$ = %vec3(0.000000,0.000000,0.000000)
	:i $Name$ = $PizzaBox$
	:i $Class$ = $GameObject$
	:i $Type$ = $SpecialItem$
	:i $CollisionMode$ = $None$
	:i $IgnoredLights$ = :a{%i(0,00000000);%i(1,00000001):a}
	:i $skeletonName$ = $PizzaBox$
	:i $animName$ = $animload_si_pizza$
	:i $model$ = %s(35,"specialitems/pizzabox/pizzabox.skin")
	:i $SuspendDistance$ = %i(0,00000000)
	:i $lod_dist1$ = %i(400,00000190)
	:i $lod_dist2$ = %i(401,00000191)
	:i $TriggerScript$ = $PizzaBox_Script$
:i :s}
```

These scripts can be pretty much copied into the THAW scripts after a few syntax changes. They also tell us right away which files we need.<br>
The trick is a Multi-part **and** SpecialItem trick. We therefore have two separate animations, one for the skater and one for the special item. A special item also has a skeleton and a skin.<br><br>

This what it looks like in the original game - Tony Hawk's Underground:
<br>![image](./chomp_on_this_thug.png)

## Example part 2: Converting the data to THAW

This is a two step process, first the items are extracted / copied over and then they are converted to the correct THAW-format.

### 1. Extracting and renaming animations

There are Init-, Idle- and Out animations for the skater (Human_) and the special item (SI_).<br>
Therefore we will extract and rename six animations in two steps:

#### Human animations

**Extraction (PreTool)**:<br>
Load `Game/Data/pre/netanims.pre`, then right click and extract the following animations. Make sure the *Full File Name* starts with *anims\THPS5_skater_special*:
<br>![image](./extract_human.png)

Save the three files to the `AnimConverter/in` folder:
- ChompOnThis_Init.ska.xbx
- ChompOnThis_Idle.ska.xbx
- ChompOnThis_Out.ska.xbx

**Renaming**:<br>
Internally, the skater animations are processes as the addition of the qb key of THPS7_Human + <AnimName>. A convenient way to generate these qb keys is to use a [QB Key Adder](https://ghwt.de/tools/qbkey):
<br>![image](./qb_key_add.png)

Rename the files to the resulting 8 digit hex value and prepend `0x`. After renaming, your `AnimConverter/in` folder should look like this:
<br>![image](./renamed_anims.png)

- THPS7_Human + ChompOnThis_Init => 0x8EA1EBC7.ska.xbx
- THPS7_Human + ChompOnThis_Idle => 0x88F1BC66.ska.xbx
- THPS7_Human + ChompOnThis_Out => 0xFF890288.ska.xbx

#### Special item animations

The process is pretty much the same with three key differences:
- The animation files still come from `Game/Data/pre/netanims.pre` but the *Full File Name* starts with *anims\SI_Pizza*
- Don't extract the special item animations to the `AnimConverter/in` folder right away. Make a temp folder to rename them there.
- Generate the QB Keys as such: SI_Pizza + <AnimName>

This is how the files shoud look like after renaming:
- SI_Pizza + ChompOnThis_Init => 0xA719DEF4.ska.xbx
- SI_Pizza + ChompOnThis_Idle => 0xA169AF93.ska.xbx
- SI_Pizza + ChompOnThis_Out => 0x1800F5B5.ska.xbx

### Converting the animations

Start with the human animations which are in the `AnimConverter\in` folder:<br>
Conversion for the three renamed files is a single command line:<br>
`node .\AnimConvert.js thug1 thaw -map .\thug_to_thaw.txt`
<br><br>
Delete the human animation files in the `AnimConverter\in` folder and put in the special item files (you extracted them to the temporary folder before).<br>
Convert the three renamed files with the following command (special item animations don't require a mapping):<br>
`node .\AnimConvert.js thug1 thaw`
<br><br>
After animation-conversion, your out folder should look like this (file ending: .ska.wpc):
<br>![image](./out_folder.png)
<br><br>
Place the six converted files into the mod folder `rethawed\Packages\rethawed_anims\Compiled`

### 2. Extracting the special item skeleton

Extract the special item skeleton from `Game/Data/pre/skeletons.pre` with PreTool.
<br>![image](./qb_key_add.png)

No renaming is required, just put the *SI_Pizza.ske.xbx* file into the `SkelConvert` folder.<br>
Convert it with the command:<br>
`node SkelConvert.js .\SI_Pizza.ske.xbx`<br><br>
This will result in *SI_Pizza.ske.wpc*. Place it where you've placed the converted animations before (`rethawed\Packages\rethawed_anims\Compiled`).

### 3. Converting the special item skin


