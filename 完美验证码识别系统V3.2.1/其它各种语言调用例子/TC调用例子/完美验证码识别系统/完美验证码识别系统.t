﻿变量 字库地址,插件地址

功能 完美验证码识别系统_初始化()
    //这里添加你要执行的代码
    变量 路径=获取资源路径("rc:") 
    字库地址=路径&"51测试.dat"
    插件地址=路径&"WmCode.dll"
结束

功能 载入识别库_点击()
    //这里添加你要执行的代码
    如果(动态库调用(插件地址,"Long","LoadWmFromFile","char *",字库地址,"char *","12345678")==真)
        消息框("载入识别库成功!","提示")
    否则
        消息框("载入识别库失败!","提示")
    结束
结束


功能 识别验证码_点击()
    //这里添加你要执行的代码
    变量 验证码结果
    变量 验证码图片地址=获取资源路径("rc:vcode.jpg")
    如果(动态库调用(插件地址,"Boolean","GetImageFromFile","char *",验证码图片地址,"pchar *",验证码结果)==真)
        消息框("验证码为:"&验证码结果,"提示")
    否则
        消息框("验证码识别失败","提示")
    结束
结束



