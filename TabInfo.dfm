object TabInfoForm: TTabInfoForm
  Left = 192
  Top = 140
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Tab Information'
  ClientHeight = 327
  ClientWidth = 311
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 18
    Top = 48
    Width = 53
    Height = 13
    Caption = 'Description'
  end
  object Label2: TLabel
    Left = 28
    Top = 80
    Width = 43
    Height = 13
    Caption = 'Tab Text'
  end
  object Label3: TLabel
    Left = 8
    Top = 108
    Width = 87
    Height = 13
    Caption = 'Notes on Tab Use'
  end
  object Label4: TLabel
    Left = 8
    Top = 40
    Width = 63
    Height = 13
    Caption = 'Layout Name'
  end
  object ActionLabel: TLabel
    Left = 0
    Top = 0
    Width = 313
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = 'Load Layout'
    Color = clGradientActiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object TabEdit: TEdit
    Left = 80
    Top = 72
    Width = 81
    Height = 21
    TabOrder = 0
  end
  object UseMemo: TMemo
    Left = 8
    Top = 127
    Width = 289
    Height = 121
    TabOrder = 1
  end
  object btnOK: TButton
    Left = 192
    Top = 64
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 192
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = btnCancelClick
  end
  object LayoutCombo: TComboBox
    Left = 80
    Top = 32
    Width = 201
    Height = 21
    AutoComplete = False
    ItemHeight = 0
    Sorted = True
    TabOrder = 4
    OnChange = LayoutComboSelect
    OnSelect = LayoutComboSelect
  end
  object DescriptionCombo: TComboBox
    Left = 80
    Top = 40
    Width = 201
    Height = 21
    AutoComplete = False
    ItemHeight = 0
    Sorted = True
    TabOrder = 5
    OnSelect = DescriptionComboSelect
  end
  object TabWarningPanel: TPanel
    Left = 8
    Top = 254
    Width = 289
    Height = 67
    Color = clYellow
    TabOrder = 6
    Visible = False
    object Label5: TLabel
      Left = 10
      Top = 8
      Width = 271
      Height = 33
      Alignment = taCenter
      AutoSize = False
      Caption = 
        'Changes made to Tab Text or Use will be seen in all layouts that' +
        ' use this tab.'
      WordWrap = True
    end
    object UpdateCheckbox: TCheckBox
      Left = 40
      Top = 40
      Width = 233
      Height = 17
      Caption = 'Update Tab Text and Tab Use fields'
      TabOrder = 0
    end
  end
end
