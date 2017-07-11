object FormTymDat: TFormTymDat
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Data'
  ClientHeight = 621
  ClientWidth = 499
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DataGrid: TStringGrid
    Left = 9
    Top = 101
    Width = 482
    Height = 512
    ColCount = 7
    FixedCols = 0
    RowCount = 2
    TabOrder = 0
  end
  object ButtonSave: TButton
    Left = 194
    Top = 24
    Width = 97
    Height = 49
    Caption = 'Save Data'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = ButtonSaveClick
  end
  object SaveDataDialog: TSaveDialog
    DefaultExt = 'txt'
    Left = 29
    Top = 56
  end
end
