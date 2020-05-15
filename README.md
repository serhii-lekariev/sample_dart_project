This repository showcases how to build a Flutter application for different desktop platforms.

### Summary
1) Install Flutter.
2) Run `flutter channel master` and `flutter upgrade`, as desktop requires the most recent Flutter version.
3) Run `flutter config --enable-<your-platform-desktop>`.
4) Run `flutter doctor` and fix whatever complaints it has. It looks like this: 
```
[X] Visual Studio - develop for Windows
    X Visual Studio not installed; this is necessary for Windows development.
      Download at https://visualstudio.microsoft.com/downloads/.
      Please install the "Desktop development with C++" workload, including the following components:
        MSBuild
        MSVC v142 - VS 2019 C++ x64/x86 build tools
         - If there are multiple build tool versions available, install the latest
        Windows 10 SDK (10.0.17763.0)
```
Instructions are straightforward and following them lets you build desktop applications.

After doing this, `flutter build <your-platform>` produces a native application:
A directory like this for Windows
```
 Directory of C:\projects\sample-dart-project\build\windows\x64\Release\Runner
05/15/2020  11:12 AM    <DIR>          .
05/15/2020  11:12 AM    <DIR>          ..
05/15/2020  11:12 AM    <DIR>          data
05/15/2020  11:11 AM        29,130,752 flutter_windows.dll
05/15/2020  11:12 AM            68,608 sample_project.exe
05/15/2020  11:12 AM           963,701 sample_project.iobj
05/15/2020  11:12 AM           530,640 sample_project.ipdb
05/15/2020  11:12 AM         1,208,320 sample_project.pdb
               5 File(s)     31,902,021 bytes

```  

Or a directory this for macOS: 
```sh
$> pwd
/home/dev/sample_project/build/macos/Build/Products/Release
$> ls -l
sample_project.app
sample_project.app.dSYM
sample_project.swiftmodule
```

### Notes on Windows
As per the [Flutter desktop documentation](https://github.com/flutter/flutter/wiki/Desktop-shells), building a Windows application
is possible, but not in a stable state. Moreover, Flutter calls Windows builds "debug" builds, producing the following warning:
```
Warning: Only debug is currently implemented for Windows. This is effectively a debug build.
See https://github.com/flutter/flutter/issues/38477 for details and updates.
```

### Notes on CI choice
I have chosen to use Appveyor, because of its Windows support.

Namely, it provides a `Visual Studio 2019` image. Windows builds require Visual Studio and its additional components: MSBuild, MSVC v142 - VS 2019 C++ x64/x86 build tools and Windows 10 SDK (10.0.17763.0).

