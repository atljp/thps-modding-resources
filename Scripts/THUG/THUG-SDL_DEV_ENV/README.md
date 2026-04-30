# THUG SDL SCRIPTING ENVIRONMENT

This setup is designed to work with [THUG-SDL's](https://github.com/atljp/THUG-SDL/) mod loader.

1) Download `THUG-SDL_DEV_ENV.zip` and extract its contents to 
-- `C:\<path-to-your-THUG-install>\Game\Data\pre`

2) In the THUG-SDL Launcher, select "Disable Script Mods" and "Additional Mods".
Specify the folder in the text field below the checkboxes as: 
-- `data/pre/THUG-SDL_DEV_ENV`
3) The game now loads contents from your specified folder. In `mod.ini` you can choose to load from the `qb.pre` file or from the loose `.qb` files in the compiled folder.
4) Edit scripts in the source folder with a text editor of your choice
-- Compile edited scripts with `Compile.bat`
-- Pack everything from the compiled folder into `qb.pre` with `Pack.bat`



___
Note:
`Compile.bat` will compile everything at first run. After that, only file that were changed since the last run are compiled
<br>
`QScript.QCompile.App.exe` is taken from the official Github release [v1.0.0](https://github.com/cuckydev/QScript/releases/tag/v1.0.0)