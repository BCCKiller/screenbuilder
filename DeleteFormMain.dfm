object DeleteForm: TDeleteForm
  Left = 0
  Top = 0
  Caption = 'Delete Layout'
  ClientHeight = 362
  ClientWidth = 364
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object CancelButton: TButton
    Left = 248
    Top = 32
    Width = 108
    Height = 73
    Caption = 'Cancel'
    TabOrder = 0
    OnClick = CancelButtonClick
  end
  object DeleteButton: TButton
    Left = 248
    Top = 200
    Width = 108
    Height = 25
    Caption = 'Delete all checked'
    TabOrder = 1
    OnClick = DeleteButtonClick
  end
  object DeleteCheckList: TJvCheckListBox
    Left = 0
    Top = 0
    Width = 242
    Height = 354
    ItemHeight = 13
    TabOrder = 2
  end
  object DeleteConnection: TAdsConnection
    AliasName = 'CBSTools'
    IsConnected = False
    AdsServerTypes = [stADS_REMOTE, stADS_LOCAL]
    LoginPrompt = True
    Compression = ccAdsCompressionNotSet
    Left = 256
    Top = 248
  end
  object DeleteQuery: TAdsQuery
    DatabaseName = 'DeleteConnection'
    StoreActive = True
    Left = 296
    Top = 248
    ParamData = <>
  end
  object Delete2Query: TAdsQuery
    DatabaseName = 'DeleteConnection'
    StoreActive = True
    Left = 296
    Top = 288
    ParamData = <>
  end
end
