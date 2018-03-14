object Form1: TForm1
  Left = 192
  Top = 114
  Width = 337
  Height = 279
  Caption = 'WmCode.dll'#30340'Delphi'#35843#29992#20363#31243
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 185
    Height = 13
    AutoSize = False
    Caption = #35831#35774#32622#35201#36733#20837#30340'dat'#25991#20214#36335#24452
  end
  object Label2: TLabel
    Left = 16
    Top = 72
    Width = 185
    Height = 13
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
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 16
    Top = 96
    Width = 289
    Height = 21
    TabOrder = 1
    Text = 'http://bbs.ent.163.com/bbs/checkcode.jsp?1201359681906'
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
    Height = 21
    TabOrder = 5
  end
end
