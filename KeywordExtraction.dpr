program KeywordExtraction;

uses
  System.StartUpCopy,
  FMX.Forms,
  KeywordExtraction.UnitMain in 'KeywordExtraction.UnitMain.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
