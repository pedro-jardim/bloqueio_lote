{ Invokable implementation File for TServidorBLL which implements IServidorBLL }

unit uServidorBLLImpl;

interface

uses
  Soap.InvokeRegistry, System.Types, Soap.XSBuiltIns, uServidorBLLIntf, System.Classes,
  System.SysUtils,
  udmBloqueioLote,
  Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc;
type

  { TServidorBLL }
  TServidorBLL = class(TInvokableClass, IServidorBLL)
  public
    function mensagemBoasVindas: String; stdcall;
    function envioLaudoLoteBloqueado(const arquivo: WideString): WideString; stdcall;
    function envioEncerramentoLote(const arquivo: WideString): WideString; stdcall;
    function exibeMensagem(const msg: WideString): WideString; stdcall;
    function retornoImediato(const arquivo: WideString): String; stdcall;
  end;

implementation

{ TServidorBLL }

function TServidorBLL.envioEncerramentoLote(const arquivo: WideString): WideString;
var
  lxml : IXMLDocument;
  lNodeListaProdutos, lNodeProduto, lNode: IXMLNode;
begin
  lxml := NewXMLDocument;

  lxml.XML.Text := arquivo;
  lxml.Active := True;
  lxml.SaveToFile('C:\Pedro\Arquivo.xml');

  lxml := NewXMLDocument;
  lNodeListaProdutos := lxml.AddChild('ListaProdutos');
  lNodeProduto := lNodeListaProdutos.AddChild('Produto');
  lNodeProduto.AddChild('Nome').Text := 'Feij�o';
  lNodeProduto.AddChild('Valor').Text := '5.99';
  lNodeProduto := lNodeListaProdutos.AddChild('Produto');
  lNodeProduto.AddChild('Nome').Text := 'Arroz';
  lNodeProduto.AddChild('Valor').Text := '30.00';
  //Result := lxml.XML.Text;
end;

function TServidorBLL.envioLaudoLoteBloqueado(const arquivo: WideString): WideString;
var
  lxml, lxmlRetorno, lxmlRetornoErro : IXMLDocument;
  lNodeIdentificacao, lNodeInspecao, lNodeItens,
  lNodeItem, lNodeRetorno, lNodeRetornoErro : IXMLNode;
  i, x : integer;
  dm : IdmBloqueioLote;
begin

  try
    lxml := NewXMLDocument;
    lxml.XML.Text := arquivo;
    lxml.Active := True;
  except
    on E:Exception do
    begin
      lxmlRetornoErro  := NewXMLDocument;
      lNodeRetornoErro := lxmlRetornoErro.AddChild('Retorno');
      lNodeRetornoErro.AddChild('id').Text       := '0';
      lNodeRetornoErro.AddChild('Sucesso').Text  := 'N';
      lNodeRetornoErro.AddChild('mensagem').Text := '(MSGWMS) Opera��o n�o Realizada - Erro na estrutura do XML! ' + E.Message;
      Result := lxmlRetornoErro.XML.Text;
      Exit;
    end;
  end;

  //-->> Guarda o node da Identifica��o
  //lNodeIdentificacao := lxml.DocumentElement.ChildNodes['IDENTIFICACAO'];
  {
  if not dm.insereXML(arquivo) then
  begin
    lxmlRetornoErro  := NewXMLDocument;
    lNodeRetornoErro := lxmlRetornoErro.AddChild('Retorno');
    lNodeRetornoErro.AddChild('id').Text       := '0';
    lNodeRetornoErro.AddChild('Sucesso').Text  := 'N';
    lNodeRetornoErro.AddChild('mensagem').Text := '(MSGWMS) Opera��o n�o Realizada - Erro ao Gravar os Dados! ' + E.Message;
    Result := lxmlRetornoErro.XML.Text;
    Exit;
  end;
  }

  //memTeste.Lines.Text := lNodeIdentificacao.XML;
  { Incluir no DataSet
  edtIdentificador.Text    := lNodeIdentificacao.ChildNodes['IDENTIFICADOR'].Text;
  edtRequisitante.Text     := lNodeIdentificacao.ChildNodes['REQUISITANTE'].Text;
  edtCNPJRequisitante.Text := lNodeIdentificacao.ChildNodes['CNPJ_REQUISITANTE'].Text;
  edtDestino.Text          := lNodeIdentificacao.ChildNodes['DESTINO'].Text;
  edtCNPJDestino.Text      := lNodeIdentificacao.ChildNodes['CNPJ_DESTINO'].Text;
  edtXSDValidacao.Text     := lNodeIdentificacao.ChildNodes['XSDVALIDACAO'].Text;
  }

  //-->> Guarda o node da Inspe��o
  //lNodeInspecao := lxml.DocumentElement.ChildNodes['DADOSXML'].ChildNodes['INSPECAO'];

  {Incuir no DataSet
  edtCentroOrigem.Text := lNodeInspecao.ChildNodes['CENTRO_ORIGEM'].Text;
  }

  //-->> Guarda o node de Itens
  //lNodeItens := lNodeInspecao.ChildNodes['ITENS'];
  {Incuir no DataSet
  edtOperacao.Text := lNodeItens.Attributes['IDENT_OPER'];
  edtLaudo.Text := lNodeItens.Attributes['NUM_LAUDO_BLOQUEIO'];
  }

  //-->> Itens
  {
  for i := 0 to lNodeItens.ChildNodes.Count - 1 do
  begin
    lNodeItem := lNodeItens.ChildNodes.Get(i);

    { Incluir no DataSet
    cdsBloqueio.FieldByName('DESCRICAO').AsString := lNodeItem.ChildNodes[i].Text;

  end;
  }

  //-->>Gera Retorno
  lxmlRetorno  := NewXMLDocument;
  lNodeRetorno := lxmlRetorno.AddChild('Retorno');
  lNodeRetorno.AddChild('id').Text       := '1234';
  lNodeRetorno.AddChild('Sucesso').Text  := 'S';
  lNodeRetorno.AddChild('mensagem').Text := '(MSGWMS) Opera��o Realizada com Sucesso!';

  Result := lxmlRetorno.XML.Text;

end;

function TServidorBLL.exibeMensagem(const msg: WideString): WideString;
var
  ixml : IXMLDocument;
  lNode : IXMLNode;
begin
  ixml := NewXMLDocument;
  lNode := ixml.AddChild('Retorno');
  lNode.AddChild('id').Text       := '1234';
  lNode.AddChild('Sucesso').Text  := 'S';
  lNode.AddChild('mensagem').Text := '(MSGWMS) Opera��o Realizada com Sucesso!';
  Result := ixml.XML.Text;
end;

function TServidorBLL.mensagemBoasVindas: String;
begin
  Result := 'Servidor SOAP da GBS';
end;

function TServidorBLL.retornoImediato(const arquivo: WideString): String;
begin
  Result := 'OK';
  {
  Result := TRetorno.Create;
  Result.id       := '1234';
  Result.sucesso  := 'S';
  Result.mensagem := '(MSGWS) Opera��o Realizada com Sucesso!';
  }
end;

initialization
{ Invokable classes must be registered }
   InvRegistry.RegisterInvokableClass(TServidorBLL);
end.

