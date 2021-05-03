{ Invokable implementation File for TServidorBLL which implements IServidorBLL }

unit uServidorBLLImpl;

interface

uses
  Soap.InvokeRegistry, System.Types, Soap.XSBuiltIns, uServidorBLLIntf, System.Classes,
  WebModuleUnit;
type

  { TServidorBLL }
  TServidorBLL = class(TInvokableClass, IServidorBLL)
  public
    function mensagemBoasVindas: String;
    function envioLaudoLoteBloqueado(const xml: WideString): WideString;
    function envioEncerramentoLote(const xml: WideString):WideString;
  end;

implementation

uses
  Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc;

{ TServidorBLL }

function TServidorBLL.envioEncerramentoLote(const xml: WideString): WideString;
var
  lxml : IXMLDocument;
  lNodeListaProdutos, lNodeProduto, lNode: IXMLNode;
begin
  lxml := NewXMLDocument;

  lxml.XML.Text := xml;
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
  Result := lxml.XML.Text;
end;

function TServidorBLL.envioLaudoLoteBloqueado(const xml: WideString): WideString;
var
  lxml : IXMLDocument;
  lNodeIdentificacao, lNodeInspecao, lNodeItens, lNodeItem : IXMLNode;
  i, x : integer;
begin

  lxml := NewXMLDocument;
  lxml.XML.Text := xml;
  lxml.Active := True;

  //-->> Guarda o node da Identifica��o
  lNodeIdentificacao := lxml.DocumentElement.ChildNodes['IDENTIFICACAO'];

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
  lNodeInspecao := lxml.DocumentElement.ChildNodes['DADOSXML'].ChildNodes['INSPECAO'];

  {Incuir no DataSet
  edtCentroOrigem.Text := lNodeInspecao.ChildNodes['CENTRO_ORIGEM'].Text;
  }

  //-->> Guarda o node de Itens
  lNodeItens := lNodeInspecao.ChildNodes['ITENS'];
  {Incuir no DataSet
  edtOperacao.Text := lNodeItens.Attributes['IDENT_OPER'];
  edtLaudo.Text := lNodeItens.Attributes['NUM_LAUDO_BLOQUEIO'];
  }

  //-->> Itens
  for i := 0 to lNodeItens.ChildNodes.Count - 1 do
  begin
    lNodeItem := lNodeItens.ChildNodes.Get(i);

    { Incluir no DataSet
    cdsBloqueio.FieldByName('DESCRICAO').AsString := lNodeItem.ChildNodes[i].Text;
    }
  end;


end;

function TServidorBLL.mensagemBoasVindas: String;
begin
  Result := 'Servidor SOAP da GBS';
end;

initialization
{ Invokable classes must be registered }
   InvRegistry.RegisterInvokableClass(TServidorBLL);
end.

