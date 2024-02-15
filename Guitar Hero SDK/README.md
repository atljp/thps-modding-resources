# Guitar Hero SDK

The Guitar Hero SDK is a modding suite designed to ease in modification of games based around Neversoft's Guitar Hero engine and related engines<br>
[Guitar Hero SDK - GHSDK on GitGud](https://gitgud.io/fretworks/guitar-hero-sdk)

## Conversion
Converters from: [https://gitgud.io/ZedekThePD/nx-scripts](https://gitgud.io/ZedekThePD/nx-scripts)<br>
Alternative script compiler: [NodeQBC](https://gitgud.io/fretworks/nodeqbc)

- Convert anims from in folder: `node AnimConvert.js thug2 thaw -map thug2_to_thaw.txt`
- Convert skeletons: `node SkelConvert.js my_skeleton.ske.xbx`
- Convert skins in SceneConv: `node convert.js skinfile.skin.xbx thug thaw`

Generate [qbkeys](https://ghwt.de/tools/qbkey) for animations by adding the animation-filenames with these prefixes:
- Human animations: THPS7_Human<br>
- Special item animations: SI_Item (for example SI_Tongue)

**Important as of Feb, 2024:** The converted skin needs the active flag to be visible in game. View the file with 010 Hexeditor and load the template: `\Resources\Templates\THAW`.<br>
Flag at: skin -> scene -> sectors -> CGeom -> sMesh -> some_flags. Set it to 0x40 0x04

# reTHAWED mod setup

TODO