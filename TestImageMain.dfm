object Form1: TForm1
  Left = 260
  Top = 329
  Width = 534
  Height = 225
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 424
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 432
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 1
    OnClick = Button2Click
  end
  object AdsConnection1: TAdsConnection
    AliasName = 'CBSTools'
    IsConnected = False
    AdsServerTypes = []
    LoginPrompt = True
    Compression = ccAdsCompressionNotSet
    Left = 56
    Top = 32
  end
end
