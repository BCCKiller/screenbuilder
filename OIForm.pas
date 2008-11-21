unit OIForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CompInsp, InspCtrl, ComCtrls, TypInfo, Design,
  RunFusC, Runfus, Mask, Proplist, PropEdit, DB, adsdata, adsfunc, adstable,
  Layout, adscnnct;
  
type
  TScriptPropertyEditor = class(TPropertyEditor)
  public
    function Execute: Boolean; override;
  end;

type
  TfrmObjectInspector = class(TForm)
    tbcObjectInspector: TTabControl;
    cmbObjectInspector: TRFComboBox;
    cmpObjectInspector: TRFCInspector;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmpObjectInspectorFilter(Sender: TObject; Prop: TProperty;
      var Result: Boolean);
    procedure FormResize(Sender: TObject);
    procedure tbcObjectInspectorChange(Sender: TObject);
    procedure cmbObjectInspectorChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function cmpObjectInspectorCallEditor(Sender: TObject;
      TheIndex: Integer; var EnableDefault: Boolean): Boolean;
    procedure cmpObjectInspectorGetButtonType(Sender: TObject;
      TheIndex: Integer; var Value: TButtonType);
    procedure cmpObjectInspectorGetValuesList(Sender: TObject;
      TheIndex: Integer; const Strings: TStrings);
    procedure cmpObjectInspectorGetSortValuesList(Sender: TObject;
      TheIndex: Integer; var Value: Boolean);
    procedure cmpObjectInspectorSetValue(Sender: TObject; TheIndex: Integer;
      var Value: string; var EnableDefault: Boolean);
  private
    { Private declarations }
    FLastDataSource: String;
    ExcludedProperties: TStringList;
    DefaultFields: TStringList;
    FDataSources: TStringList;
    procedure SetLastDataSource(const Value: String);
    procedure ClearDataFields;
    procedure SetDataSources(const Value: TStringList);
    property LastDataSource: String read FLastDataSource write SetLastDataSource;
  public
    { Public declarations }
    function GetSourceList(const PropertyName: String=''): String;
    function GetFieldList(const PropertyName: String=''): String;
    function GetDefaultList(const PropertyName: String=''): String;
    property DataSources: TStringList read FDataSources write SetDataSources;
    function CheckField(FieldName: String): Boolean;
    //GetDataInformation fills in Datasource, datafield and returns true if the datasource or datafield is a property of the control
    Function GetDataInformation(var DataSource,DataField: String): Boolean;
    Function CheckDataInformation(var DataSource,DataField: String): Boolean;
  end;

var
  frmObjectInspector: TfrmObjectInspector;

implementation

{$R *.DFM}

uses FDMain, SmartFields, CBSPrintComponents, DBGrids, CBSComponents;

procedure TfrmObjectInspector.FormResize(Sender: TObject);
begin
  cmbObjectInspector.Width:=ClientWidth;
  tbcObjectInspector.Height:=ClientHeight-cmbObjectInspector.Height-4;
end;

procedure TfrmObjectInspector.tbcObjectInspectorChange(Sender: TObject);
begin
  with cmpObjectInspector do
  begin
    Lock;
    try
      Mode:=TCompInspMode(tbcObjectInspector.TabIndex);
    finally
      Unlock;
    end;
  end;
end;

function TfrmObjectInspector.CheckDataInformation(var DataSource,
  DataField: String): Boolean;
  //if true, the data checks out, if not, it should be looked at
  var I, J: Integer;
begin
  Result := True;
  if GetDataInformation(DataSource, Datafield) then
  begin
    if DataSource = '' then Result := False;
    if Result then
    begin
      // Check to see if Datasource is good
      I := Datasources.IndexOf(DataSource);
      if I <0 then Result := False;
    end;
    if Result and (DataField <> '') then
    begin
      // check to see if datafield is in datasource.  
      Result := not ((DataSources.Objects[I] as TStringList).IndexOf(DataField)<0);
    end;
  end;
end;

function TfrmObjectInspector.CheckField(FieldName: String): Boolean;
var WorkingDataSource: TDataSource;
    BaseName: String;
    P: TProperty;
    I: Integer;
begin
  Result := False;
  with TPropertyList.Create(nil) do
  try
    Instance:=cmpObjectInspector.Instance;
    BaseName := Instance.ClassName;
    Root:=cmpObjectInspector.Root;
    P:=FindProperty('LinkedDataSource');
    if P = nil then P:=FindProperty('DataSource');
    if P = nil then exit;
    if P.AsObject = nil then exit;
    WorkingDataSource := P.AsObject as TDataSource;
    I:= DataSources.IndexOf(WorkingDataSource.Name);
    if Datasources.Objects[I] is TStringList then
      Result := (DataSources.Objects[I] as TStringList).Indexof(FieldName)>=0;
  finally
    Free;
  end;
end;

procedure TfrmObjectInspector.ClearDataFields;
var Columns: TDBGridColumns;
    P: TProperty;
begin
  with TPropertyList.Create(nil) do
  try
    Instance:=cmpObjectInspector.Instance;
    Root:=cmpObjectInspector.Root;
    // Check for a FilterStatement
    P:=FindProperty('DataField');
    if Assigned(P) then P.AsString := '';
    P:=FindProperty('DataKeyField');
    if Assigned(P) then P.AsString := '';
    P:=FindProperty('LinkedDataKeyField');
    if Assigned(P) then P.AsString := '';
   
  finally
    Free;
  end;

end;

procedure TfrmObjectInspector.cmbObjectInspectorChange(Sender: TObject);
begin
  frmLayout.MasterFormDesigner.Control:=TControl(cmbObjectInspector.Instance);
end;

procedure TfrmObjectInspector.FormShow(Sender: TObject);
begin
  cmpObjectInspector.DefaultInstance:=frmLayout.CurrentForm;
end;

function TfrmObjectInspector.cmpObjectInspectorCallEditor(Sender: TObject;
  TheIndex: Integer; var EnableDefault: Boolean): Boolean;

procedure SetColumnState;
var  DBColumns: TDBGridColumns;
  P: TProperty;
begin
  with TPropertyList.Create(nil) do
  try
    Instance:=cmpObjectInspector.Instance;
    Root:=cmpObjectInspector.Root;
    // Check for a FilterStatement
    P:=FindProperty('Columns');
    if Assigned(P) then
    begin
      DBColumns := P.AsObject as TDBGridColumns;
      if DBColumns.State = csDefault then
      begin
        DBColumns.Clear;
        DBColumns.Add;
      end;
      DBColumns.State := csCustomized;
    end;
  finally
    Free;
  end;
end;

var
  OldValue: string;
begin
  Result:=False;
  with cmpObjectInspector do
    if Assigned(Properties[TheIndex]) then
      with Properties[TheIndex] do
      begin
        if TypeKind in [tkString,tkWString,tkLString] then
        begin
          EnableDefault:=False;
          OldValue:=AsString;
          AsString:=InputBox(
            cmpObjectInspector.Instance.Name,
            Name,
            OldValue);
          Result:=AsString<>OldValue;
        end;
        if TypeName = 'TDBGridColumns' then
        begin
          SetColumnState;
        end;
      end;
end;

procedure TfrmObjectInspector.cmpObjectInspectorGetButtonType(
  Sender: TObject; TheIndex: Integer; var Value: TButtonType);
begin
  with cmpObjectInspector do
  begin
    if Assigned(Properties[TheIndex]) and
      (Properties[TheIndex].Name='DataField') then Value:=btDropDown;
    if Assigned(Properties[TheIndex]) and
      (Properties[TheIndex].Name='LinkedDataKeyField') then Value:=btDropDown;
    if Assigned(Properties[TheIndex]) and
      (Properties[TheIndex].Name='DataKeyField') then Value:=btDropDown;
    if Assigned(Properties[TheIndex]) and
      (Properties[TheIndex].Name='CheckDefault') then Value:=btDropDown;
  end;

end;

procedure TfrmObjectInspector.cmpObjectInspectorGetSortValuesList(
  Sender: TObject; TheIndex: Integer; var Value: Boolean);
begin
  with cmpObjectInspector do
  begin
    if Assigned(Properties[TheIndex]) and
      (Properties[TheIndex].Name='DataSource') then
      begin
        LastDataSource := Properties[TheIndex].AsString;
        Value := True;
      end;
    if Assigned(Properties[TheIndex]) and
      (Properties[TheIndex].Name='LinkedDataSource') then
      begin
        LastDataSource := Properties[TheIndex].AsString;
        Value := True;
      end;
  end;

end;

procedure TfrmObjectInspector.cmpObjectInspectorGetValuesList(
  Sender: TObject; TheIndex: Integer; const Strings: TStrings);
var
  ThisDataSource: String;
begin
  with cmpObjectInspector do
  begin
    if Assigned(Properties[TheIndex]) then
    begin
      if (Properties[TheIndex].Name='DataField') then
        begin
          Strings.Text:=GetFieldList;
        end;
      if (Properties[TheIndex].Name='LinkedDataKeyField') then
        begin
          Strings.Text:=GetFieldList;
        end;
      if (Properties[TheIndex].Name='DataKeyField') then
        begin
          Strings.Text:=GetFieldList('DATAKEYFIELD');
        end;
      if (Properties[TheIndex].Name='CheckDefault') then
        begin
          Strings.Text:=GetDefaultList;
        end;
    end;
  end;
end;

procedure TfrmObjectInspector.cmpObjectInspectorSetValue(Sender: TObject;
  TheIndex: Integer; var Value: string; var EnableDefault: Boolean);
  var P: TProperty;
      Name: String;
begin
  try   // Set up exception loop to catch errors
    with cmpObjectInspector do
    begin
      if Assigned(Properties[TheIndex]) then
      begin
        if (Properties[TheIndex].Name='DataSource') or (Properties[TheIndex].Name='LinkedDataSource') then
          if uppercase(Value) <> uppercase(FLastDataSource) then
            ClearDataFields;

        if (Properties[TheIndex].Name='DataField') or (Properties[TheIndex].Name='LinkedDataField')then
        begin
          if not CheckField(Value) then
              raise exception.Create('Field Name ' + Value + ' does not exist');
          try
            P := Properties[TheIndex];
            if Assigned(P) then P.AsString:=Value; //Try to assign value to force error if not valid datafield
          except
          on e: Exception do
          begin
            ShowMessage('Field Name ' + Value + ' does not exist');
            // Clear typed value after error
            Value := '';
          end;
        end;
        end;
      end;
    end;
  except
  on e: Exception do
  begin
    ShowMessage(e.Message);
    EnableDefault := False;
  end;

  end;
end;

function TfrmObjectInspector.GetFieldList(const PropertyName: String=''): String;
var WorkingDataSource: TDataSource;
    WorkingDataSet :TDataSet;
    WorkingFieldList: TFieldList;
    retStr, BaseName: String;
    P,D,T: TProperty;
    I: Integer;
    AlreadyChecked, HasFilterStatement: Boolean;

begin
  RetStr := '';
  with TPropertyList.Create(nil) do
  try
    Instance:=cmpObjectInspector.Instance;
    BaseName := Instance.ClassName;
    Root:=cmpObjectInspector.Root;
    // Check for a FilterStatement
    P:=FindProperty('FilterStatement');
    if not assigned(P) then HasFilterStatement := False
    else HasFilterStatement := ((P.AsObject as TStrings).Text <> '');
    P:=FindProperty('LinkedDataSource');
    if P = nil then P:=FindProperty('DataSource');
    if P = nil then exit;
    if P.AsObject = nil then exit;
    WorkingDataSource := P.AsObject as TDataSource;
    I:= DataSources.IndexOf(WorkingDataSource.Name);
    if Datasources.Objects[I] is TStringList then
      Result := (DataSources.Objects[I] as TStringList).Text;
    Exit;

    Instance := WorkingDataSource;
    Root := WorkingDataSource;
    D:= FindProperty('DataSet');
    WorkingDataSet := D.AsObject as TDataSet;
    Instance := WorkingDataSet;
    Root := WorkingDataSet;
  finally
    Free;
  end;
  Result := '';
  if assigned(WorkingDataSet) then
  begin
    with WorkingDataSet do
    begin
//      Active := True;
      // the following section checks for which fields to load by type
      for I  := 0 to FieldList.Count - 1 do
      begin
        AlreadyChecked := False;
        if uppercase(BaseName) = 'TCBSCTGRID' then
        begin
          AlreadyChecked := True;
          if (FieldList[I].DataType = ftMemo) or
             (FieldList[I].DataType = ftBlob) then
            retStr := retStr + FieldList[I].FullName+#13#10;
        end;

        if (uppercase(BaseName) = 'TCBSDBGRID')
          and (PropertyName = 'DATAKEYFIELD') then
        begin
          AlreadyChecked := True;

          if (pos('UNIQUE',uppercase(FieldList[I].FullName))>0)
              and HasFilterStatement  then
            retStr := retStr + FieldList[I].FullName+#13#10;
        end;

        if uppercase(BaseName) = 'TCBSDBCHECKBOX' then
        begin
          AlreadyChecked := True;
          if (FieldList[I].DataType = ftBoolean) then
            retStr := retStr + FieldList[I].FullName+#13#10;
        end;

        if not AlreadyChecked then
          retStr := retStr + FieldList[I].FullName+#13#10;
      end;
      Result := retstr;
//      Active := False;
    end;
  end;
end;




function TfrmObjectInspector.GetSourceList(const PropertyName: String): String;
begin

end;

procedure TfrmObjectInspector.SetDataSources(const Value: TStringList);
begin
  FDataSources := Value;
end;

procedure TfrmObjectInspector.SetLastDataSource(const Value: String);
begin
  FLastDataSource := Value;
end;

function TScriptPropertyEditor.Execute: Boolean;
var
  OldValue: string;
begin
  with Prop do
  begin
    OldValue:=AsString;
    AsString:=InputBox((Instance as TComponent).Name,Name,OldValue);
    Result:=AsString<>OldValue;
  end;
end;

procedure TfrmObjectInspector.cmpObjectInspectorFilter(Sender: TObject;
  Prop: TProperty; var Result: Boolean);
  var OKList: TShowEventSet;
      ThisEvent: TShowEvent;
      P: TProperty;
      PropEvent: TSmartEvents;
begin
  if Assigned(ExcludedProperties) then
    Result := Result and (ExcludedProperties.IndexOf(Prop.Name)<0);
  if Assigned(Prop.OwnerProperty) then
  P := Prop.OwnerProperty;
  if P.Name = 'SmartEvents' then
  begin
    PropEvent := P.AsObject as TSmartEvents;
    OKlist := PropEvent.ShowEvents;
    if Assigned(P) then
    begin
      if Prop.Name = 'CBSClick' then ThisEvent := seClick;
      if Prop.Name = 'CBSDblClick' then ThisEvent := seDblClick;
      if Prop.Name = 'CBSDropDown' then ThisEvent := seDropDown;
      if Prop.Name = 'CBSExit' then ThisEvent := seExit;
      if Prop.Name = 'CBSEnter' then ThisEvent := seEnter;
      if Prop.Name = 'CBSColumnClick' then ThisEvent := seColumnClick;
      if Prop.Name = 'CBSGridLoad' then ThisEvent := seGridLoad;
      Result := (Prop.Name='SmartEvents') or (ThisEvent in OKList);
    end;
  end;
  if Prop.Name = 'DataKeyField' then 
  begin
    if Prop.AsString = '' then
      with TPropertyList.Create(nil) do
      try
        Instance:=cmpObjectInspector.Instance;
        Root:=cmpObjectInspector.Root;
        P:=FindProperty('FilterStatement');
        if assigned(P) then
           Result := ((P.AsObject as TStrings).Text <> '');
      finally
        Free;
      end;
  end;
end;

procedure TfrmObjectInspector.FormCreate(Sender: TObject);
begin
  // used to filter out properties we don't want to see
  ExcludedProperties := TStringList.Create;
  FDataSources := TStringList.Create;
  if FileExists('ExcludedProperty.prp') then
    ExcludedProperties.LoadFromFile('ExcludedProperty.prp')
  else
  begin
    ExcludedProperties.Add('DragCursor');
    ExcludedProperties.Add('Enabled');
  end;
  // used to hold the properties available for linking between in print for default checking
  DefaultFields:= TStringList.Create;
  DefaultFields.Sorted := True;
end;

procedure TfrmObjectInspector.FormDestroy(Sender: TObject);
begin
  ExcludedProperties.Free;
  DefaultFields.Free;
  FDataSources.Free;
end;

function TfrmObjectInspector.GetDataInformation(var DataSource,
  DataField: String): Boolean;
var WorkingDataSource: TDataSource;
    BaseName: String;
    P: TProperty;
    I: Integer;
begin
  Result := False;
  with TPropertyList.Create(nil) do
  try
    Instance:=cmpObjectInspector.Instance;
    BaseName := Instance.ClassName;
    Root:=cmpObjectInspector.Root;
    // Check for datasources
    P:=FindProperty('LinkedDataSource');
    if P = nil then P:=FindProperty('DataSource');
    if P = nil then
      DataSource := ''
    else
    begin
      if P.AsObject=nil then
        DataSource := ''
      else
      begin
        //we have a datasource
        DataSource := (P.AsObject as TDataSource).Name;
        Result := True;
      end;
    end;
    // Check for datafields
    P:=FindProperty('LinkedDataField');
    if P = nil then P:=FindProperty('DataField');
    if P = nil then
      Datafield := ''
    else
    begin
      //we have a datafield
      Datafield := P.AsString;
      Result := True;
    end;

  finally
    Free;
  end;
end;

function TfrmObjectInspector.GetDefaultList(const PropertyName: String=''): String;
var tmpDataSource: String;
    retStr: String;
    P,D,T: TProperty;
    BaseForm: TFrmDesign;
    x: Integer;
begin
  if cmbObjectInspector.Root is TFrmDesign then
  begin
    BaseForm := cmbObjectInspector.Root as TFrmDesign;
    for x:= 0 to BaseForm.ControlCount -1 do
    if Supports(BaseForm.Controls[x], IDefaultCheck) then
      DefaultFields.Add(BaseForm.Controls[x].Name);
  end;
  Result := DefaultFields.Text;
end;

end.
