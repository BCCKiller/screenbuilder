unit Layout;

interface
{$DEFINE CBSSmart}
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  ComCtrls, Design, StdCtrls,
  TabInfo, DB, ExtCtrls, adsdata, adsfunc, adstable, adscnnct, Math,
  CBSComponents, SmartFields, Buttons, Clipbrd, Menus, RunFus, 
  FDMain, FDCmpPal, Mask, DBCtrls, CBSKrimskyDisplay;

const
  DefaultFieldSize=10;
  FieldSizeMultiplier = 4;

type
  TfrmLayout = class(TForm)
    FilesConnection: TAdsConnection;
    ToolsConnection: TAdsConnection;
    pmnMain: TPopupMenu;
    Align1: TMenuItem;
    Tops1: TMenuItem;
    Bottoms1: TMenuItem;
    Left1: TMenuItem;
    Right1: TMenuItem;
    mniAlignToGrid: TMenuItem;
    mniBringToFront: TMenuItem;
    mniSendToBack: TMenuItem;
    mniSep1: TMenuItem;
    mniCut: TMenuItem;
    mniCopy: TMenuItem;
    mniPaste: TMenuItem;
    mniDelete: TMenuItem;
    mniSelectAll: TMenuItem;
    N2: TMenuItem;
    DeleteTab1: TMenuItem;
    mniSep2: TMenuItem;
    ConverttoPrintLayout1: TMenuItem;
    HeaderPanel: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LayoutNameEdit: TEdit;
    TabNameEdit: TEdit;
    TabTextEdit: TEdit;
    TabColumnsCheck: TCheckBox;
    TabDescriptionMemo: TMemo;
    ToolPanel: TPanel;
    sbtOpen: TSpeedButton;
    sbtSave: TSpeedButton;
    sbtAlignToGrid: TSpeedButton;
    sbtLock: TSpeedButton;
    sbtCut: TSpeedButton;
    sbtCopy: TSpeedButton;
    sbtPaste: TSpeedButton;
    sbtDelete: TSpeedButton;
    sbtSetup: TSpeedButton;
    sbtAlign: TSpeedButton;
    sbtSize: TSpeedButton;
    sbtAlignPalette: TSpeedButton;
    sbtTabOrder: TSpeedButton;
    sbtSelectAll: TSpeedButton;
    sbtObjectInspector: TSpeedButton;
    sbtSource: TSpeedButton;
    sbtSortTab: TSpeedButton;
    sbtAddTab: TSpeedButton;
    pgcMain: TPageControl;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Load1: TMenuItem;
    Save1: TMenuItem;
    LoadTab1: TMenuItem;
    SaveCurrentTab1: TMenuItem;
    Edit1: TMenuItem;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    Delete1: TMenuItem;
    SelectAll1: TMenuItem;
    ools1: TMenuItem;
    AligntoGrid1: TMenuItem;
    Change1: TMenuItem;
    AlignmentPalette1: TMenuItem;
    Quit1: TMenuItem;
    N1: TMenuItem;
    RemoveTabs1: TMenuItem;
    N3: TMenuItem;
    BringtoFront1: TMenuItem;
    SendtoBack1: TMenuItem;
    N4: TMenuItem;
    AddBlankTab1: TMenuItem;
    NewLayout1: TMenuItem;
    SaveLayoutAs1: TMenuItem;
    N5: TMenuItem;
    ExportTab1: TMenuItem;
    ImportTab1: TMenuItem;
    RenameCurrentLayout1: TMenuItem;
    ExportSaveDialog: TSaveDialog;
    ImportOpenDialog: TOpenDialog;
    SaveCurrentTabAs1: TMenuItem;
    N7: TMenuItem;
    DeleteTabs1: TMenuItem;
    DeleteLayout1: TMenuItem;
    CloseLayout1: TMenuItem;
    TabLeft: TMenuItem;
    TabRight: TMenuItem;
    ChangeCurrentTabText1: TMenuItem;
    LayoutPageControl: TPageControl;
    N6: TMenuItem;
    LoadLayoutSafeItem: TMenuItem;
    Checkforbadfields1: TMenuItem;
    procedure ImportTab1Click(Sender: TObject);
    procedure ExportTab1Click(Sender: TObject);
    procedure RenameCurrentLayout1Click(Sender: TObject);
    procedure SaveLayoutAs1Click(Sender: TObject);
    procedure NewLayout1Click(Sender: TObject);
    procedure RemoveTabs1Click(Sender: TObject);
    procedure ChangeOrderofTabs1Click(Sender: TObject);
    procedure SaveCurrentTab1Click(Sender: TObject);
    procedure LoadTab1Click(Sender: TObject);
    procedure Quit1Click(Sender: TObject);
    procedure TabColumnsCheckClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LayoutPageControlChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormPaint(Sender: TObject);
    procedure RemoveTab(TabID: Integer);
    procedure CreateBlankTab;
    procedure Right1Click(Sender: TObject);
    procedure Left1Click(Sender: TObject);
    procedure Bottoms1Click(Sender: TObject);
    procedure Tops1Click(Sender: TObject);
    procedure DeleteTab1Click(Sender: TObject);
    procedure ConverttoPrintLayout1Click(Sender: TObject);
    procedure sbtPaletteButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eveLock(Sender: TObject);
    procedure eveAlign(Sender: TObject);
    procedure eveDelete(Sender: TObject);
    procedure eveCut(Sender: TObject);
    procedure evePaste(Sender: TObject);
    procedure eveCopy(Sender: TObject);
    procedure sbtOpenClick(Sender: TObject);
    procedure sbtSaveClick(Sender: TObject);
    procedure sbtSetupClick(Sender: TObject);
    procedure mniBringToFrontClick(Sender: TObject);
    procedure mniSendToBackClick(Sender: TObject);
    procedure sbtAlignClick(Sender: TObject);
    procedure sbtSizeClick(Sender: TObject);
    procedure eveSelectAll(Sender: TObject);
    procedure eveAlignPalette(Sender: TObject);
    procedure eveTabOrder(Sender: TObject);
    procedure sbtObjectInspectorClick(Sender: TObject);
    procedure sbtSourceClick(Sender: TObject);
    procedure sbtAddTabClick(Sender: TObject);
    procedure SaveCurrentTabAs1Click(Sender: TObject);
    procedure DeleteTabs1Click(Sender: TObject);
    procedure DeleteLayout1Click(Sender: TObject);
    procedure CloseLayout1Click(Sender: TObject);
    procedure moveTab(Sender: TObject);
    procedure sbtSortTabClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure LoadLayoutSafeClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Checkforbadfields1Click(Sender: TObject);
    procedure ChangeCurrentTabText1Click(Sender: TObject);
    procedure TabTextEditChange(Sender: TObject);
    procedure TabTextEditExit(Sender: TObject);
  private
    { Private declarations }
    FDataSources: TStringList;
    LayoutID : Integer;
    LayoutName: String;
    ThisTabInfoform : TTabInfoForm;
    FPrintLayout: Boolean;
    FScreenCode: String;
    FPaletteLoaded: Boolean;
    FLayoutLoaded: Boolean;
    FOnMessage: TDesignerMessageEvent;
    function LayoutType: String;
    procedure SetPrintLayout(const Value: Boolean);
    procedure ClearPage;
    procedure SetScreenCode(const Value: String);
    procedure SetPaletteLoaded(const Value: Boolean);
    function SetScreenFromParam(const ParamValue: String): Boolean;
    procedure SetLayoutLoaded(const Value: Boolean);
    function GetLayoutLoaded: Boolean;
//    function PreCheck: Boolean;
    procedure CreateDesigner;
    property OnMessage: TDesignerMessageEvent read FOnMessage write FOnMessage;
    procedure MasterFormDesignerMessage(Sender: TObject; var Msg: TMSG);
    procedure MasterFormDesignerSelectControl(Sender: TObject;
      TheControl: TControl);
    procedure MasterFormDesignerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CloseDataSets;
    procedure OpenDataSets;
    procedure CheckControls(ErrorList: TStringList; Container: TWinControl);

  public
    { Public declarations }
    CurrentTab :TTabSheet;
    CurrentForm : TfrmDesign;
    ComponentClass: TComponentClass;
    MasterFormDesigner: TRFDesigner;
    procedure SaveInfo;
    procedure GetInfo;
    procedure SetInspector;
    procedure CloseInspector;
    property PrintLayout: Boolean read FPrintLayout write SetPrintLayout;
    procedure ConvertLayout;
    procedure AdjustTabs(SortTabs:Boolean = True);
    property ScreenCode: String read FScreenCode write SetScreenCode;
    property PaletteLoaded: Boolean read FPaletteLoaded write SetPaletteLoaded;
    property LayoutLoaded: Boolean read GetLayoutLoaded write SetLayoutLoaded;

end;

var
  frmLayout: TfrmLayout;

implementation

{$R *.dfm}
{$R CBSCMP.RES}
uses OIForm, LayoutType, CBSGraphics, LayOutDataMod, ConvertToPrint,
      TabAdjustMain,
      DeleteFormMain,
      FileVer, IniFiles, Setup,
      CBSDataSources;

procedure TfrmLayout.FormCreate(Sender: TObject);
var StartParam: String;
    PrintParam: String;
    ReturnValue: Integer;
begin
// Removed as per LLW via MLC 11/20/2007
//  if not PreCheck then Application.Terminate;
  FScreenCode := '';
  FPaletteLoaded := False;
  PrintLayout := False;
  CreateDesigner;
  FDataSources := TStringList.Create;
  if (pos('SCREENBUILDER',uppercase(ParamStr(0)))>0) then
  begin
    StartParam := Uppercase(ParamStr(1));
    PrintParam := UpperCase(ParamStr(2));
    if PrintParam = '' then PrintParam := 'No';
    if (PrintParam[1] = 'Y') or (PrintParam[1] = 'T') then
      PrintLayout := True
    else
      PrintLayout := False;
    if not SetScreenFromParam(StartParam) then
    begin
      with TLayoutTypeForm.Create(nil) do
      try
        PrintCheck.Checked := FPrintLayout;
        ReturnValue := ShowModal;
        case ReturnValue of
          1: ScreenCode := 'EXAM';
          2: ScreenCode := 'PATIENT';
          3: ScreenCode := 'RESPONSIBLE';
          4: ScreenCode := 'CONTACT';
          5: ScreenCode := 'FRAMES';
          6: ScreenCode := 'CLAIMS';
          7: ScreenCode := 'APPOINTMENT';
          21: ScreenCode := 'EXAM';
          22: ScreenCode := 'PATIENT';
          23: ScreenCode := 'RESPONSIBLE';
          24: ScreenCode := 'CONTACT';
          25: ScreenCode := 'FRAMES';
          26: ScreenCode := 'CLAIMS';
          27: ScreenCode := 'APPOINTMENT';
        else
          ShowMessage('Available parameters are EXAM, PATIENT, RESPONSIBLE, CONTACT, FRAMES, CLAIMS and APPOINTMENT.'+ #13#10 +
                      'Second parameter of YES or TRUE means this is for Print Layout');
        end;
        FPrintLayout := (ReturnValue > 10);
      finally
        Free;
      end;
    end;
  end;
end;

procedure TfrmLayout.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FDataSources);
end;

procedure TfrmLayout.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
MasterFormDesignerKeyDown(Sender, Key,Shift);
end;

procedure TfrmLayout.SetScreenCode(const Value: String);
var  ReturnValue: Integer;
  I: Integer;
begin
  FScreenCode := Value;
    if FScreenCode = '' then
  begin
    with TLayoutTypeForm.Create(nil) do
    try
      PrintCheck.Checked := FPrintLayout;
      ReturnValue := ShowModal;
      case ReturnValue of
        1: FScreenCode := 'EXAM';
        2: FScreenCode := 'PATIENT';
        3: FScreenCode := 'RESPONSIBLE';
        4: FScreenCode := 'CONTACT';
        5: FScreenCode := 'FRAMES';
        6: FScreenCode := 'CLAIMS';
        7: FScreenCode := 'APPOINTMENT';
        21: FScreenCode := 'EXAM';
        22: FScreenCode := 'PATIENT';
        23: FScreenCode := 'RESPONSIBLE';
        24: FScreenCode := 'CONTACT';
        25: FScreenCode := 'FRAMES';
        26: FScreenCode := 'CLAIMS';
        27: FScreenCode := 'APPOINTMENT';
      end;
      FPrintLayout := (ReturnValue > 10);
    finally
      Free;
    end;
  end;
  Self.Name := 'F_EXAM';
  if FScreenCode = 'EXAM' then
    Self.Name := 'F_EXAM';
  if FScreenCode = 'PATIENT' then
    Self.Name := 'F_PATSCRN';
  if FScreenCode = 'RESPONSIBLE' then
    Self.Name := 'F_RESPSCRN';
  if FScreenCode = 'CONTACT' then
    Self.Name := 'F_CLSCRN';
  if FScreenCode = 'FRAMES' then
    Self.Name := 'F_SPECSCRN';
  if FScreenCode = 'CLAIMS' then
    Self.Name := 'F_CLMSCRN';
  if FScreenCode = 'APPOINTMENT' then
    Self.Name := 'F_APPTEDIT';
  ThisTabInfoForm := TTabInfoForm.Create(Self);
  ThisTabInfoForm.LayoutType := LayoutType;
  ThisTabInfoForm.PrintLayout := PrintLayout;
  LayoutId := 0;
  LayoutName := '';
  TabColumnsCheck.Visible := PrintLayout;
  TabColumnsCheck.Enabled := False;
  LayoutPageControl.Top := HeaderPanel.Top + HeaderPanel.Height + 5;
  LayoutPageControl.Width := ClientWidth;
  LayoutPageControl.Anchors := [akLeft, akTop, akRight, akBottom];
  //External in CBSDataSources so can be called from PrintHandler
  LoadDataSources(Self, FDataSources);

end;

procedure TfrmLayout.GetInfo;
begin
  ThisTabInfoForm.LayoutType := LayoutType;
  ThisTabInfoForm.PrintLayout := PrintLayout;
  LayoutData.LayoutType := LayoutType;
  LayoutData.PrintLayout := PrintLayout;
  if ThisTabInfoForm.ShowModal > 0 then
  begin
    case ThisTabInfoForm.LoadType of
      ltLoadLayout: begin
         ClearPage;
         Screen.Cursor := crHourGlass;
         try
           Self.Visible := False;
           LayoutID := ThisTabInfoForm.LayoutID;
           LayoutData.LoadLayout(LayoutID, LayoutPageControl,False);
           LayoutName := ThisTabInfoForm.SelectedLayoutName;
           LayoutPageControl.ActivePageIndex := 0;
           LayoutPageControl.OnChange(Self);
         finally
           Screen.Cursor := crDefault;
           LayoutPageControl.Visible := True;
           Self.Visible := True;
         end;
        end;
      ltLoadLayoutSafe: begin
         ClearPage;
         Screen.Cursor := crHourGlass;
         try
           CloseDataSets;
           Self.Visible := False;
           LayoutID := ThisTabInfoForm.LayoutID;
           LayoutData.LoadLayout(LayoutID, LayoutPageControl,False);
           LayoutName := ThisTabInfoForm.SelectedLayoutName;
           LayoutPageControl.ActivePageIndex := 0;
           OpenDataSets;
           LayoutPageControl.OnChange(Self);
         finally
           Screen.Cursor := crDefault;
           LayoutPageControl.Visible := True;
           Self.Visible := True;
         end;
        end;
      ltLoadTab:
        begin
        LayoutData.LoadTab(ThisTabInfoForm.TabId, LayoutPageControl,False);
        LayoutPageControl.Visible := True;
        LayoutPageControl.OnChange(Self);
        end;
      ltNewTab:
        begin
          CreateBlankTab;
          CurrentForm.TabLabel := ThisTabInfoForm.TabEdit.Text;
          CurrentForm.TabName := ThisTabInfoForm.DescriptionCombo.Text;
          CurrentForm.TabNotes := ThisTabInfoForm.UseMemo.Text;
          CurrentTab.Caption := CurrentForm.TabLabel;
          LayoutPageControl.Visible := true;
          if not (frmObjectInspector = nil) then
          begin
            SetInspector;
          end;
        end;
    end;
  end;
end;

function TfrmLayout.GetLayoutLoaded: Boolean;
begin
  Result := (LayoutPageControl.PageCount>0)
end;

procedure TfrmLayout.SetInspector;
var
  I: Integer;
begin
  if not (frmObjectInspector = nil) and not (CurrentForm = nil) then
  begin
    if FDataSources.Count >0 then
      frmObjectInspector.DataSources.Assign(FDataSources);

    MasterFormDesigner.Inspector := frmObjectInspector.cmpObjectInspector;
    // Set the form combobox drop-down to show the objects on the tab form
    frmObjectInspector.cmbObjectInspector.Root := CurrentForm;
    // Set the root of the property inspector to the layout form so that the datasource will show up correctly.
    frmObjectInspector.cmpObjectInspector.Root := Self;
    frmObjectInspector.Show;
  end;
end;

procedure TfrmLayout.SetLayoutLoaded(const Value: Boolean);
begin
  FLayoutLoaded := Value;
end;

procedure TfrmLayout.LayoutPageControlChange(Sender: TObject);
begin
  CurrentTab := LayoutPageControl.ActivePage;
//  LayoutPageControl.PopupMenu := pmnMain;
//  Self.PopupMenu := pmnMain;
  if Assigned(CurrentTab) then
  begin
    MasterFormDesigner.Active := False;
    CurrentForm := CurrentTab.Controls[0] as tfrmDesign;
    MasterFormDesigner.ParentForm := CurrentForm;
    MasterFormDesigner.GridColor := CurrentForm.Font.Color;
    MasterFormDesigner.DesignerColor := CurrentForm.Color;
    tfrmDesign(CurrentForm).PrintLayout := PrintLayout;
//    CloseDataSets;
    SetInspector;
    MasterFormDesigner.DisplayGrid := True;
    MasterFormDesigner.Active := True;
  end;
  if Assigned(CurrentForm) then CurrentForm.Refresh;
  Refresh;
  SendMessage(GetFocus,WM_KILLFOCUS,0,0);
  Application.ProcessMessages;

  
end;


procedure TfrmLayout.SaveInfo;
var LayoutInfo: TLayoutInformation;
begin
  ThisTabInfoForm.LayoutType := LayoutType;
  ThisTabinfoForm.PrintLayout := PrintLayout;
  LayoutData.LayoutType := LayoutType;
  LayoutData.PrintLayout := PrintLayout;
  ThisTabInfoForm.SelectedTabName := CurrentForm.Tabname;
  ThisTabInfoForm.TabEdit.Text := CurrentForm.TabLabel;
  ThisTabInfoForm.UseMemo.Clear;
  ThisTabInfoForm.UseMemo.Lines.Add(CurrentForm.TabNotes);
  ThisTabInfoForm.SelectedLayoutName := Self.LayoutName;
  ThisTabInfoForm.LayoutCombo.Text := Self.LayoutName;
  ThisTabInfoForm.TabID := CurrentForm.TabID;
  if ThisTabInfoForm.ShowModal > 0 then
  begin
    case ThisTabInfoForm.LoadType of
      ltSaveLayout,ltNewLayout:
        begin
          if ThisTabInfoForm.LoadType = ltNewLayout then
            LayoutInfo.LayoutID := 0
          else
            LayoutInfo.LayoutID := ThisTabInfoForm.LayoutID;

          LayoutName := ThisTabInfoForm.SelectedLayoutName;
          LayoutInfo.LayoutName := ThisTabInfoForm.SelectedLayoutName;
          LayoutInfo.LayoutType := Self.LayoutType;
          LayoutInfo.PrintLayout := Self.PrintLayout;
          LayoutData.SaveLayout(LayoutPageControl, LayoutInfo);
        end;
      ltSaveTab, ltNewTab: begin
          LayoutData.LayoutType := Self.LayoutType;
          LayoutData.PrintLayout := Self.PrintLayout;
          if ThisTabInfoForm.LoadType = ltNewTab then
          begin
            CurrentForm.TabLabel := ThisTabInfoForm.TabEdit.Text;
            CurrentForm.TabNotes := ThisTabInfoForm.UseMemo.Text;
            CurrentTab.Caption := CurrentForm.TabLabel;
            CurrentForm.Tabname := ThisTabInfoForm.DescriptionCombo.Text ;            
            LayoutData.SaveTab(0,ThisTabInfoForm.LayoutID,LayoutPageControl.ActivePage)
          end
          else
          begin
            CurrentForm.TabLabel := ThisTabInfoForm.TabEdit.Text;
            CurrentForm.TabNotes := ThisTabInfoForm.UseMemo.Text;
            CurrentTab.Caption := CurrentForm.TabLabel;
            LayoutData.SaveTab(ThisTabInfoForm.TabID,ThisTabInfoForm.LayoutID,LayoutPageControl.ActivePage);
            Refresh;
          end;
        end;
    end;
  end;
end;

procedure TfrmLayout.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CloseInspector;
  CurrentForm := nil;
end;

procedure TfrmLayout.FormPaint(Sender: TObject);
begin
  if not (CurrentForm = nil) then
  begin
    TabNameEdit.Text := CurrentForm.TabName;
    TabTextEdit.Text := CurrentForm.TabLabel;
    TabDescriptionMemo.Clear;
    TabDescriptionMemo.Lines.Add(CurrentForm.TabNotes);
    TabColumnsCheck.Visible := FPrintLayout;
    TabColumnsCheck.Enabled := FPrintLayout;
    TabColumnsCheck.Checked := CurrentForm.Columns;
    CurrentForm.Refresh;
  end;
  LayoutNameEdit.Text := LayoutName;
  Save1.Enabled := LayoutLoaded;
  SaveLayoutAs1.Enabled := LayoutLoaded;
  RenameCurrentLayout1.Enabled := LayoutLoaded;
  SaveCurrentTab1.Enabled := LayoutLoaded;
  SaveCurrentTabAs1.Enabled := LayoutLoaded;
  // No convert to print layout if not exam
  ConvertToPrintLayout1.Enabled :=
    ((LayoutType = 'X') or (LayoutType = 'L') or (LayoutType = 'G'));
end;

function TFrmLayout.LayoutType:String;
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

procedure TfrmLayout.SetPrintLayout(const Value: Boolean);
var CurrentVersion: String;
begin
  CurrentVersion := '';
  with TFileVersion.Create(nil) do
    try
      FileName := ParamStr(0);
      CurrentVersion := ' v.'+FileVersion;
    finally
      Free;
    end;
  FPrintLayout := Value;
  if FPrintLayout then
    Caption := 'Print Designer' + CurrentVersion
  else
    Caption := 'Screen Builder' + CurrentVersion;
  Refresh;
end;

procedure TfrmLayout.TabColumnsCheckClick(Sender: TObject);
begin
  CurrentForm.Columns := TabColumnsCheck.Checked;
end;


procedure TfrmLayout.TabTextEditChange(Sender: TObject);
begin
  CurrentForm.TabLabel := TabTextEdit.Text;
  LayoutPageControl.ActivePage.Caption := TabTextEdit.Text;
end;

procedure TfrmLayout.TabTextEditExit(Sender: TObject);
begin
CurrentForm.TabLabel := TabTextEdit.Text;
LayoutPageControl.ActivePage.Caption := TabTextEdit.Text;
TabTextEdit.ReadOnly := True;
end;

procedure TfrmLayout.ConvertLayout;
var CurrentPage : TTabSheet;
    x: Integer;
    LayoutInfo: TLayoutInformation;
    ConvertForm: TConvertForm;
begin
  LayoutInfo.LayoutID := 0;
  LayoutInfo.LayoutName := Self.LayoutName;
  LayoutInfo.LayoutType := Self.LayoutType;
  LayoutInfo.PrintLayout := True;
  ConvertForm := TConvertForm.Create(nil);
  try
    ConvertForm.MasterForm := Self;
    // ConvertForm.Show;
    ConvertForm.ConvertLayout(LayoutPageControl, LayoutInfo);
  finally
    FreeAndNil(ConvertForm)
  end;
  ShowMessage('done');
 end;

procedure TfrmLayout.ClearPage;
var ThisSheet: TTabSheet;
    I: Integer;
begin
  Visible := False;
  if Assigned(CurrentForm) then
  begin
    if not (frmObjectInspector = nil) then
    begin
      frmObjectInspector.Hide;
      CloseInspector;
     end;
  end;
  CurrentForm := nil;
  CurrentTab := nil;
  for I := LayoutPageControl.PageCount -1 downto 0 do
  begin
    ThisSheet := LayoutPageControl.Pages[I];
    ThisSheet.PageControl := nil;
    FreeAndNil(ThisSheet);
  end;
  Visible := True;

  ReFresh;
end;

procedure TfrmLayout.AdjustTabs(SortTabs: Boolean);
var TabAdjust: TTabAdjustForm;
    TabForm: TfrmDesign;
    x, CurrentTab, ChoiceResult, ThisTab, ThisLayout: Integer;
begin
  TabAdjust := TTabAdjustForm.Create(Self);
  try
  TabAdjust.SortTabs := SortTabs;
  TabAdjust.TabList.Clear;
  LayoutPageControl.Visible := False;
  CurrentTab := LayoutPageControl.ActivePageIndex;
  // Close inspector before copying to controls
  CloseInspector;
  for x := 0 to LayoutPageControl.PageCount -1 do
  begin
    LayoutPageControl.ActivePageIndex := x;
    TabForm := LayoutPageControl.ActivePage.Controls[0] as tfrmDesign;
    TabAdjust.TabList.AddItem(TabForm.TabLabel, TabForm);
  end;
  LayoutPageControl.ActivePageIndex := CurrentTab;
  ChoiceResult := TabAdjust.ShowModal;
  if ChoiceResult > 90 then
  begin
    CurrentForm := nil;
    CurrentTab := 0;
    for x := 0 to TabAdjust.TabList.GetChecked.Count -1 do
    begin
      TabForm := TabAdjust.Tablist.GetChecked.Objects[x] as tfrmDesign;
      if ChoiceResult = DeleteFromAll then
        ThisLayout := 0;
      if ChoiceResult = DeleteFromCurrent then
        ThisLayout := LayoutID;
      // Removes tab from table
      LayoutData.RemoveTab(ThisLayout,TabForm.TabID);
      // Removes tab from PageControl
      RemoveTab(TabForm.TabID);
    end;
  end;
  finally
    FreeAndNil(TabAdjust);
  end;
  LayoutPageControl.Visible := True;
  LayoutPageControl.OnChange(Self);
end;

procedure TfrmLayout.CheckControls(ErrorList: TStringList; Container: TWinControl);
var
  Fieldname: string;
  Datasource: string;
  I: Integer;
begin
  with Container do
  begin
    for I := 0 to ControlCount - 1 do
    begin
      if Controls[I] is TCBSDBGrid then
        continue;
      if Controls[I] is TCBSFilterDBGrid then
        continue;
      if Controls[I] is TCBSDBNavigator then
        continue;
      if Controls[I] is TCBSLabel then
        continue;
      if Controls[I] is TCBSPanel then
      begin
        CheckControls(ErrorList, Controls[I] as TCBSPanel);
        continue;
      end;
      MasterFormDesigner.Control := Controls[I];
      if not frmObjectInspector.CheckDataInformation(Datasource, Fieldname) then
        if not ((Datasource = '') and (Fieldname = '')) then  //We have something to check
          Errorlist.Add('Error Component = ' + MasterFormDesigner.Control.Name + ' Source = ' + DataSource + ' Field = ' + Fieldname);
    end;
  end;
end;

procedure TfrmLayout.CloseDataSets;
var
  I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
    if Components[I] is TDataSource then
      if Assigned(TDataSource(Components[I]).DataSet) then
        TDatasource(Components[I]).Dataset.Active := False;
end;

procedure TfrmLayout.OpenDataSets;
var
  I: Integer;
begin
  // used after load safe mode
  for I := 0 to ComponentCount - 1 do
    if Components[I] is TDataSource then
      if Assigned(TDataSource(Components[I]).DataSet) then
        try
        TDatasource(Components[I]).Dataset.Active := True;
        except
          // Trap an open error, since we already know there is a problem
        end;
end;

procedure TfrmLayout.CreateDesigner;
begin
  MasterFormDesigner := TRFDesigner.Create(Self);
  MasterFormDesigner.GridColor := Self.Font.Color;
  MasterFormDesigner.DesignerColor := Self.Color;
  MasterFormDesigner.ShowNonVisual := False;
  MasterFormDesigner.PopupMenu := pmnmain;
  MasterFormDesigner.ShowComponentCaptions := True;
  MasterFormDesigner.OnMessage := MasterFormDesignerMessage;
  MasterFormDesigner.OnKeyDown := MasterFormDesignerKeyDown;
  MasterFormDesigner.OnSelectControl := MasterFormDesignerSelectControl;
end;
{
function TfrmLayout.PreCheck: Boolean;
var
  LastVersion: string;
  CurrentVersion: string;
begin
  CurrentVersion := '';
  Result := True;
  with TFileVersion.Create(nil) do
    try
      FileName := ParamStr(0);
      CurrentVersion := FileVersion;
    finally
      Free;
    end;
  with TIniFile.Create(GetCurrentDir+'\SBCheck.ini') do
    try
      LastVersion := ReadString('Update', 'LastVersion', '1.1.0.0');
    finally
      Free;
    end;
  if EarlierVersion(LastVersion,CurrentVersion) then
  begin
    if MessageBox(Handle,'Do you want to run ScreenBuilder update?  You must be the only one on the system and can take a lot of time',
                         'ScreenBuilder Update',mb_YESNO)=ID_YES then
    begin
      with TUpdateScreenBuilderForm.Create(nil) do
        try
          // UpdateScreenBuilder(CurrentVersion);
        finally
          Free;
        end;
    end
    else
      Result := False;
  end;
  Caption := 'Compulink Screen Builder v.'+CurrentVersion;
end;
}
procedure TfrmLayout.CloseInspector;
begin
  if not (frmObjectInspector = nil) then
  begin
    frmObjectInspector.cmpObjectInspector.Root := nil;
    frmObjectInspector.cmpObjectInspector.Instance := nil;
    frmObjectInspector.cmbObjectInspector.Root := nil;
    frmObjectInspector.cmbObjectInspector.Instance := nil;
    frmObjectInspector.Hide;
  end;
  MasterFormDesigner.Active := False;
end;

procedure TfrmLayout.CloseLayout1Click(Sender: TObject);
begin
  Newlayout1Click(Sender);
end;

procedure TfrmLayout.RemoveTab(TabID: Integer);
var x: Integer;
    ThisPage: TTabSheet;
    ThisForm: TfrmDesign;
begin
  for x := LayoutPageControl.PageCount -1 downto 0 do
  begin
    ThisPage := LayoutPageControl.Pages[x];
    ThisForm := ThisPage.Controls[0] as TfrmDesign;
    if ThisForm.TabID = TabID then
    begin
      ThisPage := nil;
      ThisForm := nil;
      LayoutPageControl.ActivePageIndex := 0;
      try
      LayoutPageControl.Pages[x].Free;
      except
        on exception do;
      end;
    end;
  end;
end;

procedure TfrmLayout.sbtPaletteButtonClick(Sender: TObject);
begin
  ComponentClass:=(Sender as TPaletteButton).ComponentClass;
  if CurrentForm = nil then exit;
  with MasterFormDesigner do
    if Assigned(ComponentClass) then
    begin
      if not Locked then Lock;
    end
    else Unlock;
end;

procedure TfrmLayout.FormShow(Sender: TObject);
begin
  if not PaletteLoaded then
  begin
    if PrintLayout then
    begin
      CreatePalettePage(pgcMain,'Standard',[TCBSPrintText, TCBSPrintField, TCBSPrintCheckBox, TCBSPrintMemo,TCBSPrintImage],sbtPaletteButtonClick);
      CreatePalettePage(pgcMain,'Additional',[TCBSPrintGrid, TCBSPrintPanel, TCBSPrintRx, TImage],sbtPaletteButtonClick);
    end
    else
    begin
      CreatePalettePage(pgcMain,'Standard',[TCBSLabel,TCBSDBEdit,TCBSDBSpinEdit, TCBSDBDateTimePicker, TCBSDBMemo,TCBSDBCheckBox,TCBSDBRadioGroup,TCBSDBComboBox, TImage],sbtPaletteButtonClick);
      CreatePalettePage(pgcMain,'Additional',[TCBSDBImage,TCBSButton,TCBSBitBtn,TCBSPanel, TCBSDBGrid,TCBSFilterDBGrid],sbtPaletteButtonClick);
      CreatePalettePage(pgcMain,'Data',[{TCBSQuery,}TCBSDBNavigator{, TADSQuery}],sbtPaletteButtonClick);
      if FileExists('Eyemd.exe') or FileExists('Eyecare.exe') then
        CreatePalettePage(pgcMain,'Ophthalmic',[TCBSCTGrid],sbtPaletteButtonClick);
    end;
    PaletteLoaded := True;
  end;
end;

procedure TfrmLayout.eveLock(Sender: TObject);
var
  i,IDX: Integer;
begin
  if Sender<>sbtLock then sbtLock.Down:=not sbtLock.Down;
  {$IFDEF TFD1COMPATIBLE}
  with MasterFormDesigner,FixedControls do
  {$ELSE}
  with MasterFormDesigner,LockedControls do
  {$ENDIF}
    for i:=0 to Pred(ControlCount) do
    begin
      IDX:=IndexOf(Controls[i].Name);
      if sbtLock.Down then
      begin
        if IDX=-1 then Add(Controls[i].Name);
      end
      else
        if IDX<>-1 then Delete(IDX);
    end;
end;

procedure TfrmLayout.eveAlign(Sender: TObject);
var
  i: Integer;
begin
  with MasterFormDesigner do
    for i:=0 to Pred(ControlCount) do
      if not IsLocked(Controls[i]) then
        AlignToGrid(Controls[i]);
end;

procedure TfrmLayout.eveDelete(Sender: TObject);
var I: Integer;
begin
  if sbtDelete.Enabled then
    for I := (MasterFormDesigner.ControlCount - 1) downto 0 do
      MasterFormDesigner.Controls[I].Free;

  with frmObjectInspector,cmbObjectInspector do
  begin
    Root:= Self;
    Instance:=CurrentForm;
    cmpObjectInspector.Instance:= CurrentForm;
  end;
end;

procedure TfrmLayout.eveCut(Sender: TObject);
begin
  if sbtCut.Enabled then
    MasterFormDesigner.CutToClipboard;
end;

procedure TfrmLayout.evePaste(Sender: TObject);
begin
  if sbtPaste.Enabled then
    MasterFormDesigner.PasteFromClipboard;
end;

procedure TfrmLayout.eveCopy(Sender: TObject);
begin
  if sbtCopy.Enabled then
    MasterFormDesigner.CopyToClipboard;
end;

procedure TfrmLayout.sbtOpenClick(Sender: TObject);
begin
 // frmLayout.MasterFormDesigner.LoadFromDFM(FileName,TDFMFormat(Pred(FilterIndex)));
  ThisTabInfoForm.LoadType := ltLoadLayout;
 GetInfo;
end;

procedure TfrmLayout.sbtSaveClick(Sender: TObject);
begin
  // frmLayout.MasterFormDesigner.SaveToDFM(FileName,TDFMFormat(Pred(FilterIndex)));
  ThisTabInfoForm.LoadType := ltSaveLayout;
  SaveInfo;
end;

procedure TfrmLayout.sbtSetupClick(Sender: TObject);
begin
  with TfrmSetup.Create(nil) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmLayout.mniBringToFrontClick(Sender: TObject);
var
  i: Integer;
begin
  with MasterFormDesigner do
  begin
    for i:=Pred(ControlCount) downto 0 do Controls[i].BringToFront;
    Update;
  end;
end;

procedure TfrmLayout.mniSendToBackClick(Sender: TObject);
var
  i: Integer;
begin
  with MasterFormDesigner do
  begin
    for i:=Pred(ControlCount) downto 0 do Controls[i].SendToBack;
    Update;
  end;
end;

procedure TfrmLayout.moveTab(Sender: TObject);
var MoveAmount :Integer;
begin
  with Sender as TMenuItem do
  begin
    if Name = 'TabRight' then
       MoveAmount := 1
    else
      MoveAmount := -1;
  end;
  if (MoveAmount > 0) and
     (CurrentTab.PageIndex+MoveAmount < LayoutPageControl.PageCount) then
     CurrentTab.PageIndex := CurrentTab.PageIndex + MoveAmount;
  if (MoveAmount < 0) and
     (CurrentTab.PageIndex + MoveAmount >= 0)  then
     CurrentTab.PageIndex := CurrentTab.PageIndex + MoveAmount;
end;

procedure TfrmLayout.sbtAlignClick(Sender: TObject);
begin
  MasterFormDesigner.AlignDialog;
end;

procedure TfrmLayout.sbtSizeClick(Sender: TObject);
begin
  MasterFormDesigner.SizeDialog;
end;

procedure TfrmLayout.eveSelectAll(Sender: TObject);
begin
  MasterFormDesigner.SelectAll;
end;

procedure TfrmLayout.eveAlignPalette(Sender: TObject);
begin
  MasterFormDesigner.ShowAlignmentPalette;
end;

procedure TfrmLayout.eveTabOrder(Sender: TObject);
begin
  MasterFormDesigner.TabOrderDialog;
end;

procedure TfrmLayout.sbtObjectInspectorClick(Sender: TObject);
begin
  if CurrentForm <> nil then
  begin
    SetInspector;
    frmObjectInspector.Show;
  end;
end;

procedure TfrmLayout.sbtSortTabClick(Sender: TObject);
begin
  TabRight.Click;
end;

procedure TfrmLayout.sbtSourceClick(Sender: TObject);
begin
  TabLeft.Click;
end;

procedure TfrmLayout.sbtAddTabClick(Sender: TObject);
begin
  ThisTabInfoForm.ClearFields;
  ThisTabInfoForm.LoadType := ltNewTab;
  GetInfo;
end;

procedure TfrmLayout.ConverttoPrintLayout1Click(Sender: TObject);
begin
  // Convert Normal Layout to Print Layout
  if IDOK = Application.MessageBox('You are about to create a print layout from the saved'+
  ' version of this layout.  If you have made changes that you want to save permanently '+
  'in the screen version you should cancel, save this, then run convert' +
  ' to print layout again. This conversion is an initial conversion only, which you'+
  ' should then edit to achieve the best results available.','Convert to Print Layout', MB_OKCANCEL) then
  begin
    ConvertLayout;
  end;
end;

procedure TfrmLayout.DeleteTabs1Click(Sender: TObject);
var ThisDelete: TDeleteForm;
begin
  if Application.MessageBox('Any tab(s) deleted will no longer be available for use in any Layout.  '+
                             #13#10+#13#10+'         Tabs deleted CANNOT be undone! '+
                             #13#10+#13#10 + 'An open layout will be automatically closed without saving before this process.'+
                             #13#10 + 'Choose Cancel to save an open layout or OK to proceed with deletion.','Delete Tabs',mb_OKCancel)=id_OK then
  begin
    Newlayout1Click(Sender);
    ThisDelete := TDeleteForm.Create(nil);
    try
      ThisDelete.DeleteType := dtTab;
      ThisDelete.PrintLayout := Self.PrintLayout;
      ThisDelete.LayoutType := Self.LayoutType;
      if ThisDelete.ShowModal = 100 then
        ShowMessage('done');
    finally
      FreeAndNil(ThisDelete);
    end;

  end;

end;

procedure TfrmLayout.DeleteLayout1Click(Sender: TObject);
var ThisDelete: TDeleteForm;
begin
  if Application.MessageBox('Layouts deleted does NOT delete the associated tabs.'+
                             #13#10+#13#10+'       Layouts deleted CANNOT be undone! '+
                             #13#10+#13#10 + 'An open layout will be automatically closed without saving before this process.'+
                             #13#10 + 'Choose Cancel to save an open layout or OK to proceed.','Delete Tabs',mb_OKCancel)=id_OK then
  begin
    Newlayout1Click(Sender);
    ThisDelete := TDeleteForm.Create(nil);
    try
      ThisDelete.DeleteType := dtLayout;
      ThisDelete.PrintLayout := Self.PrintLayout;
      ThisDelete.LayoutType := Self.LayoutType;
      if ThisDelete.ShowModal = 100 then
        ShowMessage('done');
    finally
      FreeAndNil(ThisDelete);
    end;
  end;

end;

procedure TfrmLayout.DeleteTab1Click(Sender: TObject);
begin
  AdjustTabs(False);
end;


procedure TfrmLayout.Tops1Click(Sender: TObject);
begin
  MasterFormDesigner.AlignControls(amNoChange,amLeftTop);
end;

procedure TfrmLayout.Bottoms1Click(Sender: TObject);
begin
  MasterFormDesigner.AlignControls(amNoChange,amRightBottom);

end;

procedure TfrmLayout.Left1Click(Sender: TObject);
begin
  MasterFormDesigner.AlignControls(amLeftTop,amNoChange);

end;

procedure TfrmLayout.Right1Click(Sender: TObject);
begin
  MasterFormDesigner.AlignControls(amRightBottom, amNoChange);

end;


procedure TfrmLayout.SetPaletteLoaded(const Value: Boolean);
begin
  FPaletteLoaded := Value;
end;

procedure TfrmLayout.Quit1Click(Sender: TObject);
begin
  Application.Terminate;
end;


procedure TfrmLayout.LoadTab1Click(Sender: TObject);
begin
  ThisTabInfoForm.LoadType := ltLoadTab;
  GetInfo;
end;

procedure TfrmLayout.SaveCurrentTab1Click(Sender: TObject);
begin
  ThisTabInfoForm.LoadType := ltSaveTab;
  SaveInfo;
end;

procedure TfrmLayout.SaveCurrentTabAs1Click(Sender: TObject);
begin
  ThisTabInfoForm.LoadType := ltNewTab;
  SaveInfo;
end;

procedure TfrmLayout.ChangeCurrentTabText1Click(Sender: TObject);
begin
TabTextEdit.ReadOnly := False;
TabTextEdit.SetFocus;
end;

procedure TfrmLayout.ChangeOrderofTabs1Click(Sender: TObject);
begin
  AdjustTabs;
end;

procedure TfrmLayout.Checkforbadfields1Click(Sender: TObject);
var
    Controlname: String;
    ErrorList: TStringList;
begin
if not ((CurrentForm = nil) or (frmObjectInspector = nil))  then
begin
  frmobjectinspector.Visible := false;
  ErrorList := TStringList.Create;
  try
    CheckControls(ErrorList, CurrentForm);
  if ErrorList.Count > 0 then
    ShowMessage(ErrorList.Text);
  finally
    ErrorList.Free;
    frmobjectinspector.Visible := false;
  end;

end;
end;

procedure TfrmLayout.RemoveTabs1Click(Sender: TObject);
begin
  AdjustTabs(False);
end;


procedure TfrmLayout.CreateBlankTab;
begin
    CurrentTab := TTabSheet.Create(LayoutPageControl);
    CurrentTab.PageControl := LayoutPageControl;
    CurrentTab.Parent := LayoutPageControl;
    CurrentForm := TfrmDesign.Create(Application);
    CurrentForm.BorderStyle := bsNone;
    CurrentForm.Align := alClient;
    CurrentForm.Parent := CurrentTab;
    CurrentForm.Visible := True;
    LayOutPageControl.ActivePage := CurrentTab;
//    LayoutPageControl.Visible := True;

end;

procedure TfrmLayout.NewLayout1Click(Sender: TObject);
begin
  ClearPage;
  LayoutNameEdit.Text := '';
  TabNameEdit.Text := '';
  TabDescriptionMemo.Clear;
  TabTextEdit.Text := '';
  TabColumnsCheck.Checked := False;
  LayoutPageControl.Visible := False;
  LayoutName := '';
  ShowMessage('A New Layout has been created and starts out empty. '+#13#10+
  'Please select File/Load Tab to choose which tabs you would like this layout to contain'+#13#10+
  'or choose File/Blank Tab to start with a new empty tab.'+#13#10+
  'You will have the opportunity to name the layout when you save.');
end;

procedure TfrmLayout.SaveLayoutAs1Click(Sender: TObject);
begin
  ThisTabInfoForm.LoadType := ltNewLayout;
  SaveInfo;
end;

function TfrmLayout.SetScreenFromParam(const ParamValue: String): Boolean;
var CheckParam: String;
begin
  Result := False;
  CheckParam := UpperCase(Trim(ParamValue));
  if pos(CheckParam,'EXAM~PATIENT~RESPONSIBLE~CONTACT~FRAMES~CLAIMS~APPOINTMENT')>0 then
  begin
    ScreenCode := CheckParam;
    Result := True;
  end;
end;

procedure TfrmLayout.RenameCurrentLayout1Click(Sender: TObject);
var LayoutInfo: TLayoutInformation;
begin
  ThisTabInfoForm.LoadType := ltRenameLayout;
  ThisTabInfoForm.LayoutType := LayoutType;
  ThisTabinfoForm.PrintLayout := PrintLayout;
  LayoutData.LayoutType := LayoutType;
  LayoutData.PrintLayout := PrintLayout;
  ThisTabInfoForm.SelectedLayoutName := Self.LayoutName;
  ThisTabInfoForm.LayoutCombo.Text := Self.LayoutName;
  if ThisTabInfoForm.ShowModal > 0 then
  begin
    // Fill in info for Layout
    LayoutInfo.LayoutID := Self.LayoutID;
    LayoutInfo.LayoutType := Self.LayoutType;
    LayoutInfo.PrintLayout := Self.PrintLayout;
    LayoutInfo.LayoutName := ThisTabInfoForm.LayoutCombo.Text;
    //update table
    LayoutData.SaveLayoutHead(LayoutInfo);
    LayoutName := LayoutInfo.LayoutName;
    Refresh;
  end;
end;

procedure TfrmLayout.ExportTab1Click(Sender: TObject);
var FileName, ComeBackHere: WideString;
begin
  // Export to XML
  ComeBackhere := GetCurrentDir;
  if ExportSaveDialog.Execute then
  begin
    FileName := ExportSaveDialog.FileName;
    if LayoutData.ExportTab(CurrentForm.TabID, FileName) then
      ShowMessage('Exported to ' + FileName)
    else
      ShowMessage('Problem with export');
  end;
  SetCurrentDir(ComeBackHere);
end;

procedure TfrmLayout.ImportTab1Click(Sender: TObject);
var FileName, Description, ComeBackHere: WideString;
begin
  // Bring in from XML
  ComeBackhere := GetCurrentDir;
  Description := '';
  if ImportOpenDialog.Execute then
  begin
    FileName := ImportOpenDialog.FileName;
    LayoutData.ImportTab(FileName,Description);
    ShowMessage('Imported as ' + Description);
  end;
  SetCurrentDir(ComeBackHere);
end;

procedure TfrmLayout.LoadLayoutSafeClick(Sender: TObject);
begin
  if Application.MessageBox('This open method is only to fix bad data.  Do not use for normal editing.  Continue?',
  'Load Layout in Safe Mode',MB_YESNO)=idYES then
  begin
    ThisTabInfoForm.LoadType := ltLoadLayoutSafe;
    GetInfo;
  end;

end;


procedure TfrmLayout.MasterFormDesignerMessage(Sender: TObject; var Msg: TMSG);
var
  WinControl: TWinControl;
  NewComponent: TComponent;
  CC: TComponentContainer;
  P: TPoint;

  function GetPopupParent(W: HWND): HWND;
  begin
    Result:=W;
    while (Result<>0) and (Result<>Application.Handle) and (Result<>Handle) do
      Result:=GetParent(Result);
  end;
begin
  with Msg do
    case Message of
//      WM_RBUTTONDOWN:  Message:=0;
      WM_LBUTTONDBLCLK: Message:=0;
      WM_LBUTTONDOWN:
        if GetPopupParent(hwnd)=Handle then
        begin
          Message:=0;
          if hwnd=Handle then WinControl:=Self
          else
          begin
            WinControl:=MasterFormDesigner.FindWinControl(hwnd);
            while Assigned(WinControl) and
              not (csAcceptsControls in WinControl.ControlStyle) do
              WinControl:=WinControl.Parent;
          end;
          if Assigned(WinControl) and Assigned(frmLayout.ComponentClass) then
          begin
            NewComponent:=TComponent(frmLayout.ComponentClass.Create(CurrentForm));
            if Assigned(NewComponent) then
              if not CurrentForm.AutoName(NewComponent) then NewComponent.Free
              else
              begin
                P:=Point(LoWord(lParam),HiWord(lParam));
                MapWindowPoints(hwnd,WinControl.Handle,P,1);
                if NewComponent is TControl then
                  with TControl(NewComponent) do
                  begin
                    Left:=P.X;
                    Top:=P.Y;
                    with MasterFormDesigner do
                      if SnapToGrid then AlignToGrid(TControl(NewComponent));
                    Parent:=WinControl;
                  end
                else
                  with MasterFormDesigner do
                  begin
                    CC:=FindComponentContainer(NewComponent);
                    if Assigned(CC) then
                    begin
                      with CC do
                      begin
                        Left:=P.X;
                        Top:=P.Y;
                      end;
                      if SnapToGrid then AlignToGrid(CC);
                    end;
                  end;
                MasterFormDesigner.Component:=NewComponent;
              end;
          end;
          EditMode(frmLayout.pgcMain);
          MasterFormDesigner.Unlock;
        end;
    end;
    inherited;
end;

procedure TfrmLayout.MasterFormDesignerSelectControl(Sender: TObject;
  TheControl: TControl);
var
  E: Boolean;
begin
  if Assigned(TheControl) then
  frmLayout.sbtLock.Down:=MasterFormDesigner.LockedControls.IndexOf(TheControl.Name)<>-1;
  E:=Assigned(MasterFormDesigner.Control);
  with frmLayout do
  begin
//    MasterFormDesigner.Active := E;
    sbtLock.Enabled:=E;
    sbtAlignToGrid.Enabled:=E;
    sbtAlign.Enabled:=E;
    sbtSize.Enabled:=E;
    sbtDelete.Enabled:=E;
    mniAlignToGrid.Enabled:=E;
    mniDelete.Enabled:=E;
    sbtCopy.Enabled:=E;
    sbtCut.Enabled:=E;
    mniCopy.Enabled:=E;
    mniCut.Enabled:=E;
  end;

end;

procedure TfrmLayout.MasterFormDesignerKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_INSERT:
      if Shift=[ssShift] then evePaste(nil)
      else
        if Shift=[ssCtrl] then eveCopy(nil);
    VK_DELETE:
      if Shift=[ssShift] then eveCut(nil)
      else
        if Shift=[] then eveDelete(nil);
  end;
end;

Initialization
  RegisterCBSComponents;

end.
