unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, WmCodeDll, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, jpeg;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit3: TEdit;
    IdHTTP1: TIdHTTP;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  AppPath: string;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  if LoadwmFontTemplate(Edit1.Text, '7ma') then
  begin
    Button2.Enabled := True;
    Button3.Enabled := True;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  AResponseContent: TMemoryStream;
begin
  AResponseContent := TMemoryStream.Create;
  IdHTTP1.Get(Edit2.Text, AResponseContent);
  AResponseContent.Position := 0;
  Image1.Picture.LoadFromStream(AResponseContent);
  AResponseContent.Free;
  Image1.Visible := True;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Edit3.Text := GetVerifyCode(Image1.Picture.Graphic);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  AppPath := ExtractFilePath(Application.ExeName);
  WmOption(1, 0);
  WmOption(2, 0);
  WmOption(3, 0);
  WmOption(4, 1);
  WmOption(5, 0);
  WmOption(6, 88);
  WmOption(7, 0);
  Edit1.Text := AppPath + 'p1.7ma.cn.dat';
end;

end.
