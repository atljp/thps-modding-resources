# GHWT Base Mod

### Information
The *GHWT Base Mod* contains information to create a basic mod for use with the GHSDK. All stock code from *Guitar Hero: World Tour* is included as a compile-able package.

**Packaged code is not decompiled.** GHSDK tools like NodeROQ are not yet stable enough to reliably decompile the entire game's code at once. Work on code files *progressively!*

### How To Use:
#### Always remember to backup your game files! This method *will* replace your stock qb.pak.xen file!

1. Copy GHWTBaseMod to a separate directory and rename appropriately.
2. Add your mod folder's path as a `ModFolders` in GHSDK's `config.ini` file.
3. Choose a QB file / files you would like to modify and copy it to the SDK's `Assets/QB` folder.
4. Start the SDK and decompile your script(s) by using `Assets > .qb > Decompile`. A matching .txt file will appear.
5. Copy your decompiled .txt script to your mod's **Source** folder, matching the hierarchy of the compiled file.

For example:

- **Compiled .qb:** `MyMod/Packages/qb/Compiled/scripts/guitar/guitar_hud.qb.xen`
- **Source .txt:** `MyMod/Packages/qb/Source/scripts/guitar/guitar_hud.txt`

Compiled QB goes in the **Compiled** folder and source code goes in the **Source** folder.

6. Compile your script with `Scripting > qb > Compile`. The SDK will auto-detect files that need compiling based on their modified date.
7. Package your **qb** package with `Packaging > qb > Pack + Sync`. This will create a .pak file and sync to your GHWT dir.
8. Start your game and test!

------

**Remember:** Packages do not have to be solely code packages! You can include many packages in your mod and compile assets the same way!
