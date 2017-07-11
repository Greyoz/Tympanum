unit UnitScreenStim9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ImgList, Vcl.Imaging.jpeg,
  Vcl.MPlayer;

type
  TFormScreen = class(TForm)
    StimuliList1: TImageList;
    Stimulus: TPaintBox;
    MediaPlayer: TMediaPlayer;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure StimulusPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormScreen: TFormScreen;
  nStim : Integer;

implementation

{$R *.dfm}

procedure TFormScreen.StimulusPaint(Sender: TObject);
begin
  StimuliList1.Draw(Stimulus.Canvas,0,0,nStim);
end;

procedure TFormScreen.FormCreate(Sender: TObject);
begin
  // displays stimulus screen on monitor 2
  if Screen.MonitorCount > 1 then
  begin
    Left := Screen.Monitors[1].Left;
    Top := Screen.Monitors[1].Top;
  end;
end;

procedure TFormScreen.FormPaint(Sender: TObject);
begin
  Stimulus.Top := (FormScreen.Height div 2) - (Stimulus.Height div 2);
  Stimulus.Left := (FormScreen.Width div 2) - (Stimulus.Width div 2);
end;

end.
