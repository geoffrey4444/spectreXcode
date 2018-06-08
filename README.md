# spectreXcode
This repo contains a simple Xcode project that you can use to navigate and 
edit the source tree. Xcode's git integration will also let you do at least 
common git operations without the terminal.

# Installation and use

1. <code>cd $SPECTRE_ROOT; mkdir spectreXcode; cd spectreXcode</code>
2. <code>git clone git@github.com:geoffrey4444/spectreXcode.git .</code>
3. <code>cd $SPECTRE_ROOT; open ./spectreXcode/spectre/spectre.xcodeproj</code>

# Installing clang-format for Xcode

You can easily set up Xcode so a keyboard shortcut clang-format's your code 
using SpECTRE's .clang-format file. 

1. Go to https://github.com/mapbox/XcodeClangFormat and click "Open in Xcode"
2. In terminal, navigate to root directory of the repo you just cloned 
3. In terminal, run ./configure
4. In Xcode, choose "YOUR NAME (Personal Team)" under Team under "Signing".
5. Choose Project->Build from the menu bar.
6. Run the app.
7. Choose "Custom .clang-format file", and navigate to your checkout of spectre. Select the .clang-format file.
8. System Preferences -> Extensions, and enable Xcode Source Editor -> clang-format
9. System Preferences -> Keyboard -> Shortcuts. Select App Shortcuts, and add one for Xcode called "Format Source Code"
10. Now, you can choose Editor->clang-format->Format Source Code to clang-format your code.
