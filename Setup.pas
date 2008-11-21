unit Setup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, coolor;

const CustomColorFile = 'CustomColor.HLD';

type
  TfrmSetup = class(TForm)
    lblGridStep: TLabel;
    lblDesignerColor: TLabel;
    lblGridColor: TLabel;
    chbDisplayGrid: TCheckBox;
    chbSnapToGrid: TCheckBox;
    edtGridStep: TEdit;
    udnGridStep: TUpDown;
    pnlDesignerColor: TPanel;
    btnDesignerColor: TButton;
    pnlGridColor: TPanel;
    btnGridColor: TButton;
    btnOk: TButton;
    btnCancel: TButton;
    cldMain: TColorDialog;
    grbNormalGrabs: TGroupBox;
    pnlNBorder: TPanel;
    btnNBorder: TButton;
    lblNBorder: TLabel;
    pnlNFill: TPanel;
    btnNFill: TButton;
    lblNFill: TLabel;
    grbLockedGrabs: TGroupBox;
    lblLBorder: TLabel;
    lblLFill: TLabel;
    pnlLBorder: TPanel;
    btnLBorder: TButton;
    pnlLFill: TPanel;
    btnLFill: TButton;
    lblGrabSize: TLabel;
    edtGrabSize: TEdit;
    udnGrabSize: TUpDown;
    chbShowHint: TCheckBox;
    chbShowComponentHint: TCheckBox;
    chbShowNonVisual: TCheckBox;
    procedure btnDesignerColorClick(Sender: TObject);
    procedure btnGridColorClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnNBorderClick(Sender: TObject);
    procedure btnNFillClick(Sender: TObject);
    procedure btnLBorderClick(Sender: TObject);
    procedure btnLFillClick(Sender: TObject);
    procedure cldMainShow(Sender: TObject);
    procedure cldMainClose(Sender: TObject);
  private
    { Private declarations }
    TabName : String;
    TabID : Integer;
  public
    { Public declarations }
  end;

var
  frmSetup: TfrmSetup;

implementation

uses Layout;

{$R *.DFM}

procedure TfrmSetup.btnDesignerColorClick(Sender: TObject);
var MyColor : TfrmCoolorDialog;
begin
{  MyColor := TfrmCoolorDialog.Create(nil);
  try
    MyColor.ShowModal
  finally
    MyColor.Free;
  end; }

  with cldMain do
  begin
    Color:=frmLayout.MasterFormDesigner.DesignerColor;
    if Execute then pnlDesignerColor.Color:=Color;
  end;  
end;

procedure TfrmSetup.btnGridColorClick(Sender: TObject);
begin
  with cldMain do
  begin
    Color:=frmLayout.MasterFormDesigner.GridColor;
    if Execute then pnlGridColor.Color:=Color;
  end;
end;

procedure TfrmSetup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ModalResult=mrOk then
    with frmLayout.MasterFormDesigner do
    begin
      DisplayGrid:=chbDisplayGrid.Checked;
      SnapToGrid:=chbSnapToGrid.Checked;
      GridStep:=udnGridStep.Position;
// Change so that FORM color is updated, not designer
      if Assigned(frmLayout.CurrentForm) then
        frmLayout.CurrentForm.Color :=pnlDesignerColor.Color;
//      DesignerColor:=pnlDesignerColor.Color;
      GridColor:=pnlGridColor.Color;
      NormalGrabBorder:=pnlNBorder.Color;
      NormalGrabFill:=pnlNFill.Color;
      LockedGrabBorder:=pnlLBorder.Color;
      LockedGrabFill:=pnlLFill.Color;
      GrabSize:=udnGrabSize.Position;
      ShowMoveSizeHint:=chbShowHint.Checked;
      ShowComponentHint:=chbShowComponentHint.Checked;
      ShowNonVisual:=chbShowNonVisual.Checked;
    end;
end;

procedure TfrmSetup.FormShow(Sender: TObject);
begin
  with frmLayout.MasterFormDesigner do
  begin
// change to change the FORM color, not the designer color....
    if Assigned(frmLayout.Currentform) then
      pnlDesignerColor.Color := frmLayout.CurrentForm.Color;
{    if DesignerColor<>clNone then pnlDesignerColor.Color:=DesignerColor
    else pnlDesignerColor.Color:=clBtnFace;  }
    if GridColor<>clNone then pnlGridColor.Color:=GridColor
    else pnlGridColor.Color:=Font.Color;
    pnlNBorder.Color:=NormalGrabBorder;
    pnlNFill.Color:=NormalGrabFill;
    pnlLBorder.Color:=LockedGrabBorder;
    pnlLFill.Color:=LockedGrabFill;
    udnGridStep.Position:=GridStep;
    chbDisplayGrid.Checked:=DisplayGrid;
    chbSnapToGrid.Checked:=SnapToGrid;
    udnGrabSize.Position:=GrabSize;
    chbShowHint.Checked:=ShowMoveSizeHint;
    chbShowComponentHint.Checked:=ShowComponentHint;
    chbShowNonVisual.Checked:=ShowNonVisual;
  end;
  btnDesignerColor.SetFocus;
end;

procedure TfrmSetup.btnNBorderClick(Sender: TObject);
begin
  with cldMain do
  begin
    Color:=frmLayout.MasterFormDesigner.NormalGrabBorder;
    if Execute then pnlNBorder.Color:=Color;
  end;
end;

procedure TfrmSetup.btnNFillClick(Sender: TObject);
begin
  with cldMain do
  begin
    Color:=frmLayout.MasterFormDesigner.NormalGrabFill;
    if Execute then pnlNFill.Color:=Color;
  end;
end;

procedure TfrmSetup.btnLBorderClick(Sender: TObject);
begin
  with cldMain do
  begin
    Color:=frmLayout.MasterFormDesigner.LockedGrabBorder;
    if Execute then pnlLBorder.Color:=Color;
  end;
end;

procedure TfrmSetup.btnLFillClick(Sender: TObject);
begin
  with cldMain do
  begin
    Color:=frmLayout.MasterFormDesigner.LockedGrabFill;
    if Execute then pnlLFill.Color:=Color;
  end;
end;


procedure TfrmSetup.cldMainShow(Sender: TObject);
var F : TextFile;
  CustColor : String;
begin
  if FileExists(CustomColorFile) then
  begin
    AssignFile(F, CustomColorFile);
    Reset(F);
    Read(F,CustColor);
    cldMain.CustomColors.Clear;
    cldMain.CustomColors.Add(CustColor);
    CloseFile(F);
  end;
end;

procedure TfrmSetup.cldMainClose(Sender: TObject);
var F: TextFile;
begin
  AssignFile(F,CustomColorFile);
  Rewrite(F);
  Write(F,cldMain.CustomColors.Text);
  CloseFile(F);

end;

end.
