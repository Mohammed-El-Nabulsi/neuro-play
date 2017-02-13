program Lernen;

uses
  Forms,
  UHaupt in 'UHaupt.pas' {FAnwendung},
  MainlyProcessingMethods in 'MainlyProcessingMethods.pas',
  GetSetVariables in 'GetSetVariables.pas',
  ConstantMethods in 'ConstantMethods.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFAnwendung, FAnwendung);
  Application.Run;
end.
