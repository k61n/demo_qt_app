
The demo uses GR framework as an example of linking a custom library. The
library release can be downloaded from
[github](https://github.com/sciapp/gr/releases) or using brew from MLZ tap:
```bash
brew tap mlz/packages https://forge.frm2.tum.de/review/mlz/packages/homebrew
brew install qt@5 qt
brew unlink qt@5 qt
brew install gr
```

Clone the repo and see if it builds:
```bash
git clone https://github.com/k61n/demo_qt_app.git
cd demo_qt_app
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
    -DGR_ROOT=/opt/homebrew/opt/gr
    -DCMAKE_PREFIX_PATH=/opt/homebrew/opt/qt@5
cmake --build . --parallel $(sysctl -n hw.ncpu)
```

If the build is successfull the resulting executable should be able to run.
```bash
./gr-demo
```

CMakeLists.txt has piece of code that enables cmake to build .app bundles, just pass
`-DBUNDLE=ON` option to cmake:
```CMakeLists.txt
cmake .. -DCMAKE_BUILD_TYPE=Release -DBUNDLE=ON
    -DGR_ROOT=/opt/homebrew/opt/gr
    -DCMAKE_PREFIX_PATH=/opt/homebrew/opt/qt@5
```

This bundle however is not ready to be distributed, because if you run `otool -L`
you will notice that the executable is linked against development libs.
For .app bundle to be distributable between computers it must be self-sufficient.
To do that:
```bash
 /opt/homebrew/opt/qt@5/bin/macdeployqt gr-demo.app
 ```

However once you change the bundle structure macos will not allow you to run it
due to security concerns. You should create a new `Code Signing` certificate
using `Keychain Access`. Navigate the meny
`Keychain Access > Certificate Assistant > Create a certificate`. Then `Trust`
your newly create certificate.

Create "test" certificate and sign the bundle
```bash
codesign --deep --force --verify --verbose --sign "test" gr-demo.app
```

Create a `.dmg`
```bash
hdiutil create -size 100m -fs HFS+ -volname "gr-demo" -attach ./gr-demo.dmg
mv gr-demo.app /Volumes/gr-demo
ln -s /Applications /Volumes/gr-demo/Applications
rm -rf /Volumes/gr-demo/.fseventsd
hdiutil detach /Volumes/gr-demo
hdiutil convert ./gr-demo.dmg -format UDZO -o gr-demo-v0.1-arm.dmg
```
