object ConvertForm: TConvertForm
  Left = 0
  Top = 0
  Caption = 'Convert To Print'
  ClientHeight = 390
  ClientWidth = 590
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
  object LayoutPageControl: TPageControl
    Left = 0
    Top = 40
    Width = 585
    Height = 345
    TabOrder = 0
  end
end
