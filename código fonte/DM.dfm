object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 297
  Width = 707
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\POSTO_ABC\DB_POSTO.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=localhost'
      'Port=3050'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 16
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    DriverID = 'C:\Program Files (x86)\Firebird\Firebird_2_5\bin'
    Left = 48
    Top = 72
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 48
    Top = 128
  end
  object qryPrecos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from COMBUSTIVEL'
      'where id_combustivel = :pid_combustivel')
    Left = 152
    Top = 16
    ParamData = <
      item
        Name = 'PID_COMBUSTIVEL'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryTanque: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select t.id_tanque, c.descricao, c.preco'
      'from tanque t'
      'inner join combustivel c on c.id_combustivel = t.id_combustivel')
    Left = 448
    Top = 24
    object qryTanqueID_TANQUE: TIntegerField
      FieldName = 'ID_TANQUE'
      Origin = 'ID_TANQUE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryTanqueDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryTanquePRECO: TCurrencyField
      AutoGenerateValue = arDefault
      FieldName = 'PRECO'
      Origin = 'PRECO'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsTanque: TDataSource
    DataSet = qryTanque
    Left = 448
    Top = 184
  end
  object cdsTanque: TClientDataSet
    Aggregates = <>
    MasterSource = dsTanque
    PacketRecords = 0
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 448
    Top = 128
  end
  object pTanque: TDataSetProvider
    DataSet = qryTanque
    Left = 448
    Top = 72
  end
  object qryBomba: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      
        'select b.id_bomba, b.id_tanque, c.descricao from bomba_combustiv' +
        'el b'
      'inner join tanque t on t.id_tanque = b.id_tanque'
      'inner join combustivel c on c.id_combustivel = t.id_combustivel')
    Left = 344
    Top = 24
  end
  object pBomba: TDataSetProvider
    DataSet = cdsBomba
    Left = 344
    Top = 80
  end
  object cdsBomba: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pBomba'
    Left = 344
    Top = 136
  end
  object dsBomba: TDataSource
    DataSet = qryBomba
    Left = 344
    Top = 192
  end
  object qryRelatorio: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'select  a.data, t.id_tanque,b.id_bomba, CAST (sum(valortotal) as' +
        ' decimal(9,2)) as valor'
      'from abastecimento a'
      'inner join bomba_combustivel b on b.id_bomba = a .id_bomba'
      'inner join tanque t on t.id_tanque = b.id_tanque'
      'inner join combustivel c on c.id_combustivel = t.id_combustivel'
      'group by a.data, t.id_tanque, b.id_bomba'
      'order by a.data, t.id_tanque, b.id_bomba')
    Left = 248
    Top = 24
    object qryRelatorioDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object qryRelatorioID_TANQUE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_TANQUE'
      Origin = 'ID_TANQUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryRelatorioID_BOMBA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_BOMBA'
      Origin = 'ID_BOMBA'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryRelatorioVALOR: TCurrencyField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR'
      Origin = 'VALOR'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object pRelatorio: TDataSetProvider
    DataSet = qryRelatorio
    Left = 248
    Top = 72
  end
  object cdsRelatorio: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pRelatorio'
    Left = 248
    Top = 136
    object cdsRelatorioDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
    object cdsRelatorioID_TANQUE: TIntegerField
      FieldName = 'ID_TANQUE'
      ReadOnly = True
    end
    object cdsRelatorioID_BOMBA: TIntegerField
      FieldName = 'ID_BOMBA'
      ReadOnly = True
    end
    object cdsRelatorioVALOR: TCurrencyField
      FieldName = 'VALOR'
      ReadOnly = True
    end
  end
  object dsRelatorio: TDataSource
    DataSet = qryRelatorio
    Left = 248
    Top = 192
  end
  object qryAbastecimentos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'select a.id_abastecimento, a.data, a.id_bomba, cast(a.qtd_litros' +
        ' as float) as qtd_litros,'
      
        'a.preco_combustivel, cast(a.imposto as float) as imposto, a.valo' +
        'rtotal, t.id_tanque, c.descricao'
      'from abastecimento a'
      'inner join bomba_combustivel b on b.id_bomba = a .id_bomba'
      'inner join tanque t on t.id_tanque = b.id_tanque'
      'inner join combustivel c on c.id_combustivel = t.id_combustivel'
      'order by a.data desc, a.id_abastecimento desc')
    Left = 584
    Top = 24
    object qryAbastecimentosID_ABASTECIMENTO: TIntegerField
      FieldName = 'ID_ABASTECIMENTO'
      Origin = 'ID_ABASTECIMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryAbastecimentosDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object qryAbastecimentosPRECO_COMBUSTIVEL: TCurrencyField
      FieldName = 'PRECO_COMBUSTIVEL'
      Origin = 'PRECO_COMBUSTIVEL'
    end
    object qryAbastecimentosVALORTOTAL: TCurrencyField
      FieldName = 'VALORTOTAL'
      Origin = 'VALORTOTAL'
    end
    object qryAbastecimentosID_BOMBA: TIntegerField
      FieldName = 'ID_BOMBA'
      Origin = 'ID_BOMBA'
    end
    object qryAbastecimentosID_TANQUE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_TANQUE'
      Origin = 'ID_TANQUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryAbastecimentosDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryAbastecimentosQTD_LITROS: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_LITROS'
      Origin = 'QTD_LITROS'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryAbastecimentosIMPOSTO: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'IMPOSTO'
      Origin = 'IMPOSTO'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object pAbastecimentos: TDataSetProvider
    DataSet = qryAbastecimentos
    Left = 584
    Top = 80
  end
  object cdsAbastecimentos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pAbastecimentos'
    Left = 584
    Top = 136
    object cdsAbastecimentosID_ABASTECIMENTO: TIntegerField
      FieldName = 'ID_ABASTECIMENTO'
      Required = True
    end
    object cdsAbastecimentosDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
    object cdsAbastecimentosPRECO_COMBUSTIVEL: TCurrencyField
      FieldName = 'PRECO_COMBUSTIVEL'
    end
    object cdsAbastecimentosVALORTOTAL: TCurrencyField
      FieldName = 'VALORTOTAL'
    end
    object cdsAbastecimentosID_BOMBA: TIntegerField
      FieldName = 'ID_BOMBA'
    end
    object cdsAbastecimentosID_TANQUE: TIntegerField
      FieldName = 'ID_TANQUE'
      ReadOnly = True
    end
    object cdsAbastecimentosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ReadOnly = True
    end
    object cdsAbastecimentosQTD_LITROS: TSingleField
      FieldName = 'QTD_LITROS'
      ReadOnly = True
    end
    object cdsAbastecimentosIMPOSTO: TSingleField
      FieldName = 'IMPOSTO'
      ReadOnly = True
    end
  end
  object dsAbastecimentos: TDataSource
    DataSet = qryAbastecimentos
    Left = 584
    Top = 192
  end
end
