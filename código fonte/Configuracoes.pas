unit Configuracoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.Buttons, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinsDefaultPainters, cxTextEdit,
  cxMaskEdit, cxDBEdit, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfConfiguracoes = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    MaskEdit3: TMaskEdit;
    BitBtn3: TBitBtn;
    GroupBox4: TGroupBox;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    procedure PrecosCombustivel;
    procedure BombaCombustivel;
  public
    { Public declarations }
  end;

var
  fConfiguracoes: TfConfiguracoes;

implementation
uses DM;

{$R *.dfm}
procedure TfConfiguracoes.BitBtn1Click(Sender: TObject);
var
  qryAux : TFDQuery;
begin
   try
    qryAux := TFDQuery.Create(Self);
    qryAux.Connection := DM.DataModule1.FDConnection1;
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('update combustivel ');
    qryAux.SQL.Add('set preco = :ppreco');
    qryAux.SQL.Add('where id_combustivel = 1');
    qryAux.ParamByName('ppreco').AsFloat := strtofloat(MaskEdit1.Text);
    qryAux.ExecSQL;

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('update combustivel ');
    qryAux.SQL.Add('set preco = :ppreco');
    qryAux.SQL.Add('where id_combustivel = 2');
    qryAux.ParamByName('ppreco').AsFloat := strtofloat(MaskEdit2.Text);
    qryAux.ExecSQL;

  finally
    qryAux.Free;
  end;

  BitBtn2.Caption := 'Alterar';
  BitBtn1.Enabled := false;
  MaskEdit1.Enabled := false;
  MaskEdit2.Enabled := false;

end;

procedure TfConfiguracoes.BitBtn2Click(Sender: TObject);
begin
 if BitBtn2.Caption = 'Alterar' then
    begin
      BitBtn2.Caption := 'Cancelar';
      BitBtn1.Enabled := true;
      MaskEdit1.Enabled := true;
      MaskEdit2.Enabled := true;
    end
    else
    begin
      BitBtn2.Caption := 'Alterar';
      BitBtn1.Enabled := false;
      MaskEdit1.Enabled := false;
      MaskEdit2.Enabled := false;
    end;

end;

procedure TfConfiguracoes.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfConfiguracoes.FormShow(Sender: TObject);
begin
  PrecosCombustivel;
end;


procedure TfConfiguracoes.BombaCombustivel;
begin

end;

procedure TfConfiguracoes.PrecosCombustivel;
begin
  with DataModule1 do
  begin
    qryPrecos.Close;
    qryPrecos.ParamByName('pid_combustivel').AsInteger := 1; //gasolina
    qryPrecos.Open;
    MaskEdit1.Text := qryPrecos.FieldByName('preco').AsString;

    qryPrecos.Close;
    qryPrecos.ParamByName('pid_combustivel').AsInteger := 2; //diesel
    qryPrecos.Open;
    MaskEdit2.Text := qryPrecos.FieldByName('preco').AsString;

  end;

end;

end.
