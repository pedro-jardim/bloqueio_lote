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
begin

  lValido := True;

  Result := TRetorno.Create;

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
      Result.mensagem := '(MSGWMS) Operação não Realizada - Erro na estrutura do XML! ' + E.Message;
    end;
  end;

  if lValido then
  begin

    //-------------------------------------------------------------
    //-->> Grava os Dados
    //-------------------------------------------------------------
    with qryTeste do
    begin
      close;
      ParamByName('nm_arquivo').AsMemo := arquivo;
      try
        ExecSQL;
      except
        on E:Exception do
        begin
          lValido         := False;
          Result.id       := '0';
          Result.sucesso  := 'N';
          Result.mensagem := '(MSGWMS) Operação não Realizada - Erro na estrutura do XML! ' + E.Message;
        end;
      end;
      Close;
    end;

  end;

  if lValido then
  begin

    //-------------------------------------------------------------
    //-->> Retorno de Sucesso
    //-------------------------------------------------------------
    Result.id       := '1234';
    Result.sucesso  := 'S';
    Result.mensagem := '(MSGWMS) Operação Realizada com Sucesso!';

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
