object frmControleBloqueioLote: TfrmControleBloqueioLote
  Left = 0
  Top = 0
  Caption = 'Confirma'#231#227'o Autom'#225'tica do Pallet'
  ClientHeight = 334
  ClientWidth = 502
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 502
    Height = 334
    Align = alClient
    TabOrder = 0
    object gridConsulta: TDBGrid
      Left = 0
      Top = 41
      Width = 498
      Height = 248
      Align = alClient
      DataSource = dmBloqueio.dsConsultaBloqueioLote
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'cd_bloqueio_web'
          Title.Caption = 'C'#243'd. Bloqueio Web'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 135
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nm_cod_lpn'
          Title.Caption = 'LPN'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 161
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nm_status_bloqueio'
          Title.Caption = 'Status'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end>
    end
    object pnlTop: TPanel
      Left = 0
      Top = 0
      Width = 498
      Height = 41
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 192
        Top = 16
        Width = 109
        Height = 13
        Caption = 'Segundos p/ Execu'#231#227'o'
      end
      object Button1: TButton
        Left = 11
        Top = 9
        Width = 75
        Height = 25
        Caption = 'Iniciar'
        TabOrder = 0
      end
      object Button2: TButton
        Left = 96
        Top = 9
        Width = 75
        Height = 25
        Caption = 'Parar'
        TabOrder = 1
      end
      object edtTempo: TEdit
        Left = 311
        Top = 11
        Width = 121
        Height = 21
        TabOrder = 2
      end
    end
    object pnlBottom: TPanel
      Left = 0
      Top = 289
      Width = 498
      Height = 41
      Align = alBottom
      TabOrder = 2
      object lblStatus: TLabel
        Left = 1
        Top = 1
        Width = 496
        Height = 39
        Align = alClient
        Alignment = taCenter
        Caption = 'Aguardando pr'#243'xima consulta...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 179
        ExplicitHeight = 13
      end
    end
  end
  object timer: TTimer
    OnTimer = timerTimer
    Left = 248
    Top = 176
  end
end
