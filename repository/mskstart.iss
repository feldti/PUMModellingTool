; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "PUM"
#define MyAppVersion "10.00 (VA 9.2)"
#define MyAppPublisher "Marten Feldtmann"
#define MyAppURL "https://feldtmann.ddns.net/"
#define MyAppExeName "pum.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{C57C410F-4DCA-46F3-9A05-030FF24C9828}}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DisableDirPage=no
DefaultGroupName={#MyAppName}
OutputBaseFilename=InstallPUM-{#MyAppVersion}
Compression=lzma
SolidCompression=yes
; "ArchitecturesAllowed=x64" specifies that Setup cannot run on
; anything but x64.
ArchitecturesAllowed=x64
; "ArchitecturesInstallIn64BitMode=x64" requests that the install be
; done in "64-bit mode" on x64, meaning it should use the native
; 64-bit Program Files directory and the 64-bit view of the registry.
ArchitecturesInstallIn64BitMode=x64

[Code]

procedure AfterInstall(S: String);
  var
    content: AnsiString;
    fullFileName, changedContent: String;
begin
  fullFileName := ExpandConstant(S);
  Log('AfterMyProgInstall(''' + fullFileName + ''') called');
  if (LoadStringFromFile( fullFileName, content)) then
    begin
       changedContent := ExpandConstant( content);
       SaveStringToFile( fullfilename, changedContent, false);
    end;
end;

[Languages]
Name: "English"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Dirs]
Name: "{commonappdata}\{#MyAppName}"
Name: "{commonappdata}\{#MyAppName}\models"
Name: "{app}\nls" ; Permissions: users-modify;
Name: "{app}\bitmaps" ; Permissions: users-modify;

[Files]
Source: "X:\projects\pum-installation\install\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Setup]
PrivilegesRequired=admin

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}" 
Name: "{commondesktop}\{#MyAppName} - Poor Users Modeller"; Filename: "{app}\{#MyAppExeName}" 

[Run]
; Filename: "{app}\bin\{#MyAppExeName}" ; Parameters: "-msd -singleinstance -i{commonappdata}\{#MyAppName}\ics\win_seasidestarter.ic -ini:{commonappdata}\{#MyAppName}\mskstart.ini"; WorkingDir: "{app}\bin\" ; Description: "Server Starten"; Flags: postinstall skipifsilent runminimized
