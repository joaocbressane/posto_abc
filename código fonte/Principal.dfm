object fPrincipal: TfPrincipal
  Left = 0
  Top = 0
  Align = alCustom
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Sistema de gest'#227'o - Posto ABC'
  ClientHeight = 466
  ClientWidth = 639
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
  object BitBtn1: TBitBtn
    Left = 294
    Top = 8
    Width = 137
    Height = 65
    Caption = 'Configura'#231#245'es'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 8
    Top = 8
    Width = 137
    Height = 65
    Caption = 'Abastecimento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 151
    Top = 8
    Width = 137
    Height = 65
    Caption = 'Relat'#243'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn3Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 79
    Width = 617
    Height = 374
    Caption = 'Abastecimentos'
    TabOrder = 4
    object DBGrid1: TDBGrid
      Left = 16
      Top = 16
      Width = 593
      Height = 321
      DataSource = DataModule1.dsAbastecimentos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'DATA'
          Title.Alignment = taCenter
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_BOMBA'
          Title.Alignment = taCenter
          Title.Caption = 'BOMBA'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTD_LITROS'
          Title.Alignment = taCenter
          Title.Caption = 'LITROS'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'COMBUSTIVEL'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECO_COMBUSTIVEL'
          Title.Alignment = taCenter
          Title.Caption = 'PRE'#199'O COMBUSTIVEL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IMPOSTO'
          Title.Alignment = taCenter
          Title.Caption = 'IMPOSTO %'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALORTOTAL'
          Title.Alignment = taCenter
          Title.Caption = 'VALOR TOTAL'
          Width = 90
          Visible = True
        end>
    end
    object BitBtn5: TBitBtn
      Left = 16
      Top = 343
      Width = 75
      Height = 25
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = BitBtn5Click
    end
    object BitBtn6: TBitBtn
      Left = 97
      Top = 343
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = BitBtn6Click
    end
  end
  object BitBtn4: TBitBtn
    Left = 437
    Top = 8
    Width = 132
    Height = 65
    Caption = 'Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtn4Click
  end
end
