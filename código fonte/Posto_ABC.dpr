program Posto_ABC;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {fPrincipal},
  Configuracoes in 'Configuracoes.pas' {fConfiguracoes},
  Abastecimento in 'Abastecimento.pas' {fAbastecimento},
  DM in 'DM.pas' {DataModule1: TDataModule},
  Imposto in 'Imposto.pas',
  Relatorio in 'Relatorio.pas' {fRelatorio};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfPrincipal, fPrincipal);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfRelatorio, fRelatorio);
  Application.Run;
end.
