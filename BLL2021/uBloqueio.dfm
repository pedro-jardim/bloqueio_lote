object frmBloqueio: TfrmBloqueio
  Left = 0
  Top = 0
  Caption = 'Confirma'#231#227'o Bloqueio'
  ClientHeight = 205
  ClientWidth = 268
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 31
    Top = 83
    Width = 50
    Height = 13
    Caption = 'C'#243'd. A'#231#227'o'
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 268
    Height = 123
    Align = alClient
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 5
      Top = 5
      Width = 254
      Height = 109
      Align = alClient
      Caption = 'Bloqueio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label2: TLabel
        Left = 23
        Top = 29
        Width = 91
        Height = 13
        Caption = 'C'#243'd. Bloqueio Web'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 96
        Top = 52
        Width = 18
        Height = 13
        Caption = 'LPN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 58
        Top = 75
        Width = 56
        Height = 13
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edtCodBloqueioWeb: TEdit
        Left = 120
        Top = 26
        Width = 121
        Height = 21
        Color = clInactiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object edtQtdeCaixa: TEdit
        Left = 120
        Top = 72
        Width = 55
        Height = 21
        Color = clInactiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object edtCodLPN: TEdit
        Left = 120
        Top = 49
        Width = 121
        Height = 21
        Color = clInactiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
    end
  end
  object pnlResult: TPanel
    Left = 0
    Top = 164
    Width = 268
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object lblRetorno: TLabel
      Left = 0
      Top = 0
      Width = 268
      Height = 41
      Align = alClient
      Alignment = taCenter
      Caption = 'Status do Retorno'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
      ExplicitWidth = 103
      ExplicitHeight = 13
    end
  end
  object pnlConfirmacao: TPanel
    Left = 0
    Top = 123
    Width = 268
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Padding.Left = 10
    Padding.Top = 3
    Padding.Right = 10
    Padding.Bottom = 3
    TabOrder = 2
    object Button1: TButton
      Left = 10
      Top = 3
      Width = 248
      Height = 35
      Align = alClient
      Caption = 'Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
  end
end