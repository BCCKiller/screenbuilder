unit DeleteFormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvExControls, JvComponent, JvxCheckListBox, DB, adsdata,
  adsfunc, adstable, adscnnct, CheckLst, JvExCheckLst, JvCheckListBox;

type
  TDeleteType = (dtLayout, dtTab);

  TInteger = class(TComponent)
  private
    FID: Integer;
    procedure SetID(const Value: Integer);
  published
    property ID: Integer read FID write SetID;
  end;

  TDeleteForm = class(TForm)
    CancelButton: TButton;
    DeleteButton: TButton;
    DeleteConnection: TAdsConnection;
    DeleteQuery: TAdsQuery;
    DeleteCheckList: TJvCheckListBox;
    Delete2Query: TAdsQuery;
    procedure DeleteButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    FDeleteType: TDeleteType;
    FPrintLayout: Boolean;
    FLayoutType: String;
    procedure SetDeleteType(const Value: TDeleteType);
    procedure SetLayoutType(const Value: String);
    procedure SetPrintLayout(const Value: Boolean);
    procedure FillCheckList;
    { Private declarations }
  public
    { Public declarations }
    property DeleteType: TDeleteType read FDeleteType write SetDeleteType;
    property PrintLayout: Boolean read FPrintLayout write SetPrintLayout;
    property LayoutType: String read FLayoutType write SetLayoutType;
  end;

var
  DeleteForm: TDeleteForm;

implementation

uses strutils;

{$R *.dfm}

procedure TDeleteForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := -1;
end;

procedure TDeleteForm.DeleteButtonClick(Sender: TObject);
var x, IDNum: Integer;
begin
  if Application.MessageBox('You are about to delete all checked items.  This CANNOT be undone.  Choose OK to proceed.','Permanent Deletion',mb_OKCancel)=id_OK then
  begin
    DeleteQuery.Close;
    case DeleteType of
      dtLayout:
      begin
        with DeleteQuery.SQL do
        begin
          Clear;
          Add('Delete from layoutmaster');
          Add('where LayoutID = :IDNum ;');
        end;
        with Delete2Query.SQL do
        begin
          Clear;
          Add('Delete from layouttablinkmaster');
          Add('where LayoutID = :IDNum ;');
        end;
      end;
      dtTab:
      begin
        with DeleteQuery.SQL do
        begin
          Clear;
          Add('Delete from tabmaster');
          Add('where TabID = :IDNum ;');
        end;
        with Delete2Query.SQL do
        begin
          Add('Delete from layouttablinkmaster');
          Add('where TabID = :IDNum ;');
        end;
      end;
    end;
    for x := 0 to DeleteCheckList.GetChecked.Count - 1 do
    begin
      IDNum := (DeleteCheckList.GetChecked.Objects[x] as TInteger).ID;
      with DeleteQuery do
      begin
        ParamByName('IDNum').AsInteger := IDNum;
        ExecSQL;
        Close;
      end;
      with Delete2Query do
      begin
        ParamByName('IDNum').AsInteger := IDNum;
        ExecSQL;
        Close;
      end;
    end;

    ModalResult := 100;
  end;
end;

procedure TDeleteForm.FormActivate(Sender: TObject);
begin
  case DeleteType of
    dtLayout: Caption := 'Delete Layout(s)';
    dtTab:  Caption := 'Delete Tab(s)';
  end;
  FillCheckList;
end;

procedure TDeleteForm.FormCreate(Sender: TObject);
begin
  DeleteType := dtLayout;
end;

procedure TDeleteForm.SetDeleteType(const Value: TDeleteType);
begin
  FDeleteType := Value;
end;

procedure TDeleteForm.SetLayoutType(const Value: String);
begin
  FLayoutType := Value;
end;

procedure TDeleteForm.SetPrintLayout(const Value: Boolean);
begin
  FPrintLayout := Value;
end;

procedure TDeleteForm.FillCheckList;
var MyID: TInteger;
begin
  with DeleteQuery do
  begin
    Close;
    SQL.Clear;
    case DeleteType of
      dtLayout:
        begin
          SQL.Add('Select layoutName as Name, LayoutID as ID from LayoutMaster');
          SQL.Add('where PrintLayout = '+ ifthen(PrintLayout, 'True', 'False') );
          SQL.Add('and LayoutType = :LayoutType');
          SQL.Add('order by LayoutName');
          ParamByName('LayoutType').AsString := LayoutType;
        end;
      dtTab:
        begin
          SQL.Add('Select TabDescription as Name, TabID as ID from TabMaster');
          SQL.Add('where PrintLayout = '+ ifthen(PrintLayout, 'True', 'False') );
          SQL.Add('and LayoutType = :LayoutType');
          SQL.Add('order by TabDescription');
          ParamByName('LayoutType').AsString := LayoutType;
        end;

    end;
    // end DeleteType
    Open;
    First;
    while not Eof do
    begin
      MyID := TInteger.Create(DeleteCheckList);
      MyID.ID := FieldByName('ID').AsInteger;
      DeleteCheckList.Items.AddObject(FieldByName('Name').AsString,MyID);
      Next;
    end;
    Close;
  end;
end;

{ TInteger }

procedure TInteger.SetID(const Value: Integer);
begin
  FID := Value;
end;

end.
