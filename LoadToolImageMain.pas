unit LoadToolImageMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtDlgs, StdCtrls, DBCtrls, JvDBImage, ExtCtrls, Mask, Grids,
  DBGrids, DB, adsdata, adsfunc, adstable, adscnnct, StrUtils;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    AdsConnection1: TAdsConnection;
    AdsTable1: TAdsTable;
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBMemo1: TDBMemo;
    JvDBImage1: TJvDBImage;
    AddButton: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    Tool: TLabel;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    procedure AddButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.AddButtonClick(Sender: TObject);
var TextFromFile: String;
    NextRecord: Integer;
begin
  if OpenPictureDialog1.Execute then
  begin
    TextFromFile := LeftStr(ExtractFileName(OpenPictureDialog1.FileName),
                    Length(ExtractFileName(OpenPictureDialog1.FileName))-
                    (Length(ExtractFileEXT(OpenPictureDialog1.FileName))));
    ADSTable1.IndexName := 'ToolImageID';
    ADSTable1.Last;
    ADSTable1.LockTable;
    NextRecord := ADSTable1.FieldByName('ToolImageID').AsInteger +1;
    ADSTable1.Insert;
    JVDbImage1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
    DBEdit1.Text := TextFromFile;
    DBMemo1.Text := TextFromFile;
    ADSTable1.FieldByName('ToolImageID').AsInteger := NextRecord;
    ADSTable1.Post;
    ADSTable1.UnlockTable;
    ADSTable1.IndexName := 'ToolLabel'
  end;
end;

end.
