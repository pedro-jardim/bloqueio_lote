Unit udmBloqueioLote;

interface

uses SysUtils, Classes, InvokeRegistry, Midas, SOAPMidas, SOAPDm,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Phys.ODBCBase, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TRetorno = class(TRemotable)
  private
    FID: UnicodeString;
    FSucesso: UnicodeString;
    FMensagem: UnicodeString;
  published
    property id: UnicodeString       read FID       write FID;
    property sucesso: UnicodeString  read FSucesso  write FSucesso;
    property mensagem: UnicodeString read FMensagem write FMensagem;
  end;

  IdmBloqueioLote = interface(IInvokable)
    ['{192F05A7-37AF-4EEB-9DDB-604CA1E6BF01}']
    function envioLaudoXML(const arquivo: WideString): TRetorno; stdcall;
  end;

  TdmBloqueioLote = class(TSoapDataModule, IdmBloqueioLote, IAppServerSOAP, IAppServer)
    FDConnection: TFDConnection;
    qryTeste: TFDQuery;
    MSSQLDriverLink: TFDPhysMSSQLDriverLink;
    stpGeraBloqueioLote: TFDStoredProc;
    stpGeraBloqueioLoteItens: TFDStoredProc;
    stpGeraBloqueioLotecd_bloqueio_lote: TIntegerField;
    procedure SoapDataModuleDestroy(Sender: TObject);
  private

  public
    function envioLaudoXML(const arquivo: WideString): TRetorno; stdcall;
  end;

implementation

uses
  Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc;

{$R *.DFM}

procedure TdmBloqueioLoteCreateInstance(out obj: TObject);
begin
 obj := TdmBloqueioLote.Create(nil);
end;

function TdmBloqueioLote.envioLaudoXML(const arquivo: WideString): TRetorno;
var
  lxml, lxmlRetorno, lxmlRetornoErro : IXMLDocument;
  lNodeIdentificacao, lNodeInspecao, lNodeItens,
  lNodeItem, lNodeRetorno, lNodeRetornoErro : IXMLNode;
  i, x : integer;
  lValido : Boolean;
  cd_bloqueio : Integer;
  nm_oper, id : String;
  listaLPN : TStringList;
begin

  lValido := True;

  Result := TRetorno.Create;

  listaLPN := TStringList.Create;

  //-------------------------------------------------------------
  //-->> Valida o XML de Entrada
  //-------------------------------------------------------------
  try
    lxml          := NewXMLDocument;
    lxml.XML.Text := arquivo;
    lxml.Active   := True;
  except
    on E:Exception do
    begin
      lValido         := False;
      Result.id       := '0';
      Result.sucesso  := 'N';
      Result.mensagem := '(MSGWMS) Opera��o n�o Realizada - Erro na estrutura do XML! ' + E.Message;
    end;
  end;

  if lValido then
  begin
    //-------------------------------------------------------------
    //-->> Grava os Dados
    //-------------------------------------------------------------

    try
      with stpGeraBloqueioLote do
      begin
        Close;

        //-->> Guarda o node da Identifica��o
        lNodeIdentificacao := lxml.DocumentElement.ChildNodes['IDENTIFICACAO'];
        ParamByName('@cd_parametro').AsInteger       := 1;
        ParamByName('@cd_bloqueio_lote').AsInteger   := 0;
        ParamByName('@dt_bloqueio_lote').AsString    := '';
        ParamByName('@hr_bloqueio_lote').AsString    := '';
        ParamByName('@nm_identificador').AsString    := lNodeIdentificacao.ChildNodes['IDENTIFICADOR'].Text;
        if lNodeIdentificacao.ChildNodes['REQUISITANTE'].Text <> '' then
          ParamByName('@cd_requisitante').AsInteger     := StrToIntDef(lNodeIdentificacao.ChildNodes['REQUISITANTE'].Text,0);
        ParamByName('@nm_cnpj_requisitante').AsString := lNodeIdentificacao.ChildNodes['CNPJ_REQUISITANTE'].Text;
        if lNodeIdentificacao.ChildNodes['DESTINO'].Text <> '' then
          ParamByName('@cd_destino').AsInteger := StrToIntDef(lNodeIdentificacao.ChildNodes['DESTINO'].Text,0);
        ParamByName('@nm_cnpj_destino').AsString :=  lNodeIdentificacao.ChildNodes['CNPJ_DESTINO'].Text;
        ParamByName('@nm_xsd_validacao').AsString := lNodeIdentificacao.ChildNodes['XSDVALIDACAO'].Text;

        //-->> Guarda o node da Inspe��o
        lNodeInspecao := lxml.DocumentElement.ChildNodes['DADOSXML'].ChildNodes['INSPECAO'];
        if lNodeInspecao.ChildNodes['CENTRO_ORIGEM'].Text <> '' then
          ParamByName('@cd_centro_origem').AsInteger := StrToIntDef(lNodeInspecao.ChildNodes['CENTRO_ORIGEM'].Text,0);

        //-->> Guarda o node de Itens
        lNodeItens := lNodeInspecao.ChildNodes['ITENS'];
        nm_oper    := lNodeItens.Attributes['IDENT_OPER'];
        ParamByName('@nm_ident_oper').AsString := nm_oper;
        ParamByName('@nm_laudo_bloqueio').AsString := lNodeItens.Attributes['NUM_LAUDO_BLOQUEIO'];

        //-->> Salva o XML
        ParamByName('@ds_arquivo_xml').AsMemo := lxml.XML.Text;

        //--> Executa a Procedure apenas na Add
        cd_bloqueio := 0;
        if nm_oper = 'add' then
        begin
          Open;
          cd_bloqueio := stpGeraBloqueioLotecd_bloqueio_lote.AsInteger;
        end;
      end;

      with stpGeraBloqueioLoteItens do
      begin

        listaLPN.Clear;

        for i := 0 to lNodeItens.ChildNodes.Count - 1 do
        begin
          Close;
          //-->> Guarda o node do Item
          lNodeItem := lNodeItens.ChildNodes.Get(i);

          ParamByName('@cd_parametro').AsInteger          := 3;
          ParamByName('@cd_bloqueio_lote').AsInteger      := cd_bloqueio;
          ParamByName('@cd_item_bloqueio_lote').AsInteger := 0;
          ParamByName('@nm_ident_oper').AsString          := nm_oper;
          if lNodeItem.ChildNodes['COD_BLOQUEIO_WEB'].Text <> '' then
            ParamByName('@cd_bloqueio_web').AsInteger     := StrToIntDef(lNodeItem.ChildNodes['COD_BLOQUEIO_WEB'].Text,0);
          ParamByName('@nm_sku').AsString                 := lNodeItem.ChildNodes['SKU'].Text;
          ParamByName('@nm_descricao').AsString           := lNodeItem.ChildNodes['DESCRICAO'].Text;
          ParamByName('@nm_categoria').AsString           := lNodeItem.ChildNodes['CATEGORIA'].Text;
          ParamByName('@nm_divisao').AsString             := lNodeItem.ChildNodes['DIVISAO'].Text;
          ParamByName('@dt_fabricacao').AsString          := lNodeItem.ChildNodes['DH_FABRICACAO'].Text;
          ParamByName('@dt_vencimento').AsString          := lNodeItem.ChildNodes['DH_VENCIMENTO'].Text;
          if lNodeItem.ChildNodes['QTD_CAIXAS'].Text <> '' then
            ParamByName('@qt_caixa').AsInteger            := StrToIntDef(lNodeItem.ChildNodes['QTD_CAIXAS'].Text,0);
          if lNodeItem.ChildNodes['QTD_PRODUTOS'].Text <> '' then
            ParamByName('@qt_produto').AsInteger          := StrToIntDef(lNodeItem.ChildNodes['QTD_PRODUTOS'].Text,0);
          ParamByName('@nm_cod_lpn').AsString             := lNodeItem.ChildNodes['COD_LPN'].Text;
          ParamByName('@dt_bloqueio').AsString            := lNodeItem.ChildNodes['DH_BLOQUEIO'].Text;
          ParamByName('@nm_codigo_motivo').AsString       := lNodeItem.ChildNodes['CODIGO_MOTIVO'].Text;
          ParamByName('@nm_descricao_motivo').AsString    := lNodeItem.ChildNodes['DESCRICAO_MOTIVO'].Text;
          ParamByName('@nm_solicitante_motivo').AsString  := lNodeItem.ChildNodes['SOLICITANTE_BLOQUEIO'].Text;
          ExecProc;
        end;

      end;

    except
      on E:Exception do
      begin
        lValido := false;
        lValido         := False;
        Result.id       := '0';
        Result.sucesso  := 'N';
        Result.mensagem := '(MSGWMS) Opera��o n�o Realizada - Erro na grava��o dos Dados! ' + E.Message;
      end;
    end;

  end;

  if lValido then
  begin

    //-------------------------------------------------------------
    //-->> Retorno de Sucesso
    //-------------------------------------------------------------
    id := '';
    if cd_bloqueio = 0 then
      id := '-1'
    else
      id := IntToStr(cd_bloqueio);

    Result.id       := id;
    Result.sucesso  := 'S';
    Result.mensagem := '(MSGWMS) Opera��o Realizada com Sucesso!';

  end;

end;

procedure TdmBloqueioLote.SoapDataModuleDestroy(Sender: TObject);
begin
  FDConnection.Connected := False;
end;

initialization
   InvRegistry.RegisterInvokableClass(TdmBloqueioLote, TdmBloqueioLoteCreateInstance);
   InvRegistry.RegisterInterface(TypeInfo(IdmBloqueioLote));
end.
