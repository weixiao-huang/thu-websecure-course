#  软件漏洞利用

---

## 一、实验要求

在 `recho` 文件夹中包含源文件，编译之后的可执行文件，以及与可执行文件配套的libc库（可以用系统自带的库，但是分析结果稍有不同）。

代码中包含一个栈溢出漏洞，可以被攻击者利用，劫持控制流执行恶意代码（例如获取shell执行任意命令）。

请先在本地进行分析，找到漏洞，以及写好利用脚本（可以用zio或者pwntools辅助），然后连接服务器测试（202.112.51.151，端口 1234），获取服务器中的flag文件的内容，拿到flag即为攻击成功。

请撰写实验报告，包括漏洞分析结果，漏洞利用原理，漏洞利用代码，以及拿到的服务器flag。
