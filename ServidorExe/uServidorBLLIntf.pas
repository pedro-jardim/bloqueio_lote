{ Invokable interface IServidorBLL }

unit uServidorBLLIntf;

interface

uses
  Soap.InvokeRegistry, System.Types, Soap.XSBuiltIns,
  Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc;

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

  { Invokable interfaces must derive from IInvokable }
  IServidorBLL = interface(IInvokable)
  ['{B97FBB36-3194-4055-A5AF-791B416110EA}']
    function mensagemBoasVindas: String; stdcall;
    function envioLaudoLoteBloqueado(const arquivo: WideString): WideString; stdcall;
    function envioEncerramentoLote(const arquivo: WideString): WideString; stdcall;
    function exibeMensagem(const msg: WideString): WideString; stdcall;
    function retornoImediato(const arquivo: WideString): String; stdcall;
    { Methods of Invokable interface must not use the default }
    { calling convention; stdcall is recommended }
  end;

implementation

initialization
  { Invokable interfaces must be registered }
  InvRegistry.RegisterInterface(TypeInfo(IServidorBLL));

end.
