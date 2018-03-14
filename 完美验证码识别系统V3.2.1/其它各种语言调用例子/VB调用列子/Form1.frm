VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "VB调用WmCode.dll例程"
   ClientHeight    =   3510
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3510
   ScaleWidth      =   4680
   StartUpPosition =   3  '窗口缺省
   Begin VB.CommandButton Command3 
      Caption         =   "载入识别库文件"
      Height          =   375
      Left            =   2160
      TabIndex        =   8
      Top             =   1800
      Width           =   2175
   End
   Begin VB.TextBox txtPath 
      Height          =   375
      Left            =   240
      TabIndex        =   7
      Text            =   "网易论坛.dat"
      Top             =   1200
      Width           =   4095
   End
   Begin VB.TextBox txtURL 
      Height          =   375
      Left            =   240
      TabIndex        =   5
      Text            =   "http://bbs.ent.163.com/bbs/checkcode.jsp?1201359681906"
      Top             =   480
      Width           =   4095
   End
   Begin VB.CommandButton Command2 
      Caption         =   "识别验证码图像"
      Enabled         =   0   'False
      Height          =   375
      Left            =   2160
      TabIndex        =   3
      Top             =   3000
      Width           =   2175
   End
   Begin VB.PictureBox Picture1 
      Height          =   615
      Left            =   240
      ScaleHeight     =   555
      ScaleWidth      =   1395
      TabIndex        =   2
      Top             =   2760
      Width           =   1455
   End
   Begin VB.CommandButton Command1 
      Caption         =   "下载验证码图像"
      Enabled         =   0   'False
      Height          =   375
      Left            =   2160
      TabIndex        =   1
      Top             =   2400
      Width           =   2175
   End
   Begin VB.TextBox Text1 
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   14.25
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   615
      Left            =   240
      TabIndex        =   0
      Top             =   1800
      Width           =   1455
   End
   Begin VB.Label Label2 
      Caption         =   "设置识别库路径"
      Height          =   255
      Left            =   240
      TabIndex        =   6
      Top             =   960
      Width           =   1455
   End
   Begin VB.Label Label1 
      Caption         =   "设置验证码地址"
      Height          =   255
      Left            =   240
      TabIndex        =   4
      Top             =   120
      Width           =   1695
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function URLDownloadToFile Lib "urlmon" Alias "URLDownloadToFileA" (ByVal pCaller As Long, ByVal szURL As String, ByVal szFileName As String, ByVal dwReserved As Long, ByVal lpfnCB As Long) As Long
'请根据自己的情况修改WmCode.dll所在路径
Private Declare Function LoadWmFromBuffer Lib "WmCode.dll" (ByVal FileBuffer As Long, ByVal FileBufLen As Long, ByVal Password As String) As Boolean
Private Declare Function LoadWmFromFile Lib "WmCode.dll" (ByVal FilePath As String, ByVal Password As String) As Boolean
Private Declare Function GetImageFromFile Lib "WmCode.dll" (ByVal FilePath As String, ByVal Vcode As String) As Boolean
Private Declare Function GetImageFromBuffer Lib "WmCode.dll" (ByVal ImgBuffer As Long, ByVal ImgBufLen As Long, ByVal Vcode As String) As Boolean
Private Declare Function SetWmOption Lib "WmCode.dll" (ByVal OptionIndex As Long, ByVal OptionValue As Long) As Boolean

Private Sub Command1_Click()
Dim Image() As Byte
Dim ImgFile As String
Dim ImgURL As String
ImgFile = "temp.jpg"
ImgURL = txtURL.Text
Call URLDownloadToFile(0, ImgURL, ImgFile, 0, 0)
Picture1.Picture = LoadPicture(ImgFile)
End Sub

Public Function MyReadFile(FilePath As String, FileBuffer() As Byte)
Dim FileSize As Long '文件长度
FileSize = FileLen(FilePath) '获取文件长度
ReDim FileBuffer(FileSize - 1) As Byte
Open FilePath For Binary As #1
Get #1, , FileBuffer
Close
End Function

Private Sub Command2_Click()
Dim Image() As Byte
Dim ImgFile As String
Dim Vcode As String
Vcode = "      " '必须先对这个变量赋多个空格，空格数量要比验证码字符数量多1
ImgFile = "temp.jpg"

Call MyReadFile(ImgFile, Image)

'文件接口调用验证码图像并识别
'If (LoadWmFromFile(ImgFile, Vcode)) Then
  'Text1.Text = Vcode
'End If

'----------------------------
 '内存接口调用验证码图像并识别
If (GetImageFromBuffer(VarPtr(Image(0)), UBound(Image), Vcode)) Then
   Text1.Text = Vcode
End If
End Sub

Private Sub Command3_Click()
'请根据自己的情况修改dat所在路径,字库密码为 163
If (LoadWmFromFile(txtPath.Text, "163") = False) Then
  MsgBox "载入识别库出错。"
End If
If (SetWmOption(6, 90) = False) Then
MsgBox "设置最小相似度出错。"
End If

Command1.Enabled = True
Command2.Enabled = True
End Sub


