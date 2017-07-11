unit UnitTestLEDs9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Samples.Spin, Vcl.ExtCtrls, Cbw, Vcl.ComCtrls;

type
  TFormLEDs = class(TForm)
    SpeedButton1: TSpeedButton;
    RadioGroup1: TRadioGroup;
    Timer1: TTimer;
    CheckBox1: TCheckBox;
    TrackBar1: TTrackBar;
    Label1: TLabel;
    Label2: TLabel;
    procedure RadioGroup1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AssignLEDsColor(Sender: TObject);
    procedure ConfigPorts(Sender: TObject);
    procedure OpenPorts(Sender: TObject);
    procedure ClosePorts(Sender: TObject);
  end;

var
  FormLEDs: TFormLEDs;
  dPort: Integer = 0;
  boardNum: Integer = 0;
  dPortType: Integer = AUXPORT;
  direction: Integer = DIGITALOUT;
  bitNumA, bitNumB: Integer;
  revLevl: Single = CURRENTREVNUM;
  ledsOn: Boolean = False;

implementation

{$R *.dfm}

//Assigns Left(red LED) and Right(green LED) ports, counterbalanced BTW Subject Groups A & B
procedure TFormLEDs.AssignLEDsColor(Sender: TObject);
begin
  bitNumA := RadioGroup1.ItemIndex;
  bitNumB := 3 - bitNumA;
end;

//Configures the ports for output
procedure TFormLEDs.ConfigPorts(Sender: TObject);
begin
  dPort := cbDConfigBit(boardNum,dPortType,bitNumA,direction);
  dPort := cbDConfigBit(boardNum,dPortType,bitNumB,direction);
end;

procedure TFormLEDs.OpenPorts(Sender: TObject);
begin
  ConfigPorts(Sender);
  dPort := cbDBitOut(boardNum,dPortType,bitNumA,1);
  dPort := cbDBitOut(boardNum,dPortType,bitNumB,1);
end;

procedure TFormLEDs.ClosePorts(Sender: TObject);
begin
  dPort := cbDBitOut(boardNum,dPortType,bitNumA,0);
  dPort := cbDBitOut(boardNum,dPortType,bitNumB,0);
end;

//------------------------------------------------------------------------------

procedure TFormLEDs.RadioGroup1Click(Sender: TObject);
begin
  ClosePorts(Sender);
  AssignLEDsColor(Sender);

  if SpeedButton1.Down then
    OpenPorts(Sender);
end;

procedure TFormLEDs.TrackBar1Change(Sender: TObject);
begin
  Timer1.Interval := 800 div TrackBar1.Position;
end;

procedure TFormLEDs.CheckBox1Click(Sender: TObject);
begin
  Trackbar1.Enabled := not Trackbar1.Enabled;
  Label1.Enabled := Trackbar1.Enabled;
  Label2.Enabled := Trackbar1.Enabled;

  if CheckBox1.Checked and SpeedButton1.Down then
    Timer1.Enabled := True
  else
  begin
    Timer1.Enabled := False;
    if SpeedButton1.Down then
      OpenPorts(Sender);
  end;
end;

procedure TFormLEDs.SpeedButton1Click(Sender: TObject);
begin
  AssignLEDsColor(Sender);

  if SpeedButton1.Down then
  begin
    SpeedButton1.Caption := 'LEDs: ON';
    SpeedButton1.Flat := True;

    if CheckBox1.Checked then
      Timer1.Enabled := True
    else
      OpenPorts(Sender);
  end
  else
  begin
    SpeedButton1.Caption := 'LEDs: OFF';
    SpeedButton1.Flat := False;

    if Timer1.Enabled then
      Timer1.Enabled := False;

    ClosePorts(Sender);
  end;
end;

procedure TFormLEDs.Timer1Timer(Sender: TObject);
begin
  if ledsOn then
    ClosePorts(Sender)
  else
    OpenPorts(Sender);

  ledsOn := not ledsOn;
end;

procedure TFormLEDs.FormCreate(Sender: TObject);
begin
  //cbDeclareRevision();
  //Initializes the Universal Library with the revision number of the library
  //used to write a program. Must be the first Universal Library function to
  //be called by any program.
  dPort := cbDeclareRevision(revLevl);
end;

procedure TFormLEDs.FormDestroy(Sender: TObject);
begin
  ClosePorts(Sender);
end;

end.
