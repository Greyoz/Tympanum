object FormTymp: TFormTymp
  Left = 0
  Top = 0
  ActiveControl = ButtonStart
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Tympanic Temperature Monitor'
  ClientHeight = 404
  ClientWidth = 367
  Color = clBtnFace
  DefaultMonitor = dmPrimary
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object LabelLeft: TLabel
    Left = 43
    Top = 278
    Width = 75
    Height = 24
    Caption = 'Left Ear'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object LabelRight: TLabel
    Left = 224
    Top = 278
    Width = 87
    Height = 24
    Caption = 'Right Ear'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object TestProbesBtn: TSpeedButton
    Left = 214
    Top = 22
    Width = 114
    Height = 43
    AllowAllUp = True
    GroupIndex = 1
    Caption = 'Test Probes: OFF'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = TestProbesBtnClick
  end
  object WarmUpBtn: TSpeedButton
    Left = 224
    Top = 78
    Width = 93
    Height = 35
    AllowAllUp = True
    GroupIndex = 2
    Caption = 'Warm Up: OFF'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = WarmUpBtnClick
  end
  object Label1: TLabel
    Left = 91
    Top = 135
    Width = 92
    Height = 16
    Caption = 'Control (mins)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 91
    Top = 174
    Width = 81
    Height = 32
    Caption = 'Word gener. (secs)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object LabelTongue: TLabel
    Left = 130
    Top = 368
    Width = 94
    Height = 24
    Caption = 'Sublingual'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object ButtonStart: TButton
    Left = 41
    Top = 22
    Width = 131
    Height = 67
    Caption = 'Start'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = ButtonStartClick
  end
  object EditTemp1: TEdit
    Left = 31
    Top = 233
    Width = 112
    Height = 39
    Color = clBlack
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -27
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    Text = ' __.___ C'#176
  end
  object EditTemp2: TEdit
    Left = 214
    Top = 233
    Width = 114
    Height = 39
    Color = clBlack
    Font.Charset = ANSI_CHARSET
    Font.Color = clLime
    Font.Height = -27
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    Text = ' __.___ C'#176
  end
  object MediaPlayer: TMediaPlayer
    Left = 0
    Top = 378
    Width = 29
    Height = 30
    VisibleButtons = [btPlay]
    AutoOpen = True
    DeviceType = dtWaveAudio
    FileName = 'C:\Windows\Media\Windows Battery Low.wav'
    Visible = False
    TabOrder = 3
  end
  object EditTime: TEdit
    Left = 195
    Top = 148
    Width = 159
    Height = 54
    Color = clBlack
    Font.Charset = ANSI_CHARSET
    Font.Color = clYellow
    Font.Height = -40
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
    Text = ' 00:00:00'
  end
  object EditCtrl1: TSpinEdit
    Left = 36
    Top = 128
    Width = 49
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    MaxValue = 10
    MinValue = 0
    ParentFont = False
    TabOrder = 5
    Value = 7
  end
  object EditExp: TSpinEdit
    Left = 36
    Top = 175
    Width = 49
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    MaxValue = 20
    MinValue = 1
    ParentFont = False
    TabOrder = 6
    Value = 15
  end
  object EditTemp3: TEdit
    Left = 126
    Top = 323
    Width = 114
    Height = 39
    Color = clBlack
    Font.Charset = ANSI_CHARSET
    Font.Color = clYellow
    Font.Height = -27
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 7
    Text = ' __.___ C'#176
  end
  object ComPort1: TComPort
    Active = False
    BaudRate = br9600
    DataBits = db8
    DeviceName = 'COM4'
    Options = []
    Parity = paNone
    StopBits = sb1
    Timeouts.ReadMultiplier = 300
    Timeouts.ReadConstant = 300
    Left = 4
    Top = 59
  end
  object Timer: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TimerTimer
    Left = 3
    Top = 3
  end
  object ComPort2: TComPort
    Active = False
    BaudRate = br9600
    DataBits = db8
    DeviceName = 'COM5'
    Options = []
    Parity = paNone
    StopBits = sb1
    Timeouts.ReadMultiplier = 300
    Timeouts.ReadConstant = 300
    Left = 5
    Top = 111
  end
  object ComPort3: TComPort
    Active = False
    BaudRate = br9600
    DataBits = db8
    DeviceName = 'COM6'
    Options = []
    Parity = paNone
    StopBits = sb1
    Left = 8
    Top = 168
  end
end
