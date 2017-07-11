unit UnitTempBars9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Samples.Gauges, Vcl.ExtCtrls,
  Vcl.ComCtrls;

type
  TFormTempBars = class(TForm)
    Gauge1: TGauge;
    Gauge2: TGauge;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetBarVal(Sender: TObject);
  end;

var
  FormTempBars: TFormTempBars;

//  prevTempLint: Longint = 500;
//  prevTempRint: Longint = 500;
  tempLint, tempRint: LongInt;

implementation

{$R *.dfm}

procedure TFormTempBars.SetBarVal(Sender: TObject);
begin
  Gauge1.Progress := Round(((tempLint - 50)/50)*100);
  Gauge2.Progress := Round(((tempRint - 50)/50)*100);

//  prevTempLint := tempLint;
//  prevTempRint := tempRint;

end;
end.
