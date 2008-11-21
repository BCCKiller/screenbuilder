unit UpdateScreenBuilderMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, adsdata, adsfunc, adstable, adscnnct, StdCtrls, ComCtrls;

type
  TUpdateScreenBuilderForm = class(TForm)
    UpdateConnection: TAdsConnection;
    ExamStateTable: TAdsTable;
    TabMasterTable: TAdsTable;
    StatusBar1: TStatusBar;
    UpdateQuery: TAdsQuery;
    LayoutMasterTable: TAdsTable;
    SelectQuery: TAdsQuery;
  private
    FCurrentVersion: String;
    FLastVersion: String;
    { Private declarations }
    procedure StripProperties(var ComponentList: TStringList);
    procedure StripItems(var ComponentList: TStringList);
    procedure SetCurrentVersion(const Value: String);
    procedure SetLastVersion(const Value: String);
    property CurrentVersion: String read FCurrentVersion write SetCurrentVersion;
    property LastVersion: String read FLastVersion write SetLastVersion;
    procedure NewTabDescription;
    procedure NewNames;
    procedure ClearConnection;
    procedure RemoveBlankTabs;
  public
    { Public declarations }
    procedure CleanupTabs;
    procedure UpdateScreenBuilder(const InputCurrentVersion: String);
  end;

function EarlierVersion(const CheckVersion, CompareVersion:String):Boolean;

var
  UpdateScreenBuilderForm: TUpdateScreenBuilderForm;

implementation
uses IniFiles, StrUtils;

{$R *.dfm}

function EarlierVersion(const CheckVersion, CompareVersion:String):Boolean;
function GetSegmentInt(const VersionString: String; const Segment: Integer): Integer;
var SegmentString: String;
    Startgrabbing: Boolean;
    Dots, I: Integer;
begin
  Dots := 0;
  SegmentString := '';
  StartGrabbing := (Segment-1=Dots);
  for I := 1 to Length(VersionString) do
  begin
    if StartGrabbing then
    begin
      if VersionString[I]='.' then
        break
      else
        SegmentString := SegmentString + VersionString[I]
    end;
    if VersionString[I]='.' then
    begin
      Inc(Dots);
      StartGrabbing := (Segment-1=Dots);
    end;
  end;
  If Length(SegmentString)>0 then Result := StrToInt(SegmentString);
end;

var CheckPart, Comparepart: Integer;
    I: Integer;
begin
  Result := False;
  for I := 1 to 4 do
  begin
    CheckPart := GetSegmentInt(Checkversion,I);
    ComparePart := GetSegmentInt(CompareVersion,I);
    if CheckPart < ComparePart then
    begin
      Result := True;
      break;
    end;
  end;
end;

procedure TUpdateScreenBuilderForm.UpdateScreenBuilder(const InputCurrentVersion: String);
begin
  CurrentVersion := InputCurrentVersion;
  with TIniFile.Create(GetCurrentDir+'\SBCheck.ini') do
    try
      LastVersion := ReadString('Update', 'LastVersion', '1.1.0.0');
      if EarlierVersion(LastVersion,'1.1.0.87') then NewNames;
      // Clean up tabs takes TOO long on converted data
      // if LastVersion < '1.1.0.89' then CleanupTabs;
      // Stopped running RemoveBlankTabs per Link 11/7/07
      //if EarlierVersion(LastVersion,'1.1.0.90') then RemoveBlankTabs;
      if EarlierVersion(LastVersion,'1.1.0.96') then NewTabDescription;
      WriteString('Update','LastVersion',CurrentVersion);
    finally
      Free;
    end;
end;


procedure TUpdateScreenBuilderForm.CleanupTabs;
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
          //StripItems(ComponentsAsString);
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
  ClearConnection;
end;

procedure TUpdateScreenBuilderForm.NewTabDescription;
begin
  // Changes TabDescription index in TabMaster;
  with UpdateQuery do
  begin
    Close;
    with SQL do
    begin
      Clear;
      Add('DROP INDEX tabmaster.tabdescription;');
    end;
    ExecSQL;
    Close;
    with SQL do
    begin
      Clear;
      Add('CREATE INDEX tabdescription on tabmaster (tabdescription, LayoutType)');
    end;
    ExecSQL;
    Close;
  end;
  ClearConnection;
end;


procedure TUpdateScreenBuilderForm.RemoveBlankTabs;
begin
  with UpdateQuery do
  begin
    with SQL do
    begin
      Clear;
      Add('Delete from tabmaster where tabdescription is null');
    end;
    ExecSQL;
    AdsCloseSQLStatement;
    with SQL do
    begin
      Clear;
      Add('Delete from layouttablinkmaster');
      Add('where tabid not in (select tabid from tabmaster)');
    end;
  end;
  ClearConnection;
end;

procedure TUpdateScreenBuilderForm.ClearConnection;
var I: Integer;
begin
  for I := 0 to UpdateConnection.DatasetCount - 1 do
  begin
    if UpdateConnection.DataSets[I] is TADSQuery then
       TADSQuery(UpdateConnection.DataSets[I]).AdsCloseSQLStatement;
  end;
  UpdateConnection.CloseCachedTables;
    
end;

procedure TUpdateScreenBuilderForm.NewNames;
// Changes duplicate names in layoutmaster and tabmaster to be different
var AskForLive: Boolean;
    x: Integer;
    Description, LayoutType: String;
    PrintLayout: Boolean;
begin
  // Fix LayoutMaster
  with UpdateQuery.SQL do
  begin
    Close;
    Clear;
    Add('Update LayoutMaster');
    Add('set LayoutName = :NewLayoutName');
    Add('where LayoutID = :LayoutID');
  end;

  with SelectQuery do
  begin
    Close;
    AskForLive := RequestLive;
    RequestLive := False;
    With SQL do
    begin
      Clear;
      Add('Select * from LayoutMaster');
      Add('order by upper(LayoutName),LayoutType, PrintLayout, LayoutID');
    end;
    Open;
    if RecordCount >1 then
    begin
      First;
      // Get the starting checks
      Description := uppercase(trim(FieldByName('LayoutName').AsString));
      LayoutType := FieldByName('LayoutType').AsString;
      PrintLayout := FieldByName('PrintLayout').AsBoolean;
      x := 0;
      // Move to the next record
      Next;
      while not EOF do
      begin
        // The next record is the same as the previous
        if (Description = uppercase(trim(FieldByName('LayoutName').AsString)))
        and (LayoutType = FieldByName('LayoutType').AsString)
        and (PrintLayout = FieldByName('PrintLayout').AsBoolean) then
        begin
          UpdateQuery.ParamByName('NewLayoutName').AsString := Description + IntToStr(x);
          UpdateQuery.ParamByName('LayoutID').AsString := FieldByName('LayoutID').AsString;
          UpdateQuery.ExecSQL;
          UpdateQuery.Close;
          inc(x);
        end
        else
        begin
          Description := uppercase(trim(FieldByName('LayoutName').AsString));
          LayoutType := FieldByName('LayoutType').AsString;
          PrintLayout := FieldByName('PrintLayout').AsBoolean;
          x := 0;
        end;
        Next;
      end;
    end;
    Close;
    RequestLive := AskForLive;
  end;
  // fix Tabmaster
  with UpdateQuery.SQL do
  begin
    Close;
    Clear;
    Add('Update TabMaster');
    Add('set TabDescription = :NewTabDescription');
    Add('where TabID = :TabID');
  end;

  with SelectQuery do
  begin
    Close;
    AskForLive := RequestLive;
    RequestLive := False;
    With SQL do
    begin
      Clear;
      Add('Select * from TabMaster');
      Add('order by upper(TabDescription),LayoutType, PrintLayout, TabID');
    end;
    Open;
    if RecordCount >1 then
    begin
      First;
      // Get the starting checks
      Description := uppercase(trim(FieldByName('TabDescription').AsString));
      LayoutType := FieldByName('LayoutType').AsString;
      PrintLayout := FieldByName('PrintLayout').AsBoolean;
      x := 0;
      // Move to the next record
      Next;
      while not EOF do
      begin
        // The next record is the same as the previous
        if (Description = uppercase(trim(FieldByName('TabDescription').AsString)))
        and (LayoutType = FieldByName('LayoutType').AsString)
        and (PrintLayout = FieldByName('PrintLayout').AsBoolean) then
        begin
          UpdateQuery.ParamByName('NewTabDescription').AsString := Trim(FieldByName('TabDescription').AsString) + IntToStr(x);
          UpdateQuery.ParamByName('TabID').AsString := FieldByName('TabID').AsString;
          UpdateQuery.ExecSQL;
          UpdateQuery.Close;
          inc(x);
        end
        else
        begin
          Description := uppercase(trim(FieldByName('TabDescription').AsString));
          LayoutType := FieldByName('LayoutType').AsString;
          PrintLayout := FieldByName('PrintLayout').AsBoolean;
          x := 0;
        end;
        Next;
      end;
    end;
    Close;
    RequestLive := AskForLive;
  end;
  ClearConnection;
end;

procedure TUpdateScreenBuilderForm.SetCurrentVersion(const Value: String);
begin
  FCurrentVersion := Value;
end;

procedure TUpdateScreenBuilderForm.SetLastVersion(const Value: String);
begin
  FLastVersion := Value;
end;

procedure TUpdateScreenBuilderForm.StripItems(var ComponentList: TStringList);
var x: Integer;
    InItems: Boolean;
    InCombo: Boolean;
begin
  InItems := False;
  InCombo := False;
  for x := 0 to ComponentList.Count - 1 do
  begin
    if pos('CBSDBCOMBOBOX',uppercase(trim(ComponentList.Names[x])))>0 then
      InCombo := True;
    
    if copy(uppercase(trim(ComponentList.Names[x])),1,3)='END' then
      InCombo := False;
    // Look for beginning of Items.Strings
    if copy(uppercase(trim(ComponentList.Names[x])),1,13)='ITEMS.STRINGS' then
      InItems := True;
    // Clear everything while in Items
    if InItems and InCombo then
    begin
      // check to see if this is the last one
      if RightStr(trim(ComponentList[x]),1)=')' then
        InItems := False;
      ComponentList[x] := '';
    end;
  end;
  for x := ComponentList.Count-1 downto 0 do
    if ComponentList[x] = '' then ComponentList.Delete(x);
end;

procedure TUpdateScreenBuilderForm.StripProperties(var ComponentList: TStringList);
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
