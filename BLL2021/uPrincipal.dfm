object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Bloqueio de Lote'
  ClientHeight = 352
  ClientWidth = 323
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 323
    Height = 352
    Align = alClient
    TabOrder = 0
    object btnBloqueioLote: TButton
      Left = 16
      Top = 17
      Width = 289
      Height = 41
      Caption = 'Bloqueio do Lote'
      TabOrder = 0
      TabStop = False
      OnClick = btnBloqueioLoteClick
    end
    object btnDestinacao: TButton
      Left = 16
      Top = 64
      Width = 289
      Height = 41
      Caption = 'Destina'#231#227'o'
      TabOrder = 1
      TabStop = False
    end
    object btnEncerramento: TButton
      Left = 16
      Top = 112
      Width = 289
      Height = 41
      Caption = 'Encerramento'
      TabOrder = 2
      TabStop = False
    end
    object btnSair: TButton
      Left = 16
      Top = 288
      Width = 289
      Height = 41
      Caption = 'Sair'
      TabOrder = 3
      TabStop = False
      OnClick = btnSairClick
    end
    object Button1: TButton
      Left = 16
      Top = 160
      Width = 289
      Height = 41
      Caption = 'Teste do Servidor'
      TabOrder = 4
      TabStop = False
      OnClick = Button1Click
    end
  end
end
