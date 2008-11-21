program LoadToolImages;

uses
  Forms,
  LoadToolImageMain in 'LoadToolImageMain.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
