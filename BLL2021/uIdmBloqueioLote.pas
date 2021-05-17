// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://www.egisnet.com.br/webservice/ServidorISAPI.dll/wsdl/IdmBloqueioLote
//  >Import : http://www.egisnet.com.br/webservice/ServidorISAPI.dll/wsdl/IdmBloqueioLote>0
// Version  : 1.0
// (04/05/2021 16:06:41 - - $Rev: 101104 $)
// ************************************************************************ //

unit uIdmBloqueioLote;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns, SOAPMidas;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]


  // ************************************************************************ //
  // Namespace : urn:udmBloqueioLote-IdmBloqueioLote
  // soapAction: urn:udmBloqueioLote-IdmBloqueioLote#envioLaudoXML
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // use       : encoded
  // binding   : IdmBloqueioLotebinding
  // service   : IdmBloqueioLoteservice
  // port      : IdmBloqueioLotePort
  // URL       : http://www.egisnet.com.br/webservice/ServidorISAPI.dll/soap/IdmBloqueioLote
  // ************************************************************************ //
  IdmBloqueioLote = interface(IAppServerSOAP)
  ['{EE8B6287-61A4-E9BB-0454-7992889F81B0}']
    function  envioLaudoXML(const arquivo: string): string; stdcall;
  end;



implementation
  uses System.SysUtils;

initialization
  { IdmBloqueioLote }
  InvRegistry.RegisterInterface(TypeInfo(IdmBloqueioLote), 'urn:udmBloqueioLote-IdmBloqueioLote', '');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IdmBloqueioLote), 'urn:udmBloqueioLote-IdmBloqueioLote#envioLaudoXML');

end.