object FormTempBars: TFormTempBars
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Temp Change'
  ClientHeight = 437
  ClientWidth = 147
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Gauge1: TGauge
    Left = 21
    Top = 24
    Width = 54
    Height = 393
    BackColor = clBlack
    Color = clBlack
    ForeColor = clRed
    Kind = gkVerticalBar
    MinValue = -100
    ParentColor = False
    Progress = -100
    ShowText = False
  end
  object Gauge2: TGauge
    Left = 74
    Top = 24
    Width = 50
    Height = 393
    BackColor = clBlack
    Color = clBlack
    ForeColor = clLime
    Kind = gkVerticalBar
    MinValue = -100
    ParentColor = False
    Progress = -100
    ShowText = False
  end
  object TrackBar1: TTrackBar
    Left = 124
    Top = 24
    Width = 13
    Height = 393
    Max = 20
    Orientation = trVertical
    TabOrder = 0
    TabStop = False
    TickMarks = tmTopLeft
  end
  object TrackBar2: TTrackBar
    Left = 8
    Top = 24
    Width = 13
    Height = 393
    Max = 20
    Orientation = trVertical
    TabOrder = 1
    TabStop = False
    TickMarks = tmTopLeft
  end
end
