object FormRelays: TFormRelays
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Probes Pre-Warming'
  ClientHeight = 122
  ClientWidth = 216
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LabelTemp: TLabel
    Left = 94
    Top = 42
    Width = 108
    Height = 38
    Alignment = taCenter
    Caption = 'Pre-Warming Temp'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object SpinEditTemp: TSpinEdit
    Left = 24
    Top = 40
    Width = 58
    Height = 45
    EditorEnabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxValue = 37
    MinValue = 30
    ParentFont = False
    TabOrder = 0
    Value = 35
  end
  object ComPortRelays: TComPort
    Active = False
    BaudRate = br9600
    DataBits = db8
    DeviceName = 'COM9'
    Options = []
    Parity = paNone
    StopBits = sb1
    Timeouts.ReadMultiplier = 250
    Timeouts.ReadConstant = 250
    Left = 88
    Top = 80
  end
end
