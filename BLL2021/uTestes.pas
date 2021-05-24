unit uTestes;

interface

uses
  udmBloqueio,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmTestes = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    DBGrid1: TDBGrid;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTestes: TfrmTestes;

implementation

{$R *.dfm}

procedure TfrmTestes.Button1Click(Sender: TObject);
begin
  with dmBloqueio.pr_pedro do
  begin
    Close;
    ParamByName('@cd_pedro').AsInteger      := StrToIntDef(Edit1.Text,0);
    ParamByName('@nm_pedro').AsString       := Edit2.Text;
    ParamByName('@dt_pedro').value          := StrToDateTime(Edit3.Text);
    Open;
  end;


end;

end.
