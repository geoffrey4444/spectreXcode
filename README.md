# spectreXcode
This repo contains a simple Xcode project that you can use to navigate and 
edit the source tree. Xcode's git integration will also let you do at least 
common git operations without the terminal.

# Installation and use

1. <code>cd $SPECTRE_ROOT; mkdir spectreXcode; cd spectreXcode</code>
2. <code>git clone git@github.com:geoffrey4444/spectreXcode.git .</code>
3. <code>cd $SPECTRE_ROOT; open ./spectreXcode/spectre/spectre.xcodeproj</code>

# Setting up the project
Before you can use the Xcode project, there are two steps to set it up for your machine.

1. Update build settings. 

You only need to do this step once.

There are some paths that are machine dependent. 
Click the "spectre" project in the file browser, then go to "Build Settings" and click "spectre" 
under project." Scroll to the bottom. 
You need to specify the absolute path to CHARM_ROOT, 
OPENBLAS (typically will be the same on all Macs using homebrew for openblas), 
SPECTRE_ROOT, SPACK_ROOT. 

There is also an option SPECTRE_TEST_GLOB. When you run/debug spectre, it runs 
./bin/RunTests $SPECTRE_TEST_GLOB. This option lets you decide what test gets run in the 
Xcode debugger when you run the target "make-spectre." Edit this, e.g., to whatever 
test you are trying to debug.

2. Update the RunTests path.

You only need to do this step once.

To debug code, you need to tell Xcode where RunTests/ is. It turns out it's in a directory 
that's named uniquely to your system. 

To figure out the directory, build the configure-spectre 
target or (after configuring) the make-spectre target. Click the "Report" navigator, click 
the most recent build, and show the log (click the lines to the right of "running custom...")

Or, just figure out which directory with a name like 
~/Library/Developer/Xcode/DerivedData/spectre-*/build/Products. 
It's the one most recently modified, if you just built spectre. Look in the bin/ directory in 
there to find the correct RunTests.

Then select the "make-spectre" target and choose Product->Scheme->Edit Scheme... 
Under Info, choose "Other..." under executable. Select your RunTests executable.

3. Update the index (optional)

If you want fancy code-completion, etc., you'll need to force Xcode to index all the files in 
SpECTRE. The only good way to do this is by dragging the SPECTRE_ROOT folder into the 
project navigator (the "folder" icon on the left panel). Then, make sure "copy files if needed" 
is unchecked, you create groups (not folder references), and add the files to target 
"xcode-index." This is a fake target that you never build; it just exists for Xcode to 
index the SpECTRE code.

You only need to update the index to include new files, not changes to existing files, and 
then only when you want to update the index for code completion. 

Use the folder reference (blue folder) already in the project for actual work (add, remove, 
edit files). The blue folder updates in real time as files come and go. 

# Adding custom targets

You can add Xcode targets to do basically anything, since targets can run shell scripts.

I made the following targets:
* configure-spectre runs the initial cmake command when you build it.
* make-spectre runs make when you build. When you run, it runs RunTest in the debugger,
running tests set in SPECTRE_TEST_GLOB.
* run-all-tests runs all the tests with ctest

You could add other executables to other targets. Just tell them to do nothing for the build 
stage (e.g. custom build system, with date for the build command), and edit the scheme 
(Product->Scheme->Edit current scheme...) to 
select the correct executable from $BUILD_ROOT. (Look at the build logs to see where this is.)


# Installing clang-format for Xcode

You can easily set up Xcode so a keyboard shortcut clang-format's your code 
using SpECTRE's .clang-format file. (You might need to 
<code>brew install clang-format</code> first.)

1. Go to https://github.com/mapbox/XcodeClangFormat and click "Open in Xcode"
2. In terminal, navigate to root directory of the repo you just cloned 
3. In terminal, run ./configure
4. In Xcode, choose "YOUR NAME (Personal Team)" under Team under "Signing".
5. Choose Project->Build from the menu bar.
6. Run the app.
7. Choose "Custom .clang-format file", and navigate to your checkout of spectre. Select the 
.clang-format file.
8. System Preferences -> Extensions, and enable Xcode Source Editor -> clang-format
9. System Preferences -> Keyboard -> Shortcuts. Select App Shortcuts, and add one for 
Xcode called "Format Source Code"
10. Now, you can choose Editor->clang-format->Format Source Code to clang-format your 
code.


