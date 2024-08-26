---
comments: true 
---

# <strong>实验 2：CPU 功能部件设计</strong>


## <strong>实验目的</strong>

从本次实验开始，我们将通过 Verilog 硬件描述语言实现一个可用的单周期 CPU。Lab2 ~ Lab4 将按照下面的节奏进行：

- Lab2：复习 Verilog 语法，实现 CPU 的功能部件；
- Lab3：搭建无访存、无分支的单周期 CPU；
- Lab4：搭建完整的单周期 CPU。

下面，我们介绍本次实验的相关内容。

## <strong>实验内容</strong>

<strong>每一名同学都需要完成下面的任务。</strong>

!!! Question "任务 1：寄存器堆设计（3 分）"

    请参考实验教程，设计<strong>符合要求</strong>的 32 位寄存器堆，并进行仿真。你需要在 Vivado 中创建一个项目，添加下面的仿真文件。

    ??? Note "寄存器堆的仿真文件"

        ```verilog linenums="1" title="RegFile_tb"
        module RegFile_tb ();
            reg                 clk;
            reg     [ 4 : 0]    ra0, ra1, wa;
            reg     [ 0 : 0]    we;
            reg     [31 : 0]    wd;
            wire    [31 : 0]    rd0;
            wire    [31 : 0]    rd1;

            REG_FILE regfile (
                .clk    (clk),
                .rf_ra0    (ra0),
                .rf_ra1    (ra1),
                .rf_wa     (wa),
                .rf_we     (we),
                .rf_wd     (wd),
                .rf_rd0    (rd0),
                .rf_rd1    (rd1)
            );

            initial begin
                clk = 0;
                ra0 = 5'H0; ra1 = 5'H0; wa = 5'H0; we = 1'H0; wd = 32'H0;

                #12
                ra0 = 5'H0; ra1 = 5'H0; wa = 5'H3; we = 1'H1; wd = 32'H12345678;

                #5
                ra0 = 5'H0; ra1 = 5'H0; wa = 5'H0; we = 1'H0; wd = 32'H0;

                #5
                ra0 = 5'H3; ra1 = 5'H2; wa = 5'H2; we = 1'H1; wd = 32'H87654321;

                #5
                ra0 = 5'H0; ra1 = 5'H0; wa = 5'H0; we = 1'H0; wd = 32'H0;

                #5
                ra0 = 5'H3; ra1 = 5'H0; wa = 5'H0; we = 1'H1; wd = 32'H87654321;

                #10
                $finish;
            end
            always #5 clk = ~clk;
        endmodule
        ```

        <figure markdown>
        ![Image title](./img/rf_tb.png){ width="800" }
        <figcaption>参考的仿真结果</figcaption>
        </figure>

    在检查时，请向助教展示你的仿真结果，并介绍代码的设计思路。


!!! Question "任务 2：ALU 设计（3 分）"

    请参考实验教程，设计符合要求的 32 位 ALU，并进行仿真。你需要自行编写合适的仿真文件，验证每一种运算模式下 ALU 计算的正确性。一个可供参考的仿真框架如下：

    ```verilog linenums="1" title="ALU_tb"
    module ALU_tb();
        //...
        initial begin
            src0=32'hffff; src1=32'hffff; sel=5'H0;
            repeat(32) begin
                sel = sel + 1;
                #20;
            end
        end
        //...
    endmodule
    ```

    在检查时，请向助教展示你的仿真结果，并介绍代码的设计思路。




!!! Question "任务 3：在线计算器（3 分）"

    请使用任务 2 中的 ALU，在 FPGAOL 上搭建一个简单的计算器。

    <figure markdown>
    ![Image title](./img/cal.png){ width="800" }
    <figcaption>本题的数据通路</figcaption>
    </figure>

    上图展示了本题的数据通路。该电路主要由寄存器，译码器，ALU 单元、数码管显示模块 Segment 组成。其中使能信号 enable 与按钮相连，全局复位信号 rst 与 sw[7] 相连，功能控制信号 ctrl 与 sw[6:5] 相连，数据输入信号 in 与 sw[4:0] 相连。我们约定：输入的数据为<strong>五位有符号数</strong>；此外，ctrl 信号对应的规则如下：

    - ctrl=2'B00 时，按下 enable，表示选择 alu_op = in[4:0] 的 ALU 运算。我们将与列出的操作码不相符的运算视作零运算，即无论操作数 src0 和 src1 的值如何，alu_res 的值都为 0。
    - ctrl=2'B01 时，按下 enable，表示将 alu_src0 的值改为 in[4:0]。
    - ctrl=2'B10 时，按下 enable，表示将 alu_src1 的值改为 in[4:0]。
    - ctrl=2'B11 时，按下 enable，表示将计算结果 alu_res 通过 seg_an 与 seg_data 在七段数码管上显示出来。（注意：数码管的输出数据 output_data 只在此时更新）

    比如：我们首先将 ctrl 设为 2'B00，in[4:0] 设为 5'B1001，按下 enable，此时 alu_op 的值为 5'B01001，代表选择了逻辑与运算（因为在我们给出的 ALU 操作码中，AND 对应着 5'B01001）；接下来将 ctrl 设为 2'B01，in[4:0] 设为 5'B01011，按下 enable，此时 alu_src0 的值变为 5'B01011；接下来将 ctrl 设为 2'B10，in[4:0] 设为 5'B00011，按下 enable，此时 alu_src1 的值变为 5'B00011；ctrl 设为 2'B11，按下 enable，此时 alu_res 的值为 5'B00011，会通过 seg_an 与 seg_data 在七段数码管上以十六进制的形式显示出来。

    值得一提的是，我们的 ALU 依然是 32 位的。为此我们需要将寄存器中的数据<strong>符号扩展</strong>到 32 位后接入 ALU；数码管显示模块的输入是 32 位的，因此 ALU 的计算结果可以直接连接到数码管显示模块。

    ??? Question "为什么要这么设计这样的输入流程？"

        这是由于 FPGAOL 外设资源有限，我们没有办法一次性输入全部的数据（毕竟即使是用计算器也要按好几个键），因此相应的外设端口需要分时复用。换而言之，操作数 alu_src0、alu_src1 和操作码 alu_op 复用了开关输入 x[5:0]，复用的方法是通过 sel 和 enable 信号，译码生成对应寄存器的使能信号，将开关输入 x[5:0] 存入正确的寄存器。

    本题需要在 FPGAOL 上上板运行。项目对应的约束文件如下：

    ```
    ## Clock signal
    set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { clk }]; #IO_L12P_T1_MRCC_35 Sch=clk100mhz
    create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {clk}];

    ## FPGAOL SWITCH

    set_property -dict { PACKAGE_PIN D14   IOSTANDARD LVCMOS33 } [get_ports { in[0] }];
    set_property -dict { PACKAGE_PIN F16   IOSTANDARD LVCMOS33 } [get_ports { in[1] }];
    set_property -dict { PACKAGE_PIN G16   IOSTANDARD LVCMOS33 } [get_ports { in[2] }];
    set_property -dict { PACKAGE_PIN H14   IOSTANDARD LVCMOS33 } [get_ports { in[3] }];
    set_property -dict { PACKAGE_PIN E16   IOSTANDARD LVCMOS33 } [get_ports { in[4] }];
    set_property -dict { PACKAGE_PIN F13   IOSTANDARD LVCMOS33 } [get_ports { ctrl[0] }];
    set_property -dict { PACKAGE_PIN G13   IOSTANDARD LVCMOS33 } [get_ports { ctrl[1] }];
    set_property -dict { PACKAGE_PIN H16   IOSTANDARD LVCMOS33 } [get_ports { rst }];


    ## FPGAOL HEXPLAY

    set_property -dict { PACKAGE_PIN A14   IOSTANDARD LVCMOS33 } [get_ports { seg_data[0] }];
    set_property -dict { PACKAGE_PIN A13   IOSTANDARD LVCMOS33 } [get_ports { seg_data[1] }];
    set_property -dict { PACKAGE_PIN A16   IOSTANDARD LVCMOS33 } [get_ports { seg_data[2] }];
    set_property -dict { PACKAGE_PIN A15   IOSTANDARD LVCMOS33 } [get_ports { seg_data[3] }];
    set_property -dict { PACKAGE_PIN B17   IOSTANDARD LVCMOS33 } [get_ports { seg_an[0] }];
    set_property -dict { PACKAGE_PIN B16   IOSTANDARD LVCMOS33 } [get_ports { seg_an[1] }];
    set_property -dict { PACKAGE_PIN A18   IOSTANDARD LVCMOS33 } [get_ports { seg_an[2] }];

    ## FPGAOL BUTTON & SOFT_CLOCK

    set_property -dict { PACKAGE_PIN B18   IOSTANDARD LVCMOS33 } [get_ports { enable }];
    ```

    ??? Question "什么是约束文件？如何上板运行？"

        请参考[这里](https://soc.ustc.edu.cn/Digital/lab3/FPGAOL/)和[这里](https://soc.ustc.edu.cn/Digital/lab3/vivado/)。


    TOP 模块的部分代码如下：

    ```verilog linenums="1" title="TOP"
    module TOP (
        input                   [ 0 : 0]            clk,
        input                   [ 0 : 0]            rst,

        input                   [ 0 : 0]            enable,
        input                   [ 4 : 0]            in,
        input                   [ 1 : 0]            ctrl,

        output                  [ 3 : 0]            seg_data,
        output                  [ 2 : 0]            seg_an
    );

    endmodule
    ```

    数码管显示模块 Segment 的代码如下：

    ```verilog linenums="1" title="Segment"
    module Segment(
        input                   [ 0 : 0]            clk,
        input                   [ 0 : 0]            rst,
        input                   [31 : 0]            output_data,
        output          reg     [ 3 : 0]            seg_data,
        output          reg     [ 2 : 0]            seg_an
    );

    parameter COUNT_NUM = 50_000_000 / 400;         // 100MHz to 400Hz
    parameter SEG_NUM = 8;                          // Number of segments

    reg [31:0] counter;
    always @(posedge clk) begin
        if (rst)
            counter <= 0;
        else if (counter >= COUNT_NUM)
            counter <= 0;
        else
            counter <= counter + 1;
    end

    reg [2:0] seg_id;
    always @(posedge clk) begin
        if (rst)
            seg_id <= 0;
        else if (counter == COUNT_NUM) begin
            if (seg_id >= SEG_NUM - 1)
                seg_id <= 0;
            else
                seg_id <= seg_id + 1;
        end
    end

    always @(*) begin
        seg_data = 0;
        case (seg_an)
            'd0     : seg_data = output_data[3:0]; 
            'd1     : seg_data = output_data[7:4];
            'd2     : seg_data = output_data[11:8];
            'd3     : seg_data = output_data[15:12];
            'd4     : seg_data = output_data[19:16];
            'd5     : seg_data = output_data[23:20];
            'd6     : seg_data = output_data[27:24];
            'd7     : seg_data = output_data[31:28];
            default : seg_data = 0;
        endcase
    end

    always @(*) begin
        seg_an = seg_id;
    end
    endmodule
    ```

    ??? Question "Segment 模块的原理和作用？"

        请参考[这里](https://soc.ustc.edu.cn/Digital/lab3/tasks/#_2)必做部分的第三题。



!!! Question "任务 4：初始化存储器（1 分）"

    请创建一个新的项目，例化合适大小的存储器 IP 核（分布式、块式均可），将上一次实验生成的指令段 COE 文件导入到 IP 核中，并向助教展示。




## <strong>实验检查与提交</strong>

本次实验布置时间为 2024-03-25，持续一周。相应的 DDL 节点如下：


|       组别    |     检查 DDL        |     报告提交 DDL      |
| :----------: | :-----------------: | :-------------------: |
|    周一组    |      2024-04-01      |     2024-04-08       |
|    周三组    |      2024-04-03      |     2024-04-10       |

检查与报告延迟一周以内（含）的，至多只能得到 80% 分数；延迟一周以上、两周以内（含）的，至多只能得到 60% 分数；延迟超过两周的不得分。

!!! Warning "提醒"

    实验的 DDL 为当天晚上 21:30。助教有权利在 21:30 准时停止检查，请大家合理安排好自己的时间。能否线上检查、能否在其他时间检查请咨询本组的助教。


!!! Success "关于实验报告"

    实验报告需要大家提交 PDF 格式。我们推荐大家使用 Markdown 或者 Latex 撰写实验报告，这样可以直接导出为 PDF。大家也可以使用 Word、WPS 等进行报告撰写，最后转换为 PDF 格式。我们不推荐也不拒绝大家手写实验报告，但请将其拍照扫描成 PDF 文件后再上传。我们不接受任何因为文件格式错误而导致成绩异常的申诉请求！

    在实验报告中，你需要给出每一项任务的答案，并附上必要的说明过程（或截图）。

    <strong>特别地：实验报告的字数和排版与最终得分无关。影响得分的仅有内容正确性与完整性。</strong>


实验报告提交的地址在[这里](https://soc.ustc.edu.cn/)。
