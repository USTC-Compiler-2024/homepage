---
comments: true 
---

# <strong>问题汇总</strong>

!!! Warning "提醒"

    请大家在提问前，仔细阅读报错信息。向助教提问时，提供尽可能多的操作步骤、报错信息以及自己的分析等。我们将不再回答仅问出问题而不加思考的疑问。
    
    另外，我们建议大家阅读[提问的智慧](../other/ask.md)，以便于更高效地交流讨论。


??? Question "仿真框架为什么报错？"

    请确保下面的内容：

    - 在 `vsrc` 目录下添加了 `your_vsrc` 目录，并将 CPU 以及其包含的所有子模块（ALU、寄存器堆）等放入该目录下。注意：PDU 以及上板框架的 TOP 不包含在内。
    - 如果你使用了 Verilog 头文件，则需要在 `vsrc` 目录下添加 `your_include` 目录，并放在这里。
    - 运行 `cmake` 时位于 `build` 目录下，执行 `sim` 时位于项目根目录下。
    - 正确连接了 `commit` 和 `debug` 系列的信号。
    - 确保自己没有随意修改 `configs.vh` 文件中的内容。
    - 如果是 Hit Bad Trap，请确保使用的测试程序最后将 a0 寄存器置为 0。
    - 确保所有的设计文件里均没有 ```timescale`` 语句。


??? Question "RV 如何仿真？"

    手动编写一个 `CPU_tb` 文件，在其中例化 CPU 和存储器 IP 核。将 CPU 给出的 `imem_raddr` 右移两位后接入存储器的 `a` 端口，将存储器的 `spo` 端口接入 CPU 的 `imem_rdata` 端口。仿真时，将 COE 导入存储器 IP 核，生成合适的时钟信号和复位信号即可。仿真时的 `global_en` 信号置为 1。


??? Question "include 相关的问题"

    - 解决方案 1：直接删除上板框架中的 `config.v` 文件，将其中的宏定义内容移动到需要使用宏定义的各个文件中（例如 CPU.v、Decode.v 等），最后删除 CPU 以及其包含的各个模块中所有的 `include` 语句。此时使用仿真框架只需要将 CPU 以及其子模块导入到 `your_vsrc` 目录下即可。
    - 解决方案 2：按照下面的步骤进行：
        1. 在所有使用了 `config.v` 的文件中，将 include 语句改为 ```include "config.v"``（不再使用相对路径或绝对路径）；
        2. 将 `config.v` 文件放入仿真框架的 `your_include` 目录下，将 CPU 以及其子模块放入仿真框架的 `your_vsrc` 目录下；
        3. 在 Vivado 的项目中，将 `config.v` 设置成 Verilog 头文件。方法为：在 Vivado 的 Sources 窗口中右键 `config.v` 文件，选择 Set File Type，在弹出的窗口中选择 Verilog Header 即可。
            <figure markdown>
            ![Image title](./img/vh.png){ width="300" }
            <figcaption>将 config.v 设置成 Verilog 头文件</figcaption>
            </figure>
        4. 此时，仿真框架和上板框架均可正常识别到 `config.v` 文件。
