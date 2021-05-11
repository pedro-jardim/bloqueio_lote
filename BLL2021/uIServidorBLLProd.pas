// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://www.egisnet.com.br/webservice/ServidorISAPI.dll/wsdl/IServidorBLL
// Version  : 1.0
// (03/05/2021 23:57:26 - - $Rev: 101104 $)
// ************************************************************************ //

unit uIServidorBLLProd;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[]


  // ************************************************************************ //
  // Namespace : urn:uServidorBLLIntf-IServidorBLL
  // soapAction: urn:uServidorBLLIntf-IServidorBLL#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // use       : encoded
  // binding   : IServidorBLLbinding
  // service   : IServidorBLLservice
  // port      : IServidorBLLPort
  // URL       : http://www.egisnet.com.br/webservice/ServidorISAPI.dll/soap/IServidorBLL
  // ************************************************************************ //
  IServidorBLLProd = interface(IInvokable)
  ['{1E8977EB-0876-E722-950F-BFD038A93DFF}']
    function  mensagemBoasVindas: string; stdcall;
    function  envioLaudoLoteBloqueado(const xml: string): string; stdcall;
    function  envioEncerramentoLote(const xml: string): string; stdcall;
  end;

function GetIServidorBLL(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IServidorBLLProd;


implementation
  uses System.SysUtils;

function GetIServidorBLL(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IServidorBLLProd;
const
  defWSDL = 'http://www.egisnet.com.br/webservice/ServidorISAPI.dll/wsdl/IServidorBLL';
  defURL  = 'http://www.egisnet.com.br/webservice/ServidorISAPI.dll/soap/IServidorBLL';
  defSvc  = 'IServidorBLLservice';
  defPrt  = 'IServidorBLLPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as IServidorBLLProd);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  { IServidorBLL }
  InvRegistry.RegisterInterface(TypeInfo(IServidorBLLProd), 'urn:uServidorBLLIntf-IServidorBLL', '');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IServidorBLLProd), 'urn:uServidorBLLIntf-IServidorBLL#%operationName%');

end.