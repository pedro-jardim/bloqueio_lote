object frmDestinacao: TfrmDestinacao
  Left = 0
  Top = 0
  Caption = 'Destina'#231#227'o'
  ClientHeight = 465
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 472
    Height = 465
    Align = alClient
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    TabOrder = 0
    ExplicitLeft = 256
    ExplicitTop = 120
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Button1: TButton
      Left = 8
      Top = 8
      Width = 452
      Height = 43
      Caption = 'Confirma'#231#227'o do Bloqueio de Lote'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 8
      Top = 56
      Width = 452
      Height = 43
      Caption = 'Confirma'#231#227'o do Bloqueio de Lote'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object Button3: TButton
      Left = 8
      Top = 104
      Width = 452
      Height = 43
      Caption = 'Confirma'#231#227'o do Bloqueio de Lote'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object memoRetorno: TMemo
      Left = 5
      Top = 312
      Width = 458
      Height = 144
      Align = alBottom
      TabOrder = 3
      ExplicitLeft = 8
      ExplicitTop = 309
    end
  end
end
