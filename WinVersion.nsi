; winVersion.nsi - based on example1.nsi
;

; The name of the installer
Name "WinVersion"
Icon "install.ico"
UninstallIcon "uninst.ico"

LicenseText "WinVersion is a free, as-is product. Please read the license terms below before installing."
LicenseData license.txt

; The file to write
OutFile "Install-WinVersion.exe"

; The default installation directory
InstallDir $PROGRAMFILES\WinVersion

; The text to prompt the user to enter a directory
DirText "This will install winMd5Sum on your computer. Choose a directory"

Page license
Page components
Page directory
Page instfiles

Section "!WinVersion (required)"
  SectionIn RO

  SetOutPath $INSTDIR

  File "Release\WinVersion.exe"
  File "readme.txt"
  File "version.h"
  File "version.rc"
  File "version.nsi"
  File "version.ini"
  File "license.txt"

  CreateDirectory "$SMPROGRAMS\WinVersion"
  CreateShortCut "$SMPROGRAMS\WinVersion\Uninstall.lnk" "$INSTDIR\uninstall.exe" "" "$INSTDIR\uninstall.exe" 0
  CreateShortCut "$SMPROGRAMS\WinVersion\License.lnk" "$INSTDIR\license.txt" "" "$INSTDIR\license.txt" 0
  CreateShortCut "$SMPROGRAMS\WinVersion\Read Me.lnk" "$INSTDIR\readme.txt" "" "$INSTDIR\readme.txt" 0

  WriteUninstaller "uninstall.exe"

SectionEnd ; end the section

; == source code ==
Section /o "Install Source Code"
  File *.ico
  File WinVersion.*
  File resource.h
SectionEnd


UninstallText "This will uninstall WinVersion. Hit next to continue."

; special uninstall section.
Section "Uninstall"
  ; remove files
  Delete $INSTDIR\*.*

  ; remove shortcuts, if any.
  Delete "$SMPROGRAMS\WinVersion\*.*"

  ; remove directories used.
  RMDir "$SMPROGRAMS\WinVersion"
  RMDir "$INSTDIR"
SectionEnd

; eof
