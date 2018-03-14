'
' * Created by SharpDevelop.
' * User: office
' * Date: 2010-5-6
' * Time: 10:24
' * 
' * To change this template use Tools | Options | Coding | Edit Standard Headers.
' 

Imports System.Drawing
Imports System.IO
Imports System.Runtime.InteropServices
Imports System.Text
Imports System.Windows.Forms

Namespace WmCode_Demo
    ''' <summary>
    ''' Description of MainForm.
    ''' </summary>
    Partial Public Class MainForm
        Inherits Form
        Public Sub New()
            '
            ' The InitializeComponent() call is required for Windows Forms designer support.
            '

            '
            ' TODO: Add constructor code after the InitializeComponent() call.
            '
            InitializeComponent()
        End Sub

        Private Sub MainFormLoad(ByVal sender As Object, ByVal e As System.EventArgs) Handles MyBase.Load
            textBox1.Text = System.Environment.CurrentDirectory & "\网易论坛.dat"
        End Sub


        <DllImport("WmCode.dll")> _
        Public Shared Function LoadWmFromFile(ByVal FilePath As String, ByVal Password As String) As Boolean
        End Function

        <DllImport("WmCode.dll")> _
        Public Shared Function LoadWmFromBuffer(ByVal FileBuffer As Byte(), ByVal FileBufLen As Integer, ByVal Password As String) As Boolean
        End Function

        <DllImport("WmCode.dll")> _
        Public Shared Function GetImageFromFile(ByVal FilePath As String, ByVal Vcode As StringBuilder) As Boolean
        End Function

        <DllImport("WmCode.dll")> _
        Public Shared Function GetImageFromBuffer(ByVal FileBuffer As Byte(), ByVal ImgBufLen As Integer, ByVal Vcode As StringBuilder) As Boolean
        End Function


        <DllImport("urlmon.dll", EntryPoint:="URLDownloadToFileA")> _
        Public Shared Function URLDownloadToFile(ByVal pCaller As Integer, ByVal szURL As String, ByVal szFileName As String, ByVal dwReserved As Integer, ByVal lpfnCB As Integer) As Integer
        End Function


        Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
            If LoadWmFromFile(textBox1.Text, "163") Then
                Button2.Enabled = True
                Button3.Enabled = True
                Button1.Enabled = False
            End If
        End Sub


        Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
            Button3.Enabled = False
            Dim ImgURL As String = textBox2.Text
            Dim ImgPath As String = System.Environment.CurrentDirectory & "\temp.tmp"
            URLDownloadToFile(0, ImgURL, ImgPath, 0, 0)
            pictureBox1.Image = Image.FromFile(ImgPath)
            Button3.Enabled = True
        End Sub

        Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
            Button3.Enabled = False

            Dim Result As New StringBuilder(ControlChars.NullChar, 256)

            Dim ImgPath As String = System.Environment.CurrentDirectory & "\temp.tmp"

            '以下使用GetImageFromFile接口
            '			if(GetImageFromFile(ImgPath,Result))
            '				textBox3.Text = Result.ToString();
            '			else
            '				textBox3.Text = "识别失败";


            '以下使用GetImageFromBuffer接口
            Dim fsMyfile As FileStream = File.OpenRead(ImgPath)
            Dim FileLen As Integer = CInt(fsMyfile.Length)
            Dim Buffer As Byte() = New Byte(FileLen - 1) {}
            fsMyfile.Read(Buffer, 0, FileLen)
            fsMyfile.Close()

            If GetImageFromBuffer(Buffer, FileLen, Result) Then
                textBox3.Text = Result.ToString()
            Else
                textBox3.Text = "识别失败"
            End If

            Button3.Enabled = True
        End Sub
    End Class
End Namespace
