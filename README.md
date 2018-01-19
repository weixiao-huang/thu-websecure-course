#  软件漏洞利用

---

## 一、实验要求

在 `recho` 文件夹中包含源文件，编译之后的可执行文件，以及与可执行文件配套的libc库（可以用系统自带的库，但是分析结果稍有不同）。

代码中包含一个栈溢出漏洞，可以被攻击者利用，劫持控制流执行恶意代码（例如获取shell执行任意命令）。

请先在本地进行分析，找到漏洞，以及写好利用脚本（可以用zio或者pwntools辅助），然后连接服务器测试（202.112.51.151，端口 1234），获取服务器中的flag文件的内容，拿到flag即为攻击成功。

请撰写实验报告，包括漏洞分析结果，漏洞利用原理，漏洞利用代码，以及拿到的服务器flag。



## 二、本地测试过程

### 2.1 代码分析

在代码的根目录利用

```bash
$ make
```

启动本实验的 `docker` 容器，然后运行

```bash
$ make dump
```

可以在 `src/dump/recho.s` 获得 `recho` 的反汇编代码。我们主要分析里面的 `handle` 函数的代码，寻找缓冲区的位置：

```assembly
08048af4 <handle>:
 8048af4:	55                   	push   %ebp
 8048af5:	89 e5                	mov    %esp,%ebp
 8048af7:	81 ec 08 01 00 00    	sub    $0x108,%esp
 8048afd:	83 ec 04             	sub    $0x4,%esp
 8048b00:	68 00 01 00 00       	push   $0x100
 8048b05:	6a 00                	push   $0x0
 8048b07:	8d 85 f8 fe ff ff    	lea    -0x108(%ebp),%eax
 8048b0d:	50                   	push   %eax
 8048b0e:	e8 3d fc ff ff       	call   8048750 <memset@plt>
 8048b13:	83 c4 10             	add    $0x10,%esp
 8048b16:	83 ec 0c             	sub    $0xc,%esp
 8048b19:	68 c4 8e 04 08       	push   $0x8048ec4
 8048b1e:	e8 ac ff ff ff       	call   8048acf <sendstr>
 8048b23:	83 c4 10             	add    $0x10,%esp
 8048b26:	83 ec 0c             	sub    $0xc,%esp
 8048b29:	8d 85 f8 fe ff ff    	lea    -0x108(%ebp),%eax
 8048b2f:	50                   	push   %eax
 8048b30:	e8 b1 fe ff ff       	call   80489e6 <recv_line>
 8048b35:	83 c4 10             	add    $0x10,%esp
 8048b38:	83 ec 0c             	sub    $0xc,%esp
 8048b3b:	8d 85 f8 fe ff ff    	lea    -0x108(%ebp),%eax
 8048b41:	50                   	push   %eax
 8048b42:	e8 88 ff ff ff       	call   8048acf <sendstr>
 8048b47:	83 c4 10             	add    $0x10,%esp
 8048b4a:	c9                   	leave  
 8048b4b:	c3                   	ret    
```

从 `0x8048af7` 行我们可以看出，缓冲区的起始地址在 `-0x108(%ebp)`，另外我们可以知道，`handle` 函数的返回地址在 `0x8(%ebp)` 处；`old %ebp` 的地址在 `0x4(%ebp)` 处。于是要想修改返回地址，只需投喂 `0x108 + 0x8 + 0x4 = 0x114`，即 `276` 字节的数据给 `buf` 即可，其中后 `4` 个字节改为自己想跳转的地址，即 `shellcode` 代码执行的地址。

### 2.2 实验操作过程

经过上述的 `make` 操作，我们的 `docker` 容器已经运行了起来，之后我们利用

```bash
$ make exec
```

可以进入容器操作。注意我们此时进入的是 `recho` 用户，此用户有 `sudo` 权限，密码为 `recho`，详情见 `Dockerfile` 文件。



## 三、远端测试过程

我们将代码中的 `host` 改为测试服务器地址 `120.76.114.164`，然后运行 `bomb.py`，然后我们可以获取远程终端，然后利用 `ls`，可以获得当前目录的文件，然后 `cat flag` 即可以获取 `flag`如下：

![result](img/result.png)





