object Form1: TForm1
  Left = 359
  Top = 175
  Width = 928
  Height = 480
  Caption = #1047#1072#1076#1072#1085#1080#1077' 6'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object inputPnl: TGroupBox
    Left = 0
    Top = 0
    Width = 920
    Height = 185
    Align = alTop
    Caption = 'Input text'
    TabOrder = 0
    object btnPanel: TPanel
      Left = 752
      Top = 15
      Width = 166
      Height = 168
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object checkBtn: TButton
        Left = 40
        Top = 0
        Width = 100
        Height = 25
        Caption = 'Check'
        TabOrder = 0
        OnClick = MainBtnClick
      end
      object clearBtn: TButton
        Left = 40
        Top = 40
        Width = 100
        Height = 25
        Caption = 'Clear'
        TabOrder = 1
        OnClick = clearBtnClick
      end
    end
    object memoPnl: TPanel
      Left = 2
      Top = 15
      Width = 750
      Height = 168
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object inputMemo: TMemo
        Left = 0
        Top = 0
        Width = 750
        Height = 168
        Align = alClient
        TabOrder = 0
        OnKeyPress = edtInputKeyPress
      end
    end
  end
  object resulPnl: TGroupBox
    Left = 0
    Top = 185
    Width = 920
    Height = 264
    Align = alClient
    Caption = 'Result'
    TabOrder = 1
    object resultMemo: TMemo
      Left = 2
      Top = 15
      Width = 916
      Height = 247
      Align = alClient
      Enabled = False
      TabOrder = 0
    end
    object tv1: TTreeView
      Left = 576
      Top = 16
      Width = 337
      Height = 241
      Indent = 19
      TabOrder = 1
    end
  end
end
