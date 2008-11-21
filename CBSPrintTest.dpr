program CBSPrintTest;

uses
  Forms,
  CBSPrintTestMain in 'CBSPrintTestMain.pas' {Form1},
  Design in 'Design.pas' {frmDesign},
  SmartFunctions in '..\..\CBSComponents\SmartFunctions.pas',
  CBSComponents in '..\..\CBSComponents\CBSComponents.pas',
  CBSGraphics in '..\..\CBSComponents\CBSGraphics.pas',
  SmartFields in '..\..\CBSComponents\SmartFields.pas',
  CBSPrintComponents in '..\..\CBSComponents\CBSPrintComponents.pas',
  CBSPrintInterface in '..\..\CBSComponents\CBSPrintInterface.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
