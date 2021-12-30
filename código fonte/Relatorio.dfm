object fRelatorio: TfRelatorio
  Left = 0
  Top = 0
  Align = alCustom
  Caption = 'Relat'#243'rio'
  ClientHeight = 503
  ClientWidth = 875
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 41
    Top = 8
    Width = 794
    Height = 1123
    DataSource = DataModule1.dsRelatorio
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 51
      BandType = btTitle
      object RLLabel1: TRLLabel
        Left = 0
        Top = 0
        Width = 718
        Height = 51
        Align = faClient
        Alignment = taCenter
        Caption = 'Relat'#243'rio Posto ABC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel8: TRLLabel
        Left = 328
        Top = 24
        Width = 47
        Height = 18
        Caption = 'Di'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 89
      Width = 718
      Height = 99
      DataFields = 'DATA'
      object RLBand2: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 49
        BandType = btHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = True
        Borders.DrawRight = True
        Borders.DrawBottom = False
        object RLDBText1: TRLDBText
          Left = 40
          Top = 6
          Width = 47
          Height = 16
          DataField = 'DATA'
          DataSource = DataModule1.dsRelatorio
          Text = ''
        end
        object RLLabel2: TRLLabel
          Left = 8
          Top = 6
          Width = 35
          Height = 16
          Caption = 'Data:'
        end
        object RLLabel3: TRLLabel
          Left = 101
          Top = 30
          Width = 46
          Height = 16
          Caption = 'Tanque'
        end
        object RLLabel4: TRLLabel
          Left = 199
          Top = 30
          Width = 45
          Height = 16
          Caption = 'Bomba'
        end
        object RLLabel5: TRLLabel
          Left = 309
          Top = 30
          Width = 66
          Height = 16
          Caption = 'Valor Total'
        end
        object RLDraw1: TRLDraw
          Left = 0
          Top = 46
          Width = 714
          Height = 3
          DrawKind = dkLine
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 49
        Width = 718
        Height = 24
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = True
        object RLDBText2: TRLDBText
          Left = 101
          Top = 6
          Width = 33
          Height = 16
          Alignment = taRightJustify
          DataField = 'ID_TANQUE'
          DataSource = DataModule1.dsRelatorio
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 199
          Top = 6
          Width = 31
          Height = 16
          Alignment = taRightJustify
          DataField = 'ID_BOMBA'
          DataSource = DataModule1.dsRelatorio
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 309
          Top = 6
          Width = 66
          Height = 16
          Alignment = taRightJustify
          DataField = 'VALOR'
          DataSource = DataModule1.dsRelatorio
          Text = ''
        end
      end
      object RLBand4: TRLBand
        Left = 0
        Top = 73
        Width = 718
        Height = 26
        BandType = btFooter
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = True
        Borders.DrawRight = True
        Borders.DrawBottom = True
        object RLDBResult1: TRLDBResult
          Left = 270
          Top = 7
          Width = 105
          Height = 16
          Alignment = taRightJustify
          DataField = 'VALOR'
          DataSource = DataModule1.dsRelatorio
          Info = riSum
          Text = ''
        end
        object RLLabel6: TRLLabel
          Left = 189
          Top = 7
          Width = 75
          Height = 16
          Caption = 'Total do dia:'
        end
      end
    end
    object RLBand5: TRLBand
      Left = 38
      Top = 188
      Width = 718
      Height = 41
      BandType = btColumnFooter
      object RLDBResult2: TRLDBResult
        Left = 257
        Top = 3
        Width = 118
        Height = 19
        Alignment = taRightJustify
        DataField = 'VALOR'
        DataSource = DataModule1.dsRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLLabel7: TRLLabel
        Left = 141
        Top = 3
        Width = 110
        Height = 19
        Caption = 'Total Per'#237'odo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
end
