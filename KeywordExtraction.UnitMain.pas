unit KeywordExtraction.UnitMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit,
  REST.Types, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo2: TMemo;
    Memo1: TMemo;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    StyleBook1: TStyleBook;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
  System.Threading;

procedure TForm1.Button1Click(Sender: TObject);
begin
  TTask.Run(
    procedure
    begin
      RESTClient1.ResetToDefaults;
      RESTClient1.Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
      RESTClient1.AcceptCharset := 'utf-8, *;q=0.8';
      RESTClient1.BaseURL := 'https://api.apilayer.com/keyword';
      RESTClient1.ContentType := 'application/json';

      RESTRequest1.ClearBody;
      RESTRequest1.Params.Clear;

      // API acc. key
      RESTRequest1.Params.AddItem;
      RESTRequest1.Params.Items[0].Kind := pkHTTPHEADER;
      RESTRequest1.Params.Items[0].Name := 'apikey';
      RESTRequest1.Params.Items[0].Value := 'QdSe87VnIPlTkpLrS5i46iVl8XJqlDlf';
      RESTRequest1.Params.Items[0].Options := [poDoNotEncode];

      // set the url for checking
      RESTRequest1.Params.AddItem;
      RESTRequest1.Params.Items[1].Kind := pkREQUESTBODY;
      RESTRequest1.Params.Items[1].Name := 'body';
      RESTRequest1.Params.Items[1].Value := Memo1.Text; // sample body inserted
      RESTRequest1.Params.Items[1].ContentTypeStr := CONTENTTYPE_TEXT_PLAIN;

      RESTRequest1.Execute;
    end);

  Memo2.Lines.Clear;
  Memo2.Lines.Add(RESTResponse1.Content);
end;

end.
