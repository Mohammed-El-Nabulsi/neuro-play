unit UHaupt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, MainlyProcessingMethods, GetSetVariables, ConstantMethods, Advanced,
  Grids;

type
  TFAnwendung = class(TForm)
    INeuron: TImage;
    EEingang1: TEdit;
    EEingang2: TEdit;
    LEingang0: TLabel;
    LW0Gleich: TLabel;
    LW1Gleich: TLabel;
    LE0: TLabel;
    LE1: TLabel;
    LE2: TLabel;
    LW2: TLabel;
    TLAa: TLabel;
    EW0: TEdit;
    EW1: TEdit;
    EW2: TEdit;
    LW2Gleich: TLabel;
    BBerechnen: TButton;
    BLernen: TButton;
    BitBtn1: TBitBtn;
    EASoll: TEdit;
    LASoll: TLabel;
    LAlphaGleich: TLabel;
    TSum: TLabel;
    TLA: TLabel;
    Talpha: TLabel;
    BNeu: TButton;
    LA: TLabel;
    ETimes: TEdit;
    Label1: TLabel;
    BAdvancedShow: TButton;
    DataGrid: TStringGrid;
    LearnTableButton: TButton;
    Label2: TLabel;
    LCurrTime: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure BBerechnenClick(Sender: TObject);
    procedure BLernenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BNeuClick(Sender: TObject);
    procedure LearnTableButtonClick(Sender: TObject);

  private

  public

  end;

var
  FAnwendung: TFAnwendung;

implementation

{$R *.DFM}

procedure Main(Source :String);
begin
try
  try
     if(MainlyProcessingMethods.Reading = true) then
             MainlyProcessingMethods.Process(Source);
  except on E : EConvertError do
     ShowMessage('Eingabefehler! Folgender Fehler wurde registriert: '+E.Message);
  else ShowMessage('Nicht behandelter Fehler aufgertreten');
  end;
  finally TBaseClass.SetCurTime(0);
  end;
end;


procedure TFAnwendung.LearnTableButtonClick(Sender: TObject);
begin
try
 try
  MainlyProcessingMethods.ReadTable();
  except on E : EConvertError do
     ShowMessage('Eingabefehler! Folgender Fehler wurde registriert: '+E.Message);
  else ShowMessage('Nicht behandelter Fehler aufgertreten');
  end;
  finally TBaseClass.SetCurTime(0);
  end;
end;


procedure TFAnwendung.BBerechnenClick(Sender: TObject);
begin
     Main('Manual');
end;


procedure TFAnwendung.BLernenClick(Sender: TObject);
begin
     Main('Automatic');
end;


procedure TFAnwendung.FormCreate(Sender: TObject);
begin
     TBaseClass := BaseClass.Create;
     ConstantMethods.StandardValues();
end;


procedure TFAnwendung.BNeuClick(Sender: TObject);
begin
      ConstantMethods.New();
end;

end.
