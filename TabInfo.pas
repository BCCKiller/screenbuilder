unit TabInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TLoadType = (ltLoadLayout, ltLoadLayoutSafe, ltSaveLayout, ltNewLayout, ltRenameLayout, ltLoadTab, ltSaveTab, ltNewTab);

  TTabInfoForm = class(TForm)
    TabEdit: TEdit;
    UseMemo: TMemo;
    btnOK: TButton;
    btnCancel: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LayoutCombo: TComboBox;
    DescriptionCombo: TComboBox;
    ActionLabel: TLabel;
    TabWarningPanel: TPanel;
    Label5: TLabel;
    UpdateCheckbox: TCheckBox;
    procedure DescriptionComboSelect(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LayoutComboSelect(Sender: TObject);
  private
    FLayoutType: String;
    FPrintLayout: Boolean;
    FSelectedLayoutName: String;
    FSelectedTabName: String;
    FLoadType: TLoadType;
    FLayoutID: Integer;
    FTabID: Integer;
    FEditableDropDown: Boolean;
    procedure EnableLayout;
    procedure EnableTab;
    procedure LoadLayoutCombo;
    procedure LoadTabCombo;
    procedure SetLayoutType(const Value: String);
    procedure SetPrintLayout(const Value: Boolean);
    procedure SetSelectedLayoutName(const Value: String);
    procedure SetSelectedTabName(const Value: String);
    procedure SetLoadType(const Value: TLoadType);
    procedure UpdateLayout(const LayoutText: String);
    procedure UpdateTab(const TabDescription: String);
    procedure SetLayoutID(const Value: Integer);
    procedure SetTabID(const Value: Integer);
    procedure ReloadCombo;
    procedure SetEditableDropDown(const Value: Boolean);
    property EditableDropDown: Boolean read FEditableDropDown write SetEditableDropDown;
  public
    { Public declarations }
    procedure ClearFields;
    property LayoutType: String read FLayoutType write SetLayoutType;
    property PrintLayout: Boolean read FPrintLayout write SetPrintLayout;
    property SelectedTabName: String read FSelectedTabName write SetSelectedTabName;
    property SelectedLayoutName: String read FSelectedLayoutName write SetSelectedLayoutName;
    property LoadType: TLoadType read FLoadType write SetLoadType;
    property LayoutID: Integer read FLayoutID write SetLayoutID;
    property TabID: Integer read FTabID write SetTabID;
  end;

var
  TabInfoForm: TTabInfoForm;

implementation

uses LayoutDataMod;

{$R *.dfm}

procedure TTabInfoForm.btnOKClick(Sender: TObject);
var HoldLayoutID: Integer;
begin
  case FLoadType of
    ltRenameLayout: begin
      if LayoutCombo.Text = '' then
      begin
        ShowMessage('Enter new name for this Layout');
        exit;
      end;
      // Check for existing
      HoldLayoutID := FLayoutID;
      UpdateLayout(LayoutCombo.Text);
      if (FLayoutID > 0) then
      begin
        ShowMessage('Name already exists, choose another');
        LayoutID := HoldLayoutID;
        exit;
      end;
      LayoutID := HoldLayoutID;
    end;
    ltLoadLayout, ltLoadLayoutSafe: begin
      if LayoutCombo.Text = '' then
      begin
        ShowMessage('Select Layout from list');
        exit;
      end;
      UpdateLayout(LayoutCombo.Text);
    end;
    ltLoadTab: begin
      if DescriptionCombo.Text = '' then
      begin
        ShowMessage('Select Description from list');
        exit;
      end;
      UpdateTab(DescriptionCombo.Text);
    end;
    ltSaveLayout:  begin
      if LayoutCombo.Text = '' then
      begin
        ShowMessage('Enter name or select Layout to update from list');
        exit;
      end;
      UpdateLayout(LayoutCombo.Text);
      if (FLayoutID > 0) and
          (Application.MessageBox(pchar('You are about update Layout '+LayoutCombo.Text+'. Do you want to do that?'),
                                      'Update Layout',mb_YesNo) = IDNo)
       then exit;
    end;
    ltSaveTab: begin
      if DescriptionCombo.Text = '' then
      begin
        ShowMessage('Enter Tab Description or select Description to update from list');
        exit;
      end;
      UpdateTab(DescriptionCombo.Text);
      if (FTabID > 0) and
          (Application.MessageBox(pchar('You are about update tab '+DescriptionCombo.Text+'. Do you want to do that?'),
                                      'Update Tab',mb_YesNo) = IDNo)
      then exit;

    end;
    ltNewTab: begin
      if (DescriptionCombo.Text = '') or (TabEdit.Text = '') then
      begin
        ShowMessage('Fill in both Description and Tab info');
        exit;
      end;
      UpdateTab(DescriptionCombo.Text);
      if (FTabID > 0) then
      begin
        ShowMessage(DescriptionCombo.Text +' is already a named tab');
        exit;
      end;
    end;
    end;
    ModalResult := 99;
end;

procedure TTabInfoForm.btnCancelClick(Sender: TObject);
begin
  ModalResult := -1;
end;

procedure TTabInfoForm.ClearFields;
begin
  TabEdit.Text := '';
  UseMemo.Clear;
  DescriptionCombo.Text := '';
end;

procedure TTabInfoForm.EnableLayout;
begin
  LayoutCombo.Enabled := True;
  LayoutCombo.SetFocus;
end;

procedure TTabInfoForm.EnableTab;
begin
  DescriptionCombo.SetFocus;
end;

procedure TTabInfoForm.FormCreate(Sender: TObject);
begin
  fLayoutType := '';
  LoadType := ltLoadLayout;
  fPrintLayout := False;
  FLayoutID := 0;
  FTabID := 0;
  FEditableDropDown := False;
end;

procedure TTabInfoForm.ReloadCombo;
var IsLayout: Boolean;
    HoldText: String;
begin
  IsLayout := True;
  TabWarningPanel.Visible := False;
  UpdateCheckBox.Checked := False;
  case FLoadType of
  ltLoadLayout, ltLoadLayoutSafe: LoadLayoutCombo;
  ltLoadTab:
    begin
      LoadTabCombo;
      IsLayout := False;
    end;
  ltSaveLayout:
  begin
    LoadLayoutCombo;
    LayoutCombo.ItemIndex := LayoutCombo.Items.IndexOf(SelectedLayoutName);
  end;
  ltSaveTab:
    begin
      LoadTabCombo;
      DescriptionCombo.ItemIndex := DescriptionCombo.Items.IndexOf(SelectedTabName);
      IsLayout := False;
      TabWarningPanel.Visible := True;
    end;
  ltNewTab: IsLayout := False;
  end;
  LayoutCombo.Visible := IsLayout;
  if EditableDropDown then
    LayoutCombo.Style := csDropDown
  else
    LayoutCombo.Style := csDropDownList;
  Label4.Visible := LayoutCombo.Visible;
  DescriptionCombo.Visible := not LayoutCombo.Visible;
  TabEdit.Visible :=  DescriptionCombo.Visible;
  UseMemo.Visible := DescriptionCombo.Visible;
  Label1.Visible := DescriptionCombo.Visible;
  Label2.Visible := DescriptionCombo.Visible;
  Label3.Visible := DescriptionCombo.Visible;
  if EditableDropDown then
    DescriptionCombo.Style := csDropDown
  else
    DescriptionCombo.Style := csDropDownList;
  if DescriptionCombo.Visible then
    DescriptionCombo.SetFocus;
  if IsLayout then Self.ClientHeight := 150 else
  if FloadType = ltSaveTab then
    Self.ClientHeight := 327
  else
    Self.ClientHeight := 300;
end;

procedure TTabInfoForm.LoadLayoutCombo;
begin
  with LayoutData.LayoutTable do
  begin
    LayoutCombo.Clear;
    First;
    while not Eof do
    begin
      if (FieldByName('LayoutType').AsString = fLayoutType)
      and (FieldByName('PrintLayout').AsBoolean = fPrintLayout) then
      begin
        LayoutCombo.AddItem(Trim(FieldByName('LayoutName').AsString),nil);
      end;
      Next;
    end;
  end;
  FLayoutID := 0;
end;

procedure TTabInfoForm.LoadTabCombo;
 var ThisID: Integer;
begin
  with LayoutData do
  begin
  with TabTable do
  begin
    DescriptionCombo.Clear;
    First;
    while not Eof do
    begin
      ThisId :=  FieldByName('TabID').AsInteger;
      if (FieldByName('LayoutType').AsString = fLayoutType)
      and (FieldByName('PrintLayout').AsBoolean = fPrintLayout) then
      begin
        DescriptionCombo.AddItem(Trim(FieldByName('TabDescription').AsString),nil);
      end;
      Next;
    end;
  end;
  end;
  FTabID := 0;
end;

procedure TTabInfoForm.LayoutComboSelect(Sender: TObject);
begin
  SelectedLayoutName := LayoutCombo.Text;
end;

procedure TTabInfoForm.DescriptionComboSelect(Sender: TObject);
begin
  SelectedTabname := DescriptionCombo.Text;
end;

procedure TTabInfoForm.SetLayoutType(const Value: String);
begin
  FLayoutType := Value;
end;

procedure TTabInfoForm.FormActivate(Sender: TObject);
var HoldLayoutText,HoldTabText: String;
begin
  ReloadCombo;
  LayoutCombo.ItemIndex := LayoutCombo.Items.IndexOf(SelectedLayoutName);
  DescriptionCombo.ItemIndex := DescriptionCombo.Items.IndexOf(SelectedTabName);
end;

procedure TTabInfoForm.SetPrintLayout(const Value: Boolean);
begin
  FPrintLayout := Value;
end;

procedure TTabInfoForm.SetSelectedLayoutName(const Value: String);
begin
  FSelectedLayoutName := Value;
end;

procedure TTabInfoForm.SetSelectedTabName(const Value: String);
begin
  FSelectedTabName := Value;
end;

procedure TTabInfoForm.SetLoadType(const Value: TLoadType);
begin
  FLoadType := Value;
  EditableDropDown := False;
  case FLoadType of
    ltLoadLayout: ActionLabel.Caption := 'Load Layout';
    ltLoadLayoutSafe: ActionLabel.Caption := 'Load Layout in Safe Mode';    
    ltSaveLayout: ActionLabel.Caption := 'Save Layout';
    ltLoadTab: ActionLabel.Caption := 'Load Tab';
    ltSaveTab: ActionLabel.Caption := 'Save Tab';
    ltNewLayout: begin
      ActionLabel.Caption := 'New Layout';
      EditableDropDown := True;
    end;
    ltRenameLayout: begin
      ActionLabel.Caption := 'Rename Layout';
      EditableDropDown := True;
    end;
    ltNewTab: begin
      ActionLabel.Caption := 'New Tab';
      EditableDropDown := True;
    end;
  end;
end;

procedure TTabInfoForm.UpdateTab(const TabDescription: String);
var TmpTabLabel, TmpTabInformation: String;
    TmpTabID: Integer;
begin
  TmpTabID := 0;
  LayoutData.GetTabInfo(TabDescription,TmpTabID,TmpTabLabel,TmpTabInformation);
  TabID := TmpTabID;
  if (TabID > 0) //found existing tab
   or not (FLoadType = ltNewTab) // This is not a new tab
  then
  begin
    if not UpdateCheckbox.checked then
    begin
      TabEdit.Text := TmpTabLabel;
      UseMemo.Clear;
      UseMemo.Lines.Add(TmpTabInformation);
    end;
  end;
end;

procedure TTabInfoForm.UpdateLayout(const LayoutText: String);
var TmpLayoutID: Integer;
begin
  TmpLayoutID := 0;
  LayoutData.GetLayoutInfo(LayoutText,TmpLayoutID);
  LayoutID := TmpLayoutID;
end;

procedure TTabInfoForm.SetLayoutID(const Value: Integer);
begin
  FLayoutID := Value;
end;

procedure TTabInfoForm.SetTabID(const Value: Integer);
begin
  FTabID := Value;
end;


procedure TTabInfoForm.SetEditableDropDown(const Value: Boolean);
begin
  FEditableDropDown := Value;
end;

end.
