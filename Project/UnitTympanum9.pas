unit UnitTympanum9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.Math,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ComPort, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.MPlayer, Vcl.Grids, Vcl.Buttons, Vcl.Samples.Spin;

type
  TFormTymp = class(TForm)
    ButtonStart: TButton;
    TestProbesBtn: TSpeedButton;
    WarmUpBtn: TSpeedButton;
    EditTemp1: TEdit;
    EditTemp2: TEdit;
    EditTemp3: TEdit;
    EditTime: TEdit;
    LabelRight: TLabel;
    LabelLeft: TLabel;
    LabelTongue: TLabel;
    ComPort1: TComPort;
    ComPort2: TComPort;
    ComPort3: TComPort;
    Timer: TTimer;
    MediaPlayer: TMediaPlayer;
    EditCtrl1: TSpinEdit;
    EditExp: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure ButtonStartClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure TestProbesBtnClick(Sender: TObject);
    procedure WarmUpBtnClick(Sender: TObject);

   private  { Private declarations }
    procedure ResetTemp(Sender: TObject);
    procedure ResetTimeCounter(Sender: TObject);
    procedure TimeCounter(Sender: TObject);
    procedure OpenCom(Com: TComPort; Sender: TObject);
    procedure ShowTemp(Com: TComPort; EditTmp: TEdit; var tempEar: Real; Sender: TObject);
    procedure ShowStimulus(Sender: TObject);

  public
    { Public declarations }
  end;

  var
    FormTymp: TFormTymp;

    //vars for TimeCounter
    secs: Word = 0;
    mins: Word = 0;
    hrs: Word = 0;

    tempL: Real = 0;
    tempR: Real = 0;
    tempTong: Real = 0;


    //array for stimulus selection
    stimArray : array of Integer;

    // to mark on data file when letter stim shown on screen
    markStim : Boolean = False;
    showStim : Boolean = True;
    show2ndCtrl : Boolean = True;
    writeDataOk : Boolean = True;

    totMsec: Cardinal = 0;

    //time counter (in msec) for ShowStimulus procedure
    totStimMsec: Cardinal = 0;

    //flag for stimulus condition
    condition: Integer = 0;

    //to call Relays Unit procedures
    SenderRlys: TObject;

    //to call LEDs Unit procedures
    SenderLEDs: TObject;

     //to call ScreenStim Unit procedures
    SenderScreen: TObject;

   //to call TympData Unit procedures
    SenderData: TObject;

   //to call TempBars Unit procedures
    SenderTempBars: TObject;

implementation

uses UnitTempbars9, UnitTestLEDs9, UnitRelays9, UnitTympData9, UnitScreenStim9;

{$R *.dfm}

{---------------------------------------------------------------------------------------------------
            *** Beginning of definition of PRIVATE declarations ***
----------------------------------------------------------------------------------------------------}

procedure TFormTymp.ResetTemp(Sender: TObject);
begin
    EditTemp1.Text := ' __.__ C°';
    EditTemp2.Text := ' __.__ C°';
    EditTemp3.Text := ' __.__ C°';
end;

procedure TFormTymp.ResetTimeCounter(Sender: TObject);
begin
  hrs := 0;
  mins := 0;
  secs := 0;
  TimeCounter(Sender);
end;

procedure TFormTymp.TimeCounter(Sender: TObject);
var
  hrstr,minstr,secstr : string[4];
begin
  if secs = 60 then
  begin
    mins := mins + 1;
    secs := 0;
  end;

  if mins = 60 then
  begin
    hrs := hrs + 1;
    mins := 0;
  end;

  if (hrs div 10 = 0) then
    hrstr := '0' + IntToStr(hrs)
  else
    hrstr := IntToStr(hrs);

  if (mins div 10 = 0) then
    minstr := '0' + IntToStr(mins)
  else
    minstr := IntToStr(mins);

  if (secs div 10 = 0) then
    secstr := '0' + IntToStr(secs)
  else
    secstr := IntToStr(secs);

  EditTime.Text := ' ' + hrstr + ':' + minstr + ':' + secstr;

  secs := secs + 1;

end;

procedure TFormTymp.OpenCom(Com: TComPort; Sender: TObject);
var
  answer: AnsiString;
begin

  Com.Open;
  Com.WriteAnsiLine('FUNC?');
  Sleep(500);

  try
    answer := Com.ReadAnsiLine;

    if (Trim(answer) <> 'RES') then
      Com.WriteAnsiLine('FUNC RES');

    Timer.Enabled := True;
  except
  on E: EComError do
  begin
    Com.Close;
    Timer.Enabled := False;
    MediaPlayer.Play;
    ShowMessage(E.Message + ': ' + Com.DeviceName);
  end;
  end;
end;

procedure TFormTymp.ShowTemp(Com: TComPort; EditTmp: TEdit; var tempEar: Real; Sender: TObject);
var
  i: Word;
  temp_str: String;
  data: AnsiString;
  ohm,temp: Extended;
const
  //Coefficients for temp(K°) = f(Ω)
  c1 = 0.0014712260;
  c2 = 0.00023762276;
  c3 = 0.00000010502722;
  //Constant to be subtraced from temp(K°) to obtain temp(C°)
  c4 = 273.15;

begin
  Com.WriteAnsiLine('FETCh?');

  try
    data := Com.ReadAnsiLine;

    ohm := StrToFloat(Trim(data));

    //temp(C°) formula
    temp := 1/(c1+c2*(Ln(ohm))+c3*(Power(Ln(ohm),3)))-c4;

    //assigns temp value to be sent to Tympdata & Relays Units
    tempEar := RoundTo(temp,-3);

    //sets temp_str for displaying temp(C°) on screen
    temp_str := FloatToStr(tempEar);

 
    i := length(temp_str);

    while i < 6 do
    begin
      if i = 2 then
      begin
        temp_str := temp_str + '.';
        i := i+1;
      end;
      temp_str := temp_str + '0';
      i := i+1;
    end;

    //displays temp(C°) on screen
    EditTmp.Text := ' ' + temp_str + ' C°';

  except
    on E: EComError do
    begin
      Com.Close;
      Timer.Enabled := False;
      MediaPlayer.Play;
      ShowMessage(E.Message + ': ' + Com.DeviceName);
    end;
  end;
end;

procedure TFormTymp.ShowStimulus(Sender: TObject);
var
  //duration of control condition for ShowStimulus procedure
  ctrlStimMsec : Cardinal;

begin
  ctrlStimMsec := EditCtrl1.Value * 60000;

  // Control condition (blank screen) during the first --- secs, as specified by
  // var ctrlTime

  if (totStimMsec >= ctrlStimMsec) then
  begin

    if totStimMsec = ctrlStimMsec then
    begin

      if MaxIntValue(stimArray) >= 0 then
      begin
        // draws fixation point and plays sound
        nStim := 21;
        FormScreen.MediaPlayer.Play;
        FormScreen.StimulusPaint(SenderScreen);

       //stimulus selection
       nStim := Random(21);
       while stimArray[nStim] < 0 do
         nStim := Random(21);

       //flags stimulus in array as having been shown
       stimArray[nStim] := -1;

       condition := 1;
      end
      else
      begin
        if show2ndCtrl then
        begin
          totStimMsec := 0;
          condition := 2;
          show2ndCtrl := False;

          nStim := 23;
          FormScreen.MediaPlayer.FileName := 'C:\Windows\Media\Windows Print complete.wav';
          FormScreen.MediaPlayer.Open;
          FormScreen.MediaPlayer.Play;
          FormScreen.StimulusPaint(SenderScreen);

          Sleep(1500);

          nStim := 22;
          FormScreen.StimulusPaint(SenderScreen);
        end
        else
        begin
          showStim := False;
          nStim := 24;
          FormScreen.MediaPlayer.FileName := 'C:\Windows\Media\tada.wav';
          FormScreen.MediaPlayer.Open;
          FormScreen.MediaPlayer.Play;
          FormScreen.StimulusPaint(SenderScreen);
        end;
      end;
    end;

    // draws stimulus
    if totStimMsec = ctrlStimMsec + 500 then
    begin
      FormScreen.StimulusPaint(SenderScreen);
      markStim := True;
    end;

    // draws blank screen
    if totStimMsec = ctrlStimMsec + 2000 then
    begin
      nStim := 22;
      FormScreen.StimulusPaint(SenderScreen);
    end;

    // resets totTime to ---
    if totStimMsec = ctrlStimMsec + (EditExp.Value * 1000) + 1500 then
      totStimMsec := ctrlStimMsec - 500;

  end;
end;

{---------------------------------------------------------------------------------------------------
             *** End of definition of PRIVATE declarations ***
----------------------------------------------------------------------------------------------------}


procedure TFormTymp.ButtonStartClick(Sender: TObject);
var
  i : Word;
begin

  //initializes stimArray
  setLength(stimArray, 21);
  for i := 0 to Length(stimArray) -1 do
    stimArray[i] := i;

  OpenCom(ComPort1,Sender);
  OpenCom(ComPort2,Sender);
  OpenCom(ComPort3,Sender);

  FormTymDat.Visible := True;

  //Disables itself and "Test Probes" button + Enables "Stop" button
  TestProbesBtn.Enabled := False;
  ButtonStart.Enabled := False;

  case FormLEDs.RadioGroup1.ItemIndex of
    0: FormTymdat.DataGrid.Cells[6,0] := 'Group A';
    1: FormTymdat.DataGrid.Cells[6,0] := 'Group B';
  end;
end;

procedure TFormTymp.TestProbesBtnClick(Sender: TObject);
begin
  if TestProbesBtn.Down then
  begin

    TestProbesBtn.Flat := True;
    TestProbesBtn.Caption := 'Test Probes: ON';

    OpenCom(ComPort1,Sender);
    OpenCom(ComPort2,sender);
    OpenCom(ComPort3,Sender);

    //Activates LEDs Form
    FormLEDs.Visible := True;
    FormLEDs.SpeedButton1.Down := True;
    FormLEDs.SpeedButton1Click(SenderLEDs);

    //Activates TempBars Form
    FormTempBars.Visible := True;

    WarmUpBtn.Enabled := True;
    ButtonStart.Enabled := False;
  end
  else
  begin
    ComPort1.Close;
    ComPort2.Close;
    ComPort3.Close;

    TestProbesBtn.Flat := False;
    TestProbesBtn.Caption := 'Test Probes: OFF';
    ResetTemp(Sender);

    Timer.Enabled := False;
    ButtonStart.Enabled := True;

    //Disactivates LEDs Form
    FormLEDs.Visible := False;
    FormLEDs.SpeedButton1.Down := False;
    FormLEDs.SpeedButton1Click(SenderLEDs);

    WarmUpBtn.Enabled := False;
  end;
end;

procedure TFormTymp.WarmUpBtnClick(Sender: TObject);
begin
  if WarmUpBtn.Down then
  begin
    WarmUpBtn.Flat := True;
    WarmUpBtn.Caption := 'Warm Up: ON';
    FormRelays.OpenCom(SenderRlys);
    FormRelays.Visible := True;
  end
  else
  begin
    WarmUpBtn.Flat := False;
    WarmUpBtn.Caption := 'Warm Up: OFF';
    FormRelays.CloseCom(SenderRlys);
    FormRelays.Visible := False;
  end;
end;

procedure TFormTymp.TimerTimer(Sender: TObject);
begin

  //assigns ComPort1 to L/R side as selected on RadioGroup in LEDs Unit
  if ComPort1.Active then
  case FormLEDs.RadioGroup1.ItemIndex of
    0 : ShowTemp(ComPort1,EditTemp1,tempL,Sender);
    1 : ShowTemp(ComPort1,EditTemp2,tempR,Sender);
  end;

  //assigns ComPort2 to L/R side as selected on RadioGroup in LEDs Unit
  if ComPort2.Active then
  case FormLEDs.RadioGroup1.ItemIndex of
    0 : ShowTemp(ComPort2,EditTemp2,tempR,Sender);
    1 : ShowTemp(ComPort2,EditTemp1,tempL,Sender);
  end;

  if ComPort3.Active then
    ShowTemp(ComPort3,EditTemp3,tempTong,Sender);

  //assigns values to variables in TempBars Unit
  tempLint := Round(Frac(tempL) * 100);
  tempRint := Round(Frac(tempR) * 100);

  FormtempBars.SetBarVal(SenderTempBars);

  //Shows stimuli on ScreenStim and writes temp data to TympData Unit
  //when no probes testing is ongoing
  if not TestProbesBtn.Down then
  begin

    totMsec := totMsec + Timer.Interval;

    if showStim then
    begin
      ShowStimulus(Sender);
      totStimMsec := totStimMsec + Timer.Interval;

      //assigns values to variable in TympData Unit
      if writeDataOk then
      begin
        //updates display of elapsed time
        TimeCounter(Sender);

        secStr := IntToStr(totMsec div 1000);
        tempLstr := FloatToStrF(tempL,ffFixed,18,3);
        tempRstr := FloatToStrF(tempR,ffFixed,18,3);
        tempTongstr := FloatToStrF(tempTong,ffFixed,18,3);
        condStr := IntToStr(condition);
        markStimStr := BoolToStr(markStim);
        FormTymDat.WriteData(SenderData);
        markStim := False;
      end;

      writeDataOk := not writeDataOk;

    end
    else
    begin
      ComPort1.Close;
      ComPort2.Close;
      ComPort3.Close;
      ResetTemp(Sender);
      ResetTimeCounter(Sender);

      if not FormTymDat.Visible then
        FormTymDat.Visible := True;

      FormTymDat.ButtonSave.Enabled := True;

      //Disables Test Probes" button
      TestProbesBtn.Enabled := False;
      Timer.Enabled := False;
    end;

  end
  else
  begin
    //turns on Pre-Warming procedure for temp probes
    if WarmUpBtn.Down then
    begin
      //assigns values to variables in Relays Unit
      tempLn := tempL;
      tempRn := tempR;

      FormRelays.PreWarm(SenderRlys);
    end;
  end;
end;

end.
