unit ScreenTestMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    RadioGroup1: TRadioGroup;
    CheckBox1: TCheckBox;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

  procedure LaunchBuilder(ThisApp: THandle; ScreenType: PChar; ScreenLayout: Boolean); StdCall;


implementation

  procedure LaunchBuilder; external 'ScrnBldr.dll';

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var Which: String;
begin
  Case RadioGroup1.ItemIndex of
  0: Which := 'X';
  1: Which := 'P';
  2: Which := 'L';
  3: Which := 'G';
  end;
  LaunchBuilder(Application.handle,PAnsiChar(Which),checkBox1.Checked);
end;

end.
