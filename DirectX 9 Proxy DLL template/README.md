# DirectX 9 Proxy DLL Template

Minimal project that proxies `Direct3DCreate9`. For games that run on DirectX 9: Place d3d9.dll in the game folder and it will be loaded automatically.<br>
The code defined in `DllMain` will then be executed as well.<br>
This project contains the option to include SDL2 (remove the comments in CMakeLists.txt).

## Set up development environment (Windows)

This is a CMake project which will generate a Visual Studio Solution.<br>
You need these tools:
- [Visual Studio](https://visualstudio.microsoft.com/)
- [CMake](https://cmake.org/)
- [vcpkg](https://learn.microsoft.com/en-us/vcpkg/get_started/get-started?pivots=shell-cmd)
- [Recommended: git](https://git-scm.com/download/win)
- [Optional: SDL2](https://www.libsdl.org/)

First, download and install Visual Studio and CMake like any other GUI application.<br>
Install git via the Installer from the website or directly in Powershell: `winget install --id Git.Git -e --source winget`<br>
Then install vcpkg via git as described in the Microsoft documentation:
- `git clone https://github.com/microsoft/vcpkg.git`
- Run the bootstrap script `cd vcpkg && .\bootstrap-vcpkg.bat`

(Optional: Install SDL2 via vcpkg: `.\vcpkg.exe install SDL2`, for x86: `.\vcpkg.exe install SDL2:x86-windows`

## Building the project

Build the VS Solution with CMake. Create a folder in the projects root directory (for example `out`) and launch a Powershell from there.<br>
Then run:
```
cmake .. -A win32 -DCMAKE_TOOLCHAIN_FILE=C:/[vcpkg directory]/scripts/buildsystems/vcpkg.cmake
```
The `.sln` file is in the `out` directory. Make sure to select win32 and Release as the project's build options in Visual Studio. Build the actual DLL with `Ctrl+Shift+B`.