object LayoutTypeForm: TLayoutTypeForm
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  Caption = 'Select Layout Type'
  ClientHeight = 132
  ClientWidth = 203
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object LayoutGroup: TRadioGroup
    Left = 5
    Top = 5
    Width = 187
    Height = 97
    Align = alCustom
    Caption = 'Layout Type'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Exam'
      'Patient'
      'Responsible'
      'Contact Rx'
      'Frame Rx'
      'Claims'
      'Appointment')
    TabOrder = 0
    OnClick = LayoutGroupClick
  end
  object Button1: TButton
    Left = 8
    Top = 104
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 1
    OnClick = Button1Click
  end
  object PrintCheck: TCheckBox
    Left = 96
    Top = 104
    Width = 97
    Height = 17
    Caption = 'for Print Layout'
    TabOrder = 2
  end
end
