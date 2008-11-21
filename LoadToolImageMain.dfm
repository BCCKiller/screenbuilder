object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Update Image Table'
  ClientHeight = 476
  ClientWidth = 419
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Tool: TLabel
    Left = 8
    Top = 160
    Width = 48
    Height = 13
    Caption = 'Tool Label'
  end
  object Label1: TLabel
    Left = 8
    Top = 206
    Width = 145
    Height = 13
    Caption = 'Tool Text to send back to field'
  end
  object Label2: TLabel
    Left = 263
    Top = 160
    Width = 46
    Height = 13
    Caption = 'ICD Code'
  end
  object Label3: TLabel
    Left = 263
    Top = 206
    Width = 108
    Height = 13
    Caption = 'Field to send it back to'
  end
  object DBGrid1: TDBGrid
    Left = -1
    Top = 0
    Width = 413
    Height = 120
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ToolLabel'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ToolICD'
        Visible = True
      end>
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 179
    Width = 249
    Height = 21
    DataField = 'ToolLabel'
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 126
    Width = 232
    Height = 25
    DataSource = DataSource1
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel]
    TabOrder = 2
  end
  object DBMemo1: TDBMemo
    Left = 8
    Top = 225
    Width = 249
    Height = 217
    DataField = 'ToolTextForField'
    DataSource = DataSource1
    TabOrder = 3
  end
  object JvDBImage1: TJvDBImage
    Left = 263
    Top = 296
    Width = 121
    Height = 113
    DataField = 'ToolImage'
    DataSource = DataSource1
    TabOrder = 4
  end
  object AddButton: TButton
    Left = 263
    Top = 252
    Width = 75
    Height = 25
    Caption = 'Add Image'
    TabOrder = 5
    OnClick = AddButtonClick
  end
  object DBEdit2: TDBEdit
    Left = 263
    Top = 179
    Width = 74
    Height = 21
    DataField = 'ToolICD'
    DataSource = DataSource1
    TabOrder = 6
  end
  object DBEdit3: TDBEdit
    Left = 263
    Top = 225
    Width = 138
    Height = 21
    DataField = 'ToolFieldToUpdate'
    DataSource = DataSource1
    TabOrder = 7
  end
  object DataSource1: TDataSource
    DataSet = AdsTable1
    Left = 280
    Top = 40
  end
  object AdsConnection1: TAdsConnection
    AliasName = 'CBSTools'
    IsConnected = True
    AdsServerTypes = [stADS_REMOTE, stADS_LOCAL]
    LoginPrompt = True
    Compression = ccAdsCompressionNotSet
    Left = 280
    Top = 80
  end
  object AdsTable1: TAdsTable
    Active = True
    DatabaseName = 'AdsConnection1'
    IndexDefs = <
      item
        Name = 'TOOLIMAGEID'
        Fields = 'TOOLIMAGEID'
      end
      item
        Name = 'TOOLLABEL'
        Fields = 'TOOLLABEL'
      end>
    IndexName = 'TOOLLABEL'
    StoreActive = True
    AdsConnection = AdsConnection1
    AdsTableOptions.AdsIndexPageSize = 512
    FieldDefs = <
      item
        Name = 'ToolImageID'
        DataType = ftInteger
      end
      item
        Name = 'ToolImage'
        DataType = ftBlob
        Size = 1
      end
      item
        Name = 'ToolLabel'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ToolICD'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'ToolFieldToUpdate'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ToolTextForField'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'ToolAction'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ToolColor'
        DataType = ftString
        Size = 15
      end>
    StoreDefs = True
    TableName = 'ToolMaster.adt'
    Left = 280
    Top = 120
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 320
    Top = 128
  end
end
