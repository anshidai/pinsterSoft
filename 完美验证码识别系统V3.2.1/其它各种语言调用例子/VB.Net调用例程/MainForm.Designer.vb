'
' * Created by SharpDevelop.
' * User: office
' * Date: 2010-5-6
' * Time: 10:24
' * 
' * To change this template use Tools | Options | Coding | Edit Standard Headers.
' 

Namespace WmCode_Demo
    Partial Class MainForm
        ''' <summary>
        ''' Designer variable used to keep track of non-visual components.
        ''' </summary>
        Private components As System.ComponentModel.IContainer = Nothing

        ''' <summary>
        ''' Disposes resources used by the form.
        ''' </summary>
        ''' <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        Protected Overrides Sub Dispose(ByVal disposing As Boolean)
            If disposing Then
                If components IsNot Nothing Then
                    components.Dispose()
                End If
            End If
            MyBase.Dispose(disposing)
        End Sub

        ''' <summary>
        ''' This method is required for Windows Forms designer support.
        ''' Do not change the method contents inside the source code editor. The Forms designer might
        ''' not be able to load this method if it was changed manually.
        ''' </summary>
        Private Sub InitializeComponent()
            Me.label1 = New System.Windows.Forms.Label
            Me.textBox1 = New System.Windows.Forms.TextBox
            Me.textBox2 = New System.Windows.Forms.TextBox
            Me.label2 = New System.Windows.Forms.Label
            Me.pictureBox1 = New System.Windows.Forms.PictureBox
            Me.textBox3 = New System.Windows.Forms.TextBox
            Me.Button1 = New System.Windows.Forms.Button
            Me.Button2 = New System.Windows.Forms.Button
            Me.Button3 = New System.Windows.Forms.Button
            CType(Me.pictureBox1, System.ComponentModel.ISupportInitialize).BeginInit()
            Me.SuspendLayout()
            '
            'label1
            '
            Me.label1.Font = New System.Drawing.Font("宋体", 10.5!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(134, Byte))
            Me.label1.Location = New System.Drawing.Point(9, 4)
            Me.label1.Name = "label1"
            Me.label1.Size = New System.Drawing.Size(207, 24)
            Me.label1.TabIndex = 0
            Me.label1.Text = "请指定识别库(.dat)文件路径"
            Me.label1.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
            '
            'textBox1
            '
            Me.textBox1.Location = New System.Drawing.Point(9, 31)
            Me.textBox1.Name = "textBox1"
            Me.textBox1.Size = New System.Drawing.Size(271, 21)
            Me.textBox1.TabIndex = 1
            '
            'textBox2
            '
            Me.textBox2.Location = New System.Drawing.Point(9, 82)
            Me.textBox2.Name = "textBox2"
            Me.textBox2.Size = New System.Drawing.Size(271, 21)
            Me.textBox2.TabIndex = 3
            Me.textBox2.Text = "http://bbs.ent.163.com/bbs/checkcode.jsp?1201359681906"
            '
            'label2
            '
            Me.label2.Font = New System.Drawing.Font("宋体", 10.5!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(134, Byte))
            Me.label2.Location = New System.Drawing.Point(9, 55)
            Me.label2.Name = "label2"
            Me.label2.Size = New System.Drawing.Size(207, 24)
            Me.label2.TabIndex = 2
            Me.label2.Text = "请指定验证码下载地址"
            Me.label2.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
            '
            'pictureBox1
            '
            Me.pictureBox1.Location = New System.Drawing.Point(9, 109)
            Me.pictureBox1.Name = "pictureBox1"
            Me.pictureBox1.Size = New System.Drawing.Size(172, 62)
            Me.pictureBox1.TabIndex = 4
            Me.pictureBox1.TabStop = False
            '
            'textBox3
            '
            Me.textBox3.Location = New System.Drawing.Point(9, 183)
            Me.textBox3.Name = "textBox3"
            Me.textBox3.Size = New System.Drawing.Size(171, 21)
            Me.textBox3.TabIndex = 5
            '
            'Button1
            '
            Me.Button1.Location = New System.Drawing.Point(194, 114)
            Me.Button1.Name = "Button1"
            Me.Button1.Size = New System.Drawing.Size(83, 24)
            Me.Button1.TabIndex = 9
            Me.Button1.Text = "载入识别库"
            Me.Button1.UseVisualStyleBackColor = True
            '
            'Button2
            '
            Me.Button2.Enabled = False
            Me.Button2.Location = New System.Drawing.Point(194, 144)
            Me.Button2.Name = "Button2"
            Me.Button2.Size = New System.Drawing.Size(83, 24)
            Me.Button2.TabIndex = 11
            Me.Button2.Text = "下载验证码"
            Me.Button2.UseVisualStyleBackColor = True
            '
            'Button3
            '
            Me.Button3.Enabled = False
            Me.Button3.Location = New System.Drawing.Point(194, 174)
            Me.Button3.Name = "Button3"
            Me.Button3.Size = New System.Drawing.Size(83, 24)
            Me.Button3.TabIndex = 12
            Me.Button3.Text = "识别验证码"
            Me.Button3.UseVisualStyleBackColor = True
            '
            'MainForm
            '
            Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 12.0!)
            Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
            Me.ClientSize = New System.Drawing.Size(292, 215)
            Me.Controls.Add(Me.Button3)
            Me.Controls.Add(Me.Button2)
            Me.Controls.Add(Me.Button1)
            Me.Controls.Add(Me.textBox3)
            Me.Controls.Add(Me.pictureBox1)
            Me.Controls.Add(Me.textBox2)
            Me.Controls.Add(Me.label2)
            Me.Controls.Add(Me.textBox1)
            Me.Controls.Add(Me.label1)
            Me.Name = "MainForm"
            Me.Text = "WmCode的VB.Net调用例程 "
            CType(Me.pictureBox1, System.ComponentModel.ISupportInitialize).EndInit()
            Me.ResumeLayout(False)
            Me.PerformLayout()

        End Sub
        Private textBox3 As System.Windows.Forms.TextBox
        Private pictureBox1 As System.Windows.Forms.PictureBox
        Private label2 As System.Windows.Forms.Label
        Private textBox2 As System.Windows.Forms.TextBox
        Private textBox1 As System.Windows.Forms.TextBox
        Private label1 As System.Windows.Forms.Label
        Friend WithEvents Button1 As System.Windows.Forms.Button
        Friend WithEvents Button2 As System.Windows.Forms.Button
        Friend WithEvents Button3 As System.Windows.Forms.Button
    End Class
End Namespace
