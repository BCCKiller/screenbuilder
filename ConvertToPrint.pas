unit ConvertToPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ComCtrls, Design, StdCtrls, Mask,
  Math, DBCtrls, LayoutDataMod,Proplist;

type
  TConvertForm = class(TForm)
    LayoutPageControl: TPageControl;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    LayoutID : Integer;
    LayoutName: String;
    FPrintLayout: Boolean;
    OldPropertyList: TPropertyList;
    NewPropertyList: TPropertyList;
    procedure ConvertPage(PageToConvert: TTabSheet);
    procedure ConvertAllControls(ThisOwner: TWinControl);
    procedure UpdateControl(NewControl: TControl; const OldControl:TControl);
    procedure NewPrintField(OldControl: TControl);
    procedure NewPrintGrid(OldControl: TControl);
    procedure NewPrintImage(OldControl: TControl);
    procedure NewPrintMemo(OldControl: TControl);
    procedure NewPrintPanel(OldControl: TControl);
    procedure NewPrintText(OldControl: TControl);
    procedure NewPrintCheck(OldControl: TControl);
    procedure SetPrintLayout(const Value: Boolean);
  public
    { Public declarations }
    CurrentTab :TTabSheet;
    CurrentForm : TfrmDesign;
    OldForm: TFrmDesign;
    MasterForm: TForm;
    procedure ConvertLayout(MasterPageControl: TPageControl; LayoutInfo: TLayoutInformation);
    property PrintLayout: Boolean read FPrintLayout write SetPrintLayout;
  end;

var
  ConvertForm: TConvertForm;

implementation
uses Layout, CBSComponents, CBSGraphics;
{$R *.dfm}

procedure TConvertForm.UpdateControl(NewControl: TControl;
  const OldControl: TControl);
  var FormPoint, ThisPoint: TPoint;
  P: TProperty;
  XDiff, YDiff: Integer;
begin
  CurrentForm.AutoName(NewControl);
  NewControl.Parent := CurrentForm;
  ThisPoint.y := OldControl.Top;
  ThisPoint.x := OldControl.Left;
  FormPoint := OldForm.ClientToScreen(Point(0,0));
  ThisPoint := CurrentForm.ClientToScreen(Point(0,0));
  XDiff := ThisPoint.x - FormPoint.x;
  YDiff := ThisPoint.y - FormPoint.y;
  ThisPoint := OldControl.ClientToScreen(Point(0,0));
  ThisPoint := CurrentForm.ScreenToClient(Point((ThisPoint.x + XDiff),(ThisPoint.y +YDiff)));
  NewControl.Top := ThisPoint.y;
  NewControl.Left := ThisPoint.x;
  NewControl.Height := OldControl.Height;
  NewControl.Width := OldControl.Width;
end;

procedure TConvertForm.ConvertLayout(MasterPageControl: TPageControl; LayoutInfo: TLayoutInformation);
var PageToConvert : TTabSheet;
    x: Integer;
    HoldLayoutDataInfo: Boolean;
begin
  // Reset Layout ID and Print type
  if LayoutData.LayoutExists(LayoutInfo.LayoutName,True) then
  begin
    if Application.MessageBox('A print layout already exists with this name. Click OK to create a layout with a generated name or Cancel.','Layout exists',mb_OKCancel)= idCancel then
       exit
    else
      while LayoutData.LayoutExists(LayoutInfo.LayoutName,True) do
      begin
        LayoutInfo.LayoutName := LayoutInfo.LayoutName + IntToStr(Random(9));
      end;
    ShowMessage('The layout will be named ' + LayoutInfo.LayoutName);
  end;
  HoldLayoutDataInfo := LayoutData.PrintLayout;
  LayoutData.PrintLayout := True;
  LayoutData.SaveLayoutHead(LayoutInfo);
  for x := 0 to MasterPageControl.PageCount -1 do
  begin
    MasterPageControl.ActivePageIndex := x;
    PageToConvert := MasterPageControl.ActivePage;
    ConvertPage(PageToConvert);
    LayoutData.SaveTab(0, LayoutInfo.LayoutID, LayoutPageControl.ActivePage);
  end;
  LayoutData.TabTable.IndexName := '';
  LayoutData.PrintLayout := HoldLayoutDataInfo;
end;

procedure TConvertForm.NewPrintField(OldControl: TControl);
var
  ThisPrint: TCBSPrintField;
begin
  begin
    ThisPrint:= TCBSPrintField.Create(CurrentForm);
    ThisPrint.Parent := CurrentForm;
    UpdateControl(ThisPrint, OldControl);
    if OldControl is TCBSDBEdit then
    begin
      ThisPrint.DataSource := TCBSDBEdit(OldControl).DataSource;
      ThisPrint.DataField := TCBSDBEdit(OldControl).DataField;
      ThisPrint.Font := TCBSDBEdit(OldControl).Font;
    end;
    if OldControl is TCBSDBComboBox then
    begin
      ThisPrint.DataSource := TCBSDBComboBox(OldControl).DataSource;
      ThisPrint.DataField := TCBSDBComboBox(OldControl).DataField;
      ThisPrint.Font := TCBSDBComboBox(OldControl).Font;
    end;
    if OldControl is TCBSDBDateTimePicker then
    begin
      ThisPrint.DataSource := TCBSDBDateTimePicker(OldControl).DataSource;
      ThisPrint.DataField := TCBSDBDateTimePicker(OldControl).DataField;
      ThisPrint.Font := TCBSDBDateTimePicker(OldControl).Font;
    end;
    if OldControl is TCBSDBLookupComboBox then
    begin
      ThisPrint.DataSource := TCBSDBLookupComboBox(OldControl).DataSource;
      ThisPrint.DataField := TCBSDBLookupComboBox(OldControl).DataField;
      ThisPrint.Font := TCBSDBLookupComboBox(OldControl).Font;
    end;
    if OldControl is TCBSDBSpinEdit then
    begin
      ThisPrint.DataSource := TCBSDBSpinEdit(OldControl).DataSource;
      ThisPrint.DataField := TCBSDBSpinEdit(OldControl).DataField;
      ThisPrint.Font := TCBSDBSpinEdit(OldControl).Font;
    end;
    if OldControl is TCBSDBRadioGroup then
    begin
      ThisPrint.DataSource := TCBSDBRadioGroup(OldControl).DataSource;
      ThisPrint.DataField := TCBSDBRadioGroup(OldControl).DataField;
      ThisPrint.Font := TCBSDBRadioGroup(OldControl).Font;
    end;
    ThisPrint.Font.Color := clBlack;

  end;
end;

procedure TConvertForm.NewPrintCheck(OldControl: TControl);
var ThisPrint: TCBSPrintCheckBox;
begin
    ThisPrint := TCBSPrintCheckBox.Create(CurrentForm);
    ThisPrint.Parent := CurrentForm;
    UpdateControl(ThisPrint, OldControl);
    if OldControl is TCBSDBCheckbox then
    begin
      ThisPrint.DataSource := TCBSDBCheckbox(OldControl).DataSource;
      ThisPrint.DataField := TCBSDBCheckbox(OldControl).DataField;
      ThisPrint.Caption := TCBSDBCheckbox(OldControl).Caption;
      ThisPrint.Font := TCBSDBCheckbox(OldControl).Font;
      ThisPrint.Font.Color := clBlack;
    end;
end;

procedure TConvertForm.NewPrintPanel(OldControl: TControl);
var
  ThisPrint: TCBSPrintPanel;
begin
  begin
    ThisPrint := TCBSPrintPanel.Create(CurrentForm);
    ThisPrint.Parent := CurrentForm;
    UpdateControl(ThisPrint, OldControl);
  end;
end;

procedure TConvertForm.NewPrintGrid(OldControl: TControl);
var
  ThisPrint: TCBSPrintGrid;
begin
  begin
    ThisPrint := TCBSPrintGrid.Create(CurrentForm);
    ThisPrint.Parent := CurrentForm;
    UpdateControl(ThisPrint, OldControl);
  end;
end;

procedure TConvertForm.NewPrintImage(OldControl: TControl);
var
  ThisPrint: TCBSPrintImage;
begin
  begin
    ThisPrint := TCBSPrintImage.Create(CurrentForm);
    ThisPrint.Parent := CurrentForm;
    UpdateControl(ThisPrint, OldControl);
    with OldControl as TCBSDBImage do
    begin
      ThisPrint.DataSource := DataSource;
      ThisPrint.DataField := DataField;
    end;
  end;
end;

procedure TConvertForm.NewPrintText(OldControl: TControl);
var
  ThisPrint: TCBSPrintText;
begin
  begin
    ThisPrint := TCBSPrintText.Create(CurrentForm);
    ThisPrint.Parent := CurrentForm;
    UpdateControl(ThisPrint, OldControl);
    ThisPrint.Caption := TCBSLabel(OldControl).Caption;
    ThisPrint.Font := TCBSLabel(OldControl).Font;
    ThisPrint.Font.Color := clBlack;
    ThisPrint.Alignment := TCBSLabel(OldControl).Alignment;
  end;
end;


procedure TConvertForm.NewPrintMemo(OldControl: TControl);
var
  ThisPrint: TCBSPrintMemo;
begin
  begin
    ThisPrint := TCBSPrintMemo.Create(CurrentForm);
    ThisPrint.Parent := CurrentForm;
    UpdateControl(ThisPrint, OldControl);
  end;
  if OldControl is TCBSDBMemo then
  begin
    ThisPrint.DataSource := TCBSDBMemo(OldControl).DataSource;
    ThisPrint.DataField := TCBSDBMemo(OldControl).DataField;
    ThisPrint.Font := TCBSDBMemo(OldControl).Font;
  end;
  ThisPrint.Font.Color := clBlack;
end;

procedure TConvertForm.ConvertPage(PageToConvert: TTabSheet);
begin
    //CurrentTab := CurrentPage;
    OldForm := PageToConvert.Controls[0] as tfrmDesign;
    CurrentTab := TTabSheet.Create(LayoutPageControl);
    CurrentTab.PageControl := LayoutPageControl;
    CurrentForm := tFrmDesign.Create(CurrentTab);
    CurrentForm.BorderStyle := bsNone;
    CurrentForm.PrintLayout := True;
    CurrentForm.Parent := CurrentTab;
    CurrentForm.Visible := True;
    CurrentForm.TabLabel := OldForm.TabLabel;
    CurrentForm.TabName := OldForm.TabName;
    while LayoutData.TabExists(CurrentForm.TabName,True) do
       CurrentForm.TabName := CurrentForm.TabName + IntToStr(Random(9));
    CurrentForm.TabNotes := OldForm.TabNotes;
    Currentform.Height := OldForm.Height;
    CurrentForm.Width := OldForm.Width;
    LayoutPageControl.ClientHeight := Max(LayoutPageControl.ClientHeight, Currentform.Height + 24);
    LayoutPageControl.ClientWidth := max(LayoutPageControl.ClientWidth, CurrentForm.Width + 4);
    CurrentForm.Align := alClient;
    CurrentTab.Caption := CurrentForm.TabLabel;
    LayOutPageControl.ActivePage := CurrentTab;
    CurrentForm.Name := 'frmDesign'+IntToStr(CurrentTab.TabIndex);
    frmLayout.MasterFormDesigner.Active := True;
    //CurrentForm.Visible := False;
    //UpdateControl(CurrentForm, OldForm);
    ConvertAllControls(OldForm);
end;

procedure TConvertForm.ConvertAllControls(ThisOwner: TWinControl);
var x: Integer;
begin
  for x := 0 to ThisOwner.ControlCount -1 do
  begin
    if ThisOwner.Controls[x] is TWinControl then
      if TWinControl(ThisOwner.Controls[x]).ControlCount >0 then
        ConvertAllControls(ThisOwner.Controls[x] as TWinControl);

    if ThisOwner.Controls[x] is TCBSDBEdit then
      NewPrintField(ThisOwner.Controls[x] as TControl);

    if ThisOwner.Controls[x] is TCBSDBComboBox then
       NewPrintField(ThisOwner.Controls[x] as TControl);

    if ThisOwner.Controls[x] is TCBSDBDateTimePicker then
      NewPrintField(ThisOwner.Controls[x] as TControl);

    if ThisOwner.Controls[x] is TCBSDBLookupComboBox then
      NewPrintField(ThisOwner.Controls[x] as TControl);

    if ThisOwner.Controls[x] is TCBSDBSpinEdit then
      NewPrintField(ThisOwner.Controls[x]);

    if ThisOwner.Controls[x] is TCBSDBRadioGroup then
      NewPrintField(ThisOwner.Controls[x]);

    if ThisOwner.Controls[x] is TCBSDBMemo then
      NewPrintMemo(ThisOwner.Controls[x] as TControl);

    if ThisOwner.Controls[x] is TCBSDBImage then
       NewPrintImage(ThisOwner.Controls[x] as TControl);

    if ThisOwner.Controls[x] is TCBSLabel then
      NewPrintText(ThisOwner.Controls[x] as TControl);

    if ThisOwner.Controls[x] is TCBSDBCheckbox then
      NewPrintCheck(ThisOwner.Controls[x] as TControl);

    if ThisOwner.Controls[x] is TCBSPanel then
    begin
    end;

    if ThisOwner.Controls[x] is TCBSDBGrid then
    begin
    end;

    if ThisOwner.Controls[x] is TCBSDBImage then
    begin
    end;

  end;
end;
procedure TConvertForm.SetPrintLayout(const Value: Boolean);
begin
  FPrintLayout := Value;
  Refresh;
end;

procedure TConvertForm.FormCreate(Sender: TObject);
begin
  OldPropertyList := TPropertyList.Create(nil);
  NewPropertyList := TPropertyList.Create(nil);

end;

procedure TConvertForm.FormDestroy(Sender: TObject);
begin
  OldPropertyList.Free;
  NewPropertyList.Free;
end;

end.
