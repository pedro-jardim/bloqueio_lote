program ServidorBLL;
{$APPTYPE GUI}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  uServidor in 'uServidor.pas' {Form1},
  WebModuleUnit in 'WebModuleUnit.pas' {WebModule1: TWebModule},
  uServidorBLLImpl in 'uServidorBLLImpl.pas',
  uServidorBLLIntf in 'uServidorBLLIntf.pas';

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
