VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "VB����WmCode.dll����"
   ClientHeight    =   3510
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3510
   ScaleWidth      =   4680
   StartUpPosition =   3  '����ȱʡ
   Begin VB.CommandButton Command3 
      Caption         =   "����ʶ����ļ�"
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
      Text            =   "������̳.dat"
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
      Caption         =   "ʶ����֤��ͼ��"
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
      Caption         =   "������֤��ͼ��"
      Enabled         =   0   'False
      Height          =   375
      Left            =   2160
      TabIndex        =   1
      Top             =   2400
      Width           =   2175
   End
   Begin VB.TextBox Text1 
      BeginProperty Font 
         Name            =   "����"
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
      Caption         =   "����ʶ���·��"
      Height          =   255
      Left            =   240
      TabIndex        =   6
      Top             =   960
      Width           =   1455
   End
   Begin VB.Label Label1 
      Caption         =   "������֤���ַ"
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
'������Լ�������޸�WmCode.dll����·��
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
Dim FileSize As Long '�ļ�����
FileSize = FileLen(FilePath) '��ȡ�ļ�����
ReDim FileBuffer(FileSize - 1) As Byte
Open FilePath For Binary As #1
Get #1, , FileBuffer
Close
End Function

Private Sub Command2_Click()
Dim Image() As Byte
Dim ImgFile As String
Dim Vcode As String
Vcode = "      " '�����ȶ��������������ո񣬿ո�����Ҫ����֤���ַ�������1
ImgFile = "temp.jpg"

Call MyReadFile(ImgFile, Image)

'�ļ��ӿڵ�����֤��ͼ��ʶ��
'If (LoadWmFromFile(ImgFile, Vcode)) Then
  'Text1.Text = Vcode
'End If

'----------------------------
 '�ڴ�ӿڵ�����֤��ͼ��ʶ��
If (GetImageFromBuffer(VarPtr(Image(0)), UBound(Image), Vcode)) Then
   Text1.Text = Vcode
End If
End Sub

Private Sub Command3_Click()
'������Լ�������޸�dat����·��,�ֿ�����Ϊ 163
If (LoadWmFromFile(txtPath.Text, "163") = False) Then
  MsgBox "����ʶ������"
End If
If (SetWmOption(6, 90) = False) Then
MsgBox "������С���ƶȳ���"
End If

Command1.Enabled = True
Command2.Enabled = True
End Sub


