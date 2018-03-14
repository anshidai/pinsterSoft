unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

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
  wmbool:boolean;
  path: array[0..256] of Char;
function LoadWmFromFile(CdsFile:string;Password:string):boolean;stdcall;external 'WmCode.dll'name 'LoadWmFromFile';
function LoadWmFromBuffer(FileBuffer:Pointer;FileBufLen:boolean;Password:string):integer;stdcall;external 'WmCode.dll' name 'LoadWmFromBuffer';
function GetImageFromFile(FilePath:string;Vcode:string):boolean;stdcall;external 'WmCode.dll' name 'GetImageFromFile';
function GetImageFromBuffer(ImgBuffer:Pointer;ImgBufLen:integer;Vcode:string):boolean;stdcall;external 'WmCode.dll' name 'GetImageFromBuffer';
function URLDownloadToFile(pCaller:integer;szURL:string;szFileName:string;dwReserved:Integer;lpfnCB:Integer):Integer;stdcall;external 'urlmon.dll' name 'URLDownloadToFileA';

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  mStream: TMemoryStream;
begin
  //������ʾLoadWmFromFile����
  wmbool := LoadWmFromFile(Edit1.Text,'163');
  //������ʾLoadWmFromBuffer����
//  mStream := TMemoryStream.Create;
//  mStream.LoadFromFile(Edit1.Text);
//  wmbool :=LoadWmFromBuffer(mStream.Memory,mStream.Size,'163');
  if(wmbool) then
  begin
    Button2.Enabled := True;
    Button3.Enabled := True;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  tf:string;
begin
  tf := path + '\temp.JPG';
  URLDownloadToFile(0,Edit2.Text,tf,0,0);
  //Image1.Picture.LoadFromFile(tf);
  Image1.Visible := true;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  result: string;
  tf:string;
  mStream: TMemoryStream;
begin
  tf := path + '\temp.JPG';
  result := StringOfChar(' ',256); //Ԥ���ַ������Կ���һ���ռ���շ��ص���֤��
  //����ΪGetImageFromFile������ʾ
//  if(GetImageFromFile(tf,result)) then
//  begin
//    Edit3.Text := result;
//  end
  //����ΪGetImageFromBuffer������ʾ
  mStream := TMemoryStream.Create;
  mStream.LoadFromFile(tf); {���ļ������ڴ����������ʾ�ڴ���÷�ʽ}
  if(GetImageFromBuffer(mStream.Memory,mStream.Size,result)) then
  begin
    Edit3.Text := result;
  end
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  GetCurrentDirectory(SizeOf(path), path);
  Self.Edit1.Text := path + '\������̳.dat';
end;

end.
