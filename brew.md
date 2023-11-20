
[Brew formula](Formula/gr-demo.rb) might be used to install the app.
Prepare the dependencies:

```bash
brew tap mlz/packages https://forge.frm2.tum.de/review/mlz/packages/homebrew
brew install qt@5 qt
brew unlink qt@5 qt
brew install gr
```

Install from a formula locally:

```bash
git clone https://github.com/k61n/demo_qt_app.git
cd demo_qt_app
brew intsall Formula/gr-demo.rb
```

After reloading the shell:

```bash
gr-demo
```

Then formula might be placed to a
[custom repository](https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap),
which can be used as tap,
or pushed to MLZ brew formulae collection at
[MLZ Forge](https://forge.frm2.tum.de/review/plugins/gitiles/mlz/packages/homebrew).
