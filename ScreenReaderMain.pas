unit ScreenReaderMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, Menus, ComCtrls, DB, Design, FDMain,
  RunFusc, RunFus, Scripter, adsdata, adsfunc, adstable, ExtCtrls,
  DBCtrls, StdCtrls, Mask, Proplist, ExamDataModule, adscnnct,
  LayoutDataMod, CBSComponents, SmartFields, CBSPrintInterface,TabInfo, ActnList;


const RunSmart = False;

type THackDataSet = class(TDataSet);

type
  TDisplayScreen = class(TForm)
    LayoutPageControl: TPageControl;
    MainMenu1: TMainMenu;
    LoadForm1: TMenuItem;
    DBNavigator1: TDBNavigator;
    Button1: TButton;
    DBEdit1: TDBEdit;
    FilesConnection: TAdsConnection;
    Button2: TButton;
    Print1: TMenuItem;
    PrintForm1: TMenuItem;
    PrintfromDLL1: TMenuItem;
    ToolsConnection: TAdsConnection;
    Prev: TMenuItem;
    Next1: TMenuItem;
    PopupMenu1: TPopupMenu;
    One1: TMenuItem;
    wo1: TMenuItem;
    hree1: TMenuItem;
    OpenDialog1: TOpenDialog;
    ActionList1: TActionList;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    procedure Next1Click(Sender: TObject);
    procedure PrevClick(Sender: TObject);
    procedure PrintbyLayoutID1Click(Sender: TObject);
    procedure PrintfromDLL1Click(Sender: TObject);
    procedure PrintForm1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure LoadForm1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LayoutPageControlChange(Sender: TObject);
  private
    { Private declarations }
    FPrintLayout: Boolean;
    SmartFieldEngine: TSmartEngine;
    CurrentTab: TTabSheet;
    CurrentForm : TfrmDesign;
    TabInfoform : TTabInfoForm;
    LayoutID : Integer;
    LayoutName: String;
    procedure ClearPage;
    function LayoutType: String;
    procedure GetInfo;
    procedure SetPrintLayout(const Value: Boolean);
    procedure ShowObjects;
    function GetFullObjectName(ThisComponent: TComponent): String;
    procedure LoadDataSources;
    property PrintLayout: Boolean read FPrintLayout write SetPrintLayout;
    // CurrentForm : TForm;
  public
    { Public declarations }
    RunStateColors: TStateColors;
  end;

var
  DisplayScreen: TDisplayScreen;
  //frmLayout: TfrmLayout;

  procedure PrintJob(JobToPrint: IPrintDocument; oApplication: THandle); StdCall; external 'PrintHandler.DLL' name 'PrintJob';


implementation

uses OIForm, Layout, CBSPDFPrint, LayoutType, CBSGraphics, IniFiles;

{$R *.dfm}

procedure TDisplayScreen.LoadForm1Click(Sender: TObject);
//var PickResult, LPTop, LPLeft: Integer;
begin
//  PickResult := PickLayoutForm.ShowModal;
//  if PickResult > 0 then
//  begin
//    LPTop := LayoutPageControl.Top;
//    LPLeft := LayoutPageControl.Left;
//    Height := 1;
//    Width := 1;
//    if PickResult > 80 then
//      LayoutData.LoadLayout(PickLayoutForm.SelectedLayoutID, LayoutPageControl)
//    else
//      LayoutData.LoadLayout(PickLayoutForm.SelectedLayoutID, LayoutPageControl,True);
//    SmartFieldEngine.SetSmartFields(Self);
//    LayoutPageControl.Top := LPTop;
//    LayoutPageControl.Left := LPLeft;
//  end;
 TabInfoForm.LoadType := ltLoadLayout;
 GetInfo;

end;

procedure TDisplayScreen.GetInfo;
begin
  TabInfoForm.LayoutType := LayoutType;
  TabInfoForm.PrintLayout := PrintLayout;
  LayoutData.LayoutType := LayoutType;
  LayoutData.PrintLayout := PrintLayout;
  if TabInfoForm.ShowModal > 0 then
  begin
    ClearPage;
    case TabInfoForm.LoadType of
      ltLoadLayout: begin
         Screen.Cursor := crHourGlass;
         try
           Self.Visible := False;
           LayoutID := TabInfoForm.LayoutID;
           LayoutData.LoadLayout(LayoutID, LayoutPageControl,False);
           LayoutName := TabInfoForm.SelectedLayoutName;
           LayoutPageControl.ActivePageIndex := 0;
           LayoutPageControl.OnChange(Self);
         finally
           Screen.Cursor := crDefault;
           Self.Visible := True;
         end;
        end;
      ltLoadTab: LayoutData.LoadTab(TabInfoForm.TabId, LayoutPageControl,False);
    end;
  end;
end;

procedure TDisplayScreen.FormCreate(Sender: TObject);
var StartParam: String;
    PrintParam: String;
    ReturnValue: Integer;
begin
  StartParam := Uppercase(ParamStr(1));
  PrintParam := UpperCase(ParamStr(2));
  if PrintParam = '' then PrintParam := 'No';
  if (PrintParam[1] = 'Y') or (PrintParam[1] = 'T') then
    PrintLayout := True
  else
    PrintLayout := False;

  if StartParam = '' then
  begin
    with TLayoutTypeForm.Create(nil) do
    try
      PrintCheck.Checked := FPrintLayout;
      ReturnValue := ShowModal;
      case ReturnValue of
        1: StartParam := 'EXAM';
        2: StartParam := 'PATIENT';
        3: StartParam := 'RESPONSIBLE';
        4: StartParam := 'CONTACT';
        5: StartParam := 'FRAMES';
        6: StartParam := 'CLAIMS';
        7: StartParam := 'APPOINTMENT';
        21: StartParam := 'EXAM';
        22: StartParam := 'PATIENT';
        23: StartParam := 'RESPONSIBLE';
        24: StartParam := 'CONTACT';
        25: StartParam := 'FRAMES';
        26: StartParam := 'CLAIMS';
        27: StartParam := 'APPOINTMENT';
      else
        ShowMessage('Available parameters are EXAM, PATIENT, RESPONSIBLE, CONTACT, FRAMES, CLAIMS and APPOINTMENT.'+ #13#10 +
                    'Second parameter of YES or TRUE means this is for Print Layout');
      end;
      FPrintLayout := (ReturnValue > 10);
    finally
      Free;
    end;
  end;
  Self.Name := 'F_EXAM';
  if StartParam = 'EXAM' then
    Self.Name := 'F_EXAM';
  if StartParam = 'PATIENT' then
  begin
    Self.Name := 'F_PATSCRN';
  end;
  if StartParam = 'RESPONSIBLE' then
    Self.Name := 'F_RESPSCRN';
  if StartParam = 'CONTACT' then
    Self.Name := 'F_CLSCRN';
  if StartParam = 'FRAMES' then
    Self.Name := 'F_SPECSCRN';
  if StartParam = 'CLAIMS' then
    Self.Name := 'F_CLMSCRN';
  if StartParam = 'APPOINTMENT' then
    Self.Name := 'F_APPTEDIT';
  //AddNewTab;
  TabInfoForm := TTabInfoForm.Create(Self);
  TabInfoForm.LayoutType := LayoutType;
  TabInfoForm.PrintLayout := PrintLayout;
  LayoutId := 0;
  LayoutName := '';
  LoadDataSources;

  SmartFieldEngine := TSmartEngine.Create(Self);
  if RunSmart then
  begin
    SmartFieldEngine.SaveAndCompile('exam');
    SmartFieldEngine.ScriptEngine.ResetScripter;
    SmartFieldEngine.ScriptName := 'exam.sme';
  end;
  RunStateColors := TStateColors.Create(Self);
  RunStateColors.FromDefaultFont := Self.Font;
  RunStateColors.FromNewFont := Self.Font;
  RunStateColors.FromForwardedFont := Self.Font;
  RunStateColors.FromTouchedFont := Self.Font;
//  S_Exam.DataSet.Edit;

end;

procedure TDisplayScreen.LayoutPageControlChange(Sender: TObject);
begin
  CurrentTab := LayoutPageControl.ActivePage;
  CurrentForm := CurrentTab.Controls[0] as tfrmDesign;
  if RunSmart then
  begin
    SmartFieldEngine.SetSmartFields(CurrentForm);
  end;
  Refresh;

end;

procedure TDisplayScreen.ShowObjects;
var x: Integer;
begin
  for x := 0 to CurrentForm.ComponentCount -1 do
  begin
    ShowMessage(GetFullObjectName(CurrentForm.Components[x]));
  end;
end;

function TDisplayScreen.GetFullObjectName(ThisComponent: TComponent):String;
var RetStr: String;
  TempComponent: TComponent;
begin
  RetStr := '';
  TempComponent := ThisComponent.Owner;
  if (TempComponent <> Nil) and (TempComponent.Name <> ThisComponent.Name) then
    RetStr := GetFullObjectName(TempComponent)+'.';
  Result := RetStr+ThisComponent.Name;
end;

procedure TDisplayScreen.Button2Click(Sender: TObject);
begin
  if RunSmart then
  begin
    SmartFieldEngine.ScriptEngine.LoadFromFile('exam.bin');
    SmartFieldEngine.ScriptEngine.Run();
  end;
end;

procedure TDisplayScreen.PrintForm1Click(Sender: TObject);
var MyPrinter: TFormPrinter;

begin

  MyPrinter := TFormPrinter.Create(Self);
  try
    MyPrinter.PrintSet(LayoutPageControl);
  finally
    MyPrinter.Free;
  end;
end;

procedure TDisplayScreen.PrintfromDLL1Click(Sender: TObject);
var MyPrinter: TPrintDocument;
begin
  MyPrinter := TPrintDocument.Create;
  MyPrinter.SourceQuery.Add('SourceScreen=F_EXAM');
  MyPrinter.JobType := jtScreenBuilderPrint;
  MyPrinter.KeyFields.Add('LayoutID='+IntToStr(LayoutID));
//  MyPrinter.KeyFields.Add('ExamUnique='+ExamTable.FieldByName('ExamUnique').AsString);
  MyPrinter.SentFrom := 'Exam';
  MyPrinter.Destination := pdPDF;
  MyPrinter.Document := 'C:\New.pdf';
  PrintJob(MyPrinter, Handle);
end;

procedure TDisplayScreen.PrintbyLayoutID1Click(Sender: TObject);
var MyPrinter: TFormPrinter;

begin
{
  MyPrinter := TFormPrinter.Create;
  try
    MyPrinter.PrintLayout(Self,33);
  finally
    MyPrinter.Free;
  end;    }
end;

procedure TDisplayScreen.PrevClick(Sender: TObject);
begin
  DBNavigator1.BtnClick(nbPrior);
end;

procedure TDisplayScreen.Next1Click(Sender: TObject);
begin
  DBNavigator1.BtnClick(nbNext);
end;


procedure TDisplayScreen.SetPrintLayout(const Value: Boolean);
begin
  FPrintLayout := Value;
end;

procedure TDisplayScreen.ClearPage;
var ThisSheet: TTabSheet;
begin
  Visible := False;
  CurrentForm := nil;
  CurrentTab := nil;

  while LayoutPageControl.PageCount > 0 do
  begin
    ThisSheet := LayoutPageControl.Pages[LayoutPageControl.PageCount-1];
    ThisSheet.PageControl := nil;
    FreeAndNil(ThisSheet);
  end;
  Visible := True;
  ReFresh;

end;


function TDisplayScreen.LayoutType: String;
begin
  Result := 'Z';
  If Self.Name = 'F_EXAM' then
    Result := 'X';
  If Self.Name = 'F_PATSCRN' then
    Result := 'P';
  If Self.Name = 'F_RESPSCRN' then
    Result := 'R';
  If Self.Name = 'F_SPECSCRN' then
    Result := 'G';
  If Self.Name = 'F_CLSCRN' then
    Result := 'L';
  If Self.Name = 'F_CLMSCRN' then
    Result := 'C';
  If Self.Name = 'F_APPTEDIT' then
    Result := 'A';

end;

procedure TDisplayScreen.LoadDataSources;
var DataSourceList: TStringList;
  I, J: Integer;
  TempSource: TDataSource;
  TempTable: TADSTable;
  TempField: TField;
  CheckTableName: String;
begin
  DataSourceList := TStringList.Create;
  try
    with TIniFile.Create(GetCurrentDir+'\SBCheck.ini') do
    try
      //Read datasource names
      ReadSection('DataSources',DataSourceList);
      for I := 0 to DataSourceList.Count - 1 do
      begin
        //Lookup table names and make sure table exists
        CheckTableName := ReadString('DataSources',DataSourceList[i],'');
        if not FileExists(GetCurrentDir + '/' +CheckTableName) then continue;
        
        TempSource := TDataSource.Create(Self);
        TempSource.Name := DataSourceList[i];
        TempTable := TAdsTable.Create(Self);
        TempTable.Name := 'T_'+copy(TempSource.Name,3,50);
        TempTable.TableName := CheckTableName;
        if pos('.dbf',TempTable.TableName)>0 then
        begin
          TempTable.DatabaseName := 'FilesConnection';
          TempTable.TableType := ttADSCDX;
        end
        else
        begin
          TempTable.DatabaseName := 'ToolsConnection';
          TempTable.TableType := ttADSADT;
        end;
        TempSource.DataSet := TempTable;

        if uppercase(TempTable.Name) = 'T_EXAM' then
        begin
          DBnavigator1.DataSource := TempSource;
        end;

        if uppercase(TempTable.Name) = 'T_PATIENT' then
        begin
          TempTable.FieldDefs.Update;
          THackDataSet(TempTable).CreateFields;
          TempField := TIntegerField.Create(TempTable);
          TempField.Name := 'T_PatientAge';
          TempField.FieldName := 'Age';
          TempField.FieldKind := fkCalculated;
          TempField.Calculated := True;
          TempField.DataSet := TempTable;
          // TempTable.Fields.Add(TempField);
//          with TempField do
//          begin
//            TempTable.FieldDefs.Add(FieldName, DataType, Size, Required);
//          end;

        end;
        TempTable.Open;
      end;
    finally
      Free;
    end;
  finally
    DataSourceList.Free;
  end;

end;

initialization
  RegisterCBSComponents;
  RegisterClasses([TfrmDesign]);

end.
