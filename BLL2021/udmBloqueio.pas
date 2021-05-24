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
    qryTeste: TFDQuery;
    pr_pedro: TFDStoredProc;
    MSSQLDriverLink: TFDPhysMSSQLDriverLink;
    ds_pedro: TDataSource;
    pr_pedrocd_controle: TIntegerField;
    pr_pedronm_arquivo: TMemoField;
    pr_pedrodt_pedro: TSQLTimeStampField;
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
