{ Invokable implementation File for TServidorBLL which implements IServidorBLL }

unit uServidorBLLImpl;

interface

uses Soap.InvokeRegistry, System.Types, Soap.XSBuiltIns, uServidorBLLIntf;

type

  { TServidorBLL }
  TServidorBLL = class(TInvokableClass, IServidorBLL)
  public
    function mensagemBoasVindas: String;
  end;

implementation


{ TServidorBLL }

function TServidorBLL.mensagemBoasVindas: String;
begin
  Result := 'Servidor SOAP da GBS';
end;

initialization
{ Invokable classes must be registered }
   InvRegistry.RegisterInvokableClass(TServidorBLL);
end.

