// WmCode_Demo.cpp : WmCode.dll��ʾ����
//

#include<stdio.h>
#include <iostream>
#include <Windows.h>

int main()
{
	HINSTANCE hInst = LoadLibraryA("WmCode.dll");//����WmCode.dll
	if (!hInst)
	{
		std::cout<<"�޷����� WmCode.Dll!";
		getchar();
		return 0;
	}

/*
	WmCode.dll��������˵����
	bool LoadWmFromBuffer(//�ɹ������棬ʧ�ܷ��ؼ�
	char[] FileBuffer, //ʶ����ļ�����������
	int FileBufLen,//ʶ����ļ����ݳߴ�
	char[] Password);//ʶ����������

	bool LoadWmFromFile(//�ɹ������棬ʧ�ܷ��ؼ�
	char[] FilePath��//ʶ����ļ�����·��
	char[] Password);//ʶ����ļ�����·��

	-------��������������������ʶ����ļ�----------

	bool GetImageFromBuffer(  //��ʶ�𷵻��棬���򷵻ؼ�
	char* ImgBuffer , //��֤��ͼ�����������
	int ImgBufLen ,//��֤��ͼ��ߴ�
	char[] Vcode);//���ص���ʶ����֤���ı�

	bool GetImageFromFile( //��ʶ�𷵻��棬���򷵻ؼ�
	char[] FilePath , //��֤���ļ�����·��
	char[] Vcode);   //���ص���ʶ����֤���ı�

	-------����������������ʶ����֤��----------


    bool SetWmOption(  //�趨ʶ���ѡ��趨�ɹ������棬���򷵻ؼ١�
    int OptionIndex ,//ѡ��������ȡֵ��Χ1��7
	int OptionValue ,//ѡ����ֵ��
    ������⣺
	OptionIndex	OptionValue
	1.	���ط�ʽ	ȡֵ��Χ��0��1   Ĭ��Ϊ0,ֱ�ӷ�����֤��,Ϊ1������֤���ַ��;��η�Χ���磺S,10,11,12,13|A,1,2,3,4 ��ʾʶ���ı� S ��ߺ�����10,���������11,�ұߺ�����,�ұ�������12
	2.  ʶ��ʽ    ȡֵ��Χ��0��4   Ĭ��Ϊ0,0����ʶ��,1��ͨ�ָ�ʶ��,2�ݷָ�ʶ��,3��ָ�ʶ��,4���ݷָ�ʶ��
	3.	ʶ��ģʽ	ȡֵ��Χ��0��1   Ĭ��Ϊ0,0ʶͼģʽ,1Ϊʶ��ģʽ
	4.	ʶ�����	ȡֵ��Χ��0��1   Ĭ��Ϊ0,0Ϊ������,1Ϊʹ�ü���
	5.	���ٷ���	ȡֵ��Χ��0��1   Ĭ��Ϊ0,0Ϊ�����ٷ���,1Ϊʹ�ü��ٷ���
	6.	��С���ƶ�	ȡֵ��Χ��0��100 Ĭ��Ϊ90
	7.  �ַ���϶    ȡֵ��Χ��-10��0   Ĭ��Ϊ0,����ַ��ص�,����ʵ�������д,��-3�����ص�3����,������ص��Ļ�,ֱ��д0

    -------����һ��������������ʶ��ѡ��----------

*/	
	//-----------LoadWmFromFile------------
typedef bool (CALLBACK* LPLoadWm)(char[],char[]);
LPLoadWm LoadWmFromFile = (LPLoadWm)GetProcAddress(hInst, "LoadWmFromFile");

/*
	//-----------LoadWmFromBuffer------------
	typedef bool (CALLBACK* LPLoadWm)(char[],int,char[]);
	LPLoadWm LoadWmFromBuffer = (LPLoadWm)GetProcAddress(hInst, "LoadWmFromBuffer");
*/
if (LoadWmFromFile ("������̳.dat","163")==false)//���ؼ�˵������ʶ������
	{
		std::cout<<"����ʶ������";
		getchar();
		return 0;
	}

	//-----------GetImageFromFile------------
	//typedef bool (CALLBACK* LPGetVcode)(int,char[],char[]);
	//LPGetVcode GetImageFromFile = (LPGetVcode)GetProcAddress(hInst, "GetImageFromFile");

	//-----------GetImageFromBuffer------------
typedef bool (CALLBACK* LPGetVcode)(char*,int,char[]);
LPGetVcode GetImageFromBuffer = (LPGetVcode)GetProcAddress(hInst, "GetImageFromBuffer");

	char result[5];//����һ���ַ����Խ�����֤�룬������֤���ַ�����4������ȡ5.

	HANDLE pfile = CreateFile("wy.JPG",GENERIC_READ,FILE_SHARE_READ,0,OPEN_EXISTING,0,0);

	if(pfile == INVALID_HANDLE_VALUE){
		std::cout<<"�ļ���ʧ�ܣ�";
		CloseHandle(pfile);
		return 0;
	}

	unsigned long filesize = GetFileSize (pfile, NULL);
	char* buffer = new char[filesize]; 
	unsigned long readsize;
	ReadFile(pfile,buffer,filesize,&readsize,NULL);
	CloseHandle(pfile);

	if(GetImageFromBuffer(buffer,filesize,result))
		std::cout<<"��֤��ʶ��ɹ���"<<result;
	else
		std::cout<<"��֤��ʶ��ʧ�ܣ�";

	getchar();
	return 0;
}

