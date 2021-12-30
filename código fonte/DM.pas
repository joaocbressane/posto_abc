unit DM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB, Data.DB,
  FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, Datasnap.DBClient,
  Datasnap.Provider;

type
  TDataModule1 = class(TDataModule)
    FDConnection1: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    qryPrecos: TFDQuery;
    qryTanque: TFDQuery;
    dsTanque: TDataSource;
    cdsTanque: TClientDataSet;
    qryTanqueID_TANQUE: TIntegerField;
    qryTanqueDESCRICAO: TStringField;
    qryTanquePRECO: TCurrencyField;
    pTanque: TDataSetProvider;
    qryBomba: TFDQuery;
    pBomba: TDataSetProvider;
    cdsBomba: TClientDataSet;
    dsBomba: TDataSource;
    qryRelatorio: TFDQuery;
    pRelatorio: TDataSetProvider;
    cdsRelatorio: TClientDataSet;
    dsRelatorio: TDataSource;
    cdsRelatorioDATA: TSQLTimeStampField;
    cdsRelatorioID_TANQUE: TIntegerField;
    cdsRelatorioID_BOMBA: TIntegerField;
    cdsRelatorioVALOR: TCurrencyField;
    qryRelatorioDATA: TSQLTimeStampField;
    qryRelatorioID_TANQUE: TIntegerField;
    qryRelatorioID_BOMBA: TIntegerField;
    qryRelatorioVALOR: TCurrencyField;
    qryAbastecimentos: TFDQuery;
    pAbastecimentos: TDataSetProvider;
    cdsAbastecimentos: TClientDataSet;
    dsAbastecimentos: TDataSource;
    qryAbastecimentosID_ABASTECIMENTO: TIntegerField;
    qryAbastecimentosDATA: TSQLTimeStampField;
    qryAbastecimentosPRECO_COMBUSTIVEL: TCurrencyField;
    qryAbastecimentosVALORTOTAL: TCurrencyField;
    qryAbastecimentosID_BOMBA: TIntegerField;
    qryAbastecimentosID_TANQUE: TIntegerField;
    qryAbastecimentosDESCRICAO: TStringField;
    cdsAbastecimentosID_ABASTECIMENTO: TIntegerField;
    cdsAbastecimentosDATA: TSQLTimeStampField;
    cdsAbastecimentosPRECO_COMBUSTIVEL: TCurrencyField;
    cdsAbastecimentosVALORTOTAL: TCurrencyField;
    cdsAbastecimentosID_BOMBA: TIntegerField;
    cdsAbastecimentosID_TANQUE: TIntegerField;
    cdsAbastecimentosDESCRICAO: TStringField;
    qryAbastecimentosQTD_LITROS: TSingleField;
    cdsAbastecimentosQTD_LITROS: TSingleField;
    qryAbastecimentosIMPOSTO: TSingleField;
    cdsAbastecimentosIMPOSTO: TSingleField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
