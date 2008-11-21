unit PropertyChangeMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, adsdata, adsfunc, adstable, adscnnct;

type
  TPropertyChangeForm = class(TForm)
    PropertyNameEdit: TEdit;
    ActionGroup: TRadioGroup;
    GoButton: TButton;
    CancelButton: TButton;
    AdsConnection1: TAdsConnection;
    TabTable: TAdsTable;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GoButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
  private
    { Private declarations }
    TabInfo: TStrings;
    procedure ReadObjectInfo;
    procedure WriteObjectInfo(NewObjects: TStrings);
  public
    { Public declarations }
  end;

var
  PropertyChangeForm: TPropertyChangeForm;

implementation

{$R *.dfm}

procedure TPropertyChangeForm.CancelButtonClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TPropertyChangeForm.GoButtonClick(Sender: TObject);
begin
  if PropertyNameEdit.Text = '' then
  begin
    ShowMessage('Fill in the name of the property please');
    exit;
  end;
  TabTable.Open;


end;



procedure TPropertyChangeForm.ReadObjectInfo;
var
  BlobField : TField;
  ComponentStream: TMemoryStream;

begin
  TabInfo.Clear;
  Blobfield := TabTable.FieldByName('TabComponents');
  ComponentStream := TabTable.CreateBlobStream(BlobField, bmRead);
  try
    TabInfo.LoadFromStream(ComponentStream);
  finally
    ComponentStream.Free;
  end;

end;

procedure TPropertyChangeForm.WriteObjectInfo(NewObjects: TStrings);
begin

end;

procedure TPropertyChangeForm.FormCreate(Sender: TObject);
begin
  TabInfo := TStringList.Create;
end;

procedure TPropertyChangeForm.FormDestroy(Sender: TObject);
begin
  TabInfo.Free;
end;

end.
