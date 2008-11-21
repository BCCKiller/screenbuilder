unit CleanupTabsMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, adsdata, adsfunc, adstable, adscnnct, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    AdsConnection1: TAdsConnection;
    ExamStateTable: TAdsTable;
    TabMasterTable: TAdsTable;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure StripProperties(var ComponentList: TStringList);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
  var ReadBlob, WriteBlob: TStream;
      ComponentsAsString: TStringList;
      BlobField : TField;
begin
    ComponentsAsString := TStringList.Create;
    try
      with TabMasterTable do
      begin
        Open;
        First;
        while not Eof do
        begin
          ComponentsAsString.Clear;
          BlobField := FieldByName('TabComponents');
          ReadBlob := CreateBlobStream(BlobField, bmRead);
          ComponentsAsString.LoadFromStream(ReadBlob);
          StripProperties(ComponentsAsString);
          Edit;
          WriteBlob := CreateBlobStream(BlobField, bmWrite);
          ComponentsAsString.SaveToStream(WriteBlob);
          Post;
          Next;
        end;
        Close;
      end;
      with ExamStateTable do
      begin
        Open;
        First;
        while not Eof do
        begin
          ComponentsAsString.Clear;
          BlobField := FieldByName('TabComponents');
          ReadBlob := CreateBlobStream(BlobField, bmRead);
          ComponentsAsString.LoadFromStream(ReadBlob);
          StripProperties(ComponentsAsString);
          Edit;
          WriteBlob := CreateBlobStream(BlobField, bmWrite);
          ComponentsAsString.SaveToStream(WriteBlob);
          Post;
          Next;
        end;
        Close;
      end;

    finally
      ComponentsAsString.Free;
    end;
    ShowMessage('done');
end;

procedure TForm1.StripProperties(var ComponentList: TStringList);
var x: Integer;
begin
  for x := 0 to ComponentList.Count - 1 do
  begin
    if copy(uppercase(trim(ComponentList.Names[x])),1,8)='EXPLICIT' then
      ComponentList[x] := '';
    if pos('RUSSIAN_CHARSET',ComponentList[x])>0 then
      ComponentList[x] := '';
  end;
  for x := ComponentList.Count-1 downto 0 do
    if ComponentList[x] = '' then ComponentList.Delete(x);
    
    
end;
end.
