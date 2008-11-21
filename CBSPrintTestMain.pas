unit CBSPrintTestMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, gtCstDocEng, gtCstPlnEng, gtCstPDFEng, gtExPDFEng,
  gtPDFEng, gtClasses, DB, adsdata, adsfunc, adstable, adscnnct,
  Design, CBSComponents, ComCtrls;

type

  TForm1 = class(TForm)
    gtDocSettings1: TgtDocSettings;
    gtPDFEngine1: TgtPDFEngine;
    Button1: TButton;
    AdsConnection1: TAdsConnection;
    AdsQuery1: TAdsQuery;
    Button2: TButton;
    TreeView1: TTreeView;
    Button3: TButton;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FFieldList: TStringList;
    procedure FillQuery(LayoutID: Integer);
    procedure SetFieldList(const Value: TStringList);
    property FieldList: TStringList read FFieldList write SetFieldList;
    procedure FindAllFields;
    procedure MakeFieldList;
    procedure ExtractInfo(ExtractString: TStrings; BaseNode: TTreeNode);
    procedure GetObjectInfo(CurrentNode: TTreeNode; ObjectTop, ObjectLeft: Integer);
    function GoodProperty(TestString: String):Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FillQuery(LayoutID: Integer);
begin
  with ADSQuery1 do
  begin
    Close;
    with SQL do
    begin
      Clear;
      Add('Select TabComponents, TabLabel from Tabmaster,');
      Add('LayoutTabLinkMaster as Link, LayoutMaster as Layout');
      Add('where Layout.LayoutID = :LayoutID and Layout.LayoutID = Link.LayoutID');
      Add('and Link.TabID = TabMaster.TabID');
      Add('Order by Link.TabSort');
    end;
    ParamByName('LayoutID').AsInteger := LayoutID;
    Open;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  // Run Query
  FillQuery(10);
  // Get all Components
  //ShowMessage(IntToStr(ADSQuery1.RecordCount));
  // Strip out Fields
  FindAllFields;
  MakeFieldList;
  // Put on the page in relative order
  // Print
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  with gtPDFEngine1 do
  begin
  FileName := 'Output.pdf';
  Page.PaperSize := A4;
  //... Set any other document properties as required
  BeginDoc;
  // 1st Page: Render text, image and other items here
  // Write 'Welcome to Gnostice eDocEngine' in the output at position(1,1)
  TextOut(1,1,'Welcome to Gnostice eDocEngine');
  NewPage;
  // 2nd Page: Render text, image and other items here
  // Similarly, insert any number of pages by calling the NewPage method
  EndDoc;
  end;
end;

procedure TForm1.FindAllFields;
var
  ComponentStream: TStream;
  CheckObjectStream: TStringStream;
  MyStrings: TStrings;
  BlobField : TField;
  x: Integer;
  ThisParent : TForm;
  EnterMethod, ExitMethod, ClickMethod, DblClickMethod, DropDownMethod : TMethod;
  BaseNode: TTreeNode;
begin
  with ADSQuery1 do
  begin
    MyStrings := TStringList.Create;
    try
    while not Eof do
    begin
      BaseNode := TreeView1.Items.Add(Nil,ADSQuery1.FieldByName('TabLabel').AsString );
      Blobfield := FieldByName('TabComponents');
      ComponentStream := CreateBlobStream(BlobField, bmRead);
      CheckObjectStream := TStringStream.Create('');
      CheckObjectStream.CopyFrom(ComponentStream, ComponentStream.Size);
      CheckObjectStream.Seek(0,soFromBeginning);
//      MyStrings.LoadFromStream(CheckObjectStream.ReadString(CheckObjectStream.Size));
       MyStrings.LoadFromStream(CheckObjectStream);
      // ShowMessage(MyStrings.Text);
      ExtractInfo(MyStrings, BaseNode);
      Next;
    end;
    finally
      MyStrings.Free;
      MyStrings := nil;
    end;
  end;
end;

procedure TForm1.ExtractInfo(ExtractString: TStrings; BaseNode: TTreeNode);
var x: Integer;
    ThisString: String;
    Node: TTreeNode;
begin
  Node := BaseNode;
  for x := 0 to ExtractString.Count -1 do
  begin
    thisString := Trim(ExtractString.Strings[x]);
    if (copy(thisstring,1,7) = 'object ') or
       (thisstring = 'item')then
    begin
      Node := TreeView1.Items.AddChild(Node,Copy(ThisString,7));
    end
    else
    begin
      if copy(thisString,1,3) = 'end' then
      begin
        Node := Node.Parent;
        if Node = BaseNode then
          exit;
      end
      else
        if GoodProperty(ThisString) then
          TreeView1.Items.AddChild(Node,ThisString);
    end;
    if Node = BaseNode then exit;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var x: Integer;
begin
  for x := 0 to Treeview1.Items.Count - 1 do
  begin
    if TreeView1.Items[x].Text = '' then
    begin
    end;
  end;
end;

procedure TForm1.GetObjectInfo(CurrentNode: TTreeNode; ObjectTop,
  ObjectLeft: Integer);
begin

end;

function TForm1.GoodProperty(TestString: String): Boolean;
var x: Integer;
    PropString: String;
begin
 Result := False;
 for x:= 0 to 7 do
 begin
   case x of
   0: Result := ('Top' = copy(TestString,1,Length('Top')));
   1: Result := ('Left' = copy(TestString,1,Length('Left')));
   2: Result := ('Width' = copy(TestString,1,Length('Width')));
   3: Result := ('Color' = copy(TestString,1,Length('Color')));
   4: Result := ('Height' = copy(TestString,1,Length('Height')));
   5: Result := ('Caption' = copy(TestString,1,Length('Caption')));
   6: Result := ('DataField' = copy(TestString,1,Length('DataField')));
   7: Result := ('DataSource' = copy(TestString,1,Length('DataSource')));
   end;
   if Result then break;
 end;
end;

procedure TForm1.SetFieldList(const Value: TStringList);
begin
  FFieldList := Value;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FFieldList := TStringList.Create;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FFieldList.Free;
end;

procedure TForm1.MakeFieldList;
var x:Integer;
    ThisNode: TTreeNode;
begin
  FFieldList.Clear;
  for x := 0 to TreeView1.Items.Count -1 do
  begin

  end;

end;

end.
