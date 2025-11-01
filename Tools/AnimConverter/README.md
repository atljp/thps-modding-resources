# AnimConvert
## Description:

`.ska` animation converter. Currently, this is aimed at converting various TH animation formats to THAW's `.ska` format.

Currently, the tool only outputs `.ska` animations that work in THAW.

## Usage:

- Create the `in` folder if it does not exist.
- Place the animations you'd like to convert in the `in` directory.
- Run:
```
node convert.js IN_FORMAT OUT_FORMAT
```
- All converted animations will be placed in the `out` folder.

Replace `IN_FORMAT` and `OUT_FORMAT` with the formats of your animations!

## Supported Formats:

- `thps4` - Tony Hawk's Pro Skater 4
- `thug1` - Tony Hawk's Underground
- `thug2` - Tony Hawk's Underground 2 / Tony Hawk's Project 8 (PSP)
- `thaw` - Tony Hawk's American Wasteland
- `thpg` - Tony Hawk's Proving Ground (Last-Gen)

## THPS3 Animations:

- Currently, Tony Hawk's Pro Skater 3 skater animations are supported via a separate program in the `THPS3Converter` folder. 
- This program functions similarly to AnimConvert in that it converts THPS3 animations to THAW format. 
- At some point, the functionality from this program will be mainlined into AnimConvert itself.

## Bone Mapping:

AnimConvert supports bone mapping files to remap bones from game A to game B. These can be used with the `-map` parameter.

**Example:**

```
node convert.js thug1 thaw -map thug_to_thaw.txt
node convert.js thug1 thaw -map thug_to_thaw.js
```

The example above will convert a THUG skater animation to THAW, and remap bones accordingly. (THUG head bone will become THAW head bone, etc.)

Each line should have 2 numbers:

- Bone index on **DESTINATION** skeleton
- Bone index on **SOURCE** skeleton

Optionally, a line can be a single number with a `!` in front of it. **This will exclude this bone from the output file(s).**

## Caveats:

- At the moment, this converter primarily targets pedestrian, skater, and special item animations. This is **NOT** yet ready to be used for cameras or cutscene animations.
- Last-gen THPG animations use a completely different skeleton than other games in the series.

## Credits

This repository includes code from adragonite's [math3d](https://www.npmjs.com/package/math3d) module.

## See Also:

- [010 .ska Template (GHSDK)](https://gitgud.io/fretworks/guitar-hero-sdk/-/blob/master/Resources/Templates/THAW/SkaAnim.bt) - 010 Editor reverse-engineering template for .ska files.
