object frmLayout: TfrmLayout
  Left = 0
  Top = 0
  Caption = 'Compulink Screen Builder'
  ClientHeight = 746
  ClientWidth = 991
  Color = clNavy
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PopupMode = pmAuto
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnPaint = FormPaint
  OnShow = FormShow
  DesignSize = (
    991
    746)
  PixelsPerInch = 96
  TextHeight = 13
  object HeaderPanel: TPanel
    Left = 0
    Top = 0
    Width = 985
    Height = 77
    Anchors = [akLeft, akTop, akRight]
    AutoSize = True
    BevelOuter = bvNone
    BorderWidth = 3
    BorderStyle = bsSingle
    Color = clMoneyGreen
    Padding.Left = 3
    Padding.Top = 3
    Padding.Right = 3
    Padding.Bottom = 3
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 550
      Top = 6
      Width = 63
      Height = 13
      Caption = 'Layout Name'
    end
    object Label2: TLabel
      Left = 662
      Top = 6
      Width = 50
      Height = 13
      Caption = 'Tab Name'
    end
    object Label3: TLabel
      Left = 686
      Top = 54
      Width = 43
      Height = 13
      Caption = 'Tab Text'
    end
    object LayoutNameEdit: TEdit
      Left = 550
      Top = 22
      Width = 105
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 0
    end
    object TabNameEdit: TEdit
      Left = 662
      Top = 22
      Width = 153
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 1
    end
    object TabTextEdit: TEdit
      Left = 734
      Top = 46
      Width = 81
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 2
      OnChange = TabTextEditChange
      OnExit = TabTextEditExit
    end
    object TabColumnsCheck: TCheckBox
      Left = 550
      Top = 50
      Width = 129
      Height = 17
      Caption = 'Use 2 Columns at print'
      TabOrder = 3
      OnClick = TabColumnsCheckClick
    end
    object TabDescriptionMemo: TMemo
      Left = 822
      Top = 10
      Width = 153
      Height = 57
      TabStop = False
      TabOrder = 4
    end
    object ToolPanel: TPanel
      Left = 6
      Top = 10
      Width = 541
      Height = 57
      TabOrder = 5
      object sbtOpen: TSpeedButton
        Tag = 1
        Left = 0
        Top = 0
        Width = 28
        Height = 28
        Hint = 'Load layout'
        Flat = True
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777770000007000000000000077770000007788888888888077770000007F77
          777777778077770000007F77777777778077770000007F799777777780777700
          00007FFFFFFFFFFF707777000000777777777777777777000000770077777777
          7777770000007700777777777777770000007700777777000000000000007700
          770777FFFFFFF00000007700870077F44444F00000007780000007FFFFFFF000
          00007777770077F44444F00000007777770777FFFFFFF00000007777777777F4
          44F8870000007777777777FFFFF877000000}
        OnClick = sbtOpenClick
      end
      object sbtSave: TSpeedButton
        Tag = 2
        Left = 0
        Top = 28
        Width = 28
        Height = 28
        Hint = 'Save layout'
        Flat = True
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777770000007777700000000000000000007777778888888888800000007777
          7F77777777778000000077777F77777777778000000077777F79977777778000
          000077777FFFFFFFFFFF70000000777777777777777777000000777777777777
          7707770000007777777777777000770000007000000007770000070000007FFF
          FFFF07777707770000007F44444F07777707770000007FFFFFFF077778077700
          00007F44444F07000007770000007FFFFFFF07000087770000007F444F887777
          7777770000007FFFFF877777777777000000}
        OnClick = sbtSaveClick
      end
      object sbtAlignToGrid: TSpeedButton
        Tag = 1
        Left = 112
        Top = 0
        Width = 28
        Height = 28
        Hint = 'Align to grid'
        Enabled = False
        Flat = True
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777770000007777777777777777770000007707777777777770770000007770
          7707777077077700000077770007777000777700000077770007777000777700
          0000777000077770000777000000777777777777777777000000777777770077
          7777770000007777777700777777770000007777777777777777770000007770
          0007777000077700000077770007777000777700000077770007777000777700
          0000777077077770770777000000770777777777777077000000777777777777
          777777000000777777777777777777000000}
        OnClick = eveAlign
      end
      object sbtLock: TSpeedButton
        Tag = 2
        Left = 84
        Top = 28
        Width = 28
        Height = 28
        Hint = 'Lock/unlock'
        AllowAllUp = True
        GroupIndex = 1
        Enabled = False
        Flat = True
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777770000007777777777777777770000007777777777777777770000007777
          7777777777777700000077777777777777777700000077777777777777777700
          0000778000877777780877000000780BBB07777770B07700000070FB0B000000
          00B08700000070FB0BBFBFBFFBFB0700000070FB0B000000000087000000780F
          FF07777777777700000077800087777777777700000077777777777777777700
          0000777777777777777777000000777777777777777777000000777777777777
          777777000000777777777777777777000000}
        OnClick = eveLock
      end
      object sbtCut: TSpeedButton
        Tag = 1
        Left = 28
        Top = 0
        Width = 28
        Height = 28
        Hint = 'Cut (Shift+Del)'
        Enabled = False
        Flat = True
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777770000007777777777777777770000007777700777777777770000007777
          0770770077777700000077770770707707777700000077770770707707777700
          0000777770007077077777000000777777707000777777000000777777700077
          7777770000007777777707777777770000007777777000777777770000007777
          7770707777777700000077777700700777777700000077777707770777777700
          0000777777077707777777000000777777077707777777000000777777777777
          777777000000777777777777777777000000}
        OnClick = eveCut
      end
      object sbtCopy: TSpeedButton
        Tag = 2
        Left = 56
        Top = 0
        Width = 28
        Height = 28
        Hint = 'Copy (Ctrl+Ins)'
        Enabled = False
        Flat = True
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777770000007777777777777777770000007777777777777777770000007777
          7770000000007700000077777770FFFFFFF07700000077777770F00000F07700
          000070000000FFFFFFF07700000070FFFFF0F00000F07700000070F00000FFFF
          FFF07700000070FFFFF0F00F00007700000070F00000FFFF0F077700000070FF
          FFF0FFFF00777700000070F00F00000007777700000070FFFF0F077777777700
          000070FFFF007777777777000000700000077777777777000000777777777777
          777777000000777777777777777777000000}
        OnClick = eveCopy
      end
      object sbtPaste: TSpeedButton
        Tag = 1
        Left = 28
        Top = 28
        Width = 28
        Height = 28
        Hint = 'Paste (Shift+Ins)'
        Flat = True
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777770000007777777777777777770000007777777444444444470000007700
          0004FFFFFFFF4700000070838384F000000F4700000070383834FFFFFFFF4700
          000070838384F000F4444700000070383834FFFFF4F47700000070838384FFFF
          F447770000007038383444444407770000007083838383838307770000007038
          00000000880777000000708807777770830777000000703830B00B0838077700
          00007700000BB000007777000000777777000077777777000000777777777777
          777777000000777777777777777777000000}
        OnClick = evePaste
      end
      object sbtDelete: TSpeedButton
        Tag = 2
        Left = 56
        Top = 28
        Width = 28
        Height = 28
        Hint = 'Delete (Del)'
        Enabled = False
        Flat = True
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777770000007777777777777777770000007777777777777777770000007770
          7777777777077700000077000777777777777700000077000077777770777700
          0000777000777777077777000000777700077770077777000000777770007700
          7777770000007777770000077777770000007777777000777777770000007777
          7700000777777700000077777000770077777700000077700007777007777700
          0000770000777777007777000000770007777777770777000000777777777777
          777777000000777777777777777777000000}
        OnClick = eveDelete
      end
      object sbtSetup: TSpeedButton
        Tag = 2
        Left = 168
        Top = 28
        Width = 28
        Height = 28
        Hint = 'Properties'
        Flat = True
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777770000007777777000007777770000007777770BF3330777770000007770
          000FB300000777000000773BF00BF0BF333077000000773FBFBFBBFB33307700
          00007780FB330BB03007770000007700B3B330F000007700000073FBF30B30BF
          B3330700000073BFB30F30FBF333070000007733F3F330B00000770000007703
          BF330BF0300777000000773BFBFBFBBF333077000000773FB00FB0FB33307700
          00007773303BF3000007770000007777773FB333077777000000777777733000
          777777000000777777777777777777000000}
        OnClick = sbtSetupClick
      end
      object sbtAlign: TSpeedButton
        Tag = 2
        Left = 140
        Top = 0
        Width = 28
        Height = 28
        Hint = 'Align'
        Enabled = False
        Flat = True
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777770000007777777777777777770000007777777777777777770000007777
          7777777777777700000077777777777077707700000077777777777007707700
          0000770000000000008077000000777777777770077077000000777777777770
          7770770000007707770777777777770000007707700777777777770000007708
          0000000000007700000077077007777777777700000077077707777777777700
          0000777777777777777777000000777777777777777777000000777777777777
          777777000000777777777777777777000000}
        OnClick = sbtAlignClick
      end
      object sbtSize: TSpeedButton
        Tag = 2
        Left = 140
        Top = 28
        Width = 28
        Height = 28
        Hint = 'Size'
        Enabled = False
        Flat = True
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777770000007777777777777777770000007777777777777777770000007070
          7070707070707700000077777777777777777700000070777777774444707700
          0000777777777774447777000000707777777744447077000000777777777744
          74777700000070000000007777707700000070FFFFFFF07777777700000070FF
          FFFFF07777707700000070FFFFFFF07777777700000070FFFFFFF07777707700
          000070FFFFFFF077777777000000700000000070707077000000777777777777
          777777000000777777777777777777000000}
        OnClick = sbtSizeClick
      end
      object sbtAlignPalette: TSpeedButton
        Tag = 1
        Left = 112
        Top = 28
        Width = 28
        Height = 28
        Hint = 'Show alignment palette'
        Flat = True
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777770000007777777777777777770000007700000000000007770000007707
          7777077777077700000077077777070707077700000077070007070707077700
          0000770770770707070777000000770777770777770777000000770000000000
          0007770000007707777707777707770000007707707707000707770000007707
          0077077777077700000077077077070007077700000077077777077777077700
          000077044444444444077700000077044444444F4F0777000000770000000000
          000777000000777777777777777777000000}
        OnClick = eveAlignPalette
      end
      object sbtTabOrder: TSpeedButton
        Tag = 1
        Left = 168
        Top = 0
        Width = 28
        Height = 28
        Hint = 'Tab order'
        Flat = True
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333380000000000333330F7B7B7B7B0333330FB7B000B70333800F7B7B0B
          7B03330F0FB7B707B703330F0F7B700B7B03800F0FB7FFFFFF030F0F0FFF0000
          00830F0FB000B7B703330F0FB7FFFFFF03330F0FFF00000083330F70007B7B03
          33330FB7FFFFFF0333330FFF0000008333333000333333333333}
        OnClick = eveTabOrder
      end
      object sbtSelectAll: TSpeedButton
        Tag = 2
        Left = 84
        Top = 0
        Width = 28
        Height = 28
        Hint = 'Select All'
        Flat = True
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777770000007777777777777777770000007777777700000000770000007777
          77770FFFFFF077000000777770000FFFFFF077000000777770FF0FFFFFF07700
          0000770000FF0FFFFFF077000000770FF0FF0FFFFFF077000000770FF0FF0FFF
          FFF077000000770FF0FF0FFFFFF077000000770FF0FF0FFFFFF077000000770F
          F0FF0000000077000000770FF0FFFFFF077777000000770FF000000007777700
          0000770FFFFFF077777777000000770000000077777777000000777777777777
          777777000000777777777777777777000000}
        OnClick = eveSelectAll
      end
      object sbtObjectInspector: TSpeedButton
        Tag = 2
        Left = 196
        Top = 28
        Width = 28
        Height = 28
        Hint = 'Object Inspector'
        Flat = True
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777770000007777778444877777770000007777774444477777770000007777
          7744444999977700000077777744444999777700000077777784449999000700
          000077777780008997F7070000007777780FFF099F7F07000000777770FFFFF0
          F7F707000000777770FFFFF07F7F070000007777700FFFF08888870000007777
          0900FF0877777700000077709F0000877777770000007709F007777777777700
          0000709F1077777777777700000070F107777777777777000000770077777777
          777777000000777777777777777777000000}
        OnClick = sbtObjectInspectorClick
      end
      object sbtSource: TSpeedButton
        Tag = 2
        Left = 196
        Top = 0
        Width = 28
        Height = 28
        Hint = 'Scripter Source Editor'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333FF3333333333333744333333333333F773333333333337
          44473333333333F777F3333333333744444333333333F7733733333333374444
          4433333333F77333733333333744444447333333F7733337F333333744444444
          433333F77333333733333744444444443333377FFFFFFF7FFFFF999999999999
          9999733777777777777333CCCCCCCCCC33333773FF333373F3333333CCCCCCCC
          C333333773FF3337F333333333CCCCCCC33333333773FF373F3333333333CCCC
          CC333333333773FF73F33333333333CCCCC3333333333773F7F3333333333333
          CCC333333333333777FF33333333333333CC3333333333333773}
        NumGlyphs = 2
        OnClick = sbtSourceClick
      end
      object sbtSortTab: TSpeedButton
        Tag = 2
        Left = 224
        Top = 0
        Width = 28
        Height = 28
        Hint = 'Sort the Tabs'
        AllowAllUp = True
        GroupIndex = 1
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333FF3333333333333447333333333333377FFF33333333333744473333333
          333337773FF3333333333444447333333333373F773FF3333333334444447333
          33333373F3773FF3333333744444447333333337F333773FF333333444444444
          733333373F3333773FF333334444444444733FFF7FFFFFFF77FF999999999999
          999977777777777733773333CCCCCCCCCC3333337333333F7733333CCCCCCCCC
          33333337F3333F773333333CCCCCCC3333333337333F7733333333CCCCCC3333
          333333733F77333333333CCCCC333333333337FF7733333333333CCC33333333
          33333777333333333333CC333333333333337733333333333333}
        NumGlyphs = 2
        OnClick = sbtSortTabClick
      end
      object sbtAddTab: TSpeedButton
        Tag = 2
        Left = 224
        Top = 28
        Width = 28
        Height = 28
        Hint = 'Add a Tab'
        AllowAllUp = True
        GroupIndex = 1
        Flat = True
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF008888822AAAA2
          2888880000008888822AAAA22888880000008888822AAAA22888880000008888
          822AAAA22888880000008888822AAAA22888880000008888822AAAA228888800
          00002222222AAAA22222220000002222222AAAA2222222000000AAAAAAAAAAAA
          AAAAAA000000AAAAAAAAAAAAAAAAAA000000AAAAAAAAAAAAAAAAAA000000AAAA
          AAAAAAAAAAAAAA0000002222222AAAA22222220000002222222AAAA222222200
          00008888822AAAA22888880000008888822AAAA22888880000008888822AAAA2
          2888880000008888822AAAA2288888000000}
        OnClick = sbtAddTabClick
      end
      object pgcMain: TPageControl
        Left = 256
        Top = 1
        Width = 284
        Height = 55
        Align = alRight
        TabOrder = 0
        TabStop = False
      end
    end
  end
  object LayoutPageControl: TPageControl
    Left = -2
    Top = 83
    Width = 985
    Height = 662
    TabOrder = 1
    OnChange = LayoutPageControlChange
  end
  object FilesConnection: TAdsConnection
    AliasName = 'CBSFiles'
    IsConnected = True
    AdsServerTypes = [stADS_REMOTE, stADS_LOCAL]
    LoginPrompt = False
    Compression = ccAdsCompressionNotSet
    Left = 512
    Top = 56
  end
  object ToolsConnection: TAdsConnection
    AliasName = 'CBSTools'
    IsConnected = True
    AdsServerTypes = [stADS_REMOTE, stADS_LOCAL]
    LoginPrompt = False
    Compression = ccAdsCompressionNotSet
    Left = 480
    Top = 56
  end
  object pmnMain: TPopupMenu
    Left = 260
    Top = 56
    object Align1: TMenuItem
      Caption = 'Align'
      object Tops1: TMenuItem
        Caption = 'Tops'
        ShortCut = 49236
        OnClick = Tops1Click
      end
      object Bottoms1: TMenuItem
        Caption = 'Bottoms'
        ShortCut = 49218
        OnClick = Bottoms1Click
      end
      object Left1: TMenuItem
        Caption = 'Left'
        ShortCut = 49228
        OnClick = Left1Click
      end
      object Right1: TMenuItem
        Caption = 'Right'
        ShortCut = 49234
        OnClick = Right1Click
      end
    end
    object mniAlignToGrid: TMenuItem
      Caption = 'Align to &Grid'
      OnClick = eveAlign
    end
    object mniBringToFront: TMenuItem
      Caption = 'Bring to &Front'
      OnClick = mniBringToFrontClick
    end
    object mniSendToBack: TMenuItem
      Caption = 'Send to &Back'
      OnClick = mniSendToBackClick
    end
    object mniSep1: TMenuItem
      Caption = '-'
    end
    object mniCut: TMenuItem
      Caption = 'Cu&t'
      ShortCut = 8238
      OnClick = eveCut
    end
    object mniCopy: TMenuItem
      Caption = '&Copy'
      ShortCut = 16429
      OnClick = eveCopy
    end
    object mniPaste: TMenuItem
      Caption = '&Paste'
      ShortCut = 8237
      OnClick = evePaste
    end
    object mniDelete: TMenuItem
      Caption = '&Delete'
      ShortCut = 46
      OnClick = eveDelete
    end
    object mniSelectAll: TMenuItem
      Caption = 'Select &All'
      OnClick = eveSelectAll
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object DeleteTab1: TMenuItem
      Caption = 'Delete Tab'
      OnClick = DeleteTab1Click
    end
    object mniSep2: TMenuItem
      Caption = '-'
    end
    object ConverttoPrintLayout1: TMenuItem
      Caption = 'Convert to Print Layout'
      OnClick = ConverttoPrintLayout1Click
    end
  end
  object MainMenu1: TMainMenu
    Left = 288
    Top = 56
    object File1: TMenuItem
      Caption = '&File'
      object Load1: TMenuItem
        Caption = '&Load Layout'
        OnClick = sbtOpenClick
      end
      object NewLayout1: TMenuItem
        Caption = '&New Layout'
        OnClick = NewLayout1Click
      end
      object Save1: TMenuItem
        Caption = '&Save Layout'
        OnClick = sbtSaveClick
      end
      object SaveLayoutAs1: TMenuItem
        Caption = 'Sa&ve Layout As'
        OnClick = SaveLayoutAs1Click
      end
      object RenameCurrentLayout1: TMenuItem
        Caption = '&Rename Current Layout'
        OnClick = RenameCurrentLayout1Click
      end
      object CloseLayout1: TMenuItem
        Caption = 'Close Layout'
        OnClick = NewLayout1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object AddBlankTab1: TMenuItem
        Caption = '&Add Blank Tab'
        OnClick = sbtAddTabClick
      end
      object LoadTab1: TMenuItem
        Caption = 'Load &Tab'
        OnClick = LoadTab1Click
      end
      object SaveCurrentTab1: TMenuItem
        Caption = 'Save &Current Tab'
        OnClick = SaveCurrentTab1Click
      end
      object SaveCurrentTabAs1: TMenuItem
        Caption = 'Sav&e Current Tab As'
        OnClick = SaveCurrentTabAs1Click
      end
      object ChangeCurrentTabText1: TMenuItem
        Caption = 'Change Current Tab Text'
        OnClick = ChangeCurrentTabText1Click
      end
    end
    object Edit1: TMenuItem
      Caption = '&Edit'
      object Cut1: TMenuItem
        Caption = 'C&ut'
        OnClick = eveCut
      end
      object Copy1: TMenuItem
        Caption = '&Copy'
        OnClick = eveCopy
      end
      object Paste1: TMenuItem
        Caption = '&Paste'
        OnClick = evePaste
      end
      object Delete1: TMenuItem
        Caption = '&Delete'
        OnClick = eveDelete
      end
      object SelectAll1: TMenuItem
        Caption = '&Select All'
        OnClick = eveSelectAll
      end
    end
    object ools1: TMenuItem
      Caption = '&Tools'
      object AligntoGrid1: TMenuItem
        Caption = '&Align to Grid'
        OnClick = eveAlign
      end
      object Change1: TMenuItem
        Caption = '&Change Field Tab Order'
        OnClick = eveTabOrder
      end
      object AlignmentPalette1: TMenuItem
        Caption = 'Alignment &Palette'
        OnClick = eveAlignPalette
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object TabLeft: TMenuItem
        Caption = 'Move Tab Left'
        OnClick = moveTab
      end
      object TabRight: TMenuItem
        Caption = 'Move Tab Right'
        OnClick = moveTab
      end
      object RemoveTabs1: TMenuItem
        Caption = '&Remove Tabs from Layout'
        OnClick = RemoveTabs1Click
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object DeleteTabs1: TMenuItem
        Caption = '&Delete Tabs from system'
        OnClick = DeleteTabs1Click
      end
      object DeleteLayout1: TMenuItem
        Caption = 'Delete &Layout from system'
        OnClick = DeleteLayout1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object BringtoFront1: TMenuItem
        Caption = '&Bring to Front'
        OnClick = mniBringToFrontClick
      end
      object SendtoBack1: TMenuItem
        Caption = '&Send to Back'
        OnClick = mniSendToBackClick
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object ExportTab1: TMenuItem
        Caption = 'E&xport Tab'
        OnClick = ExportTab1Click
      end
      object ImportTab1: TMenuItem
        Caption = '&Import Tab'
        OnClick = ImportTab1Click
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object LoadLayoutSafeItem: TMenuItem
        Caption = 'Load Layout in Safe Mode'
        Visible = False
        OnClick = LoadLayoutSafeClick
      end
      object Checkforbadfields1: TMenuItem
        Caption = 'Check tab for bad fields'
        OnClick = Checkforbadfields1Click
      end
    end
    object Quit1: TMenuItem
      Caption = '&Quit'
      OnClick = Quit1Click
    end
  end
  object ExportSaveDialog: TSaveDialog
    DefaultExt = 'xml'
    Filter = 'XML files|*.xml'
    Title = 'Export to'
    Left = 368
    Top = 56
  end
  object ImportOpenDialog: TOpenDialog
    DefaultExt = 'xml'
    Filter = 'XML files|*.xml'
    Title = 'Import From'
    Left = 400
    Top = 56
  end
end
