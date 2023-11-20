
To configure this project in windows one has to set up Visual Studio tools,
Cmake, Qt5 and gr.

 * MSVC v142 - VS 2019 C++ x64/x86 build tools
 * Cmake - https://github.com/Kitware/CMake/releases/download/v3.27.8/cmake-3.27.8-windows-x86_64.msi
 * Qt 5.15.2 MSVC 2019 64-bit - https://www.qt.io/download-open-source
 * Qt Installer Framework 4.6 - https://www.qt.io/download-open-source
 * gr - https://github.com/sciapp/gr/releases/download/v0.72.10/gr-0.72.10-Windows-x86_64-msvc.tar.gz

Clone and build the demo:
```powershell
git.exe clone https://github.com/k61n/demo_qt_app.git
cd .\demo_qt_app\
mkdir build
cd build
cmake.exe .. -A x64
    -DCMAKE_PREFIX_PATH="C:\Qt\5.15.2\msvc2019_64"
    -DGR_ROOT="C:\Users\kk\Documents\gr"
cmake.exe --build . --parallel 6 --config Release
```

Qt Installer Framework doesn't link or re-link the executables for developer's
convenience. One should arrange all required binaries in
`./win/packages/com.gr-demo/data` folder. The `win` folder is already set up to
deploy `gr-demo` package, one should preserve the folder and file structures and
take care of contents in `config.xml`, `package.xml` and `LICENSE` files. To
create an installer:

```powershell
C:\Qt\Tools\QtInstallerFramework\4.6\bin\binarycreator.exe -v
    -c .\win\config\config.xml -p .\win\packages\ gr-demo-v0.1-x64.exe
```
