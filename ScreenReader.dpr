program ScreenReader;

uses
  ShareMem,
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Forms,
  ScreenReaderMain in 'ScreenReaderMain.pas' {DisplayScreen},
  CBSComponents in '..\..\CBSComponents\CBSComponents.pas',
  Layout in 'Layout.pas' {frmLayout},
  CBSGraphics in '..\..\CBSComponents\CBSGraphics.pas',
  SmartFunctions in '..\..\CBSComponents\SmartFunctions.pas',
  SmartFields in '..\..\CBSComponents\SmartFields.pas',
  OIForm in 'OIForm.pas' {frmObjectInspector},
  ImageDataModule in '..\..\CBSComponents\ImageDataModule.pas' {ImageData: TDataModule},
  FormComponents in '..\..\CBSComponents\FormComponents.pas',
  TabInfo in 'TabInfo.pas' {TabInfoForm},
  CBSPDFPrint in '..\..\CBSComponents\CBSPDFPrint.pas',
  CBSPrintComponents in '..\..\CBSComponents\CBSPrintComponents.pas',
  CBSPrintInterface in '..\..\CBSComponents\CBSPrintInterface.pas',
  LayoutDataMod in '..\..\CBSComponents\LayoutDataMod.pas' {LayoutData: TDataModule},
  Design in '..\..\CBSComponents\Design.pas' {frmDesign},
  PrintSupport in '..\PrintHandler\PrintSupport.pas' {PrintSupportForm},
  ImageHandlerInt in '..\..\CBSComponents\ImageHandlerInt.pas',
  CBSExtComponents in '..\..\CBSComponents\CBSExtComponents.pas',
  CBSKrimskyDisplay in '..\..\CBSComponents\CBSKrimskyDisplay.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TLayoutData, LayoutData);
  Application.CreateForm(TDisplayScreen, DisplayScreen);
  //  Application.CreateForm(TPickLayoutForm, PickLayoutForm);
//  Application.CreateForm(TfrmObjectInspector, frmObjectInspector);
//  Application.CreateForm(TImageData, ImageData);
  Application.Run;
end.
