program ScreenBuilder;



uses
  ShareMem,
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Forms,
  Setup in 'Setup.pas' {frmSetup},
  OIForm in 'OIForm.pas' {frmObjectInspector},
  Layout in 'Layout.pas' {frmLayout},
  SmartFunctions in '..\..\CBSComponents\SmartFunctions.pas',
  TabInfo in 'TabInfo.pas' {TabInfoForm},
  LayoutType in 'LayoutType.pas' {LayoutTypeForm},
  ConvertToPrint in 'ConvertToPrint.pas' {ConvertForm},
  LayoutDataMod in '..\..\CBSComponents\LayoutDataMod.pas' {LayoutData: TDataModule},
  Design in '..\..\CBSComponents\Design.pas' {frmDesign},
  TabAdjustMain in '..\..\CBSComponents\TabAdjustMain.pas' {TabAdjustForm},
  ScreenImport in 'ScreenImport.pas',
  TabExport in '..\..\CBSComponents\TabExport.pas',
  DeleteFormMain in 'DeleteFormMain.pas' {DeleteForm},
  CBSComponents in '..\..\CBSComponents\CBSComponents.pas',
  CBSExtComponents in '..\..\CBSComponents\CBSExtComponents.pas',
  CBSDataSources in '..\..\CBSComponents\CBSDataSources.pas',
  CBSComboBox in '..\..\CBSComponents\CBSComboBox.pas';

{$R *.RES}
{$O-}

begin
  Application.Initialize;
  Application.Title := 'Compulink Screen Generator';
  Application.CreateForm(TfrmLayout, frmLayout);
  Application.CreateForm(TfrmObjectInspector, frmObjectInspector);
  Application.CreateForm(TLayoutData, LayoutData);
  Application.Run;
end.
