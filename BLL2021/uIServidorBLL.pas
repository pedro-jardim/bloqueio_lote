// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:8080/wsdl/IServidorBLL
// Version  : 1.0
// (26/04/2021 21:50:53 - - $Rev: 96726 $)
// ************************************************************************ //

unit uIServidorBLL;

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
  // URL       : http://localhost:8080/soap/IServidorBLL
  // ************************************************************************ //
  IServidorBLL = interface(IInvokable)
  ['{1E8977EB-0876-E722-950F-BFD038A93DFF}']
    function  mensagemBoasVindas: string; stdcall;
    function  envioLaudoLoteBloqueado(const xml: string): string; stdcall;
    function  envioEncerramentoLote(const xml: string): string; stdcall;
  end;

function GetIServidorBLL(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IServidorBLL;


implementation
  uses System.SysUtils;

function GetIServidorBLL(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IServidorBLL;
const
  defWSDL = 'http://localhost:8080/wsdl/IServidorBLL';
  defURL  = 'http://localhost:8080/soap/IServidorBLL';
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
    Result := (RIO as IServidorBLL);
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
  InvRegistry.RegisterInterface(TypeInfo(IServidorBLL), 'urn:uServidorBLLIntf-IServidorBLL', '');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IServidorBLL), 'urn:uServidorBLLIntf-IServidorBLL#%operationName%');

end.