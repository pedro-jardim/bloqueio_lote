unit uDestinacao;

interface

uses
  uServiceIntegracaoWMS,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmDestinacao = class(TForm)
    ScrollBox1: TScrollBox;
    GroupBox1: TGroupBox;
    btnSetBloqueioLote: TButton;
    Label1: TLabel;
    edtCodAcaoBL: TEdit;
    Label2: TLabel;
    edtCodBloqueioWebBL: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtEmailUsuarioBL: TEdit;
    edtObsBL: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    edtQtdeCaixaBL: TEdit;
    edtCodLocalBloqueioBL: TEdit;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    btnSetDestinacao: TButton;
    edtCodBloqueioWebDes: TEdit;
    edtObsDes: TEdit;
    edtCodDestinacaoDes: TEdit;
    edtLocalBloqueioDes: TEdit;
    memoRetorno: TMemo;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    btnSetFinalizacao: TButton;
    edtCodBloqueioEnc: TEdit;
    edtObsEnc: TEdit;
    edtCodDestinacaoEnc: TEdit;
    edtLocalBloqueioEnc: TEdit;
    procedure btnSetBloqueioLoteClick(Sender: TObject);
    procedure btnSetDestinacaoClick(Sender: TObject);
    procedure btnSetFinalizacaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDestinacao: TfrmDestinacao;

implementation

{$R *.dfm}

procedure TfrmDestinacao.btnSetBloqueioLoteClick(Sender: TObject);
var
  Servidor : IintegracaoWMS;
  Data : DataBloqueio2;
begin
  try
    Data := DataBloqueio2.Create;
    Data.COD_ACAO := edtCodAcaoBL.Text;
    Data.COD_BLOQUEIO_WEB := edtCodBloqueioWebBL.Text;
    Data.COD_LOCAL_BLOQUEIO := edtCodLocalBloqueioBL.Text;
    Data.EMAIL_USUARIO := edtCodLocalBloqueioBL.Text;
    Data.OBSERVACAO := edtObsBL.Text;
    Data.QTDE_CAIXAS := edtQtdeCaixaBL.Text;
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

procedure TfrmDestinacao.btnSetDestinacaoClick(Sender: TObject);
var
  Servidor : IintegracaoWMS;
  Data : DataBloqueioDest2;
begin
  try
    Data := DataBloqueioDest2.Create;
    Data.COD_BLOQUEIO_WEB   := edtCodBloqueioWebDes.Text;
    Data.COD_LOCAL_BLOQUEIO := edtLocalBloqueioDes.Text;
    Data.OBSERVACAO         := edtObsDes.Text;
    Data.COD_DESTINACAO     := edtCodDestinacaoDes.Text;
    try
      Servidor := uServiceIntegracaoWMS.GetIintegracaoWMS;
      memoRetorno.Lines.Text := Servidor.SetDestinacao(Data);
    except
      on e:exception do
      begin
        showmessage('Não foi possível confirmar o bloqueio do lote');
      end;
    end;
  finally

  end;
end;

procedure TfrmDestinacao.btnSetFinalizacaoClick(Sender: TObject);
var
  Servidor : IintegracaoWMS;
  Data : DataBloqueioDest2;
begin
  try
    Data := DataBloqueioDest2.Create;
    Data.COD_BLOQUEIO_WEB   := edtCodBloqueioEnc.Text;
    Data.COD_LOCAL_BLOQUEIO := edtLocalBloqueioEnc.Text;
    Data.OBSERVACAO         := edtObsEnc.Text;
    Data.COD_DESTINACAO     := edtCodDestinacaoEnc.Text;
    try
      Servidor := uServiceIntegracaoWMS.GetIintegracaoWMS;
      memoRetorno.Lines.Text := Servidor.SetFinalizacao(Data);
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
