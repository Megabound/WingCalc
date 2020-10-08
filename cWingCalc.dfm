object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Wing Calc'
  ClientHeight = 414
  ClientWidth = 485
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 485
    Height = 73
    Align = alTop
    TabOrder = 0
    object lblNoWings: TLabel
      Left = 48
      Top = 30
      Width = 86
      Height = 13
      Caption = 'Number of Wings:'
    end
    object se1: TSpinEdit
      Left = 140
      Top = 27
      Width = 121
      Height = 22
      MaxValue = 200000000
      MinValue = 4
      TabOrder = 0
      Value = 0
    end
    object btnCalculate: TButton
      Left = 288
      Top = 25
      Width = 75
      Height = 25
      Caption = 'Calculate'
      TabOrder = 1
      OnClick = btnCalculateClick
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 73
    Width = 485
    Height = 341
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 320
    ExplicitTop = 136
    ExplicitWidth = 185
    ExplicitHeight = 41
    object mmoOutput: TMemo
      Left = 1
      Top = 1
      Width = 483
      Height = 339
      Align = alClient
      TabOrder = 0
      ExplicitLeft = -4
      ExplicitTop = 180
      ExplicitWidth = 489
      ExplicitHeight = 193
    end
  end
end
