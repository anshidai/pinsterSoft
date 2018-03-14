'
' * Created by SharpDevelop.
' * User: office
' * Date: 2010-5-6
' * Time: 10:24
' * 
' * To change this template use Tools | Options | Coding | Edit Standard Headers.
' 

Imports System.Windows.Forms

Namespace WmCode_Demo
    ''' <summary>
    ''' Class with program entry point.
    ''' </summary>
    Friend NotInheritable Class Program
        ''' <summary>
        ''' Program entry point.
        ''' </summary>
        <STAThread()> _
        Friend Shared Sub Main(ByVal args As String())
            Application.EnableVisualStyles()
            Application.SetCompatibleTextRenderingDefault(False)
            Application.Run(New MainForm())
        End Sub

    End Class
End Namespace
