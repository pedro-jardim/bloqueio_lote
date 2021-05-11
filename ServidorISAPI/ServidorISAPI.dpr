library ServidorISAPI;

uses
  Winapi.ActiveX,
  System.Win.ComObj,
  Web.WebBroker,
  Web.Win.ISAPIApp,
  Web.Win.ISAPIThreadPool,
  uServidorBLLImpl in '..\ServidorExe\uServidorBLLImpl.pas',
  uServidorBLLIntf in '..\ServidorExe\uServidorBLLIntf.pas',
  WebModuleUnit in '..\ServidorExe\WebModuleUnit.pas' {WebModule1: TWebModule},
  udmBloqueioLote in '..\ServidorExe\udmBloqueioLote.pas' {dmBloqueioLote: TSoapDataModule};

{$R *.res}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  CoInitFlags := COINIT_MULTITHREADED;
  Application.Initialize;
  Application.WebModuleClass := WebModuleClass;
  Application.Run;
end.
