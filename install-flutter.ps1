./flutter/bin/flutter doctor
./flutter/bin/flutter channel master
./flutter/bin/flutter upgrade
./flutter/bin/flutter config --enable-windows-desktop
echo "BUILDING FOR WINDOWS"
./flutter/bin/flutter build windows
