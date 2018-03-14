[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=361bf8ce-3c5d-491f-b2ba-67f3ed879336
Description=WmCode.dll验证码识别例子
Enable=1
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]

[Script]
Private Declare Function LoadWmFromFile Lib "D:\WmCode.dll" (ByVal FilePath As String,ByVal Password As String) As Boolean
Private Declare Function GetImageFromFile Lib "D:\WmCode.dll" (ByVal FilePath As String,ByVal Vcode As String) As Boolean
Private Declare Function UseUnicodeString Lib "D:\WmCode.dll" (ByVal OptionIndex As Long,ByVal OptionValue As Long) As Boolean
Private Declare Function SetWmOption  Lib "D:\WmCode.dll" (ByVal OptionIndex As Long,ByVal OptionValue As Long) As Boolean

If (UseUnicodeString(1, 1) = False) Then '设置传入文本格式为Unicode
	MsgBox "设置传入文本格式为Unicode不成功"
	EndScript
End If

If (UseUnicodeString(2, 1) = False) Then '设置传出文本格式为Unicode
	MsgBox "设置传出文本格式为Unicode不成功"
	EndScript
End If

If (LoadWmFromFile("D:\网易论坛.dat", "163") = False) Then '加载识别库，识别库密码为163 
	MsgBox "载入识别库不成功"
	EndScript
End If

If (SetWmOption(4, 1) = False) Then '设置识别参数，开启加速功能
	MsgBox "开启加速功能失败"
	EndScript
End If

If (SetWmOption(6, 85) = False) Then '设置识别参数，设置识别模糊度为85
	MsgBox "设置识别模糊度失败"
	EndScript
End If

Vcode = Space(255)'必须先将识别结果初始化
If (GetImageFromFile("D:\temp.JPG", Vcode)) Then 
	MsgBox Vcode
Else 
	MsgBox "识别错误"
End If
