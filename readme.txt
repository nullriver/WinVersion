WinVersion - readme.txt
Copyright (c) 2005 Nullriver Software. All rights reserved.

WinVersion is a utility to auto-increment your build numbers (something Visual
Studio should do)

This readme is going to be short, cause you're probably a programer and we
assume programers are smart.

Installation:
Put the exe in path or your project directory. Put the ini in your project
directory. Use the example resource file (version.rc) to create a resource file
in your project directory.

Usage:
In your project properties add WinVersion.exe to the Pre-Build event Command
Line. If you only want the build number incrementing on release build, only do
this for the release config. All files that include version.h will be rebuilt.

Config:
verson.ini has 6 things:
Header  - the name of the header file to automatically generate
Install - the NSIS version file to create (blank will skip it)
Major   - the major version of your product
Minor   - the minor version of your product
Release - the release of your product
Build   - the auto-generated build number of your product

Resource Files:
See version.rc for an example of a resource file. You would would add this file
to your resource includes NOT directly into a resource file Visual Studio will
edit. Visual Studio will just screw it up. Sometimes your main resource file
will get a copy of this version info in it (who knows how or why). When this
happens, just delete it from the Visual Stupido resource editor.

For all non-hand-holding questions email support@nullriver.com
