object Form1: TForm1
  Left = 192
  Top = 114
  Caption = 'WmCode.dll'#30340'Delphi'#35843#29992#20363#31243
  ClientHeight = 248
  ClientWidth = 329
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #24494#36719#38597#40657
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 233
    Height = 29
    AutoSize = False
    Caption = #35831#35774#32622#35201#36733#20837#30340'dat'#25991#20214#36335#24452
  end
  object Label2: TLabel
    Left = 16
    Top = 72
    Width = 185
    Height = 21
    AutoSize = False
    Caption = #35831#35774#32622#39564#35777#30721#22270#20687#19979#36733#22320#22336
  end
  object Image1: TImage
    Left = 16
    Top = 128
    Width = 165
    Height = 65
  end
  object Edit1: TEdit
    Left = 16
    Top = 40
    Width = 289
    Height = 25
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 16
    Top = 96
    Width = 289
    Height = 25
    TabOrder = 1
    Text = 'http://p1.7ma.cn/Code.Gif'
  end
  object Button1: TButton
    Left = 208
    Top = 128
    Width = 97
    Height = 24
    Caption = #36733#20837#35782#21035#24211
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 208
    Top = 168
    Width = 97
    Height = 24
    Caption = #19979#36733#39564#35777#30721
    Enabled = False
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 208
    Top = 208
    Width = 97
    Height = 24
    Caption = #35782#21035#39564#35777#30721
    Enabled = False
    TabOrder = 4
    OnClick = Button3Click
  end
  object Edit3: TEdit
    Left = 16
    Top = 211
    Width = 165
    Height = 25
    TabOrder = 5
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 296
  end
end
