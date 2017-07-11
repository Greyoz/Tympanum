program Tympanum9;

uses
  Vcl.Forms,
  UnitTympanum9 in 'UnitTympanum9.pas' {FormTymp},
  UnitTympData9 in 'UnitTympData9.pas' {FormTymDat},
  UnitScreenStim9 in 'UnitScreenStim9.pas' {FormScreen},
  UnitRelays9 in 'UnitRelays9.pas' {FormRelays},
  UnitTestLEDs9 in 'UnitTestLEDs9.pas' {FormLEDs},
  UnitTempBars9 in 'UnitTempBars9.pas' {FormTempBars};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormTymp, FormTymp);
  Application.CreateForm(TFormTymDat, FormTymDat);
  Application.CreateForm(TFormScreen, FormScreen);
  Application.CreateForm(TFormRelays, FormRelays);
  Application.CreateForm(TFormLEDs, FormLEDs);
  Application.CreateForm(TFormTempBars, FormTempBars);
  Application.Run;
end.
