# QScript with helper scripts

The bat scripts have to be in the same folder as the actual (de)compilers.<br>
`QScript.QCompile.App.exe` and `QScript.QDecompile.App.exe` are taken from the official Github release [v1.0.0](https://github.com/cuckydev/QScript/releases/tag/v1.0.0).

## Bulk decompile
 - Place the scripts in `.qb` format inside the "compiled" folder
 - Run `decompile_QScript_ALL.bat`
 - The converted `.q` files will be placed inside the "decompiled" folder
## Bulk compile
- Place the scripts in `.q` format inside the "decompiled" folder
- Run `compile_QScript_ALL-THUG1.bat` or `compile_QScript_ALL-THUG2.bat` depending on the game the scripts are coming from
- The converted `.qb` files will be placed inside the "recompiled" folder
## Decompile a single file
- Run `decompile_QScript_SINGLE.bat` and provide the `.qb` as the first argument:
- - `.\decompile_QScript_SINGLE.bat .\example.qb`
- You can also drag the `.qb` file onto the bat-script in Windows Explorer
## Compile a single file
- Run `compile_QScript_SINGLE-THUG1.bat` or `compile_QScript_SINGLE-THUG1.bat` depending on the game the scripts are coming from
- Provide the `.q` as the first argument:
- - `.\compile_QScript_SINGLE-THUG1.bat .\example.q`
- You can also drag the `.q` file onto the bat-script in Windows Explorer