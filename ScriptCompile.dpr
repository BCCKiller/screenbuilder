program ScriptCompile;

uses
  Forms,
  scriptcompilemain in 'scriptcompilemain.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
