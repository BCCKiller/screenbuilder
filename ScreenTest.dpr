program ScreenTest;

uses
  ShareMem,
  Forms,
  ScreenTestMain in 'ScreenTestMain.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
