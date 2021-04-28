// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://bloqueio-bra-unilever-hml.opscontent.com.br/BloqueioService/ServiceIntegracaoWMS.svc?singleWsdl
//  >Import : http://bloqueio-bra-unilever-hml.opscontent.com.br/BloqueioService/ServiceIntegracaoWMS.svc?singleWsdl>0
//  >Import : http://bloqueio-bra-unilever-hml.opscontent.com.br/BloqueioService/ServiceIntegracaoWMS.svc?singleWsdl>1
//  >Import : http://bloqueio-bra-unilever-hml.opscontent.com.br/BloqueioService/ServiceIntegracaoWMS.svc?singleWsdl>2
// Encoding : utf-8
// Version  : 1.0
// (27/04/2021 23:20:03 - - $Rev: 101104 $)
// ************************************************************************ //

unit uServiceIntegracaoWMS;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_NLBL = $0004;
  IS_REF  = $0080;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]

  DataBloqueioDest2    = class;                 { "http://schemas.datacontract.org/2004/07/wcfIntegracaoWMS"[GblCplx] }
  DataBloqueioDest     = class;                 { "http://schemas.datacontract.org/2004/07/wcfIntegracaoWMS"[GblElm] }
  DataBloqueio2        = class;                 { "http://schemas.datacontract.org/2004/07/wcfIntegracaoWMS"[GblCplx] }
  DataBloqueio         = class;                 { "http://schemas.datacontract.org/2004/07/wcfIntegracaoWMS"[GblElm] }



  // ************************************************************************ //
  // XML       : DataBloqueioDest, global, <complexType>
  // Namespace : http://schemas.datacontract.org/2004/07/wcfIntegracaoWMS
  // ************************************************************************ //
  DataBloqueioDest2 = class(TRemotable)
  private
    FCOD_BLOQUEIO_WEB: string;
    FCOD_BLOQUEIO_WEB_Specified: boolean;
    FCOD_DESTINACAO: string;
    FCOD_DESTINACAO_Specified: boolean;
    FCOD_LOCAL_BLOQUEIO: string;
    FCOD_LOCAL_BLOQUEIO_Specified: boolean;
    FOBSERVACAO: string;
    FOBSERVACAO_Specified: boolean;
    procedure SetCOD_BLOQUEIO_WEB(Index: Integer; const Astring: string);
    function  COD_BLOQUEIO_WEB_Specified(Index: Integer): boolean;
    procedure SetCOD_DESTINACAO(Index: Integer; const Astring: string);
    function  COD_DESTINACAO_Specified(Index: Integer): boolean;
    procedure SetCOD_LOCAL_BLOQUEIO(Index: Integer; const Astring: string);
    function  COD_LOCAL_BLOQUEIO_Specified(Index: Integer): boolean;
    procedure SetOBSERVACAO(Index: Integer; const Astring: string);
    function  OBSERVACAO_Specified(Index: Integer): boolean;
  published
    property COD_BLOQUEIO_WEB:   string  Index (IS_OPTN or IS_NLBL) read FCOD_BLOQUEIO_WEB write SetCOD_BLOQUEIO_WEB stored COD_BLOQUEIO_WEB_Specified;
    property COD_DESTINACAO:     string  Index (IS_OPTN or IS_NLBL) read FCOD_DESTINACAO write SetCOD_DESTINACAO stored COD_DESTINACAO_Specified;
    property COD_LOCAL_BLOQUEIO: string  Index (IS_OPTN or IS_NLBL) read FCOD_LOCAL_BLOQUEIO write SetCOD_LOCAL_BLOQUEIO stored COD_LOCAL_BLOQUEIO_Specified;
    property OBSERVACAO:         string  Index (IS_OPTN or IS_NLBL) read FOBSERVACAO write SetOBSERVACAO stored OBSERVACAO_Specified;
  end;



  // ************************************************************************ //
  // XML       : DataBloqueioDest, global, <element>
  // Namespace : http://schemas.datacontract.org/2004/07/wcfIntegracaoWMS
  // ************************************************************************ //
  DataBloqueioDest = class(DataBloqueioDest2)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : DataBloqueio, global, <complexType>
  // Namespace : http://schemas.datacontract.org/2004/07/wcfIntegracaoWMS
  // ************************************************************************ //
  DataBloqueio2 = class(TRemotable)
  private
    FCOD_ACAO: string;
    FCOD_ACAO_Specified: boolean;
    FCOD_BLOQUEIO_WEB: string;
    FCOD_BLOQUEIO_WEB_Specified: boolean;
    FCOD_LOCAL_BLOQUEIO: string;
    FCOD_LOCAL_BLOQUEIO_Specified: boolean;
    FEMAIL_USUARIO: string;
    FEMAIL_USUARIO_Specified: boolean;
    FOBSERVACAO: string;
    FOBSERVACAO_Specified: boolean;
    FQTDE_CAIXAS: string;
    FQTDE_CAIXAS_Specified: boolean;
    procedure SetCOD_ACAO(Index: Integer; const Astring: string);
    function  COD_ACAO_Specified(Index: Integer): boolean;
    procedure SetCOD_BLOQUEIO_WEB(Index: Integer; const Astring: string);
    function  COD_BLOQUEIO_WEB_Specified(Index: Integer): boolean;
    procedure SetCOD_LOCAL_BLOQUEIO(Index: Integer; const Astring: string);
    function  COD_LOCAL_BLOQUEIO_Specified(Index: Integer): boolean;
    procedure SetEMAIL_USUARIO(Index: Integer; const Astring: string);
    function  EMAIL_USUARIO_Specified(Index: Integer): boolean;
    procedure SetOBSERVACAO(Index: Integer; const Astring: string);
    function  OBSERVACAO_Specified(Index: Integer): boolean;
    procedure SetQTDE_CAIXAS(Index: Integer; const Astring: string);
    function  QTDE_CAIXAS_Specified(Index: Integer): boolean;
  published
    property COD_ACAO:           string  Index (IS_OPTN or IS_NLBL) read FCOD_ACAO write SetCOD_ACAO stored COD_ACAO_Specified;
    property COD_BLOQUEIO_WEB:   string  Index (IS_OPTN or IS_NLBL) read FCOD_BLOQUEIO_WEB write SetCOD_BLOQUEIO_WEB stored COD_BLOQUEIO_WEB_Specified;
    property COD_LOCAL_BLOQUEIO: string  Index (IS_OPTN or IS_NLBL) read FCOD_LOCAL_BLOQUEIO write SetCOD_LOCAL_BLOQUEIO stored COD_LOCAL_BLOQUEIO_Specified;
    property EMAIL_USUARIO:      string  Index (IS_OPTN or IS_NLBL) read FEMAIL_USUARIO write SetEMAIL_USUARIO stored EMAIL_USUARIO_Specified;
    property OBSERVACAO:         string  Index (IS_OPTN or IS_NLBL) read FOBSERVACAO write SetOBSERVACAO stored OBSERVACAO_Specified;
    property QTDE_CAIXAS:        string  Index (IS_OPTN or IS_NLBL) read FQTDE_CAIXAS write SetQTDE_CAIXAS stored QTDE_CAIXAS_Specified;
  end;



  // ************************************************************************ //
  // XML       : DataBloqueio, global, <element>
  // Namespace : http://schemas.datacontract.org/2004/07/wcfIntegracaoWMS
  // ************************************************************************ //
  DataBloqueio = class(DataBloqueio2)
  private
  published
  end;


  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // soapAction: http://tempuri.org/IintegracaoWMS/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // use       : literal
  // binding   : BasicHttpBinding_IintegracaoWMS
  // service   : BloqueioWebService
  // port      : BasicHttpBinding_IintegracaoWMS
  // URL       : http://bloqueio-bra-unilever-hml.opscontent.com.br/BloqueioService/ServiceIntegracaoWMS.svc
  // ************************************************************************ //
  IintegracaoWMS = interface(IInvokable)
  ['{2B05305A-78ED-B351-3DA3-8B71C1D55C3E}']
    function  SetBloqueio(const _data: DataBloqueio2): string; stdcall;
    function  SetDestinacao(const _data: DataBloqueioDest2): string; stdcall;
    function  SetFinalizacao(const _data: DataBloqueioDest2): string; stdcall;
  end;

function GetIintegracaoWMS(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IintegracaoWMS;


implementation
  uses System.SysUtils;

function GetIintegracaoWMS(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IintegracaoWMS;
const
  defWSDL = 'http://bloqueio-bra-unilever-hml.opscontent.com.br/BloqueioService/ServiceIntegracaoWMS.svc?singleWsdl';
  defURL  = 'http://bloqueio-bra-unilever-hml.opscontent.com.br/BloqueioService/ServiceIntegracaoWMS.svc';
  defSvc  = 'BloqueioWebService';
  defPrt  = 'BasicHttpBinding_IintegracaoWMS';
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
    Result := (RIO as IintegracaoWMS);
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


procedure DataBloqueioDest2.SetCOD_BLOQUEIO_WEB(Index: Integer; const Astring: string);
begin
  FCOD_BLOQUEIO_WEB := Astring;
  FCOD_BLOQUEIO_WEB_Specified := True;
end;

function DataBloqueioDest2.COD_BLOQUEIO_WEB_Specified(Index: Integer): boolean;
begin
  Result := FCOD_BLOQUEIO_WEB_Specified;
end;

procedure DataBloqueioDest2.SetCOD_DESTINACAO(Index: Integer; const Astring: string);
begin
  FCOD_DESTINACAO := Astring;
  FCOD_DESTINACAO_Specified := True;
end;

function DataBloqueioDest2.COD_DESTINACAO_Specified(Index: Integer): boolean;
begin
  Result := FCOD_DESTINACAO_Specified;
end;

procedure DataBloqueioDest2.SetCOD_LOCAL_BLOQUEIO(Index: Integer; const Astring: string);
begin
  FCOD_LOCAL_BLOQUEIO := Astring;
  FCOD_LOCAL_BLOQUEIO_Specified := True;
end;

function DataBloqueioDest2.COD_LOCAL_BLOQUEIO_Specified(Index: Integer): boolean;
begin
  Result := FCOD_LOCAL_BLOQUEIO_Specified;
end;

procedure DataBloqueioDest2.SetOBSERVACAO(Index: Integer; const Astring: string);
begin
  FOBSERVACAO := Astring;
  FOBSERVACAO_Specified := True;
end;

function DataBloqueioDest2.OBSERVACAO_Specified(Index: Integer): boolean;
begin
  Result := FOBSERVACAO_Specified;
end;

procedure DataBloqueio2.SetCOD_ACAO(Index: Integer; const Astring: string);
begin
  FCOD_ACAO := Astring;
  FCOD_ACAO_Specified := True;
end;

function DataBloqueio2.COD_ACAO_Specified(Index: Integer): boolean;
begin
  Result := FCOD_ACAO_Specified;
end;

procedure DataBloqueio2.SetCOD_BLOQUEIO_WEB(Index: Integer; const Astring: string);
begin
  FCOD_BLOQUEIO_WEB := Astring;
  FCOD_BLOQUEIO_WEB_Specified := True;
end;

function DataBloqueio2.COD_BLOQUEIO_WEB_Specified(Index: Integer): boolean;
begin
  Result := FCOD_BLOQUEIO_WEB_Specified;
end;

procedure DataBloqueio2.SetCOD_LOCAL_BLOQUEIO(Index: Integer; const Astring: string);
begin
  FCOD_LOCAL_BLOQUEIO := Astring;
  FCOD_LOCAL_BLOQUEIO_Specified := True;
end;

function DataBloqueio2.COD_LOCAL_BLOQUEIO_Specified(Index: Integer): boolean;
begin
  Result := FCOD_LOCAL_BLOQUEIO_Specified;
end;

procedure DataBloqueio2.SetEMAIL_USUARIO(Index: Integer; const Astring: string);
begin
  FEMAIL_USUARIO := Astring;
  FEMAIL_USUARIO_Specified := True;
end;

function DataBloqueio2.EMAIL_USUARIO_Specified(Index: Integer): boolean;
begin
  Result := FEMAIL_USUARIO_Specified;
end;

procedure DataBloqueio2.SetOBSERVACAO(Index: Integer; const Astring: string);
begin
  FOBSERVACAO := Astring;
  FOBSERVACAO_Specified := True;
end;

function DataBloqueio2.OBSERVACAO_Specified(Index: Integer): boolean;
begin
  Result := FOBSERVACAO_Specified;
end;

procedure DataBloqueio2.SetQTDE_CAIXAS(Index: Integer; const Astring: string);
begin
  FQTDE_CAIXAS := Astring;
  FQTDE_CAIXAS_Specified := True;
end;

function DataBloqueio2.QTDE_CAIXAS_Specified(Index: Integer): boolean;
begin
  Result := FQTDE_CAIXAS_Specified;
end;

initialization
  { IintegracaoWMS }
  InvRegistry.RegisterInterface(TypeInfo(IintegracaoWMS), 'http://tempuri.org/', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IintegracaoWMS), 'http://tempuri.org/IintegracaoWMS/%operationName%');
  InvRegistry.RegisterInvokeOptions(TypeInfo(IintegracaoWMS), ioDocument);
  { IintegracaoWMS.SetBloqueio }
  InvRegistry.RegisterMethodInfo(TypeInfo(IintegracaoWMS), 'SetBloqueio', '',
                                 '[ReturnName="SetBloqueioResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IintegracaoWMS), 'SetBloqueio', '_data', '',
                                '[Namespace="http://schemas.datacontract.org/2004/07/wcfIntegracaoWMS"]', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IintegracaoWMS), 'SetBloqueio', 'SetBloqueioResult', '',
                                '', IS_NLBL);
  { IintegracaoWMS.SetDestinacao }
  InvRegistry.RegisterMethodInfo(TypeInfo(IintegracaoWMS), 'SetDestinacao', '',
                                 '[ReturnName="SetDestinacaoResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IintegracaoWMS), 'SetDestinacao', '_data', '',
                                '[Namespace="http://schemas.datacontract.org/2004/07/wcfIntegracaoWMS"]', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IintegracaoWMS), 'SetDestinacao', 'SetDestinacaoResult', '',
                                '', IS_NLBL);
  { IintegracaoWMS.SetFinalizacao }
  InvRegistry.RegisterMethodInfo(TypeInfo(IintegracaoWMS), 'SetFinalizacao', '',
                                 '[ReturnName="SetFinalizacaoResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IintegracaoWMS), 'SetFinalizacao', '_data', '',
                                '[Namespace="http://schemas.datacontract.org/2004/07/wcfIntegracaoWMS"]', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IintegracaoWMS), 'SetFinalizacao', 'SetFinalizacaoResult', '',
                                '', IS_NLBL);
  RemClassRegistry.RegisterXSClass(DataBloqueioDest2, 'http://schemas.datacontract.org/2004/07/wcfIntegracaoWMS', 'DataBloqueioDest2', 'DataBloqueioDest');
  RemClassRegistry.RegisterXSClass(DataBloqueioDest, 'http://schemas.datacontract.org/2004/07/wcfIntegracaoWMS', 'DataBloqueioDest');
  RemClassRegistry.RegisterXSClass(DataBloqueio2, 'http://schemas.datacontract.org/2004/07/wcfIntegracaoWMS', 'DataBloqueio2', 'DataBloqueio');
  RemClassRegistry.RegisterXSClass(DataBloqueio, 'http://schemas.datacontract.org/2004/07/wcfIntegracaoWMS', 'DataBloqueio');

end.