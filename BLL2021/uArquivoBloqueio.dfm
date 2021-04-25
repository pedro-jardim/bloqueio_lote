object frmBloqueioLote: TfrmBloqueioLote
  Left = 0
  Top = 0
  Caption = 'Bloqueio de Lote'
  ClientHeight = 299
  ClientWidth = 635
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
    Width = 635
    Height = 299
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 240
    ExplicitTop = 120
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 631
      Height = 97
      Align = alTop
      TabOrder = 0
      object RadioGroup1: TRadioGroup
        Left = 16
        Top = 8
        Width = 225
        Height = 49
        Caption = 'M'#233'todo de Bloqueio do Lote'
        Columns = 2
        Items.Strings = (
          'Webservice'
          'XML')
        TabOrder = 0
      end
    end
  end
end
