object Form1: TForm1
  Left = 0
  Top = 0
  Width = 430
  Height = 319
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 80
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Create Tree'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 296
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Print'
    TabOrder = 1
    OnClick = Button2Click
  end
  object TreeView1: TTreeView
    Left = 80
    Top = 8
    Width = 305
    Height = 217
    Indent = 19
    TabOrder = 2
  end
  object Button3: TButton
    Left = 184
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Create List'
    TabOrder = 3
    OnClick = Button3Click
  end
  object gtDocSettings1: TgtDocSettings
    BackgroundImageDisplayType = dtCenter
    MeasurementUnit = muPixels
    Page.Width = 793.699200000000000000
    Page.Height = 1122.518400000000000000
    Page.BinNumber = 0
    Left = 72
    Top = 40
  end
  object gtPDFEngine1: TgtPDFEngine
    FileExtension = 'pdf'
    FileDescription = 'Adobe PDF Files'
    InputXRes = 96
    InputYRes = 96
    ReferencePoint = rpBand
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ImageSettings.SourceDPI = 96
    ImageSettings.OutputImageFormat = ifBMP
    Page.Width = 8.267700000000000000
    Page.Height = 11.692900000000000000
    Page.BinNumber = 0
    FontEncoding = feWinAnsiEncoding
    Left = 24
    Top = 40
  end
  object AdsConnection1: TAdsConnection
    AliasName = 'CBSTools'
    IsConnected = False
    AdsServerTypes = [stADS_REMOTE, stADS_LOCAL]
    LoginPrompt = False
    Compression = ccAdsCompressionNotSet
    Left = 264
    Top = 40
  end
  object AdsQuery1: TAdsQuery
    DatabaseName = 'AdsConnection1'
    StoreActive = True
    Left = 264
    Top = 104
    ParamData = <>
  end
end
