program CBSDBImageTest;

uses
  ShareMem,
  Forms,
  CBSImageTesterMain in 'CBSImageTesterMain.pas' {Form1},
  CBSGraphics in 'CBSGraphics.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
