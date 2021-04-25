unit uBloqueioLote;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB, Datasnap.DBClient,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmBloqueioLote = class(TForm)
    ScrollBox1: TScrollBox;
    OpenDialog: TOpenDialog;
    XMLDocument: TXMLDocument;
    Panel1: TPanel;
    Label1: TLabel;
    edtDirXML: TButtonedEdit;
    btnAbrirXML: TButton;
    PageControl: TPageControl;
    Panel2: TPanel;
    btnSair: TButton;
    tabArquivo: TTabSheet;
    memoArquivo: TMemo;
    tabDados: TTabSheet;
    ScrollBox2: TScrollBox;
    cdsBloqueio: TClientDataSet;
    dsBloqueio: TDataSource;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edtIdentificador: TEdit;
    edtRequisitante: TEdit;
    Label4: TLabel;
    edtCNPJRequisitante: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edtDestino: TEdit;
    edtCNPJDestino: TEdit;
    Label7: TLabel;
    edtXSDValidacao: TEdit;
    GroupBox2: TGroupBox;
    memTeste: TMemo;
    GroupBox3: TGroupBox;
    Panel3: TPanel;
    Label8: TLabel;
    edtCentroOrigem: TEdit;
    ListBox1: TListBox;
    Label9: TLabel;
    DBGrid1: TDBGrid;
    cdsBloqueioDESCRICAO: TStringField;
    procedure btnAbrirXMLClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
    procedure AbrirXML;
    procedure MostrarDadosXML;
  public
    { Public declarations }
  end;

var
  frmBloqueioLote: TfrmBloqueioLote;

implementation

{$R *.dfm}

procedure TfrmBloqueioLote.AbrirXML;
begin
  memoArquivo.Lines.Clear;
  memoArquivo.Lines := XMLDocument.XML;
end;

procedure TfrmBloqueioLote.btnAbrirXMLClick(Sender: TObject);
var
  lFileName : String;
begin
  if edtDirXML.Text = '' then
  begin
    with OpenDialog do
    begin
      DefaultExt := '.xml';
      InitialDir := 'C:\Pedro\Projetos\GBS\GNSF';
      Title := 'Selecione o XML do Bloqueio';
      if Execute then
        edtDirXML.Text := FileName;
    end;
  end;

  lFileName := edtDirXML.Text;

  //--> Valida o Diret�rio
  if not FileExists(lFileName) then
  begin
    Showmessage('N�o existe o arquivo informado');
    edtDirXML.SetFocus;
    Abort;
  end;

  //--> Valida se o arquivo selecionado � um XML
  if ExtractFileExt(lFileName) <> '.xml' then
  begin
    Showmessage('Selecionar um arquivo XML');
    edtDirXML.SetFocus;
    Abort;
  end;

  //-->Atribui o arquivo XML para o XMLDocument
  XMLDocument.LoadFromFile(lFileName);

  AbrirXML;

  MostrarDadosXML;

end;

procedure TfrmBloqueioLote.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBloqueioLote.MostrarDadosXML;
var
  lNodeIdentificacao, lNodeInspecao, lNodeItens, lNodeItem : IXMLNode;
  i, x : integer;
begin
  memTeste.Lines.Clear;
  memTeste.Lines.Add('------------------------------');

  //-->> Guarda o node da Identifica��o
  lNodeIdentificacao := XMLDocument.DocumentElement.ChildNodes['IDENTIFICACAO'];

  //memTeste.Lines.Text := lNodeIdentificacao.XML;
  edtIdentificador.Text    := lNodeIdentificacao.ChildNodes['IDENTIFICADOR'].Text;
  edtRequisitante.Text     := lNodeIdentificacao.ChildNodes['REQUISITANTE'].Text;
  edtCNPJRequisitante.Text := lNodeIdentificacao.ChildNodes['CNPJ_REQUISITANTE'].Text;
  edtDestino.Text          := lNodeIdentificacao.ChildNodes['DESTINO'].Text;
  edtCNPJDestino.Text      := lNodeIdentificacao.ChildNodes['CNPJ_DESTINO'].Text;
  edtCNPJDestino.Text      := lNodeIdentificacao.ChildNodes['XSDVALIDACAO'].Text;

  //-->> Guarda o node da Inspe��o
  lNodeInspecao := XMLDocument.DocumentElement.ChildNodes['DADOSXML'].ChildNodes['INSPECAO'];
  edtCentroOrigem.Text := lNodeInspecao.ChildNodes['CENTRO_ORIGEM'].Text;

  //-->> Guarda o node de Itens
  lNodeItens := lNodeInspecao.ChildNodes['ITENS'];
  memTeste.Lines.Text := lNodeItens.XML;

  try
    if cdsBloqueio.Active then
      cdsBloqueio.Close;
    cdsBloqueio.CreateDataSet;
    cdsBloqueio.Open;
    for i := 0 to lNodeItens.ChildNodes.Count - 1 do
    begin
      lNodeItem := lNodeItens.ChildNodes.Get(i);
      cdsBloqueio.Insert;
      cdsBloqueio.FieldByName('DESCRICAO').AsString := lNodeItem.ChildNodes[i].Text;
      cdsBloqueio.Post;
    end;
  finally

  end;


{
  for i := 0 to XMLDocument.DocumentElement.ChildNodes.Count - 1 do
  begin
    //-->> Guarda o node da Identifica��o
    if XMLDocument.DocumentElement.ChildNodes.Get(i).NodeName = 'IDENTIFICACAO' then
    begin
      lNodeIdentificacao := XMLDocument.DocumentElement.ChildNodes.Get(i);
      //memTeste.Lines.Text := lNodeIdentificacao.XML;

      edtIdentificador.Text    := lNodeIdentificacao.ChildNodes['IDENTIFICADOR'].Text;
      edtRequisitante.Text     := lNodeIdentificacao.ChildNodes['REQUISITANTE'].Text;
      edtCNPJRequisitante.Text := lNodeIdentificacao.ChildNodes['CNPJ_REQUISITANTE'].Text;
      edtDestino.Text          := lNodeIdentificacao.ChildNodes['DESTINO'].Text;
      edtCNPJDestino.Text      := lNodeIdentificacao.ChildNodes['CNPJ_DESTINO'].Text;
      edtCNPJDestino.Text      := lNodeIdentificacao.ChildNodes['XSDVALIDACAO'].Text;
    end;

    if XMLDocument.DocumentElement.ChildNodes.Get(i).NodeName = 'DADOSXML' then
    begin
      //-->> Guarda o node da Inspe��o
      lNodeInspecao := XMLDocument.DocumentElement.ChildNodes.Get(i).ChildNodes.First;

      edtCentroOrigem.Text := lNodeInspecao.ChildNodes['CENTRO_ORIGEM'].Text;

      lNodeItens := lNodeInspecao.ChildNodes['ITENS'];
      memTeste.Lines.Text := lNodeItens.XML;

    end;

  end;
}

end;

end.
