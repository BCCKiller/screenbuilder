object UpdateScreenBuilderForm: TUpdateScreenBuilderForm
  Left = 0
  Top = 0
  Caption = 'Update ScreenBuilder'
  ClientHeight = 45
  ClientWidth = 274
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 26
    Width = 274
    Height = 19
    Panels = <>
  end
  object UpdateConnection: TAdsConnection
    AliasName = 'CBSTools'
    AdsServerTypes = [stADS_REMOTE, stADS_LOCAL]
    LoginPrompt = False
    StoreConnected = False
    Compression = ccAdsCompressionNotSet
    Left = 200
    Top = 16
  end
  object ExamStateTable: TAdsTable
    DatabaseName = 'UpdateConnection'
    StoreActive = True
    AdsConnection = UpdateConnection
    TableName = 'examstate.adt'
    Left = 168
    Top = 16
  end
  object TabMasterTable: TAdsTable
    DatabaseName = 'UpdateConnection'
    StoreActive = False
    AdsConnection = UpdateConnection
    TableName = 'tabmaster.adt'
    Left = 128
    Top = 16
  end
  object UpdateQuery: TAdsQuery
    DatabaseName = 'UpdateConnection'
    StoreActive = False
    Left = 32
    Top = 8
    ParamData = <>
  end
  object LayoutMasterTable: TAdsTable
    DatabaseName = 'UpdateConnection'
    StoreActive = True
    AdsConnection = UpdateConnection
    TableName = 'LayoutMaster.adt'
    Left = 96
    Top = 16
  end
  object SelectQuery: TAdsQuery
    DatabaseName = 'UpdateConnection'
    StoreActive = False
    Left = 64
    Top = 8
    ParamData = <>
  end
end
