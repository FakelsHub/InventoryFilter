; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

 #define MyAppVersion "2.0.0"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{604894C4-28E2-46E2-9E30-F1382F609636}
AppName=Inventory Filter plugin for Fallout 2
AppVersion={#MyAppVersion}
DefaultDirName=Fallout2
DisableProgramGroupPage=true
OutputDir=.\
OutputBaseFilename=F2-InventoryFilter_v{#MyAppVersion}
Compression=lzma
SolidCompression=true
Uninstallable=true
DirExistsWarning=no
EnableDirDoesntExistWarning=false
AppCopyright=Mr.Stalin
ShowLanguageDialog=yes
;LanguageDetectionMethod=locale
AppVerName=Inventory Filter v{#MyAppVersion}
UninstallFilesDir={app}\mods\InventoryFilter.dat\
AppendDefaultDirName=false
DisableStartupPrompt=true
DisableFinishedPage=false
FlatComponentsList=true
InfoAfterFile=Use.txt
UsePreviousGroup=false
UserInfoPage=false
UsePreviousTasks=true
InfoBeforeFile=Readme.txt
CreateUninstallRegKey=false

[Languages]
Name: Eng; MessagesFile: compiler:Default.isl
Name: Rus; MessagesFile: compiler:Languages\Russian.isl; InfoBeforeFile: Readme_ru.txt; InfoAfterFile: Use_ru.txt

[Types]
Name: Advanced; Description: Inventory Filter
Name: Custom; Description: Custom Selection; Flags: iscustom

[Components]
Name: Advanced; Description: Inventory Filter v{#MyAppVersion}; Flags: exclusive; Types: Advanced
Name: Advanced\Sfall; Description: install with sFall v4.2.8.1 - Extended version [only DLL]; Types: Advanced

Name: Common; Description: Language version; Types: Custom Advanced; Flags: fixed
Name: Common\Rus; Description: Russian (Text Code Win for 1C); Flags: exclusive; Languages: Rus
Name: Common\Dos; Description: Russian (Text Code Dos for US); Flags: exclusive; Languages: Rus
Name: Common\Eng; Description: English; Flags: exclusive

Name: Source; Description: Source Files; Types: Custom

[Files]
Source: ..\gl_invenfilter.int;   DestDir: {app}\mods\InventoryFilter.dat\scripts\; DestName: gl_InvenFilter.int; Flags: ignoreversion; Components: Advanced
Source: .\sfall_files\ddraw.dll; DestDir: {app}; Flags: uninsneveruninstall confirmoverwrite ignoreversion; Components: Advanced\Sfall
Source: .\sfall_files\ddraw.ini; DestDir: {app}; Flags: uninsneveruninstall onlyifdoesntexist; Components: Advanced\Sfall

;PCX
Source: ..\PCX\InvFilterArt\common\*; DestDir: {app}\mods\InventoryFilter.dat\PCX\InvFilterArt\; Flags: ignoreversion; Components: Advanced
Source: ..\PCX\InvFilterArt\rus\*;    DestDir: {app}\mods\InventoryFilter.dat\PCX\InvFilterArt\; Flags: ignoreversion; Components: Common\Rus Common\Dos
Source: ..\PCX\InvFilterArt\eng\*;    DestDir: {app}\mods\InventoryFilter.dat\PCX\InvFilterArt\; Flags: ignoreversion; Components: Common\Eng

;InvenFilter.ini
Source: ..\ini\InvenFilter.ini;     DestDir: {app}\mods\InventoryFilter.dat\; Flags: ignoreversion; Components: Common\Rus; DestName: InvenFilter.ini
Source: ..\ini\InvenFilter_eng.ini; DestDir: {app}\mods\InventoryFilter.dat\; Flags: ignoreversion; Components: Common\Eng; DestName: InvenFilter.ini
Source: ..\ini\InvenFilter_dos.ini; DestDir: {app}\mods\InventoryFilter.dat\; Flags: ignoreversion; Components: Common\Dos; DestName: InvenFilter.ini

Source: ..\gl_InvenFilter.ssl; DestDir: {app}\mods\InventoryFilter.dat\source\; Flags: ignoreversion; Components: Source

; system
Source: .\SetKeys.bat; DestDir: {app}\mods\InventoryFilter.dat\; Flags: ignoreversion deleteafterinstall; Components: Common

[Icons]
Name: {app}\Inventory Filter Config; Filename: {app}\mods\InventoryFilter.dat\InvenFilter.ini; WorkingDir: {app}

[INI]
;Filename: {app}\ddraw.ini; Section: Misc; Key: InterfaceDontMoveOnTop; String: 1
Filename: {app}\ddraw.ini; Section: Debugging; Key: AllowUnsafeScripting; String: 1

[Code]
//function sfallMods(Default: String): String;
//Begin
// Result := GetIniString('ExtraPatches', 'AutoSearchPath', 'mods', ExpandConstant('{app}') + '\ddraw.ini');
//end; 

[InstallDelete]
Name: {app}\mods\InventoryFilter.dat\PCX\inv_filter; Type: filesandordirs;
Name: {app}\data\PCX\inv_filter; Type: filesandordirs;
Name: {app}\data\scripts\gl_InvenFilter.int; Type: files;
Name: {app}\InvenFilter.ini; Type: files;

[Run]
Filename: {app}\mods\InventoryFilter.dat\SetKeys.bat; WorkingDir: {app}\mods\InventoryFilter.dat\; Description: {cm:ShowS}; Parameters: "InvenFilter.ini ""SwapParty="" ""SwapParty=0"""; Flags: postinstall unchecked runhidden; Components: Advanced
Filename: {app}\mods\InventoryFilter.dat\SetKeys.bat; WorkingDir: {app}\mods\InventoryFilter.dat\; Description: {cm:ShowC}; Parameters: "InvenFilter.ini ""ShowCaps="" ""ShowCaps=0"""; Flags: postinstall runhidden unchecked
Filename: {app}\mods\InventoryFilter.dat\SetKeys.bat; WorkingDir: {app}\mods\InventoryFilter.dat\; Description: {cm:ShowW}; Parameters: "InvenFilter.ini ""ShowWeight="" ""ShowWeight=0"""; Flags: postinstall unchecked runhidden
Filename: {app}\mods\InventoryFilter.dat\SetKeys.bat; WorkingDir: {app}\mods\InventoryFilter.dat\; Description: {cm:ShowB}; Parameters: "InvenFilter.ini ""SmartBarter="" ""SmartBarter=1"""; Flags: postinstall unchecked runhidden; Components: Advanced

[LangOptions]
DialogFontSize=10
WelcomeFontSize=16
TitleFontSize=16
CopyrightFontSize=10

[CustomMessages]
Eng.ShowS=Disable exchange the party members
Rus.ShowS=��������� ����� ����� ����������
Eng.ShowW=Disable weight information
Rus.ShowW=��������� ���������� � ������� ����
Eng.ShowC=Disable information about money in barter
Rus.ShowC=��������� ���� � ���������� ����� � �������
Eng.ShowB=Enable Smart Mode for barter
Rus.ShowB=�������� ����� Smart ��� �������
;Eng.Unsafe=Set AllowUnsafeScripting option (required for work)
;Rus.Unsafe=���������� AllowUnsafeScripting ����� (��������� ��� ������)

[Messages]
ClickFinish=