program PropertyChanger;

uses
  Forms,
  PropertyChangeMain in 'PropertyChangeMain.pas' {PropertyChangeForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPropertyChangeForm, PropertyChangeForm);
  Application.Run;
end.
