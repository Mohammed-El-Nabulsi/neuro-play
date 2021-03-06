unit ConstantMethods;

interface
  uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, GetSetVariables, Math;

  procedure New();
  procedure StandardValues();
  function Delta() : double;
  function InitializationWarning() : Boolean;
  function TimeWarning() : Boolean;
  function RoundNumber(Num: double; Spaces: integer): double;

implementation

  uses UHaupt;

procedure StandardValues();
var i: integer;
begin
     TBaseClass.SetAlpha(1);
     TBaseClass.SetCurTime(0);
     FAnwendung.EW0.Text := '-0,5';
     FAnwendung.EW1.Text := '1,0';
     FAnwendung.EW2.Text := '0,8';
     FAnwendung.EEingang1.Text := IntToStr(0);
     FAnwendung.EEingang2.Text := IntToStr(0);
     FAnwendung.TSum.Caption := '';
     FAnwendung.TAlpha.Caption := IntToStr(1);
     FAnwendung.TLA.Caption := '';
     FAnwendung.DataGrid.Cols[1].Text := 'Eingang 1';
     FAnwendung.DataGrid.Cols[2].Text := 'Eingang 2';
     FAnwendung.DataGrid.Cols[3].Text := 'Soll';
     FAnwendung.ETimes.Text := '';

     for i := 1 to FAnwendung.DataGrid.RowCount do
        FAnwendung.DataGrid.Rows[i].Text := 'Daten ' + IntToStr(i);

     FAnwendung.DataGrid.CleanupInstance;
end;


procedure New();
begin
     TBaseClass.Destroy;
     TBaseClass := BaseClass.Create;
     StandardValues();
end;

function Delta() : double;
begin
     result := GetSetVariables.TBaseClass.GetShould -
                           GetSetVariables.TBaseClass.GetA;
end;

function InitializationWarning() : Boolean;
var tmpTextString, tmpHeadderString :String;
begin
   tmpTextString := 'Wie es aussieht, haben Sie vergessen, einigen Feldern einen Wert zuzuweisen. Diese wurden automatisch mit Null belegt. Wollen Sie die Werte noch einmal korregieren?';
   tmpHeadderString := 'Fehler beim Lesen der Werte';

   if(Application.Messagebox(PChar(tmpTextString),
                             PChar(tmpHeadderString),
                             MB_ICONQUESTION or MB_YESNO)) = IDYES then result := false
   else result := true;
end;

function TimeWarning() : Boolean;
var tmpTextString, tmpHeadderString :String;
begin
   tmpTextString := 'Sie haben nicht festgelegt, wie oft der Lernprozess wiederholt werden soll und er wurde auf 200 gesetzt. Wollen Sie ihn noch einmal korregieren?';
   tmpHeadderString := 'Schleifenende nicht definiert';

   if(Application.Messagebox(PChar(tmpTextString),
                             PChar(tmpHeadderString),
                             MB_ICONQUESTION or MB_YESNO)) = IDYES then result := false
   else result := true;
end;


function RoundNumber(Num: double; Spaces: integer): double;
var Multi: double;
begin
  Multi := IntPower(10, Spaces);
  Num := round(Num*Multi);
  result:= Num / Multi;
end;


end.
