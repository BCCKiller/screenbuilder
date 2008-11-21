object PropertyChangeForm: TPropertyChangeForm
  Left = 0
  Top = 0
  Width = 162
  Height = 210
  BorderIcons = [biMinimize, biMaximize]
  Caption = 'Property Changer'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    154
    176)
  PixelsPerInch = 96
  TextHeight = 13
  object PropertyNameEdit: TEdit
    Left = 8
    Top = 112
    Width = 129
    Height = 21
    TabOrder = 0
  end
  object ActionGroup: TRadioGroup
    Left = 8
    Top = 8
    Width = 129
    Height = 89
    Caption = 'Action to take'
    ItemIndex = 0
    Items.Strings = (
      'Delete'
      'Edit Value'
      'Change Name')
    TabOrder = 1
  end
  object GoButton: TButton
    Left = 8
    Top = 144
    Width = 57
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Go'
    TabOrder = 2
    OnClick = GoButtonClick
  end
  object CancelButton: TButton
    Left = 88
    Top = 144
    Width = 57
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = CancelButtonClick
  end
  object AdsConnection1: TAdsConnection
    AliasName = 'CBSTools'
    IsConnected = True
    AdsServerTypes = [stADS_REMOTE, stADS_LOCAL]
    LoginPrompt = True
    Compression = ccAdsCompressionNotSet
    Left = 112
    Top = 24
  end
  object TabTable: TAdsTable
    DatabaseName = 'AdsConnection1'
    StoreActive = True
    AdsConnection = AdsConnection1
    TableName = 'TabMaster.adt'
    Left = 112
    Top = 64
  end
end
