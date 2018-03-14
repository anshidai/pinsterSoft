

using System;
using System.Drawing;
using System.IO;
using System.Runtime.InteropServices;
using System.Text;
using System.Windows.Forms;

namespace WmCode_Demo
{
	/// <summary>
	/// Description of MainForm.
	/// </summary>
	public partial class MainForm : Form
	{
		public MainForm()
		{
			//
			// The InitializeComponent() call is required for Windows Forms designer support.
			//
			InitializeComponent();
			
			//
			// TODO: Add constructor code after the InitializeComponent() call.
			//
		}
		
		void MainFormLoad(object sender, System.EventArgs e)
		{
            textBox1.Text = System.Environment.CurrentDirectory + "\\网易论坛.dat";
		}


        [DllImport("WmCode.dll")]
        public static extern bool LoadWmFromFile(string FilePath, string Password);

        [DllImport("WmCode.dll")]
        public static extern bool LoadWmFromBuffer(byte[] FileBuffer, int FileBufLen, string Password);

        [DllImport("WmCode.dll")]
        public static extern bool GetImageFromFile(string FilePath, StringBuilder Vcode);

        [DllImport("WmCode.dll")]
        public static extern bool GetImageFromBuffer(byte[] FileBuffer, int ImgBufLen, StringBuilder Vcode);

        [DllImport("WmCode.dll")]
        public static extern bool SetWmOption(int OptionIndex, int OptionValue);

	
		[DllImport("urlmon.dll", EntryPoint="URLDownloadToFileA")]
		public static extern int URLDownloadToFile(int pCaller, string szURL, string szFileName, int dwReserved,int lpfnCB);
				
		void Button1Click(object sender, System.EventArgs e)
		{
             if (LoadWmFromFile(textBox1.Text, "163"))
			{
                SetWmOption(6, 90);
				button2.Enabled = true;
				button3.Enabled = true;
			}
		}
		
		void Button2Click(object sender, EventArgs e)
		{
			button2.Enabled = false;
			string ImgURL = textBox2.Text;
			string ImgPath = System.Environment.CurrentDirectory + "\\temp.tmp";
			URLDownloadToFile(0,ImgURL,ImgPath,0,0);
			pictureBox1.Image = Image.FromFile(ImgPath);
			button2.Enabled = true;
		}
		
		void Button3Click(object sender, EventArgs e)
		{
			button3.Enabled = false;
			
			StringBuilder Result = new StringBuilder('\0',256); 
			
			string ImgPath = System.Environment.CurrentDirectory + "\\temp.tmp";
			
	
			
			//以下使用GetImageFromBuffer接口
			FileStream fsMyfile = File.OpenRead(ImgPath); 
			int FileLen = (int)fsMyfile.Length;
			byte[] Buffer = new byte[FileLen]; 
			fsMyfile.Read (Buffer, 0, FileLen); 
			fsMyfile.Close();
			
			if(GetImageFromBuffer(Buffer,FileLen,Result))
				textBox3.Text = Result.ToString();
			else
				textBox3.Text = "识别失败";
			
			button3.Enabled = true;
		}
	}
}