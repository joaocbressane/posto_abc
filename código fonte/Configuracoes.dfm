object fConfiguracoes: TfConfiguracoes
  Left = 0
  Top = 0
  Align = alCustom
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Configura'#231#245'es'
  ClientHeight = 453
  ClientWidth = 459
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 249
    Height = 145
    Caption = 'Pre'#231'os Combust'#237'veis'
    TabOrder = 0
    object Label1: TLabel
      Left = 45
      Top = 41
      Width = 44
      Height = 13
      Caption = 'Gasolina:'
    end
    object Label2: TLabel
      Left = 32
      Top = 77
      Width = 57
      Height = 13
      Caption = #211'leo Diesel:'
    end
    object MaskEdit1: TMaskEdit
      Left = 96
      Top = 32
      Width = 121
      Height = 31
      AutoSize = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '0,00'
    end
    object MaskEdit2: TMaskEdit
      Left = 96
      Top = 69
      Width = 121
      Height = 31
      AutoSize = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '0,00'
    end
    object BitBtn1: TBitBtn
      Left = 61
      Top = 106
      Width = 75
      Height = 25
      Caption = 'Gravar'
      Enabled = False
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 142
      Top = 106
      Width = 75
      Height = 25
      Caption = 'Alterar'
      TabOrder = 3
      OnClick = BitBtn2Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 272
    Top = 8
    Width = 177
    Height = 90
    Caption = 'Imposto'
    TabOrder = 1
    object Label11: TLabel
      Left = 8
      Top = 40
      Width = 89
      Height = 13
      Caption = 'Percentagem (%):'
    end
    object MaskEdit3: TMaskEdit
      Left = 104
      Top = 32
      Width = 49
      Height = 31
      AutoSize = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '13'
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 263
    Width = 345
    Height = 129
    Caption = 'Bombas'
    Enabled = False
    TabOrder = 2
    object DBGrid2: TDBGrid
      Left = 9
      Top = 16
      Width = 320
      Height = 105
      DataSource = DataModule1.dsBomba
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID_BOMBA'
          Title.Alignment = taCenter
          Title.Caption = 'BOMBA'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ID_TANQUE'
          Title.Alignment = taCenter
          Title.Caption = 'TANQUE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'COMBUSTIVEL'
          Visible = True
        end>
    end
  end
  object BitBtn3: TBitBtn
    Left = 244
    Top = 398
    Width = 205
    Height = 42
    Caption = 'Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtn3Click
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 159
    Width = 249
    Height = 98
    Caption = 'Tanques'
    Enabled = False
    TabOrder = 4
    object DBGrid1: TDBGrid
      Left = 9
      Top = 24
      Width = 222
      Height = 65
      DataSource = DataModule1.dsTanque
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID_TANQUE'
          Title.Caption = 'TANQUE'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'COMBUSTIVEL'
          Visible = True
        end>
    end
  end
end
