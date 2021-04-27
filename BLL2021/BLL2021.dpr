program BLL2021;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  Vcl.Themes,
  Vcl.Styles,
  uBloqueioLote in 'uBloqueioLote.pas' {frmBloqueioLote},
  udmBloqueio in 'udmBloqueio.pas' {dmBloqueio: TDataModule},
  uIServidorBLL in 'uIServidorBLL.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Sapphire Kamri');
  Application.Title := 'BLL2021 - Bloqueio de Lote';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmBloqueioLote, frmBloqueioLote);
  Application.CreateForm(TdmBloqueio, dmBloqueio);
  Application.Run;
end.
