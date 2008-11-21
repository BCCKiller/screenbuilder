object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Clean up Tabs'
  ClientHeight = 132
  ClientWidth = 231
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 40
    Top = 32
    Width = 153
    Height = 65
    Caption = 'Clean up all tabs'
    TabOrder = 0
    OnClick = Button1Click
  end
  object AdsConnection1: TAdsConnection
    AliasName = 'CBSTools'
    IsConnected = True
    AdsServerTypes = [stADS_REMOTE, stADS_LOCAL]
    LoginPrompt = True
    Compression = ccAdsCompressionNotSet
    Left = 200
    Top = 16
  end
  object ExamStateTable: TAdsTable
    DatabaseName = 'AdsConnection1'
    StoreActive = True
    AdsConnection = AdsConnection1
    TableName = 'examstate.adt'
    Left = 200
    Top = 56
  end
  object TabMasterTable: TAdsTable
    DatabaseName = 'AdsConnection1'
    StoreActive = True
    AdsConnection = AdsConnection1
    TableName = 'tabmaster.adt'
    Left = 200
    Top = 96
  end
end
