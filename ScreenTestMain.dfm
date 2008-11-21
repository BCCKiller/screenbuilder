object Form1: TForm1
  Left = 0
  Top = 0
  Width = 169
  Height = 246
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
  object Button1: TButton
    Left = 16
    Top = 160
    Width = 113
    Height = 25
    Caption = 'Screen Builder'
    TabOrder = 0
    OnClick = Button1Click
  end
  object RadioGroup1: TRadioGroup
    Left = 16
    Top = 16
    Width = 113
    Height = 105
    Caption = 'ScreenType'
    ItemIndex = 0
    Items.Strings = (
      'Exam'
      'Patient'
      'Contact Lens'
      'Lens Rx')
    TabOrder = 1
  end
  object CheckBox1: TCheckBox
    Left = 24
    Top = 128
    Width = 97
    Height = 17
    Caption = 'Screen Layout'
    Checked = True
    State = cbChecked
    TabOrder = 2
  end
end
