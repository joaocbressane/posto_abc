unit Abastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.Buttons, Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfAbastecimento = class(TForm)
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    DateTimePicker1: TDateTimePicker;
    Label4: TLabel;
    Edit2: TEdit;
    Label5: TLabel;
    Edit3: TEdit;
    Label6: TLabel;
    Edit4: TEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure VerificaCombustivel;
    function CalculaValorTotal:Double;
    function id_abastecimento:Integer;
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    operacao : String;
  end;

var
  fAbastecimento: TfAbastecimento;
  preco_combustivel : double;


implementation
uses
  DM, Imposto;

{$R *.dfm}

procedure TfAbastecimento.BitBtn1Click(Sender: TObject);
var
  qryAux: TFDQuery;
begin
   try
    qryAux := TFDQuery.Create(Self);
    qryAux.Connection := DM.DataModule1.FDConnection1;
    qryAux.Close;
    qryAux.SQL.Clear;

    if operacao = 'incluir' then
       begin
          qryAux.SQL.Add('insert into abastecimento (id_abastecimento, data, qtd_litros, imposto, preco_combustivel, valortotal, id_bomba) ');
          qryAux.SQL.Add('values (:pid_abastecimento, :pdata, :pqtd_litros, :pimposto, :ppreco_combustivel, :pvalortotal, :pid_bomba);');
       end;

    if operacao = 'alterar' then
       begin
          qryAux.SQL.Add('update abastecimento set  data = :pdata, qtd_litros = :pqtd_litros, imposto = :pimposto, preco_combustivel = :ppreco_combustivel,  ');
          qryAux.SQL.Add('valortotal = :pvalortotal, id_bomba = :pid_bomba');
          qryAux.SQL.Add('where id_abastecimento = :pid_abastecimento;');
       end;


    qryAux.ParamByName('pid_abastecimento').AsInteger := id_abastecimento;
    qryAux.ParamByName('pdata').AsDate := DateTimePicker1.Date;
    qryAux.ParamByName('pqtd_litros').AsFloat := StrToFloat(MaskEdit1.Text);
    qryAux.ParamByName('pimposto').AsFloat := Imposto.percetagem_imposto;
    qryAux.ParamByName('ppreco_combustivel').AsFloat := preco_combustivel;
    qryAux.ParamByName('pvalortotal').AsFloat := StrToFloat(Edit2.Text);
    qryAux.ParamByName('pid_bomba').AsInteger := RadioGroup1.ItemIndex + 1;

    qryAux.ExecSQL;

  finally
    qryAux.Free;
  end;

  close;
end;

procedure TfAbastecimento.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TfAbastecimento.RadioGroup1Click(Sender: TObject);
begin
  VerificaCombustivel;
  MaskEdit1.SetFocus;
end;

function TfAbastecimento.CalculaValorTotal:Double;
var
  qryAux: TFDQuery;
  valortotal, preco, litros : double;
begin
   try
    qryAux := TFDQuery.Create(Self);
    qryAux.Connection := DM.DataModule1.FDConnection1;
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('select b.id_bomba, b.id_tanque, c.descricao, c.preco from bomba_combustivel b');
    qryAux.SQL.Add('inner join tanque t on t.id_tanque = b.id_tanque');
    qryAux.SQL.Add('inner join combustivel c on c.id_combustivel = t.id_combustivel');
    qryAux.SQL.Add('where b.id_bomba = :pid_bomba');
    qryAux.ParamByName('pid_bomba').AsInteger := RadioGroup1.ItemIndex + 1;
    qryAux.Open;

    preco := qryAux.FieldByName('preco').Value;
    litros := StrToFloat(MaskEdit1.Text);
    valortotal := litros * preco;
    valortotal := valortotal + (valortotal * Imposto.percetagem_imposto / 100);
  finally
    qryAux.Free;
  end;

  result := valortotal;
end;

procedure TfAbastecimento.FormShow(Sender: TObject);
    var
  qryAux: TFDQuery;

begin

  RadioGroup1.SetFocus;
  DateTimePicker1.Date := Date;

  if operacao = 'alterar' then
     begin
       try
        qryAux := TFDQuery.Create(Self);
        qryAux.Connection := DM.DataModule1.FDConnection1;
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add('select id_abastecimento, data, qtd_litros, imposto, preco_combustivel, valortotal, id_bomba ');
        qryAux.SQL.Add('from abastecimento');
        qryAux.SQL.Add('where id_abastecimento = :pid_abastecimento');
        qryAux.ParamByName('pid_abastecimento').AsInteger := DM.DataModule1.qryAbastecimentosID_ABASTECIMENTO.Value;
        qryAux.Open;

        RadioGroup1.ItemIndex := qryAux.FieldByName('id_bomba').Value - 1;
        VerificaCombustivel;

        Edit3.Text := qryAux.FieldByName('preco_combustivel').asString;
        Edit4.Text := qryAux.FieldByName('imposto').asString;
        DateTimePicker1.Date := qryAux.FieldByName('data').Value;
        MaskEdit1.Text := qryAux.FieldByName('qtd_litros').AsString;
        Edit2.Text := qryAux.FieldByName('valortotal').asString;

       finally
        qryAux.Free;
       end;
     end;

end;

procedure TfAbastecimento.MaskEdit1Exit(Sender: TObject);
begin
  Edit2.Text := FormatFloat('##0.00', CalculaValorTotal);
end;

procedure TfAbastecimento.VerificaCombustivel;
var
  qryAux: TFDQuery;
begin
  try
    qryAux := TFDQuery.Create(Self);
    qryAux.Connection := DM.DataModule1.FDConnection1;
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('select b.id_bomba, b.id_tanque, c.descricao, c.preco from bomba_combustivel b');
    qryAux.SQL.Add('inner join tanque t on t.id_tanque = b.id_tanque');
    qryAux.SQL.Add('inner join combustivel c on c.id_combustivel = t.id_combustivel');
    qryAux.SQL.Add('where b.id_bomba = :pid_bomba');
    qryAux.ParamByName('pid_bomba').AsInteger := RadioGroup1.ItemIndex + 1;
    qryAux.Open;
    Edit1.Text := qryAux.FieldByName('descricao').AsString;
    preco_combustivel := qryAux.FieldByName('preco').Value;
    Edit3.Text := qryAux.FieldByName('preco').AsString;
    Edit4.Text := floattostr(Imposto.percetagem_imposto);

  finally
    qryAux.Free;
  end;

end;

function TfAbastecimento.id_abastecimento:integer;
var
  qryAux: TFDQuery;
  id : integer;
begin
  if operacao = 'incluir' then
     begin
      try
        qryAux := TFDQuery.Create(Self);
        qryAux.Connection := DM.DataModule1.FDConnection1;
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add('select max(id_abastecimento) as id from abastecimento');
        qryAux.Open;
        id := qryAux.FieldByName('id').AsInteger + 1;
      finally
        qryAux.Free;
      end;
     end;

  if operacao = 'alterar' then
    begin
      id := DM.DataModule1.qryAbastecimentosID_ABASTECIMENTO.Value;
    end;

  result := id;
end;


end.
