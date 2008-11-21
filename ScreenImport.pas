unit ScreenImport;

interface

uses Forms, SysUtils, Controls, Classes, Dialogs, DB, DBGrids, ComCtrls,
     Design, CBSComponents, Graphics, math, IniFiles;

type TScreenImporter = class(TComponent)
private
  FLayoutPageControl: TPageControl;
  FDataSource: TDataSource;
  CurrentTab :TTabSheet;
  CurrentForm : TfrmDesign;
  CurrentDirectory: String;
  GridAreaTop: Integer;
  LastGrid: TCBSDBGrid;
  procedure CreateBlankTab;
  function FixName(Oldname: String): String;
  function GetEditType(DataField: String): Char;
  procedure ImportFrom(FileName: String);
  procedure ImportNewCheckBox(ParsedLine: TStringList);
  procedure ImportNewCombo(ParsedLine: TStringList);
  procedure ImportNewDate(ParsedLine: TStringList);
  procedure ImportNewEdit(ParsedLine: TStringList);
  procedure ImportNewLabel(ParsedLine: TStringList);
  procedure ImportNewMemo(ParsedLine: TStringList);
  procedure ImportNewTab(ParsedLine: TStringList);
  procedure ImportNewGrid(ParsedLine: TStringList);
  procedure ModifyLastGrid(ParsedLine: TStringList);
  procedure SetDataSource(const Value: TDataSource); overload;
  procedure SetDataSource(const Value: String); overload;
  procedure ImportConfig(const Filename:WideString; const ScreenType: Char);
  function GetScreenFile(const Filename:WideString; const ScreenType: Char; ScreenFile:Boolean=True):WideString;
  procedure AddGrids(const Filename:WideString);
  procedure AddGridColumns(const Filename:WideString);
  procedure SetGridAreaTop;
public
  constructor Create(AOwner: TComponent; DataSource: TDataSource; LayoutPageControl:TPageControl);overload;
  constructor Create(AOwner: TComponent; LayoutPageControl:TPageControl);overload;
  destructor Destroy;override;
  procedure ImportScreen; overload;
  procedure ImportScreen(Filename:WideString; ScreenType: Char='P');overload;
  property DataSource: TDataSource read FDataSource write SetDataSource;
end;

implementation

procedure ParseDelimited(const sl : TStrings; const value : string; const delimiter : string) ;
var
   dx : integer;
   ns : string;
   txt : string;
   delta : integer;
begin
   delta := Length(delimiter) ;
   txt := value + delimiter;
   sl.BeginUpdate;
   sl.Clear;
   try
     while Length(txt) > 0 do
     begin
       dx := Pos(delimiter, txt) ;
       ns := Copy(txt,0,dx-1) ;
       sl.Add(ns) ;
       txt := Copy(txt,dx+delta,MaxInt) ;
     end;
   finally
     sl.EndUpdate;
   end;
end;


procedure TScreenImporter.ImportScreen;
var FileDialog: TOpenDialog;
    FileFilter: String;
begin
  FileFilter := 'Exam Screen (*.ex)|*.ex';
  FileDialog := TOpenDialog.Create(Self);
  try
    FileDialog.Filter := FileFilter;
    if FileDialog.Execute then
    begin
      if MessageDlg('You are about to import from ' +FileDialog.FileName+'. Do you want to do that?',
                    mtConfirmation, mbYesNo, 0) = mrYes then
      begin
        FLayoutPageControl.Visible := False;
        try
          ImportFrom(FileDialog.FileName);
        finally
          FLayoutPageControl.Visible := true;
        end;
      end;
    end;
  finally
    FreeAndNil(FileDialog);
  end;

end;

procedure TScreenImporter.CreateBlankTab;
begin
    CurrentTab := TTabSheet.Create(FLayoutPageControl);
    CurrentTab.PageControl := FLayoutPageControl;
    CurrentTab.Parent := FLayoutPageControl;
    CurrentForm := TfrmDesign.Create(Application);
    CurrentForm.BorderStyle := bsNone;
    CurrentForm.Align := alClient;
    CurrentForm.Parent := CurrentTab;
    CurrentForm.Visible := True;
    FLayoutPageControl.ActivePage := CurrentTab;
//    FLayoutPageControl.Visible := True;

end;

procedure TScreenImporter.ImportFrom(FileName: String);
var TotalFile, ParsedLine: TStringList;
    x: Integer;
    EditType: Char;
    ThisDataSource: TDataSource;
    HoldActive: Boolean;
    FileType: String;
begin
{$O-}
  TotalFile := TStringList.Create;
  ParsedLine := TStringList.Create;
  TotalFile.LoadFromFile(FileName);
  FileType := UpperCase(ExtractFileExt(FileName));
  HoldActive := FDataSource.DataSet.Active;
  FDataSource.DataSet.Active := True;
  try
    for x := 0 to TotalFile.Count -1 do
    begin
      ParseDelimited(ParsedLine,TotalFile[x],'^');
      if (x = 0) and (ParsedLine[0]<>'T') then
      begin
        Randomize;
        CreateBlankTab;
        CurrentForm.TabName := 'Blank-'+IntToStr(Random(9999));
      end;
      if ParsedLine[0]='T' then ImportNewTab(ParsedLine);
      if ParsedLine[0]='L' then ImportNewLabel(ParsedLine);
      if ParsedLine[0]='E' then
      begin
        EditType := GetEditType(ParsedLine[3]);
        case EditType of
        'D': ImportNewDate(ParsedLine);
        'L': ImportNewCheckBox(ParsedLine);
        else
          if ParsedLine[ParsedLine.Count-1] = 'Y' then
            ImportNewCombo(ParsedLine)
          else
            ImportNewEdit(ParsedLine);
        end;
      end;
      if ParsedLine[0]='M' then ImportNewMemo(ParsedLine);
      if ParsedLine[0]='P' then ImportNewGrid(ParsedLine);
      if ParsedLine[0]='S' then ModifyLastGrid(ParsedLine);
    end;

  finally
    TotalFile.Free;
    ParsedLine.Free;
    FDataSource.DataSet.Active := HoldActive;
  end;

end;

procedure TScreenImporter.ImportNewEdit(ParsedLine: TStringList);
var NewComponent: TCBSDBEdit;
begin
  NewComponent := TCBSDBEdit.Create(CurrentForm);
  NewComponent.Parent := CurrentForm;
  CurrentForm.AutoName(NewComponent);
  NewComponent.Left := StrToInt(ParsedLine[1]);
  NewComponent.Top := StrToInt(ParsedLine[2]);
  NewComponent.DataSource := FDataSource;
  NewComponent.DataField := FixName(ParsedLine[3]);
  NewComponent.Color := StringToColor(ParsedLine[4]);
  NewComponent.Width := 7 + (NewComponent.DataSource.DataSet.FieldByName(NewComponent.DataField).DisplayWidth*7);
  //GetFieldSize(NewComponent.DataField);
  FLayoutPageControl.Height := max(FLayoutPageControl.Height,NewComponent.Top+NewComponent.Height);
end;

procedure TScreenImporter.ImportNewCombo(ParsedLine: TStringList);
var NewComponent: TCBSDBComboBox;
begin
  NewComponent := TCBSDBComboBox.Create(CurrentForm);
  NewComponent.Parent := CurrentForm;
  CurrentForm.AutoName(NewComponent);
  NewComponent.Left := StrToInt(ParsedLine[1]);
  NewComponent.Top := StrToInt(ParsedLine[2]);
  NewComponent.DataSource := FDataSource;
  NewComponent.DataField := FixName(ParsedLine[3]);
  NewComponent.Color := StringToColor(ParsedLine[4]);
  NewComponent.Width := 24 + (NewComponent.DataSource.DataSet.FieldByName(NewComponent.DataField).DisplayWidth*8);
//  NewComponent.Width := GetFieldSize(NewComponent.DataField);
  FLayoutPageControl.Height := max(FLayoutPageControl.Height,NewComponent.Top+NewComponent.Height);
end;

procedure TScreenImporter.ImportNewMemo(ParsedLine: TStringList);
var NewComponent: TCBSDBMemo;
begin
  NewComponent := TCBSDBMemo.Create(CurrentForm);
  NewComponent.Parent := CurrentForm;
  CurrentForm.AutoName(NewComponent);
  NewComponent.Left := StrToInt(ParsedLine[1]);
  NewComponent.Top := StrToInt(ParsedLine[2]);
  NewComponent.Width := StrToInt(ParsedLine[3]);
  NewComponent.Height := StrToInt(ParsedLine[4]);
  NewComponent.DataSource := FDataSource;
  NewComponent.DataField := FixName(ParsedLine[5]);
  if ParsedLine.Count = 7 then
    NewComponent.Color := StringToColor(ParsedLine[6]);
  FLayoutPageControl.Height := max(FLayoutPageControl.Height,NewComponent.Top+NewComponent.Height);
end;

procedure TScreenImporter.ImportNewLabel(ParsedLine: TStringList);
var NewComponent: TCBSLabel;
begin
  NewComponent := TCBSLabel.Create(CurrentForm);
  NewComponent.Parent := CurrentForm;
  CurrentForm.AutoName(NewComponent);
  NewComponent.Left := StrToInt(ParsedLine[1]);
  NewComponent.Top := StrToInt(ParsedLine[2]);
  NewComponent.Caption := ParsedLine[3];
  NewComponent.Color := StringToColor(ParsedLine[4]);
  FLayoutPageControl.Height := max(FLayoutPageControl.Height,NewComponent.Top+NewComponent.Height);
end;

procedure TScreenImporter.ImportNewCheckBox(ParsedLine: TStringList);
var NewComponent: TCBSDBCheckBox;
begin
  NewComponent := TCBSDBCheckBox.Create(CurrentForm);
  NewComponent.Parent := CurrentForm;
  CurrentForm.AutoName(NewComponent);
  NewComponent.Left := StrToInt(ParsedLine[1]);
  NewComponent.Top := StrToInt(ParsedLine[2]);
  NewComponent.DataSource := FDataSource;
  NewComponent.DataField := FixName(ParsedLine[3]);
  // NewComponent.Color := StringToColor(ParsedLine[4]);
  NewComponent.Width := 20;
  NewComponent.Caption := '';
  FLayoutPageControl.Height := max(FLayoutPageControl.Height,NewComponent.Top+NewComponent.Height);
end;

procedure TScreenImporter.ImportNewDate(ParsedLine: TStringList);
var NewComponent: TCBSDBDateTimePicker;
begin
  NewComponent := TCBSDBDateTimePicker.Create(CurrentForm);
  NewComponent.Parent := CurrentForm;
  CurrentForm.AutoName(NewComponent);
  NewComponent.Left := StrToInt(ParsedLine[1]);
  NewComponent.Top := StrToInt(ParsedLine[2]);
  NewComponent.DataSource := FDataSource;
  NewComponent.DataField := FixName(ParsedLine[3]);
  NewComponent.Color := StringToColor(ParsedLine[4]);
  NewComponent.Width := Max(NewComponent.DataSource.DataSet.FieldByName(NewComponent.DataField).DisplayWidth*7,14);
  FLayoutPageControl.Height := max(FLayoutPageControl.Height,NewComponent.Top+NewComponent.Height);
end;

procedure TScreenImporter.ImportNewGrid(ParsedLine: TStringList);
var NewComponent: TCBSDBGrid;
    NewLabel: TCBSLabel;
begin
  NewLabel := TCBSLabel.Create(CurrentForm);
  NewLabel.Parent := CurrentForm;
  CurrentForm.AutoName(NewLabel);
  NewLabel.Left := StrToInt(ParsedLine[1]);
  NewLabel.Top := GridAreaTop;
  NewLabel.Height := 13;
  NewLabel.Width := StrToInt(ParsedLine[4]);
  NewLabel.Color := StringToColor(ParsedLine[5]);
  NewLabel.Caption := ParsedLine[6];
  NewComponent := TCBSDBGrid.Create(CurrentForm);
  NewComponent.Parent := CurrentForm;
  CurrentForm.AutoName(NewComponent);
  NewComponent.Left := NewLabel.Left;
  NewComponent.Top := NewLabel.Top+NewLabel.Height;
  NewComponent.Width := NewLabel.Width;
  NewComponent.Height := 20; //This is temporary....will be modified by ModifyLastGrid
  FLayoutPageControl.Height := max(FLayoutPageControl.Height,NewComponent.Top+NewComponent.Height);
  LastGrid := NewComponent;
end;

procedure TScreenImporter.ModifyLastGrid(ParsedLine: TStringList);
var HoldDataSource: TDataSource;
begin
  LastGrid.Width := StrToInt(ParsedLine[4]);
  LastGrid.Height := StrToInt(ParsedLine[5]);
  LastGrid.Color := StringToColor(ParsedLine[6]);
  HoldDataSource := FDataSource;
  SetDataSource('S_'+ParsedLine[1]);
  LastGrid.DataSource := FDataSource;
  AddGridColumns(CurrentDirectory+Trim(ParsedLine[3])+'.SCL');
  FDataSource := HoldDataSource;
end;

procedure TScreenImporter.AddGridColumns(const Filename: WideString);
var TotalFile: TStringList;
    x: Integer;
    NewColumn: TColumn;
begin
  if not FileExists(FileName) then exit;
  TotalFile := TStringList.Create;
  try
    TotalFile.LoadFromFile(FileName);
    for x := 0 to TotalFile.Count-1 do
    begin
      if TotalFile[x]='' then continue;
      NewColumn := LastGrid.Columns.Add;
      NewColumn.Title.Caption := Trim(copy(TotalFile[x],14,30));
      NewColumn.Width := StrToInt(copy(TotalFile[x],1,3));
      NewColumn.FieldName := Trim(copy(TotalFile[x],4,10));
    end;
  finally
    TotalFile.Free;
  end;
end;

procedure TScreenImporter.ImportNewTab(ParsedLine: TStringList);
begin
  randomize;
  CreateBlankTab;
  CurrentTab.Caption := ParsedLine[1];
  CurrentForm.TabLabel := CurrentTab.Caption;
  CurrentForm.TabName := Trim(CurrentTab.Caption)+'-'+IntToStr(Random(9999)) ;
end;

Function TScreenImporter.FixName(Oldname: String):String;
begin
  Result := Oldname;
  if uppercase(trim(OldName)) = 'EXAMDATE' then Result := 'DATE';
  if uppercase(trim(OldName)) = 'PAT_ID' then Result := 'PatUnique';
end;

function TScreenImporter.GetEditType(DataField: String): Char;
var RetString: String;
begin
  RetString := ' ';
//  with CheckFieldQuery do
//  begin
//    Close;
//    if LeftStr(Trim(DataField),2)='ZZ' then
//      ParamByName('FieldName').AsString := copy(Trim(DataField),3,15)
//    else
//      ParamByName('FieldName').AsString := Trim(DataField);
//    Open;
//    if RecordCount > 0 then RetString := FieldByName('Type').AsString[1];
//    Close;
//  end;
  Result := RetString[1];
end;


constructor TScreenImporter.Create(AOwner: TComponent;DataSource: TDataSource; LayoutPageControl:TPageControl);
begin
  inherited Create(AOwner);
  FDataSource := DataSource;
  FLayoutPageControl := LayoutPageControl;
  CurrentDirectory := '';
end;

constructor TScreenImporter.Create(AOwner: TComponent; LayoutPageControl:TPageControl);
begin
  inherited Create(AOwner);
  FLayoutPageControl := LayoutPageControl;
  CurrentDirectory := '';
end;


destructor TScreenImporter.Destroy;
begin
  FDataSource := nil;
  FLayoutPageControl := nil;
  inherited;
end;

procedure TScreenImporter.ImportScreen(Filename:WideString; ScreenType: Char='P');
var Extension: String;
begin
if FileExists(FileName) then
begin
  FLayoutPageControl.Visible := False;
  Extension := uppercase(ExtractFileExt(FileName));
  if Extension = '.CFG' then
  begin
    ImportConfig(FileName,ScreenType);
    FLayoutPageControl.Visible := true;
    Exit;
  end;
  if Extension = '.EX' then SetDataSource('S_EXAM');
  if Extension = '.PD' then SetDataSource('S_PATIENT');
  if Extension = '.CL' then SetDataSource('S_LENS_RX');
  if Extension = '.APT' then SetDataSource('S_APPT');
  if Extension = '.SP' then SetDataSource('S_FRAM_RX');
  if Extension = '.AR' then SetDataSource('S_BILL');
  if Extension = '.CS' then SetDataSource('S_CLAIM');
  try
    if Assigned(FDataSource) then
      ImportFrom(FileName);
  finally
    FLayoutPageControl.Visible := true;
  end;
end;

end;

procedure TScreenImporter.SetDataSource(const Value: TDataSource);
begin
  FDataSource := Value;
end;

procedure TScreenImporter.SetDataSource(const Value: String);
var BaseForm: TForm;
begin
  if Assigned(Self.Owner) and  (Value <> '') then
  begin
    if Self.Owner is TForm then
    begin
      FDataSource := TForm(Self.Owner).FindComponent(Value) as TDataSource;
    end;
  end;

end;


procedure TScreenImporter.ImportConfig(const Filename: WideString; const ScreenType: Char);
var ImportFileName: WideString;
begin
  // Import the basic screen
  ImportFileName := GetScreenFile(FileName, ScreenType);
  if FileExists(ImportFileName) then
    ImportScreen(ImportFileName)
  else
    exit;
  // Check to be sure there are any created pages
  if FLayoutPageControl.PageCount = 0 then exit;
  // now add the grids to the front tab
  FLayoutPageControl.ActivePageIndex := 0;
  CurrentTab := FLayoutPageControl.ActivePage;
  CurrentForm := FLayoutPageControl.ActivePage.Controls[0] as TfrmDesign;
  ImportFileName := GetScreenFile(Filename, ScreenType, False);
  if FileExists(ImportFileName) then
    AddGrids(ImportFileName);
end;

function TScreenImporter.GetScreenFile(const Filename: WideString; const ScreenType: Char; ScreenFile:Boolean=True):WideString;
var ConfigFile: TIniFile;
    Section: String;
    FileParam: String;
begin
  ConfigFile := TIniFile.Create(FileName);
  try
    //the parameter marked layout is the file with the actual screen, the parameter screen has the file for the grids
    if ScreenFile then FileParam := 'layout' else FileParam := 'screen';
    case ScreenType of
    'P':  Result := ConfigFile.ReadString('PATDEMO',FileParam,'')+'.PD';
    'R':  Result := ConfigFile.ReadString('RESPDEMO',FileParam,'')+'.AR';
    'X':  Result := ConfigFile.ReadString('EXAM',FileParam,'')+'.EX';
    'L':  Result := ConfigFile.ReadString('CLRX',FileParam,'')+'.CL';
    'G':  Result := ConfigFile.ReadString('SPECRX',FileParam,'')+'.SP';
    else
      Result := '';
    end;
    if Result <> '' then
    begin
      CurrentDirectory := ExtractFilePath(FileName)+'\';
      Result := CurrentDirectory+Result;
    end;
  finally
    ConfigFile.Free;
  end;
end;

procedure TScreenImporter.AddGrids(const Filename: WideString);
begin
  SetGridAreaTop;
  ImportFrom(FileName);
end;

procedure TScreenImporter.SetGridAreaTop;
var x: Integer;
begin
  for x := 0 to CurrentForm.ControlCount -1 do
  begin
    GridAreaTop := max(CurrentForm.Controls[x].Top + CurrentForm.Controls[x].Height,
                       GridAreaTop);
  end;
end;

end.
