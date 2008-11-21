object DisplayScreen: TDisplayScreen
  Left = 177
  Top = 152
  Caption = 'Display Form'
  ClientHeight = 646
  ClientWidth = 942
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LayoutPageControl: TPageControl
    Left = 0
    Top = 86
    Width = 942
    Height = 560
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    OnChange = LayoutPageControlChange
  end
  object DBNavigator1: TDBNavigator
    Left = 250
    Top = 8
    Width = 240
    Height = 25
    TabOrder = 1
  end
  object Button1: TButton
    Left = 8
    Top = 16
    Width = 49
    Height = 25
    Caption = 'Refresh'
    TabOrder = 2
  end
  object DBEdit1: TDBEdit
    Left = 496
    Top = 8
    Width = 121
    Height = 21
    DataField = 'METHOD'
    TabOrder = 3
  end
  object Button2: TButton
    Left = 623
    Top = 6
    Width = 75
    Height = 25
    Caption = 'Compile Exam'
    TabOrder = 4
    OnClick = Button2Click
  end
  object DBEdit2: TDBEdit
    Left = 72
    Top = 8
    Width = 121
    Height = 21
    DataField = 'FIRST'
    TabOrder = 5
  end
  object DBEdit3: TDBEdit
    Left = 72
    Top = 59
    Width = 49
    Height = 21
    DataField = 'PATUNIQUE'
    TabOrder = 6
  end
  object DBEdit4: TDBEdit
    Left = 72
    Top = 32
    Width = 121
    Height = 21
    DataField = 'LAST'
    TabOrder = 7
  end
  object MainMenu1: TMainMenu
    Left = 704
    Top = 8
    object LoadForm1: TMenuItem
      Caption = 'Load Form'
      OnClick = LoadForm1Click
    end
    object Print1: TMenuItem
      Caption = 'Print'
      object PrintForm1: TMenuItem
        Caption = 'Print Form'
        OnClick = PrintForm1Click
      end
      object PrintfromDLL1: TMenuItem
        Caption = 'Print from DLL'
        OnClick = PrintfromDLL1Click
      end
    end
    object Prev: TMenuItem
      Caption = '&Prev'
      OnClick = PrevClick
    end
    object Next1: TMenuItem
      Caption = '&Next'
      OnClick = Next1Click
    end
  end
  object FilesConnection: TAdsConnection
    AliasName = 'CBSFiles'
    IsConnected = True
    AdsServerTypes = [stADS_REMOTE, stADS_LOCAL]
    LoginPrompt = True
    Compression = ccAdsCompressionNotSet
    Left = 376
    Top = 40
  end
  object ToolsConnection: TAdsConnection
    AliasName = 'CBSTools'
    IsConnected = True
    AdsServerTypes = [stADS_REMOTE, stADS_LOCAL]
    LoginPrompt = True
    Compression = ccAdsCompressionNotSet
    Left = 408
    Top = 40
  end
  object PopupMenu1: TPopupMenu
    Left = 720
    Top = 40
    object One1: TMenuItem
      Caption = 'One'
    end
    object wo1: TMenuItem
      Caption = 'Two'
    end
    object hree1: TMenuItem
      Caption = 'Three'
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 560
    Top = 40
  end
  object ActionList1: TActionList
    Left = 528
    Top = 40
  end
end
