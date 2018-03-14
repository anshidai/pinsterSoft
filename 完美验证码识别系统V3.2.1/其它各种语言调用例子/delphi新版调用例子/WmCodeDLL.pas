﻿unit WmCodeDll;
//By 黑夜杀手
interface

uses
  Windows, Messages, SysUtils, Variants,  Classes, Graphics;

// 加载字库
function LoadwmFontTemplate(Const FullFilePath: string;
  Const Password: string = ''): boolean; overload;
function LoadwmFontTemplate(TemplateDataStream: TMemoryStream;
  Const Password: string = ''): boolean; overload;

// 取得验证结果
function GetVerifyCode(VCImgStream: TMemoryStream): string; overload;
function GetVerifyCode(Const VCImgFilePath: string): string; overload;
function GetVerifyCode(VCImg: TGraphic): string; overload;

function WmOption(OptionIndex, OptionValue: Integer): boolean;

implementation

function LoadWmFromFile(FilePath: AnsiString; Password: AnsiString): boolean;
  stdcall; external 'WmCode.dll' name 'LoadWmFromFile';
(*
  函数功能说明：从文件中载入识别库文件，成功返回True，否则返回False。
  函数参数说明：
  FilePath  ：文本型，识别库文件所在全路径。
  Password  ：文本型，识别库调用密码
*)
function LoadWmFromBuffer(FileBuffer: Pointer; FileBufLen: Integer;
  Const Password: AnsiString): boolean; stdcall;
  external 'WmCode.dll' name 'LoadWmFromBuffer';
(*
  函数功能说明：从内存中载入识别库文件，成功返回True，否则返回False。
  函数参数说明：
  FileBuffer ：整数型，一个记录了识别库文件的二进制数据的字节数组，或一块同样功
  能的内存区域。这里请提供数组第一个成员的地址，或内存区域的地址。
  FileBufLen ：整数型，上述字节数组的数组成员数，或内存区域大小。
  Password  ：文本型，识别库调用密码
*)
function GetImageFromFile(FilePath: AnsiString; Vcode: AnsiString): boolean;
  stdcall; external 'WmCode.dll' name 'GetImageFromFile';
(*
  函数功能说明：识别一个图像文件，成功返回True，否则返回False。
  函数参数说明：
  FilePath ：文本型，图像文件所在全路径。
  Vcode  ：文本型，返回的验证码字符串，使用该参数前需要将一个足够长的空白字符串赋值给它。
*)
function GetImageFromBuffer(ImgBuffer: Pointer; ImgBufLen: Integer;
  Vcode: AnsiString): boolean; stdcall;
  external 'WmCode.dll' name 'GetImageFromBuffer';
(*
  函数功能说明：识别一个记录了图像文件的二进制数据的字节数组，或一块同样功能的
  内存区域，成功返回True，否则返回False。
  函数参数说明：
  ImgBuffer ：整数型，一个记录了图像文件的二进制数据的字节数组，或一块同样功能的
  内存区域。这里请提供数组第一个成员的地址，或内存区域的地址。
  ImgBufLen ：整数型，上述字节数组的数组成员数，或内存区域大小。
  Vcode ：文本型，返回的验证码字符串，使用该参数前需要将一个足够长的空白字符串赋值给它。
*)
function SetWmOption(OptionIndex, OptionValue: Integer): boolean; stdcall;
  external 'WmCode.dll' name 'SetWmOption';

(* 函数功能说明：设定识别库选项。设定成功返回真，否则返回假。

  函数参数说明：
  OptionIndex ：整数型，选项索引，取值范围1～7
  OptionValue ：整数型，选项数值。

  参数详解：
  OptionIndex（方式目前有1-7），每个都有对应的取值范围（OptionValue ），分别如下：
  1.返回方式	取值范围：0～1     默认为0,直接返回验证码,为1返回验证码字符和矩形
  范围形如：S,10,11,12,13|A,1,2,3,4 表示识别到文本 S 左边横坐标10,左边纵坐标
  11,右边横坐标,右边纵坐标12

  2.识别方式  取值范围：0～4     默认为0,0整体识别,1连通分割识别,2纵分割识别,
  3横分割识别,4横纵分割识别。可以进行分割的验证码，建议优先使用分割识别，
  因为分割后不仅能提高识别率，而且还能提高识别速度

  3.识别模式	取值范围：0～1     默认为0,0识图模式,1为识字模式。识图模式指的是
  背景白色视为透明不进行对比，识字模式指的是白色不视为透明，也加入对比。绝大
  多数我们都是使用识图模式，但是有少数部分验证码，使用识字模式更佳。

  4.识别加速	取值范围：0～1     默认为0,0为不加速,1为使用加速。一般我们建议开启
  加速功能，开启后对识别率几乎不影响。而且能提高3-5倍识别速度。

  5.加速返回	取值范围：0～1     默认为0,0为不加速返回,1为使用加速返回。使用加速
  返回一般用在粗体字识别的时候，可以大大提高识别速度，但是使用后，会稍微影响识
  别率。识别率有所下降。一般不是粗体字比较耗时的验证码，一般不用开启

  6.最小相似度	取值范围：0～100 默认为90

  7.字符间隙  取值范围：-10～0   默认为0,如果字符重叠,根据实际情况填写,如-3允许
  重叠3像素,如果不重叠的话,直接写0，注意：重叠和粘连概念不一样，粘连的话，
  其实字符间隙为0.
*)

function Calculator(Expression: AnsiString; CalcResult: AnsiString): boolean;
  stdcall; external 'WmCode.dll' name 'Calculator';
(*
  函数功能说明：计算数学表达式。失败返回空文本，成功返回计算结果文本。功能简单，
  只是用来计算那些需要填写计算结果的验证码。计算完成返回真，否则返回假。

  函数参数说明：
  Expression ：文本型，数学表达式，只能计算加，减，乘，除，次方运算，支持小括号
  ，中括号，大括号运算，支持负数运算。
  CalcResult ：文本型，计算结果，使用需要将一个足够长的空白字符串赋值给它。
*)

function UseUnicodeString(OptionIndex, OptionValue: Integer): boolean; stdcall;
  external 'WmCode.dll' name 'UseUnicodeString';
(*
  函数功能说明：设置传入传出dll的各个文本类型参数是否使用unicode格式，一次设置在
  程序运行期间有效。设置成功返回真，失败返回假
  函数参数说明：
  OptionIn ：整数型，选项索引，取值范围：1～2 ，1代表设置传入，2代表设置传出
  OptionOut ：整数型，选项数值。取值范围：0～1，默认为0使用ansi格式，为1使用unicode文本
  参数详解：
  如果要让DLL传入或传出返回Unicode格式的字符文本，必须在加载字库之前先调用
  这个API，使用后所有API的文本参数【传入】或【传出】都将被视为unicode文本。
*)

function LoadwmFontTemplate(Const FullFilePath: string;
  Const Password: string = ''): boolean;
begin
  Result := LoadWmFromFile(AnsiString(FullFilePath), AnsiString(Password));
end;

function LoadwmFontTemplate(TemplateDataStream: TMemoryStream;
  Const Password: string = ''): boolean;
begin
  Result := LoadWmFromBuffer(TemplateDataStream.Memory, TemplateDataStream.Size,
    AnsiString(Password));
end;

function GetVerifyCode(VCImgStream: TMemoryStream): string;
var
  MStr: AnsiString;
begin
  MStr := AnsiString(StringOfChar(#0, 256)); // 预置字符串，以开辟一个空间接收返回的验证码
  if not GetImageFromBuffer(VCImgStream.Memory, VCImgStream.Size, MStr) then
    Result := ''
  else
    Result := Trim(string(MStr));
end;

function GetVerifyCode(Const VCImgFilePath: string): string;
var
  mStream: TMemoryStream;
  MStr: AnsiString;
begin
  mStream := TMemoryStream.Create;
  MStr := AnsiString(StringOfChar(#0, 256)); // 预置字符串，以开辟一个空间接收返回的验证码
  try
    mStream.LoadFromFile(VCImgFilePath);
    if not GetImageFromBuffer(mStream.Memory, mStream.Size, MStr) then
      Result := ''
    else
      Result := Trim(String(MStr));
  finally
    mStream.Free;
  end;
end;

function GetVerifyCode(VCImg: TGraphic): string;
var
  mStream: TMemoryStream;
  MStr: AnsiString;
begin
  mStream := TMemoryStream.Create;
  MStr := AnsiString(StringOfChar(#0, 256)); // 预置字符串，以开辟一个空间接收返回的验证码
  try
    VCImg.SaveToStream(mStream);
    if not GetImageFromBuffer(mStream.Memory, mStream.Size, MStr) then
      Result := ''
    else
      Result := Trim(string(MStr));
  finally
    mStream.Free;
  end;
end;

function WmOption(OptionIndex, OptionValue: Integer): boolean;
begin
  SetWmOption(OptionIndex, OptionValue);
end;

end.
