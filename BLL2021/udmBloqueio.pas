unit udmBloqueio;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Phys.ODBCBase;

type
  TdmBloqueio = class(TDataModule)
    FDConnection: TFDConnection;
    MSSQLDriverLink: TFDPhysMSSQLDriverLink;
    dsConsultaBloqueioLote: TDataSource;
    stpConsultaBloqueioLote: TFDStoredProc;
    qryParametroLogistica: TFDQuery;
    qryParametroLogisticacd_local_bloqueio_unilever: TIntegerField;
    stpConsultaBloqueioLotecd_controle: TFDAutoIncField;
    stpConsultaBloqueioLotecd_bloqueio_lote: TIntegerField;
    stpConsultaBloqueioLotecd_item_bloqueio_lote: TIntegerField;
    stpConsultaBloqueioLotecd_bloqueio_web: TIntegerField;
    stpConsultaBloqueioLotenm_sku: TStringField;
    stpConsultaBloqueioLotenm_descricao: TStringField;
    stpConsultaBloqueioLotenm_categoria: TStringField;
    stpConsultaBloqueioLotenm_divisao: TStringField;
    stpConsultaBloqueioLotedt_fabricacao: TSQLTimeStampField;
    stpConsultaBloqueioLotedt_vencimento: TSQLTimeStampField;
    stpConsultaBloqueioLoteqt_caixa: TIntegerField;
    stpConsultaBloqueioLoteqt_produto: TIntegerField;
    stpConsultaBloqueioLotenm_cod_lpn: TStringField;
    stpConsultaBloqueioLotedt_bloqueio: TSQLTimeStampField;
    stpConsultaBloqueioLotenm_codigo_motivo: TStringField;
    stpConsultaBloqueioLotenm_descricao_motivo: TStringField;
    stpConsultaBloqueioLotenm_solicitante_motivo: TStringField;
    stpConsultaBloqueioLotecd_usuario_inclusao: TIntegerField;
    stpConsultaBloqueioLotedt_usuario_inclusao: TSQLTimeStampField;
    stpConsultaBloqueioLotecd_usuario: TIntegerField;
    stpConsultaBloqueioLotedt_usuario: TSQLTimeStampField;
    stpConsultaBloqueioLotenm_laudo_bloqueio: TStringField;
    stpConsultaBloqueioLotecd_status_bloqueio: TIntegerField;
    stpConsultaBloqueioLotenm_status_bloqueio: TStringField;
    stpConsultaBloqueioLotecd_identificacao: TIntegerField;
    stpConsultaBloqueioLotedt_entrada: TSQLTimeStampField;
    stpConsultaBloqueioLotenm_fantasia_destinatario: TStringField;
    stpConsultaBloqueioLotecd_nota_entrada: TIntegerField;
    stpConsultaBloqueioLotecd_serie_nota_fiscal: TIntegerField;
    stpConsultaBloqueioLotecd_item_nota_entrada: TIntegerField;
    stpConsultaBloqueioLotecd_produto: TIntegerField;
    stpConsultaBloqueioLotecd_mascara_produto: TStringField;
    stpConsultaBloqueioLotenm_fantasia_produto: TStringField;
    stpConsultaBloqueioLotenm_produto: TStringField;
    stpConsultaBloqueioLotecd_lote_produto: TIntegerField;
    stpConsultaBloqueioLotenm_ref_lote_produto: TStringField;
    stpConsultaBloqueioLotecd_identificacao_lote: TStringField;
    stpConsultaBloqueioLotecd_identificacao_pallet: TStringField;
    stpConsultaBloqueioLotecd_movimento: TIntegerField;
    stpConsultaBloqueioLotecd_motivo_bloqueio: TIntegerField;
    stpConsultaBloqueioLotecd_destinacao_bloqueio: TIntegerField;
    stpConsultaBloqueioLotecd_tipo_bloqueio: TIntegerField;
    stpConsultaBloqueioLotedt_bloqueio_movimento: TSQLTimeStampField;
    stpConsultaBloqueioLotedt_liberacao_movimento: TSQLTimeStampField;
    stpConsultaBloqueioLotedt_confirmacao_bloqueio: TSQLTimeStampField;
    stpConsultaBloqueioLotedt_confirmacao_destinacao: TSQLTimeStampField;
    stpConsultaBloqueioLotedt_confirmacao_encerramento: TSQLTimeStampField;
    stpConsultaBloqueioLoteic_utilizado: TStringField;
    qryInsereMovimento: TFDQuery;
    qryAtualizaMovimentoDestinacao: TFDQuery;
    qryAtualizaMovimentoEncerramento: TFDQuery;
    stpGeraEmailBloqueioPallet: TFDStoredProc;
    FDAutoIncField1: TFDAutoIncField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    SQLTimeStampField1: TSQLTimeStampField;
    SQLTimeStampField2: TSQLTimeStampField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    StringField5: TStringField;
    SQLTimeStampField3: TSQLTimeStampField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    IntegerField6: TIntegerField;
    SQLTimeStampField4: TSQLTimeStampField;
    IntegerField7: TIntegerField;
    SQLTimeStampField5: TSQLTimeStampField;
    StringField9: TStringField;
    IntegerField8: TIntegerField;
    StringField10: TStringField;
    IntegerField9: TIntegerField;
    SQLTimeStampField6: TSQLTimeStampField;
    StringField11: TStringField;
    IntegerField10: TIntegerField;
    IntegerField11: TIntegerField;
    IntegerField12: TIntegerField;
    IntegerField13: TIntegerField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    IntegerField14: TIntegerField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    IntegerField15: TIntegerField;
    IntegerField16: TIntegerField;
    IntegerField17: TIntegerField;
    IntegerField18: TIntegerField;
    SQLTimeStampField7: TSQLTimeStampField;
    SQLTimeStampField8: TSQLTimeStampField;
    SQLTimeStampField9: TSQLTimeStampField;
    SQLTimeStampField10: TSQLTimeStampField;
    SQLTimeStampField11: TSQLTimeStampField;
    StringField18: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmBloqueio: TdmBloqueio;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
