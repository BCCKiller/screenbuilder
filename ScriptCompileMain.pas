unit ScriptCompileMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, SmartFields;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FMySmart: TSmartEngine;
    procedure SetMySmart(const Value: TSmartEngine);
    { Private declarations }
    property MySmart: TSmartEngine read FMySmart write SetMySmart;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  FMySmart.SaveAndCompile('exam.pp','exam.bin');
  ShowMessage('Done');
end;

procedure TForm1.SetMySmart(const Value: TSmartEngine);
begin
  FMySmart := Value;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FMySmart := TSmartEngine.Create(Self);
end;

end.
