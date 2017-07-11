unit UnitTympData9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids;

type
  TFormTymDat = class(TForm)
    DataGrid: TStringGrid;
    ButtonSave: TButton;
    SaveDataDialog: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure WriteData(Sender: TObject);
  end;

var
  FormTymDat: TFormTymDat;
  datafile: TextFile;
  //data to be saved on txt file
  secStr, tempLstr, tempRstr, tempTongstr, condStr, markStimStr, ubjGroup: String;
  showLastRow: Boolean = True;

implementation

{$R *.dfm}

{ *** Beginning of definition of PUBLIC declarations ***
  ***                                                ***
  ***                                                ***}

procedure TFormTymDat.WriteData(Sender: TObject);
begin
  with DataGrid do
  begin
    Cells[0,RowCount-1] := SecStr;
    Cells[1,RowCount-1] := tempLstr;
    Cells[2,RowCount-1] := tempRstr;
    Cells[3,RowCount-1] := tempTongstr;
    Cells[4,RowCount-1] := condStr;
    Cells[5,RowCount-1] := markStimStr;

    RowCount := RowCount + 1;

    //to keep showing the last data point added to the grid
    if showLastRow then
      Row := RowCount -2;
 end;
end;

{ *** End of definition of PUBLIC declarations ***
  ***                                          ***
  ***                                          ***}


procedure TFormTymDat.FormCreate(Sender: TObject);
begin
  with dataGrid do
  begin
    Cells[0,0] := 'Time';
    Cells[1,0] := 'T_Left';
    Cells[2,0] := 'T_Right';
    Cells[3,0] := 'T_tongue';
    Cells[4,0] := 'Condition';
    Cells[5,0] := 'Stim Shown';
    Cells[6,0] := 'Group A';
  end;
end;

procedure TFormTymDat.ButtonSaveClick(Sender: TObject);
var
  c,r :Integer;
begin
  ForceCurrentDirectory := True;
  SaveDataDialog.Execute;
  AssignFile(datafile,SaveDataDialog.FileName);
  ReWrite(datafile);

  for r := 0 to DataGrid.RowCount -1 do
  begin
    for c := 0 to DataGrid.ColCount -1 do  // = tab separator
      Write(datafile,DataGrid.Cells[c,r] + #9);
    WriteLn(datafile);
  end;

  CloseFile(datafile);
end;

end.
