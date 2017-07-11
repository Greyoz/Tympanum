unit UnitRelays9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ComPort, Vcl.StdCtrls, Vcl.Samples.Spin,
  Vcl.Buttons, Vcl.ExtCtrls;

type
  TFormRelays = class(TForm)
    ComPortRelays: TComPort;
    SpinEditTemp: TSpinEdit;
    LabelTemp: TLabel;
  private
    { Private declarations }
    procedure PreWarmProbe(probeTemp: Real; chnl: Char; Sender: TObject);
  public
    { Public declarations }
    procedure OpenCom(Sender: TObject);
    procedure PreWarm(Sender: TObject);
    procedure CloseCom(Sender: TObject);
  end;

var
  FormRelays: TFormRelays;
  tempRn, tempLn : Real;

implementation

uses UnitTestLEDs1;

{$R *.dfm}

{ *** Beginning of definition of PRIVATE declarations ***
  ***                                                 ***
  ***                                                 ***}

procedure TFormRelays.PreWarmProbe(probeTemp: Real; chnl: Char; Sender: TObject);
begin
  If (probeTemp <= SpinEditTemp.Value) then
    ComPortRelays.WriteAnsiLine('relay on ' + chnl)
    else
    if (probeTemp >= SpinEditTemp.Value + 0.05) then
      ComPortRelays.WriteAnsiLine('relay off ' + chnl);
end;

{ *** End of definition of PRIVATE declarations ***
  ***                                           ***
  ***                                           ***}


{ *** Beginning of definition of PUBLIC declarations ***
  ***                                                ***
  ***                                                ***}

procedure TFormRelays.OpenCom(Sender: TObject);
begin
  ComPortRelays.Open;
end;

procedure TFormRelays.CloseCom(Sender: TObject);
begin
  ComPortRelays.WriteAnsiLine('reset');
  ComPortRelays.Close;
end;

procedure TFormRelays.PreWarm(Sender: TObject);
begin
  PreWarmProbe(tempLn,'0',Sender);
  PreWarmProbe(tempRn,'1',Sender);
end;

{ *** End of definition of PUBLIC declarations ***
  ***                                          ***
  ***                                          ***}

end.
