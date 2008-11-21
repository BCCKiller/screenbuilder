unit CBSImageTesterMain;

interface

uses
  ShareMem, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GR32_Image, GR32, CBSGraphics, DBCtrls, adscnnct, DB, adsdata,
  adsfunc, adstable, JPEG, StdCtrls, ExtCtrls, Mask, ImageHandlerInt, FDMain;


type
  TForm1 = class(TForm)
    AdsTable1: TAdsTable;
    DataSource1: TDataSource;
    AdsConnection1: TAdsConnection;
    AdsTable2: TAdsTable;
    DataSource2: TDataSource;
    Button1: TButton;
    AdsTable3: TAdsTable;
    DBImage1: TDBImage;
    S_EXAMIMAG: TDataSource;
    DBNavigator1: TDBNavigator;
    DBEdit1: TDBEdit;
    Image1: TImage;
    Button2: TButton;
    DBEdit2: TDBEdit;
    ExamTable: TAdsTable;
    S_EXAM: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure LaunchPicture(Component: TCBSDBImage);
  private
    function ComponentToString(Component: TComponent): string;
    { Private declarations }
  public
    { Public declarations }
    MainPicture :TCBSDBImage;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  AdsTable1.Open;
  MainPicture := TCBSDBImage.Create(Self);
  MainPicture.Parent := Self;
  MainPicture.Left := 10;
  MainPicture.Top := 10;
  MainPicture.DataSource := S_EXAM;
  MainPicture.DataField := 'ZZIMG_GO_R';
  MainPicture.BaseImage := 'AMSLER_R';
  MainPicture.AutoDisplay := True;
  MainPicture.Stretch := True;
  MainPicture.Visible := True;
end;


procedure TForm1.Button1Click(Sender: TObject);
var BlobStream: TStream;
BitStream :TBitMap32;
begin
  BitStream := TBitMap32.Create;
  ADSTable3.Edit;
  BlobStream := S_ExamImag.DataSet.CreateBlobStream(S_ExamImag.DataSet.FieldByName('Image'), bmwrite);
//  ADSTable3.Last;
//  if (ADSTable3.FieldByName('primkey').asinteger = 5) then
//    Image1.Picture.
  BitStream.Assign(Image1.Picture);
  BitStream.SaveToStream(BlobStream);
  ADSTable3.Post;
end;

procedure TForm1.Button2Click(Sender: TObject);
var BaseImage, FileName, FieldName: String;
RecordNumber: Integer;
ReturnRecord: Integer;
begin
  BaseImage := MainPicture.BaseImage;
  FieldName := MainPicture.DataField;
  FileName := MainPicture.DataSource.DataSet.Name;
  RecordNumber := 0;
  LaunchPicture(MainPicture);
  ReturnRecord := HandleImage(BaseImage, FieldName, FileName, RecordNumber );
  ShowMessage(IntToStr(ReturnRecord));
end;

function TForm1.ComponentToString(Component: TComponent): string;

var
  BinStream:TMemoryStream;
  StrStream: TStringStream;
  s: string;
begin
  BinStream := TMemoryStream.Create;
  try
    StrStream := TStringStream.Create(s);
    try
      BinStream.WriteComponent(Component);
      BinStream.Seek(0, soFromBeginning);
      ObjectBinaryToText(BinStream, StrStream);
      StrStream.Seek(0, soFromBeginning);
      Result:= StrStream.DataString;
    finally
      StrStream.Free;

    end;
  finally
    BinStream.Free
  end;
end;



procedure TForm1.LaunchPicture(Component: TCBSDBImage);
const BufSize = 2048;

var MyFile :TFileStream;
  BinStream: TMemoryStream;
begin
  if Assigned(Component) then
  begin
    BinStream:=TMemoryStream.Create;
    MyFile := TFileStream.Create('Graphic.tmp',fmcreate);
    try
      with TWriter.Create(BinStream,BufSize) do
      try
        Root:=Self;
        WriteSignature;
        WriteComponent(Component);
      finally
        Free;
      end;
      BinStream.Seek(0,soFromBeginning);
      ObjectBinaryToText(BinStream,MyFile);
    finally
      BinStream.Free;
      MyFile.Free;
    end;
  end;
end;

end.
