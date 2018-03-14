// WmCode_Demo.cpp : WmCode.dll演示程序。
//

#include<stdio.h>
#include <iostream>
#include <Windows.h>

int main()
{
	HINSTANCE hInst = LoadLibraryA("WmCode.dll");//载入WmCode.dll
	if (!hInst)
	{
		std::cout<<"无法加载 WmCode.Dll!";
		getchar();
		return 0;
	}

/*
	WmCode.dll导出函数说明：
	bool LoadWmFromBuffer(//成功返回真，失败返回假
	char[] FileBuffer, //识别库文件二进制数据
	int FileBufLen,//识别库文件数据尺寸
	char[] Password);//识别库调用密码

	bool LoadWmFromFile(//成功返回真，失败返回假
	char[] FilePath，//识别库文件所在路径
	char[] Password);//识别库文件所在路径

	-------以上两个函数用于载入识别库文件----------

	bool GetImageFromBuffer(  //能识别返回真，否则返回假
	char* ImgBuffer , //验证码图像二进制数据
	int ImgBufLen ,//验证码图像尺寸
	char[] Vcode);//返回的已识别验证码文本

	bool GetImageFromFile( //能识别返回真，否则返回假
	char[] FilePath , //验证码文件所在路径
	char[] Vcode);   //返回的已识别验证码文本

	-------以上两个函数用于识别验证码----------


    bool SetWmOption(  //设定识别库选项。设定成功返回真，否则返回假。
    int OptionIndex ,//选项索引，取值范围1～7
	int OptionValue ,//选项数值。
    参数详解：
	OptionIndex	OptionValue
	1.	返回方式	取值范围：0～1   默认为0,直接返回验证码,为1返回验证码字符和矩形范围形如：S,10,11,12,13|A,1,2,3,4 表示识别到文本 S 左边横坐标10,左边纵坐标11,右边横坐标,右边纵坐标12
	2.  识别方式    取值范围：0～4   默认为0,0整体识别,1连通分割识别,2纵分割识别,3横分割识别,4横纵分割识别
	3.	识别模式	取值范围：0～1   默认为0,0识图模式,1为识字模式
	4.	识别加速	取值范围：0～1   默认为0,0为不加速,1为使用加速
	5.	加速返回	取值范围：0～1   默认为0,0为不加速返回,1为使用加速返回
	6.	最小相似度	取值范围：0～100 默认为90
	7.  字符间隙    取值范围：-10～0   默认为0,如果字符重叠,根据实际情况填写,如-3允许重叠3像素,如果不重叠的话,直接写0

    -------以上一个函数用于设置识别选项----------

*/	
	//-----------LoadWmFromFile------------
typedef bool (CALLBACK* LPLoadWm)(char[],char[]);
LPLoadWm LoadWmFromFile = (LPLoadWm)GetProcAddress(hInst, "LoadWmFromFile");

/*
	//-----------LoadWmFromBuffer------------
	typedef bool (CALLBACK* LPLoadWm)(char[],int,char[]);
	LPLoadWm LoadWmFromBuffer = (LPLoadWm)GetProcAddress(hInst, "LoadWmFromBuffer");
*/
if (LoadWmFromFile ("网易论坛.dat","163")==false)//返回假说明载入识别库出错
	{
		std::cout<<"载入识别库出错。";
		getchar();
		return 0;
	}

	//-----------GetImageFromFile------------
	//typedef bool (CALLBACK* LPGetVcode)(int,char[],char[]);
	//LPGetVcode GetImageFromFile = (LPGetVcode)GetProcAddress(hInst, "GetImageFromFile");

	//-----------GetImageFromBuffer------------
typedef bool (CALLBACK* LPGetVcode)(char*,int,char[]);
LPGetVcode GetImageFromBuffer = (LPGetVcode)GetProcAddress(hInst, "GetImageFromBuffer");

	char result[5];//定义一个字符串以接收验证码，这里验证码字符数是4，所以取5.

	HANDLE pfile = CreateFile("wy.JPG",GENERIC_READ,FILE_SHARE_READ,0,OPEN_EXISTING,0,0);

	if(pfile == INVALID_HANDLE_VALUE){
		std::cout<<"文件打开失败！";
		CloseHandle(pfile);
		return 0;
	}

	unsigned long filesize = GetFileSize (pfile, NULL);
	char* buffer = new char[filesize]; 
	unsigned long readsize;
	ReadFile(pfile,buffer,filesize,&readsize,NULL);
	CloseHandle(pfile);

	if(GetImageFromBuffer(buffer,filesize,result))
		std::cout<<"验证码识别成功："<<result;
	else
		std::cout<<"验证码识别失败！";

	getchar();
	return 0;
}

