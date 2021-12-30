unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, RLReport,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfPrincipal = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrincipal: TfPrincipal;

implementation

uses
  Configuracoes, Abastecimento, DM, Relatorio;

{$R *.dfm}

procedure TfPrincipal.BitBtn1Click(Sender: TObject);
begin

  try
    fConfiguracoes := TfConfiguracoes.Create(Self);
    fConfiguracoes.ShowModal;
  finally
    fConfiguracoes.Free;
  end;

end;

procedure TfPrincipal.BitBtn2Click(Sender: TObject);
begin

  try
    fAbastecimento := TfAbastecimento.Create(Self);
    fAbastecimento.operacao := 'incluir';
    fAbastecimento.ShowModal;
  finally
    fAbastecimento.Free;
  end;

  DM.DataModule1.qryAbastecimentos.Close;
  DM.DataModule1.qryAbastecimentos.Active := true;
end;

procedure TfPrincipal.BitBtn3Click(Sender: TObject);
begin
  try
    DM.DataModule1.qryRelatorio.Active := false;
    DM.DataModule1.qryRelatorio.Active := true;
    fRelatorio := TfRelatorio.Create(Self);
    fRelatorio.RLReport1.Preview();
  finally
    fRelatorio.Free;
  end;
end;

procedure TfPrincipal.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrincipal.BitBtn5Click(Sender: TObject);
begin
  try
    fAbastecimento := TfAbastecimento.Create(Self);
    fAbastecimento.operacao := 'alterar';
    fAbastecimento.ShowModal;
  finally
    fAbastecimento.Free;
  end;

  DM.DataModule1.qryAbastecimentos.Close;
  DM.DataModule1.qryAbastecimentos.Active := true;
end;

procedure TfPrincipal.BitBtn6Click(Sender: TObject);
var
  qryAux: TFDQuery;
begin
  if Application.MessageBox('Confirma a exclusão do abastecimento?','Atenção',MB_YESNO+MB_ICONWARNING) = mrYes then
     begin
     try
      qryAux := TFDQuery.Create(Self);
      qryAux.Connection := DM.DataModule1.FDConnection1;
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('delete from abastecimento where id_abastecimento = :pid_abastecimento ');
      qryAux.ParamByName('pid_abastecimento').AsInteger := DM.DataModule1.qryAbastecimentosID_ABASTECIMENTO.Value;
      qryAux.ExecSQL;

     finally
      qryAux.Free;
     end;
  end;

  DM.DataModule1.qryAbastecimentos.Close;
  DM.DataModule1.qryAbastecimentos.Active := true;

end;

procedure TfPrincipal.FormShow(Sender: TObject);
begin
  DM.DataModule1.qryAbastecimentos.Active := true;
end;

end.

