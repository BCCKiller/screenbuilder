unit LayoutType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TLayoutTypeForm = class(TForm)
    LayoutGroup: TRadioGroup;
    Button1: TButton;
    PrintCheck: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure LayoutGroupClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LayoutTypeForm: TLayoutTypeForm;

implementation

{$R *.dfm}

procedure TLayoutTypeForm.Button1Click(Sender: TObject);
begin
  if PrintCheck.Checked then
    ModalResult := LayoutGroup.ItemIndex+21
  else
    ModalResult := LayoutGroup.ItemIndex+1;
end;

procedure TLayoutTypeForm.FormPaint(Sender: TObject);
begin
  if (LayoutGroup.ItemIndex = 0) or
  (LayoutGroup.ItemIndex = 3) or
  (LayoutGroup.ItemIndex = 4)
   then
    PrintCheck.Enabled := True
  else
  begin
    PrintCheck.Checked := False;
    PrintCheck.Enabled := False;
  end;
end;

procedure TLayoutTypeForm.LayoutGroupClick(Sender: TObject);
begin
  Refresh;
end;

end.
