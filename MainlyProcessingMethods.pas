unit MainlyProcessingMethods;

interface

  uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, GetSetVariables, ConstantMethods;

  procedure Process(Source :String);
  function Reading() :Boolean;
  procedure CalculateAndDisplay(Source :String);
  procedure ReadTable();

implementation

  uses UHaupt;

  
procedure Process(Source :String);
begin
     if(Source = 'Manual') then
     begin
          if (GetSetVariables.TBaseClass.GetA <>
                                     GetSetVariables.TBaseClass.GetShould) then
          CalculateAndDisplay(Source)
          else Showmessage('Berechnung abgeschlossen');
     end
     else while (GetSetVariables.TBaseClass.GetA <>
                                       GetSetVariables.TBaseClass.GetShould) do
         CalculateAndDisplay(Source);
end;



function Reading() : Boolean;
var doIniWarning :Boolean;
begin
     result := true;

     if (length(FAnwendung.ETimes.Text) = 0) then
     begin
         if(ConstantMethods.TimeWarning = false) then result := false
         else
         begin
         TBaseClass.SetTimes(200);
         FAnwendung.ETimes.Text := '200';
         end;
     end
     else TBaseClass.SetTimes(StrToInt(FAnwendung.ETimes.Text));


     if (length(FAnwendung.EW0.Text) = 0) then
     begin
         TBaseClass.SetW1(0);
         FAnwendung.EW0.Text := '0';
         doIniWarning := true;
     end
     else TBaseClass.SetW0(StrToFloat(FAnwendung.EW0.Text));

     if (length(FAnwendung.EEingang1.Text) = 0)
        or (length(FAnwendung.EW1.Text) = 0) then
     begin
         FAnwendung.EW1.Text := '0';
         FAnwendung.EEingang1.Text := '0';
         TBaseClass.SetW1(0);
         TBaseClass.SetE1(0);
         doIniWarning := true;
     end
     else
     begin
         TBaseClass.SetW1(StrToFloat(FAnwendung.EW1.Text));
         TBaseClass.SetE1(StrToFloat(FAnwendung.EEingang1.Text));
     end;


     if (length(FAnwendung.EEingang2.Text) = 0)
        or (length(FAnwendung.EW2.Text) = 0) then
     begin
         FAnwendung.EW2.Text := '0';
         FAnwendung.EEingang2.Text := '0';
         TBaseClass.SetW2(0);
         TBaseClass.SetE2(0);
         doIniWarning := true;
     end
     else
     begin
         TBaseClass.SetW2(StrToFloat(FAnwendung.EW2.Text));
         TBaseClass.SetE2(StrToFloat(FAnwendung.EEingang2.Text));
     end;

     if(doIniWarning = true) then
         if(ConstantMethods.InitializationWarning = false) then result := false;
     if(result = false) then exit;

     SameText(FAnwendung.EEingang2.Text, '');
     TBaseClass.SetShould(StrToFloat(FAnwendung.EASoll.Text));
end;



procedure CalculateAndDisplay(Source :String);
var alpha, tmpSum: Double;
    tmpW0, tmpW1, tmpW2 :double;
begin
      tmpSum := TBaseClass.GetW0 + TBaseClass.GetW1*TBaseClass.GetE1
                                 + TBaseClass.GetW2*TBaseClass.GetE2;
      GetSetVariables.TBaseClass.SetSum(tmpSum);
      FAnwendung.TSum.Caption := FloatToStr(ConstantMethods.RoundNumber(tmpSum, 3));

      if(tmpSum > 0.5) then TBaseClass.SetA(1)
          else TBaseClass.SetA(0);

      if(GetSetVariables.TBaseClass.GetShould <>
                           GetSetVariables.TBaseClass.GetA) then
      begin   
          TBaseClass.SetCurTime(TBaseClass.GetCurTime + 1);
          FAnwendung.LCurrTime.Caption := IntToStr(TBaseClass.GetCurTime);


          tmpW0 := (TBaseClass.GetW0 + TBaseClass.GetAlpha*
                                   Delta);

          tmpW1 := (TBaseClass.GetW1 + TBaseClass.GetAlpha*
                                   Delta*
                                   TBaseClass.GetE1());

          tmpW2 := (TBaseClass.GetW2 + TBaseClass.GetAlpha*
                                   Delta*
                                   TBaseClass.GetE2());

          FAnwendung.EW0.Text := FloatToStr(ConstantMethods.RoundNumber(tmpW0, 3));
          FAnwendung.EW1.Text := FloatToStr(ConstantMethods.RoundNumber(tmpW1, 3));
          FAnwendung.EW2.Text := FloatToStr(ConstantMethods.RoundNumber(tmpW2, 3));


         TBaseClass.SetW0(tmpW0);
         TBaseClass.SetW1(tmpW1);
         TBaseClass.SetW2(tmpW2);

         alpha := TBaseClass.GetAlpha();
         alpha := alpha * (1 - GetSetVariables.TBaseClass.GetCurTime/
                                            GetSetVariables.TBaseClass.GetTimes);
         TBaseClass.SetAlpha(alpha);

         FAnwendung.Talpha.Caption := FloatToStr(
                                          ConstantMethods.RoundNumber(alpha, 3));
     end;

     FAnwendung.TLA.Caption := FloatToStr(TBaseClass.GetA());
end;


procedure ReadTable();
var i,k,j, tmpIndex, tmpOldIndex: integer;
    isEmpty: boolean;
    filledCellsArray : Array of Integer;
begin
     tmpOldIndex := -1;

     TBaseClass.SetW0(StrToFloat(FAnwendung.EW0.Text));
     TBaseClass.SetW1(StrToFloat(FAnwendung.EW1.Text));
     TBaseClass.SetW2(StrToFloat(FAnwendung.EW2.Text));

     if (length(FAnwendung.ETimes.Text) = 0) then
     begin
         if(ConstantMethods.TimeWarning = false) then exit
         else
         begin
         TBaseClass.SetTimes(200);
         FAnwendung.ETimes.Text := '200';
         end;
     end
     else TBaseClass.SetTimes(StrToInt(FAnwendung.ETimes.Text));

     for i := 1 to FAnwendung.DataGrid.RowCount - 1 do
     begin
          isEmpty := false;
          for j := 1 to 3 do
             if(length(FAnwendung.DataGrid.Cells[j, i]) = 0) then
             isEmpty := true;

          if(isEmpty = true) then continue;

          SetLength(filledCellsArray, Length(filledCellsArray) + 1);
          filledCellsArray[High(filledCellsArray)] := i;
     end;

     if(Length(filledCellsArray) = 0) then
     begin
         ShowMessage('Sie müssen midnestens eine Zeile in der Tabelle ausfüllen!');
         exit;
     end;

     for k := 1 to TBaseClass.GetTimes do
     begin
          if Length(filledCellsArray) > 0 then
          begin
              tmpIndex := Random(Length(filledCellsArray));
              if tmpOldIndex = tmpIndex then continue;
              tmpOldIndex := tmpIndex;
          end
          else tmpIndex := 0;

          GetSetVariables.TBaseClass.SetE1(StrToFloat(
                    FAnwendung.DataGrid.Cells[1, filledCellsArray[tmpIndex]]));
          GetSetVariables.TBaseClass.SetE2(StrToFloat(
                    FAnwendung.DataGrid.Cells[2, filledCellsArray[tmpIndex]]));
          GetSetVariables.TBaseClass.SetShould(StrToFloat(
                    FAnwendung.DataGrid.Cells[3, filledCellsArray[tmpIndex]]));

          Process('Automatic');
     end;
end;
end.
