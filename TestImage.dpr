program TestImage;

uses
  ShareMem,
  Forms,
  TestImageMain in 'TestImageMain.pas' {Form1},
  ImageHandlerInt in 'ImageHandlerInt.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
