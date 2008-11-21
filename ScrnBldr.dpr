library ScrnBldr;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  ShareMem,
  SysUtils,
  Classes,
  ScrnBldrProcs in 'ScrnBldrProcs.pas',
  PickFormMain in 'PickFormMain.pas' {PickLayoutForm},
  Setup in 'Setup.pas' {frmSetup},
  ToolForm in 'ToolForm.pas' {frmToolForm},
  Layout in 'Layout.pas' {frmLayout},
  OIForm in 'OIForm.pas' {frmObjectInspector},
  TabAdjustMain in '..\..\CBSComponents\TabAdjustMain.pas' {TabAdjustForm},
  CBSComponents in '..\..\CBSComponents\CBSComponents.pas',
  CBSGraphics in '..\..\CBSComponents\CBSGraphics.pas',
  CBSPrintComponents in '..\..\CBSComponents\CBSPrintComponents.pas',
  LayoutDataMod in '..\..\CBSComponents\LayoutDataMod.pas' {LayoutData: TDataModule},
  SmartFields in '..\..\CBSComponents\SmartFields.pas',
  SmartFunctions in '..\..\CBSComponents\SmartFunctions.pas',
  TabInfo in 'TabInfo.pas' {TabInfoForm},
  ConvertToPrint in 'ConvertToPrint.pas' {ConvertForm};

{$R *.res}
 exports LaunchBuilder;
begin
end.
