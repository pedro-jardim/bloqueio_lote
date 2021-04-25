unit uPrincipal;

interface

uses
  uIServidorBLL,
  uBloqueioLote,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Vcl.Graphics,  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    ScrollBox1: TScrollBox;
    btnBloqueioLote: TButton;
    btnDestinacao: TButton;
    btnEncerramento: TButton;
    btnSair: TButton;
    Button1: TButton;
    procedure btnSairClick(Sender: TObject);
    procedure btnBloqueioLoteClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnBloqueioLoteClick(Sender: TObject);
begin
  with TfrmBloqueioLote.Create(Self) do
  begin
    try
      ShowModal;
    finally
      Free;
    end;
  end;
end;

procedure TfrmPrincipal.btnSairClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente sair do sistema?', mtConfirmation, mbYesNo, 0) = mrYes then
  begin
    Close;
  end;

end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
var
  Servidor : IServidorBLL;
begin
  Servidor := uIServidorBll.GetIServidorBLL;
  ShowMessage( Servidor.mensagemBoasVindas );
end;

end.
