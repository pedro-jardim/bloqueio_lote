object frmDestinacao: TfrmDestinacao
  Left = 0
  Top = 0
  Caption = 'Destina'#231#227'o'
  ClientHeight = 525
  ClientWidth = 757
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
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
    Width = 757
    Height = 525
    Align = alClient
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 5
      Top = 5
      Width = 458
      Height = 156
      Caption = 'Bloqueio do Lote'
      TabOrder = 0
      object Label1: TLabel
        Left = 24
        Top = 28
        Width = 50
        Height = 13
        Caption = 'C'#243'd. A'#231#227'o'
      end
      object Label2: TLabel
        Left = 24
        Top = 52
        Width = 91
        Height = 13
        Caption = 'C'#243'd. Bloqueio Web'
      end
      object Label4: TLabel
        Left = 24
        Top = 76
        Width = 93
        Height = 13
        Caption = 'C'#243'd. Local Bloqueio'
      end
      object Label5: TLabel
        Left = 248
        Top = 28
        Width = 24
        Height = 13
        Caption = 'Email'
      end
      object Label6: TLabel
        Left = 248
        Top = 52
        Width = 58
        Height = 13
        Caption = 'Observa'#231#227'o'
      end
      object Label7: TLabel
        Left = 248
        Top = 76
        Width = 63
        Height = 13
        Caption = 'Qtde. Caixas'
      end
      object btnSetBloqueioLote: TButton
        Left = 2
        Top = 111
        Width = 454
        Height = 43
        Align = alBottom
        Caption = 'Confirma'#231#227'o do Bloqueio de Lote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnSetBloqueioLoteClick
        ExplicitLeft = 6
        ExplicitTop = 8
        ExplicitWidth = 452
      end
      object edtCodAcaoBL: TEdit
        Left = 120
        Top = 25
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object edtCodBloqueioWebBL: TEdit
        Left = 120
        Top = 49
        Width = 121
        Height = 21
        TabOrder = 2
      end
      object edtEmailUsuarioBL: TEdit
        Left = 312
        Top = 25
        Width = 121
        Height = 21
        TabOrder = 3
      end
      object edtObsBL: TEdit
        Left = 312
        Top = 49
        Width = 121
        Height = 21
        TabOrder = 4
      end
      object edtQtdeCaixaBL: TEdit
        Left = 312
        Top = 73
        Width = 121
        Height = 21
        TabOrder = 5
      end
      object edtCodLocalBloqueioBL: TEdit
        Left = 119
        Top = 73
        Width = 121
        Height = 21
        TabOrder = 6
        Text = '181'
      end
    end
    object GroupBox2: TGroupBox
      Left = 5
      Top = 165
      Width = 458
      Height = 118
      Caption = 'Destina'#231#227'o'
      TabOrder = 1
      object Label9: TLabel
        Left = 24
        Top = 25
        Width = 91
        Height = 13
        Caption = 'C'#243'd. Bloqueio Web'
      end
      object Label10: TLabel
        Left = 24
        Top = 49
        Width = 93
        Height = 13
        Caption = 'C'#243'd. Local Bloqueio'
      end
      object Label12: TLabel
        Left = 264
        Top = 25
        Width = 58
        Height = 13
        Caption = 'Observa'#231#227'o'
      end
      object Label13: TLabel
        Left = 248
        Top = 49
        Width = 79
        Height = 13
        Caption = 'C'#243'd. Destina'#231#227'o'
      end
      object btnSetDestinacao: TButton
        Left = 2
        Top = 73
        Width = 454
        Height = 43
        Align = alBottom
        Caption = 'Destina'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnSetDestinacaoClick
        ExplicitTop = 111
      end
      object edtCodBloqueioWebDes: TEdit
        Left = 120
        Top = 22
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object edtObsDes: TEdit
        Left = 328
        Top = 22
        Width = 121
        Height = 21
        TabOrder = 2
      end
      object edtCodDestinacaoDes: TEdit
        Left = 328
        Top = 46
        Width = 121
        Height = 21
        TabOrder = 3
      end
      object edtLocalBloqueioDes: TEdit
        Left = 119
        Top = 46
        Width = 121
        Height = 21
        TabOrder = 4
        Text = '181'
      end
    end
    object memoRetorno: TMemo
      Left = 467
      Top = 8
      Width = 277
      Height = 251
      TabOrder = 2
    end
    object GroupBox3: TGroupBox
      Left = 5
      Top = 285
      Width = 458
      Height = 118
      Caption = 'Encerramento'
      TabOrder = 3
      object Label8: TLabel
        Left = 24
        Top = 25
        Width = 91
        Height = 13
        Caption = 'C'#243'd. Bloqueio Web'
      end
      object Label11: TLabel
        Left = 24
        Top = 49
        Width = 93
        Height = 13
        Caption = 'C'#243'd. Local Bloqueio'
      end
      object Label14: TLabel
        Left = 264
        Top = 25
        Width = 58
        Height = 13
        Caption = 'Observa'#231#227'o'
      end
      object Label15: TLabel
        Left = 248
        Top = 49
        Width = 79
        Height = 13
        Caption = 'C'#243'd. Destina'#231#227'o'
      end
      object btnSetFinalizacao: TButton
        Left = 2
        Top = 73
        Width = 454
        Height = 43
        Align = alBottom
        Caption = 'Encerramento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnSetFinalizacaoClick
      end
      object edtCodBloqueioEnc: TEdit
        Left = 120
        Top = 22
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object edtObsEnc: TEdit
        Left = 328
        Top = 22
        Width = 121
        Height = 21
        TabOrder = 2
      end
      object edtCodDestinacaoEnc: TEdit
        Left = 328
        Top = 46
        Width = 121
        Height = 21
        TabOrder = 3
      end
      object edtLocalBloqueioEnc: TEdit
        Left = 119
        Top = 46
        Width = 121
        Height = 21
        TabOrder = 4
        Text = '181'
      end
    end
  end
end
