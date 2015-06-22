!include "MUI2.nsh"
!include "LogicLib.nsh"
!include "x64.nsh"
CRCCheck on
XPStyle on
Name "ProjectMagenta"
OutFile "ProjectMagenta_setup.exe"
InstallDir "$PROGRAMFILES\ProjectMagenta"
InstallDirRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\ProjectMagenta" "InstallLocation"
RequestExecutionLevel admin
SetCompress auto
SetCompressor /solid lzma
SetDatablockOptimize on
VIAddVersionKey ProductName "ProjectMagenta"
VIAddVersionKey LegalCopyright "Copyright 2015 Bill Dengler."
VIAddVersionKey ProductVersion "0.3.0"
VIAddVersionKey FileVersion "0.3.0"
VIProductVersion "0.3.0.0"
!insertmacro MUI_PAGE_WELCOME
!define MUI_LICENSEPAGE_RADIOBUTTONS
!insertmacro MUI_PAGE_LICENSE "license.txt"
!insertmacro MUI_PAGE_DIRECTORY
var StartMenuFolder
!insertmacro MUI_PAGE_STARTMENU startmenu $StartMenuFolder
!insertmacro MUI_PAGE_INSTFILES
!define MUI_FINISHPAGE_LINK "Visit ProjectMagenta website"
!define MUI_FINISHPAGE_LINK_LOCATION "http://n6.io/magenta"
!define MUI_FINISHPAGE_RUN "$INSTDIR\ProjectMagenta.exe"
!define MUI_FINISHPAGE_RUN_PARAMETERS "-i"
!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
  !insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "French"
!insertmacro MUI_LANGUAGE "Spanish"
!insertmacro MUI_LANGUAGE "Italian"
!insertmacro MUI_LANGUAGE "Finnish"
!insertmacro MUI_LANGUAGE "Russian"
!insertmacro MUI_LANGUAGE "PortugueseBR"
!insertmacro MUI_LANGUAGE "Polish"
!insertmacro MUI_LANGUAGE "German"
!insertmacro MUI_LANGUAGE "Hungarian"
!insertmacro MUI_LANGUAGE "Turkish"
!insertmacro MUI_LANGUAGE "Arabic"
!insertmacro MUI_LANGUAGE "Galician"
!insertmacro MUI_LANGUAGE "Catalan"
!insertmacro MUI_LANGUAGE "Basque"
!insertmacro MUI_RESERVEFILE_LANGDLL
Section
SetShellVarContext All
SetOutPath "$INSTDIR"
${If} ${RunningX64}
File /r ProjectMagenta64\*
${Else}
File /r ProjectMagenta\*
${EndIf}
CreateShortCut "$DESKTOP\ProjectMagenta.lnk" "$INSTDIR\ProjectMagenta.exe" "-i"
!insertmacro MUI_STARTMENU_WRITE_BEGIN startmenu
CreateDirectory "$SMPROGRAMS\$StartMenuFolder"
CreateShortCut "$SMPROGRAMS\$StartMenuFolder\ProjectMagenta.lnk" "$INSTDIR\ProjectMagenta.exe" "-i"
CreateShortCut "$SMPROGRAMS\$StartMenuFolder\ProjectMagenta on the web.lnk" "http://n6.io/magenta"
CreateShortCut "$SMPROGRAMS\$StartMenuFolder\Uninstall.lnk" "$INSTDIR\Uninstall.exe"
!insertmacro MUI_STARTMENU_WRITE_END
WriteUninstaller "$INSTDIR\Uninstall.exe"
WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\ProjectMagenta" "DisplayName" "ProjectMagenta"
WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\ProjectMagenta" "UninstallString" '"$INSTDIR\uninstall.exe"'
WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall" "InstallLocation" $INSTDIR
WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall" "Publisher" "Manuel Cortéz"
WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\ProjectMagenta" "DisplayVersion" "0.80"
WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\ProjectMagenta" "URLInfoAbout" "http://n6.io/magenta"
WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\ProjectMagenta" "VersionMajor" 0
WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\ProjectMagenta" "VersionMinor" 80
WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\ProjectMagenta" "NoModify" 1
WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\ProjectMagenta" "NoRepair" 1
SectionEnd
Section "Uninstall"
SetShellVarContext All
DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\ProjectMagenta"
RMDir /r /REBOOTOK $INSTDIR
Delete "$DESKTOP\ProjectMagenta.lnk"
!insertmacro MUI_STARTMENU_GETFOLDER startmenu $StartMenuFolder
RMDir /r "$SMPROGRAMS\$StartMenuFolder"
SectionEnd
Function .onInit
${If} ${RunningX64}
StrCpy $instdir "$programfiles64\ProjectMagenta"
${EndIf}
!insertmacro MUI_LANGDLL_DISPLAY
FunctionEnd
