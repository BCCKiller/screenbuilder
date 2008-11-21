(*  GREATIS OBJECT INSPECTOR                      *)
(*  unit version 1.55.003                         *)
(*  Copyright (C) 2002-2006 Greatis Software      *)
(*  http://www.greatis.com/delphicb/objinsp/      *)
(*  http://www.greatis.com/delphicb/objinsp/faq/  *)
(*  http://www.greatis.com/bteam.html             *)

unit CollEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, StdCtrls, InspCtrl, CompInsp, Menus, TypInfo, PropList,
  PropEdit, OIForm;

type 

  TCollectionPropertyEditor = class(TPropertyEditor)
  private
    function GetCollection: TCollection;
  public
    function Execute: Boolean; override;
    property Collection: TCollection read GetCollection;
  end;

  TTargetPosition = (tpNone,tpTop,tpItem,tpBottom);

  TfrmCollectionEditor = class(TForm)
    splMain: TSplitter;
    pnlButtons: TPanel;
    btnAdd: TButton;
    btnDelete: TButton;
    pnlSysButtons: TPanel;
    btnClose: TButton;
    cinItemProperties: TComponentInspector;
    lsbItems: TListBox;
    btnUp: TButton;
    btnDown: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure lsbItemsClick(Sender: TObject);
    procedure lsbItemsDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lsbItemsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure lsbItemsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnUpClick(Sender: TObject);
    procedure btnDownClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure cinItemPropertiesChange(Sender: TObject; TheIndex: Integer);
    procedure cinItemPropertiesExit(Sender: TObject);
    procedure cinItemPropertiesGetButtonType(Sender: TObject; TheIndex: Integer;
      var Value: TButtonType);
    procedure cinItemPropertiesGetValuesList(Sender: TObject; TheIndex: Integer;
      const Strings: TStrings);
  private
    { Private declarations }
    FEditor: TCollectionPropertyEditor;
    FDragIndex: Integer;
    procedure WMGetMinMaxInfo(var Msg: TMessage); message WM_GETMINMAXINFO;
    function ItemText(CI: TCollectionItem): string;
    procedure UpdateSelection;
    procedure MoveUp(Target: Integer);
    procedure MoveDown(Target: Integer);
    procedure Reorder;
    procedure FillList;
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

function TCollectionPropertyEditor.GetCollection: TCollection;
begin
  Result:=Prop.AsObject as TCollection;
end;

function TCollectionPropertyEditor.Execute: Boolean;
begin
  Result:=False;
  with TfrmCollectionEditor.Create(Application) do
  try
    FEditor:=Self;
    FillList;
    with cinItemProperties do
    begin
      Root:=TCompInspPropertyList(Prop.Owner).Root;
      PaintStyle:=TCompInspPropertyList(Prop.Owner).CompInspList.Owner.PaintStyle;
      TCompInspPropertyList(Prop.Owner).CompInspList.Owner.CustomizeInspector(cinItemProperties);
    end;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmCollectionEditor.WMGetMinMaxInfo(var Msg: TMessage);
begin
  inherited;
  with PMinMaxInfo(Msg.LParam)^.ptMinTrackSize do
  begin
    X:=415;
    Y:=200;
  end;
end;

function TfrmCollectionEditor.ItemText(CI: TCollectionItem): string;
begin
  with CI do
    Result:=Format('%d - %s',[Index,DisplayName]);
end;

procedure TfrmCollectionEditor.UpdateSelection;
var
  i,Idx: Integer;
begin
  with cinItemProperties,lsbItems,Items do
    if (SelCount<1) or (ItemIndex=-1) then Instance:=nil
    else
      if (SelCount=1) and (Instance<>Objects[ItemIndex]) then Instance:=TComponent(Objects[ItemIndex])
      else
      begin
        i:=0;
        while i<InstanceCount do
        begin
          Idx:=IndexOfObject(Instances[i]);
          if (Idx<>-1) and not Selected[Idx] then DeleteInstance(Instances[i])
          else Inc(i);
        end;
        for i:=0 to Pred(Count) do
          if Selected[i] and (IndexOfInstance(TComponent(Objects[i]))=-1) then
            AddInstance(TComponent(Objects[i]));
      end;
end;

procedure TfrmCollectionEditor.MoveUp(Target: Integer);
var
  i,OldSelCount: Integer;
begin
  with lsbItems,Items do
  begin
    OldSelCount:=SelCount;
    for i:=0 to Pred(Count) do
      if Selected[i] then
      begin
        Move(i,Target);
        Inc(Target);
      end;
    Reorder;
    for i:=Target-OldSelCount to Pred(Target) do Selected[i]:=True;
  end;
end;

procedure TfrmCollectionEditor.MoveDown(Target: Integer);
var
  i,OldSelCount: Integer;
begin
  with lsbItems,Items do
  begin
    OldSelCount:=SelCount;
    i:=0;
    while (i<Count) and (SelCount>0) do
      if Selected[i] and (i<>Target) then Move(i,Target)
      else Inc(i);
    Reorder;
    for i:=Target-Pred(OldSelCount) to Target do Selected[i]:=True;
  end;
end;

procedure TfrmCollectionEditor.Reorder;
var
  i: Integer;
  Sel: Boolean;
begin
  with lsbItems,Items do
    for i:=0 to Pred(Count) do
    begin
      Sel:=Selected[i];
      TCollectionItem(Objects[i]).Index:=i;
      Items[i]:=ItemText(TCollectionItem(Objects[i]));
      if Sel then Selected[i]:=True;
    end;
end;

procedure TfrmCollectionEditor.FillList;
var
  i: Integer;
begin
  with FEditor,lsbItems do
  begin
    Items.BeginUpdate;
    try
      Items.Clear;
      for i:=0 to Pred(Collection.Count) do
        if Collection.Items[i].ClassType=Collection.ItemClass then
        begin
//          // trap for columns problem
//          if ((Collection.ItemClass.ClassNameIs('TColumn')) and
//             (Collection.Count = 1) and
//             (ItemText(Collection.Items[i])='0 - TColumn')) then
//               Collection.ItemClass.Create(Collection) ;
//          //end trap
          lsbItems.Items.AddObject(ItemText(Collection.Items[i]),Collection.Items[i]);
        end;
    finally
      Items.EndUpdate;
    end;
  end;
end;

procedure TfrmCollectionEditor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cinItemProperties.ApplyChanges;
end;

procedure TfrmCollectionEditor.FormShow(Sender: TObject);
begin
  with lsbItems,Items do
  begin
    if Count>0 then
    begin
      ItemIndex:=0;
      Selected[0]:=True;
      UpdateSelection;
    end
    else cinItemProperties.Instance:=nil;
    btnDelete.Enabled:=SelCount>0;
  end;
end;

procedure TfrmCollectionEditor.lsbItemsClick(Sender: TObject);
begin
  UpdateSelection;
end;

procedure TfrmCollectionEditor.lsbItemsDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var
  Index: Integer;
begin
  with lsbItems do
  begin
    Index:=ItemAtPos(Point(X,Y),True);
    Accept:=(Index>=0) and (Index<Items.Count) and not Selected[Index];
  end;
end;

procedure TfrmCollectionEditor.lsbItemsDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  Index: Integer;
begin
  with lsbItems do
  begin
    Index:=ItemAtPos(Point(X,Y),True);
    if Index<FDragIndex then MoveUp(Index)
    else MoveDown(Index);
  end;
end;

procedure TfrmCollectionEditor.lsbItemsMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FDragIndex:=lsbItems.ItemAtPos(Point(X,Y),True);
end;

procedure TfrmCollectionEditor.btnUpClick(Sender: TObject);
var
  i,Index: Integer;
begin
  Index:=-1;
  with lsbItems,Items do
    for i:=0 to Pred(Count) do
      if Selected[i] then
      begin
        Index:=i;
        Break;
      end;
  case Index of
    -1:;
    0: MoveUp(Index);
  else MoveUp(Pred(Index));
  end;
end;

procedure TfrmCollectionEditor.btnDownClick(Sender: TObject);
var
  i,Index: Integer;
begin            
  Index:=-1;
  with lsbItems,Items do
  begin
    for i:=Pred(Count) downto 0 do
      if Selected[i] then
      begin
        Index:=i;
        Break;
      end;
    if Index<>-1 then
      if Index=Pred(Count) then MoveDown(Index)
      else MoveDown(Succ(Index));
  end
end;

procedure TfrmCollectionEditor.btnAddClick(Sender: TObject);
var
  Index: Integer;
  CI: TCollectionItem;
begin
  with lsbItems,Items do
  begin
    with FEditor do CI:=Collection.ItemClass.Create(Collection);
    for Index:=0 to Pred(Count) do Selected[Index]:=False;
    FillList;
    Selected[CI.Index]:=True;
    cinItemProperties.Instance:=TComponent(CI);
    btnDelete.Enabled:=SelCount>0;
  end;
end;

procedure TfrmCollectionEditor.btnDeleteClick(Sender: TObject);
var
  i,OldSel: Integer;
begin
  with lsbItems,Items do
  begin
    OldSel:=ItemIndex;
    i:=0;
    while (i<Count) and (SelCount>0) do
      if Selected[i] then
      begin
        Delete(i);
        FEditor.Collection.Items[i].Free;
      end
      else Inc(i);
    FillList;
    if OldSel>Pred(Count) then OldSel:=Pred(Count);
    ItemIndex:=OldSel;
    Selected[OldSel]:=True;
    btnDelete.Enabled:=SelCount>0;
  end;
  UpdateSelection;
end;

procedure TfrmCollectionEditor.cinItemPropertiesChange(Sender: TObject;
  TheIndex: Integer);
begin
  Reorder;
end;

procedure TfrmCollectionEditor.cinItemPropertiesExit(Sender: TObject);
begin
  cinItemProperties.ApplyChanges;
end;

procedure TfrmCollectionEditor.cinItemPropertiesGetButtonType(
  Sender: TObject; TheIndex: Integer; var Value: TButtonType);
begin
  with cinItemProperties do
    if Assigned(Properties[TheIndex]) and
      (Properties[TheIndex].Name='FieldName') then Value:=btDropDown;

end;

procedure TfrmCollectionEditor.cinItemPropertiesGetValuesList(
  Sender: TObject; TheIndex: Integer; const Strings: TStrings);
begin
  with cinItemProperties do
    if Assigned(Properties[TheIndex]) and
      (Properties[TheIndex].Name='FieldName') then
      begin
        Strings.Text:=frmObjectInspector.GetFieldList;
      end;
end;
end.
