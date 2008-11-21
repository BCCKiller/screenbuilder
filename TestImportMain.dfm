object Form1: TForm1
  Left = 0
  Top = 0
  Width = 666
  Height = 320
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MyPageControl: TPageControl
    Left = 0
    Top = 56
    Width = 657
    Height = 225
    TabOrder = 0
  end
  object Button1: TButton
    Left = 24
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object AdsTable1: TAdsTable
    DatabaseName = 'AdsConnection1'
    StoreActive = True
    AdsConnection = AdsConnection1
    TableName = 'EXAM.DBF'
    TableType = ttAdsCDX
    Left = 280
  end
  object S_EXAM: TDataSource
    DataSet = AdsTable1
    Left = 312
  end
  object AdsConnection1: TAdsConnection
    AliasName = 'CBSFiles'
    IsConnected = False
    AdsServerTypes = [stADS_REMOTE, stADS_LOCAL]
    LoginPrompt = True
    Compression = ccAdsCompressionNotSet
    Left = 208
  end
end
