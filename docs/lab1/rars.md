---
comments: true 
---

# <strong>RARS</strong>

!!! Note "RISC-V 指令集专属"

    RARS 为 RV32I 指令集的相关工具，选择 LA32R 的同学请移步 LARS。
    

[RARS](https://github.com/TheThirdOne/rars) 是基于 RISC-V 架构的汇编综合实验平台。RARS 程序提供了汇编器、仿真器（参考 ICS LabA$\&$S）等功能，同时也包含了方便的外设接口与信息查询接口，被广泛用于 RISC-V 汇编程序的编写与测试之中。

## <strong>概述</strong>

<strong>你可以点击[这里](./src/rars1_6.jar)获取 1.6 版本的 Rars 应用。</strong>Rars 在安装了 Java 运行环境的电脑上都可以正常使用。你可以在 [Vlab 平台](https://vlab.ustc.edu.cn/)上获取 Java 的有关资源。由于篇幅有限，大家可以参考[这篇博客](https://blog.csdn.net/weixin_45710060/article/details/123315280)中的相关内容或其他教程进行下载与安装。

RISC-V 汇编程序涉及到的相关知识点请参考课本与指令集手册。如果你以前未接触过，或不熟悉汇编语言编程的话，可以参考[这篇教程](https://riscv-programming.org/book/riscv-book.html)。本次实验中，你可能会关注下面的内容：4-Assembly language、6-The RV32I ISA。

下面，我们将对本次实验中可能用到的相关内容进行介绍。


## <strong>内存设置</strong>

在主界面上，单击 Settings >> Memory Configuration 即可打开下图所示的子界面。在 RARS 中，内存空间被划分为许多部分。按照功能可以概括为：程序段、数据段、栈空间与堆空间、内核空间以及 MMIO 保留地址。根据设置的不同，各个部分的相对位置与大小也有所不同。
    
<figure markdown>
![Image title](./assets/rars/compact_mem.png){ width="400" }
<figcaption>内存分布（紧凑型）</figcaption>
</figure>

在本学期的实验中，我们均将内存空间设置为默认类型（Default）。



## <strong>简单使用</strong>

正常运行 Rars 程序后，你将看到下面的界面。

<figure markdown>
![Image title](./assets/rars/rars_1.png){ width="900" }
<figcaption>Rars 界面</figcaption>
</figure>

为了创建一个新项目，你可以在左上角，依次单击 File $\rightarrow$ New，即可新建一个 .asm 汇编文件。此时我们便可以进行汇编代码的编写工作。

<figure markdown>
![Image title](./assets/rars/rars_1.png){ width="900" }
<figcaption>编写汇编代码</figcaption>
</figure>

完成编写后，请保存 .asm 文件，如上图所示点击 Assemble 按钮。此时 Rars 便会开始编译 RISC-V 代码，并在下方提示可能的错误（上图中的代码就无法通过编译）。如果一切顺利，我们就可以进入调试界面，开始执行汇编程序。

<figure markdown>
![Image title](./assets/rars/rars_3.png){ width="800" }
<figcaption>调试</figcaption>
</figure>

在执行与调试时，请善用断点功能，并及时查看各个寄存器和存储单元中的数值变化。

在代码编译之后，你可以在左上角点击 File$\rightarrow$Dump Memory，即可选择将代码段或数据段导出成 COE 文件。你需要选择十六进制的格式导出，并参考 COE 文件的格式添加部分内容。

对于 Rars 的其他功能，请在程序内点击 Help 查看官方的教程。


