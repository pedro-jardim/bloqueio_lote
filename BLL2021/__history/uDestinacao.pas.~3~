unit uDestinacao;

interface

uses
  uServiceIntegracaoWMS,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmDestinacao = class(TForm)
    ScrollBox1: TScrollBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    memoRetorno: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDestinacao: TfrmDestinacao;

implementation

{$R *.dfm}

procedure TfrmDestinacao.Button1Click(Sender: TObject);
var
  Servidor : IintegracaoWMS;
  Data : DataBloqueio2;
begin
  try
    Data := DataBloqueio2.Create;
    Data.COD_ACAO := '3';
    Data.COD_BLOQUEIO_WEB := '12345';
    Data.COD_LOCAL_BLOQUEIO := '181';
    Data.EMAIL_USUARIO := 'pedro@gbstec.com.br';
    Data.OBSERVACAO := 'Envio de Teste GBS';
    Data.QTDE_CAIXAS := '1';
    try
      Servidor := uServiceIntegracaoWMS.GetIintegracaoWMS;
      memoRetorno.Lines.Text := Servidor.SetBloqueio(Data);
    except
      on e:exception do
      begin
        showmessage('Não foi possível confirmar o bloqueio do lote');
      end;
    end;
  finally

  end;
end;

end.
