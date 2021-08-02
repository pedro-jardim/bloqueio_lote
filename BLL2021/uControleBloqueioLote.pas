unit uControleBloqueioLote;

interface

uses
  udmBloqueio,
  uIntegracaoUnilever,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmControleBloqueioLote = class(TForm)
    gridConsulta: TDBGrid;
    ScrollBox1: TScrollBox;
    pnlTop: TPanel;
    pnlBottom: TPanel;
    btnIniciar: TButton;
    btnParar: TButton;
    lblStatus: TLabel;
    timer: TTimer;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure timerTimer(Sender: TObject);
    procedure btnIniciarClick(Sender: TObject);
    procedure btnPararClick(Sender: TObject);
  private
    { Private declarations }
    procedure AbrirDataSet;
    procedure ExecutaConfirmacao;
    procedure InsereMovimento;
    procedure AtualizaDestinacao(const pLPN: string);
    procedure AtualizaEncerramento(const pLPN: string);
    procedure Parada;
  public
    { Public declarations }
    iControle, iTempo : Integer;
    lParada   : Boolean;
  end;

var
  frmControleBloqueioLote: TfrmControleBloqueioLote;

implementation

{$R *.dfm}

{ TfrmControleBloqueioLote }

procedure TfrmControleBloqueioLote.AbrirDataSet;
begin
  with dmBloqueio.stpConsultaBloqueioLote do
  begin
    Close;
    ParamByName('@cd_parametro').AsInteger    := 0;
    ParamByName('@cd_lpn_produto').AsString   := '';
    ParamByName('@ic_encerrado').AsString     := 'N';
    ParamByName('@cd_usuario').AsInteger      := 0;
    Open;
  end;
end;

procedure TfrmControleBloqueioLote.AtualizaDestinacao(const pLPN: string);
begin
  with dmBloqueio do
  begin
    qryAtualizaMovimentoDestinacao.Close;
    qryAtualizaMovimentoDestinacao.ParamByName('lpn').AsString := pLPN;
    qryAtualizaMovimentoDestinacao.ExecSQL;
    qryAtualizaMovimentoDestinacao.Close;
  end;
end;

procedure TfrmControleBloqueioLote.AtualizaEncerramento(const pLPN: string);
begin
  with dmBloqueio do
  begin
    qryAtualizaMovimentoEncerramento.Close;
    qryAtualizaMovimentoEncerramento.ParamByName('lpn').AsString := pLPN;
    qryAtualizaMovimentoEncerramento.ExecSQL;
    qryAtualizaMovimentoEncerramento.Close;
  end;
end;

procedure TfrmControleBloqueioLote.btnIniciarClick(Sender: TObject);
begin
  lblStatus.Caption := 'Pr�xima atualiza��o em 10 segundo(s)';
  iControle := 0;
  lParada := False;

  Application.ProcessMessages;

  timer.Enabled := True;

end;

procedure TfrmControleBloqueioLote.btnPararClick(Sender: TObject);
begin

  Parada;

end;

procedure TfrmControleBloqueioLote.ExecutaConfirmacao;
var
  msgRetorno : String;
  lValido: Boolean;
begin

  //******************************************************************************************************//
  //-->> Regra Add - Novo
  //-->> 1. Se tiver dados na ws_bloqueio_lote_itens e n�o tiver dados na identificacao_material_entrada
  //-->>    (bloqueio futuro cod.bloqueio 13 e qtd. caixas 0);
  //-->> 2. Se tiver dados na ws_bloqueio_lote_itens e existir na identificacao_material_entrada
  //-->>    (cod.bloqueio 3 e qtd. caixas na identificacao), sem que o lote esteja em OP;
  //-->> 3. Se tiver dados na ws_bloqueio_lote_itens e existir na identificacao_material_entrada
  //-->>    (cod.bloqueio 3 e qtd. caixas na identificacao), com OP vinculada;
  //-->> Regra Des - Destinacao
  //-->> 1. Se tiver dados na ws_bloqueio_itens com status 2 para destina��o
  //-->> Regra Enc - Encerramento
  //-->> 1. Se tiver dados na ws_bloqueio_itens com status 3 para encerramento
  //******************************************************************************************************//

  AbrirDataSet;

  msgRetorno := '';
  lValido    := False;
  lblStatus.Caption := 'Processando dados...';

  with dmBloqueio do
  begin
    while not stpConsultaBloqueioLote.Eof do
    begin

      lblStatus.Caption := 'Processando LPN '+stpConsultaBloqueioLotenm_cod_lpn.AsString;

      //---------------------------------------------
      //-->> Bloqueio Futuro
      //---------------------------------------------
      if (stpConsultaBloqueioLotecd_status_bloqueio.AsInteger = 1) and (stpConsultaBloqueioLotecd_identificacao.AsInteger = 0) then
      begin

        lValido := BloqueioLote(
                    '13',                                                                   //CodAcao
                    stpConsultaBloqueioLotecd_bloqueio_web.AsString,                        //CodBloqueioWeb
                    dmBloqueio.qryParametroLogisticacd_local_bloqueio_unilever.asstring,    //CodLocalBloqueio
                    '',                                                                     //EmailUsuario
                    '0',                                                                    //Qtde. Caixas
                    stpConsultaBloqueioLotenm_cod_lpn.AsString,                             //Numero da LPN
                    msgRetorno                                                              //Mensagem de Retorno
                  );

        if lValido then
        begin
          lblStatus.Caption := 'LPN '+stpConsultaBloqueioLotenm_cod_lpn.AsString+' - Bloqueado com Sucesso!';
          InsereMovimento;
        end
        else
          lblStatus.Caption := msgRetorno;

        Application.ProcessMessages;
        Sleep(2000);

      end
      else
      //--------------------------------------------------
      //-->> Bloqueio com Pallet Recebido e N�o Utilizado
      //--------------------------------------------------
      if (stpConsultaBloqueioLotecd_status_bloqueio.AsInteger = 1) and (stpConsultaBloqueioLotecd_identificacao.AsInteger > 0) and (stpConsultaBloqueioLoteic_utilizado.AsString = 'N') then
      begin

        lValido := BloqueioLote(
                    '3',                                                              //CodAcao
                    stpConsultaBloqueioLotecd_bloqueio_web.AsString,                        //CodBloqueioWeb
                    dmBloqueio.qryParametroLogisticacd_local_bloqueio_unilever.asstring, //CodLocalBloqueio
                    '',                                                               //EmailUsuario
                    stpConsultaBloqueioLoteqt_caixa.AsString,                                                              //Qtde. Caixas
                    stpConsultaBloqueioLotenm_cod_lpn.AsString,                             //Numero da LPN
                    msgRetorno                                                        //Mensagem de Retorno
                  );

        if lValido then
        begin
          InsereMovimento;
          lblStatus.Caption := 'LPN '+stpConsultaBloqueioLotenm_cod_lpn.AsString+' - Bloqueado com Sucesso!'
        end
        else
          lblStatus.Caption := msgRetorno;

        Application.ProcessMessages;
        Sleep(2000);

      end
      else
      //--------------------------------------------------
      //-->> Bloqueio com Pallet Recebido j� Utilizado
      //--------------------------------------------------
      if (stpConsultaBloqueioLotecd_status_bloqueio.AsInteger = 1) and (stpConsultaBloqueioLotecd_identificacao.AsInteger > 0) and (stpConsultaBloqueioLoteic_utilizado.AsString = 'S') then
      begin

        lValido := BloqueioLote(
                    '99',                                                                   //CodAcao
                    stpConsultaBloqueioLotecd_bloqueio_web.AsString,                        //CodBloqueioWeb
                    dmBloqueio.qryParametroLogisticacd_local_bloqueio_unilever.asstring,    //CodLocalBloqueio
                    '',                                                                     //EmailUsuario
                    '0',                                                                    //Qtde. Caixas
                    stpConsultaBloqueioLotenm_cod_lpn.AsString,                             //Numero da LPN
                    msgRetorno                                                              //Mensagem de Retorno
                  );

        if lValido then
        begin
          InsereMovimento;
          lblStatus.Caption := 'LPN '+stpConsultaBloqueioLotenm_cod_lpn.AsString+' - Bloqueado com Sucesso!';
        end
        else
          lblStatus.Caption := msgRetorno;

        Application.ProcessMessages;
        Sleep(2000);
      end
      else
      //--------------------------------------------------
      //-->> Confirma a Destina��o
      //--------------------------------------------------
      if (stpConsultaBloqueioLotecd_status_bloqueio.AsInteger = 2) and (stpConsultaBloqueioLotedt_confirmacao_destinacao.AsString = '') then
      begin

        lValido := DestinacaoLote(
                    stpConsultaBloqueioLotecd_bloqueio_web.AsString,                        //CodBloqueioWeb
                    '13',                                                              //CodAcao
                    dmBloqueio.qryParametroLogisticacd_local_bloqueio_unilever.asstring, //CodLocalBloqueio
                    stpConsultaBloqueioLotenm_cod_lpn.AsString,                             //Numero da LPN
                    msgRetorno                                                        //Mensagem de Retorno
                  );

        if lValido then
        begin
          AtualizaDestinacao(stpConsultaBloqueioLotenm_cod_lpn.AsString);
          lblStatus.Caption := 'LPN '+stpConsultaBloqueioLotenm_cod_lpn.AsString+' - Destinada com Sucesso!';
        end
        else
          lblStatus.Caption := msgRetorno;

        Application.ProcessMessages;
        Sleep(2000);
      end
      else
      //--------------------------------------------------
      //-->> Confirma a Encerramento
      //--------------------------------------------------
      if (stpConsultaBloqueioLotecd_status_bloqueio.AsInteger = 3) and (stpConsultaBloqueioLotedt_confirmacao_encerramento.AsString = '') then
      begin

        lValido := EncerramentoLote(
                    stpConsultaBloqueioLotecd_bloqueio_web.AsString,                        //CodBloqueioWeb
                    '13',                                                                    //CodDestinacao
                    dmBloqueio.qryParametroLogisticacd_local_bloqueio_unilever.asstring,    //CodLocalBloqueio
                    stpConsultaBloqueioLotenm_cod_lpn.AsString,                             //Numero da LPN
                    msgRetorno                                                              //Mensagem de Retorno
                  );

        if lValido then
        begin
          AtualizaEncerramento(stpConsultaBloqueioLotenm_cod_lpn.AsString);
          lblStatus.Caption := 'LPN '+stpConsultaBloqueioLotenm_cod_lpn.AsString+' - Encerrada com Sucesso!';
        end
        else
          lblStatus.Caption := msgRetorno;

        Application.ProcessMessages;
        Sleep(2000);
      end;

      stpConsultaBloqueioLote.Next;

    end;

  end;

  AbrirDataSet;

  lblStatus.Caption := 'Aguardando a pr�xima consulta...';

end;

procedure TfrmControleBloqueioLote.FormCreate(Sender: TObject);
begin

  with dmBloqueio.qryParametroLogistica do
  begin
    Close;
    Open;
  end;

  lblStatus.Caption := 'A consulta n�o est� em opera��o...';

  iControle := 0;
  iTempo := 10;
  timer.Interval := 1000;
  timer.Enabled := False;

end;

procedure TfrmControleBloqueioLote.FormShow(Sender: TObject);
begin
  AbrirDataSet;
end;

procedure TfrmControleBloqueioLote.InsereMovimento;
begin
  with dmBloqueio do
  begin
    try
      qryInsereMovimento.Close;
      qryInsereMovimento.ParamByName('cd_motivo_bloqueio').Value      := StrToIntDef(stpConsultaBloqueioLotenm_codigo_motivo.AsString,0);
      qryInsereMovimento.ParamByName('cd_local_bloqueio').Value       := dmBloqueio.qryParametroLogisticacd_local_bloqueio_unilever.AsInteger;
      qryInsereMovimento.ParamByName('cd_lote_produto').Value         := stpConsultaBloqueioLotecd_lote_produto.AsInteger;
      qryInsereMovimento.ParamByName('cd_produto').Value              := stpConsultaBloqueioLotecd_produto.AsInteger;
      qryInsereMovimento.ParamByName('nm_ref_lote_produto').Value     := stpConsultaBloqueioLotenm_ref_lote_produto.AsString;
      qryInsereMovimento.ParamByName('qt_movimento').Value            := stpConsultaBloqueioLoteqt_produto.AsFloat;
      qryInsereMovimento.ParamByName('cd_fase_produto').Value         := 0;
      qryInsereMovimento.ParamByName('dt_bloqueio_movimento').Value   := stpConsultaBloqueioLotedt_bloqueio.AsDateTime;
      qryInsereMovimento.ParamByName('cd_lpn_produto').Value          := stpConsultaBloqueioLotenm_cod_lpn.AsString;
      qryInsereMovimento.ExecSQL;
    except
      on E:exception do
      begin
        ShowMessage('Aten��o! N�o foi poss�vel gerar o movimento de bloqueio de lote');
        Abort;
      end;
    end;
  end;

end;

procedure TfrmControleBloqueioLote.Parada;
begin
  lblStatus.Caption := 'A consulta n�o est� em opera��o...';

  lParada   := True;
  iTempo    := 10;
  iControle := 0;
end;

procedure TfrmControleBloqueioLote.timerTimer(Sender: TObject);
begin

  if lParada then
  begin
    Parada;
    Abort;
  end;

  inc(iControle);

  iTempo :=  10 - iControle;

  lblStatus.Caption := 'Pr�xima atualiza��o em '+ IntToStr(iTempo+1)+' segundo(s)';

  if iControle > 10 then
  begin
    timer.Enabled := False;
    ExecutaConfirmacao;
    iTempo := 10;
    iControle := 0;
    timer.Enabled := True;
  end;

  Application.ProcessMessages;

end;

end.
