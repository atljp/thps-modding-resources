# SkelConvert
## Description:
Converts THUG1 / THUG2 .ske files to THAW .ske format. 

This tool, like `AnimConvert`, is primarily made for humanoids.

## Usage:
```
node SkelConvert.js my_skeleton.ske.xbx
```

```
node SkelConvert.js my_skeleton.ske.wpc
```

## Caveats:
Some skeletons (THUG2 Skatopia cat) seem to have issues when converting. The following are a few skeletons that have been tested and working:

- THUG2 Pigeon
- THUG2 Seagull
- THUG2 Shark
- THUG2 Special Items

## Credits:
This repository includes code from the [math3d](https://www.npmjs.com/package/math3d) module.
