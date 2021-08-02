unit uIntegracaoUnilever;

interface

uses
  uServiceIntegracaoWMS,
  xmldom, XMLIntf, msxmldom, XMLDoc,
  sysUtils;

type TBloqueio = class(DataBloqueio2)
  private
  public
  end;

type TDestinacao = class(DataBloqueioDest2)
  private
  public
  end;

type TEncerramento = class(DataBloqueioDest2)
  private
  public
  end;

function BloqueioLote(const codAcao, codBloqueioWeb, codLocalBloqueio, emailUsuario, qtdCaixas, codLPN: string;
                        var msgRetorno: String): Boolean;

function DestinacaoLote(const codBloqueioWeb, codDestinacao, codLocalBloqueio, codLPN: string;
                          var msgRetorno: String): Boolean;

function EncerramentoLote(const codBloqueioWeb, codDestinacao, codLocalBloqueio, codLPN: string;
                            var msgRetorno: String): Boolean;

implementation

function BloqueioLote(const codAcao, codBloqueioWeb, codLocalBloqueio, emailUsuario, qtdCaixas, codLPN: string;
                        var msgRetorno: String):Boolean;
var
  objBloqueio : DataBloqueio2;
  iIntegracao : IintegracaoWMS;
  iXML        : IXMLDocument;
  sID, sSucesso, sObs : string;
begin
  Result:= True;
  try
    try
      objBloqueio := DataBloqueio2.Create;
      objBloqueio.COD_ACAO            := codAcao;
      objBloqueio.COD_BLOQUEIO_WEB    := codBloqueioWeb;
      objBloqueio.COD_LOCAL_BLOQUEIO  := codLocalBloqueio;
      objBloqueio.EMAIL_USUARIO       := emailUsuario;
      if codAcao = '3' then
        objBloqueio.OBSERVACAO          := 'Processado no WMS | Msg WMS: LPN '+ codLPN + ' - Bloqueada com sucesso'
      else if codAcao = '13' then
        objBloqueio.OBSERVACAO          := 'Bloqueio Futuro | Msg WMS: LPN '+ codLPN + ' - Produto não encontrado no estoque'
      else if codAcao = '99' then
      begin
        objBloqueio.COD_ACAO            := '13';
        objBloqueio.OBSERVACAO          := 'Processado no WMS | Msg WMS: LPN '+ codLPN + ' - Produto já expedido do estoque';
      end;
      objBloqueio.QTDE_CAIXAS         := qtdCaixas;

      iIntegracao := GetIintegracaoWMS();
      msgRetorno  := iIntegracao.SetBloqueio(objBloqueio);

      msgRetorno := '<?xml version="1.0" encoding="ISO-8859-1"?>' + msgRetorno;
      //msgRetorno := '<?xml version="1.0" encoding="UTF-8"?>' + msgRetorno;
      iXML          := NewXMLDocument;
      iXML.XML.Text := msgRetorno;
      iXML.Active   := True;

      sID      := iXML.DocumentElement.ChildNodes[0].Text;
      sSucesso := iXML.DocumentElement.ChildNodes[1].Text;
      sObs     := iXML.DocumentElement.ChildNodes[2].Text;

      //-->> codAcao 13 (Bloqueio Futuro) retorna erro, porém continuar mesmo assim...
      if ((StrToIntDef(sID,0) <= 0) or (sSucesso = 'N')) and (codAcao <> '13') then
        Result := False;

      msgRetorno := sObs;

    finally
      objBloqueio.Free;
    end;
  except
    on E:Exception do
    begin
      Result := False;
    end;
  end;
end;

function DestinacaoLote(const codBloqueioWeb, codDestinacao, codLocalBloqueio, codLPN: string;
                          var msgRetorno: String):Boolean;
var
  objDestinacao : DataBloqueioDest2;
  iIntegracao   : IintegracaoWMS;
  iXML          : IXMLDocument;
  sID, sSucesso, sObs : string;
begin
  Result:= True;
  try
    try
      objDestinacao := DataBloqueioDest2.Create;
      objDestinacao.COD_BLOQUEIO_WEB    := codBloqueioWeb;
      objDestinacao.COD_DESTINACAO      := codDestinacao;
      objDestinacao.COD_LOCAL_BLOQUEIO  := codLocalBloqueio;
      objDestinacao.OBSERVACAO          := 'Processado no WMS | WMS Msg: LPN '+ codLPN + ' Destinada com sucesso';

      iIntegracao := GetIintegracaoWMS();
      msgRetorno  := iIntegracao.SetDestinacao(objDestinacao);

      msgRetorno := '<?xml version="1.0" encoding="ISO-8859-1"?>' + msgRetorno;
      iXML          := NewXMLDocument;
      iXML.XML.Text := msgRetorno;
      iXML.Active   := True;

      sID      := iXML.DocumentElement.ChildNodes[0].Text;
      sSucesso := iXML.DocumentElement.ChildNodes[1].Text;
      sObs     := iXML.DocumentElement.ChildNodes[2].Text;

      if (StrToIntDef(sID,0) <= 0) or (sSucesso = 'N') then
        Result := False;

      msgRetorno := sObs;

    finally
      objDestinacao.Free;
    end;
  except
    on E:Exception do
    begin
      Result := False;
    end;
  end;
end;

function EncerramentoLote(const codBloqueioWeb, codDestinacao, codLocalBloqueio, codLPN: string;
                            var msgRetorno: String): Boolean;
var
  objEncerramento     : DataBloqueioDest2;
  iIntegracao         : IintegracaoWMS;
  iXML                : IXMLDocument;
  sID, sSucesso, sObs : String;
begin
  Result:= True;
  try
    try
      objEncerramento  := DataBloqueioDest2.Create;
      objEncerramento.COD_BLOQUEIO_WEB    := codBloqueioWeb;
      objEncerramento.COD_DESTINACAO      := codDestinacao;
      objEncerramento.COD_LOCAL_BLOQUEIO  := codLocalBloqueio;
      objEncerramento.OBSERVACAO          := 'Processado no WMS | WMS Msg: LPN '+ codLPN + ' Finalizada com sucesso';

      iIntegracao := GetIintegracaoWMS();
      msgRetorno  := iIntegracao.SetFinalizacao(objEncerramento);

      msgRetorno := '<?xml version="1.0" encoding="ISO-8859-1"?>' + msgRetorno;
      iXML          := NewXMLDocument;
      iXML.XML.Text := msgRetorno;
      iXML.Active   := True;

      sID      := iXML.DocumentElement.ChildNodes[0].Text;
      sSucesso := iXML.DocumentElement.ChildNodes[1].Text;
      sObs     := iXML.DocumentElement.ChildNodes[2].Text;

      if (StrToIntDef(sID,0) <= 0) or (sSucesso = 'N') then
        Result := False;

      msgRetorno := sObs + ' Sucesso: ' + sSucesso + ' - ID: ' + sID;

    finally
      objEncerramento.Free;
    end;
  except
    on E:Exception do
    begin
      Result := False;
    end;
  end;
end;

end.
