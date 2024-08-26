---
comments: true 
---

# <strong>实验 3：简单单周期 CPU</strong>

!!! Bug "提问汇总"

    关于本次实验中大家遇到的问题，请阅读[这里](./problem.md)。


## <strong>实验目的</strong>

现在，我们终于可以开始搭建自己的第一个 CPU 了。当然，这只是一个十分基础的单周期 CPU，但这将是「图灵完备」在 COD 课程中的直接体现。

单周期 CPU（Single Cycle Processor）是指一条指令在一个时钟周期内完成，并在下一个时钟周期开始下一条指令的执行的 CPU。单周期 CPU 由时钟的上升沿或下降沿控制相关操作，两个相邻的上升沿或下降沿之间的时间间隔就是 CPU 的时钟周期。

需要注意的是，由于没有额外的暂存寄存器，单周期通路中的关键路径对应的延迟很高，以致于上板时的单条指令运行时长大于 10 纳秒。所以，我们不能直接使用开发板上的 100MHz 时钟作为 CPU 的运行时钟。除此之外，上板时我们也无法了解当前 CPU 运行到哪条指令，以及相应的结果如何。为此，我们不得不请出 PDU 来帮助我们完成这些工作。

本次实验我们将实现一个最为基础的单周期 CPU。这个 CPU 没有分支功能，也没有数据访存功能，只能进行基本的数据运算。但我们仍将深刻领悟到 CPU、PDU 以及 MEM 之间是如何相协同工作的。

## <strong>实验内容</strong>


!!! Question "任务 1：译码器设计（3 分）"

    请根据自己选择的指令集，设计译码器 Decoder 模块，以正确生成控制信号。你可以结合仿真证明自己的设计。


!!! Question "任务 2：搭建 CPU（4 分）"

    请正确实现 CPU 的各个功能模块，并根据数据通路将其正确连接。<strong>理论上，你只需要完成 CPU 模块及其子模块的设计，而无需修改其他模块的内容。</strong>最终，你需要在 FPGAOL 上上板运行，并通过我们给出的测试程序，为此你需要实现 Lab1 列出的指令中，从 add.w（add）到 pcaddu12i（auipc）之间的全部指令。

    ??? Note "Lab3 需要实现的汇编指令"


        |       LA32R 中指令    |     RV32I 中指令         |            指令功能                                  |           说明           |
        | :------------------: | :----------------------: | :----------------------------:                      | :----------------------: | 
        |   add.w rd, rj, rk   |     add rd, rs1, rs2     | GR[rd] = GR[rj] + GR[rk] </br> x[rd] = x[rs1] + x[rs2]                   |         整数加法          | 
        |  addi.w rd, rj, imm  |     addi rd, rs1, imm    | GR[rd] = GR[rj] + sext(imm) </br> x[rd] = x[rs1] + sext(imm) |         整数加法          | 
        |   sub.w rd, rj, rk   |     sub rd, rs1, rs2     | GR[rd] = GR[rj] - GR[rk] </br> x[rd] = x[rs1] - x[rs2]                  |         整数减法          | 
        |    slt rd, rj, rk    |     slt rd, rs1, rs2     | GR[rd] = (GR[rj] < GR[rk]) </br> x[rd] = (x[rs1] < x[rs2])            |      有符号整数比较       | 
        |   sltu rd, rj, rk    |    sltu rd, rs1, rs2     | GR[rd] = (GR[rj] <u GR[rk]) </br> x[rd] = (x[rs1] <u x[rs2])              |      无符号整数比较       | 
        |    and rd, rj, rk    |     and rd, rs1, rs2     | GR[rd] = GR[rj] & GR[rk] </br> x[rd] = x[rs1] & x[rs2]          |          按位与          | 
        |    or rd, rj, rk     |     or rd, rs1, rs2      | GR[rd] = GR[rj] \| GR[rk] </br> x[rd] = x[rs1] \| 𝑥[rs2] |          按位或          | 
        |    xor rd, rj, rk    |     xor rd, rs1, rs2     | GR[rd] = GR[rj] ^ GR[rk] </br> x[rd] = x[rs1] ^ 𝑥[rs2]                    |         按位异或         | 
        |   sll.w rd, rj, rk   |     sll rd, rs1, rs2     | GR[rd] = GR[rj] << GR[rk][4:0]  </br> x[rd] = x[rs1] << x[rs2][4:0]          |         逻辑左移         | 
        |   srl.w rd, rj, rk   |     srl rd, rs1, rs2     | GR[rd]= GR[rj] >> GR[rk][4:0]  </br> x[rd] = x[rs1] >> x[rs2][4:0]  |         逻辑右移         | 
        |   sra.w rd, rj, rk   |     sra rd, rs1, rs2     | GR[rd] = GR[rj] >>> GR[rk][4:0]  </br> x[rd] = x[rs1] >>> x[rs2][4:0]         |         算术右移         | 
        |  slli.w rd, rj, imm  |   slli rd, rs1, shamt    | GR[rd] = GR[rj] << imm </br> x[rd] = x[rs1] << shamt|         逻辑左移         | 
        |  srli.w rd, rj, imm  |   srli rd, rs1, shamt    | GR[rd] = GR[rj] >> imm </br> x[rd] = x[rs1] >> shamt        |         逻辑右移         | 
        |  srai.w rd, rj, imm  |   srai rd, rs1, shamt    | GR[rd] = GR[rj] >>> imm </br>  x[rd] = x[rs1] >>> shamt      |         算术右移         | 
        |   slti rd, rj, imm   |   slti rd, rs1, imm    | GR[rd] = (GR[rj] < sext(imm)) </br> x[rd] = (x[rs1] < sext(imm))  |      有符号整数比较      | 
        |  sltui rd, rj, imm   |   sltiu rd, rs1, imm   | GR[rd] = (GR[rj] <u sext(imm)) </br> x[rd] = (x[rs1] <u sext(imm))        |      无符号整数比较      | 
        |   andi rd, rj, imm   |   andi rd, rs1, imm    | GR[rd] = GR[rj] & zext(imm)  </br> x[rd] = x[rs1] & sext(imm) |          按位与          | 
        |   ori rd, rj, imm    |    ori rd, rs1, imm    | GR[rd] = GR[rj] \| zext(imm)   </br> x[rd] = x[rs1] \| sext(imm)       |          按位或          | 
        |   xori rd, rj, imm   |   xori rd, rs1, imm    | GR[rd] = GR[rj] ^ zext(imm)   </br> x[rd] = x[rs1] ^  sext(imm)      |         按位异或         | 
        |  lu12i.w rd, imm     |       lui rd, imm        | GR[rd] = imm << 12 </br> x[rd] = sext(imm << 12)         |     加载高20位立即数     | 
        |  pcaddu12i rd, imm   |      auipc rd, imm       | GR[rd] = pc + sext(imm << 12) </br> x[rd] = pc + sext(imm[31:12] << 12) | 加载加上 PC 的高 20 位立即数 | 

    ??? Note "LA32R 的测试汇编程序"

        请确保下面的程序运行完成后，寄存器堆中的结果与 LARS 运行的结果一致。

        - 仿真框架用的测试文件[在这里](./src/la32r_sim.asm)。
        - Vivado 仿真以及上板用的测试文件[在这里](./src/la32r_online.asm)。


    ??? Note "RV32I 的测试汇编程序"

        请确保下面的程序运行完成后，寄存器堆中的结果与 RARS 运行的结果一致。

        [在这里](./src/rv32i.asm)。


    !!! Tips "建议"

        为了完成本项任务，你可以按照下面的顺序进行：

        1. 使用 Verilog 硬件描述语言编写 CPU 关键部件的代码，例如算数逻辑单元（ALU）、寄存器堆（RF）、程序计数器（PC）、译码器（DECODER）、多路选择器（MUX）等。其中 ALU、RF 在 Lab2 中已经完成了设计，PC、DECODER 以及 MUX 需要结合本次实验的教程进行设计。<strong>请注意自己使用的指令集是 RV32I 还是 LA32R，二者在本次实验中是存在差异的。</strong>
        2. 结合教程中提供的简单单周期 CPU 数据通路，在我们提供的 CPU 模块中将上述部件正确连接，同时也将 CPU 模块的接口正确连接到内部对应的线路上。
        3. 将我们提供的测试汇编程序导入指令存储器。
        4. 对于使用 RV32I 指令集的同学，可以<strong>将 CPU 模块设为 TOP</strong>，并用 Vivado 的行为级仿真验证 CPU 模块的正确性（与 RARS 运行的结果进行对比）；对于使用 LA32R 指令集的同学，除了可以使用 Vivado 的行为级仿真外，还可以使用我们提供的仿真框架进行仿真测试。<strong>使用仿真框架前，请仔细阅读使用说明，并正确配置好项目结构。</strong>
        5. 仿真测试完成后，将框架中的 TOP 模块设定为项目的 TOP，并查看 Elaborated Design。你需要参考[这里](https://soc.ustc.edu.cn/Digital/lab3/bugs/)介绍的内容消除可能存在的 Bug。
        6. 在确保 TOP 模块为项目的 TOP 的前提下生成比特流，并参考 PDU 使用手册在 FPGAOL 平台上实际运行。

        请牢记：<strong> Debug 的过程应当在仿真阶段完成，上板仅仅是为了运行汇编程序。</strong>


!!! Question "任务 3：思考与总结（3 分）"

    请在实验报告中回答下面的问题：

    1. 本次实验的 CPU 中，哪些模块用到了时钟信号？
    2. 请分别给出一条指令，以符合下面的描述：
        - alu_src0 选择 pc;
        - alu_src0 选择 rf_rd0；
        - alu_src1 选择 rf_rd1；
        - alu_src1 选择 imm； 
    3. 请指出本次实验的 CPU 中可能的关键路径；如果这条路径的延迟大于一个时钟周期，可能会带来什么影响？



## <strong>实验检查与提交</strong>

本次实验布置时间为 2024-04-01，持续一周。相应的 DDL 节点如下：


|       组别    |     检查 DDL        |     报告提交 DDL      |
| :----------: | :-----------------: | :-------------------: |
|    周一组    |      2024-04-08      |     2024-04-15       |
|    周三组    |      2024-04-10      |     2024-04-17       |

检查与报告延迟一周以内（含）的，至多只能得到 80% 分数；延迟一周以上、两周以内（含）的，至多只能得到 60% 分数；延迟超过两周的不得分。

!!! Warning "提醒"

    实验的 DDL 为当天晚上 21:30。助教有权利在 21:30 准时停止检查，请大家合理安排好自己的时间。能否线上检查、能否在其他时间检查请咨询本组的助教。


!!! Success "关于实验报告"

    实验报告需要大家提交 PDF 格式。我们推荐大家使用 Markdown 或者 Latex 撰写实验报告，这样可以直接导出为 PDF。大家也可以使用 Word、WPS 等进行报告撰写，最后转换为 PDF 格式。我们不推荐也不拒绝大家手写实验报告，但请将其拍照扫描成 PDF 文件后再上传。我们不接受任何因为文件格式错误而导致成绩异常的申诉请求！

    在实验报告中，你需要给出每一项任务的答案，并附上必要的说明过程（或截图）。

    <strong>特别地：实验报告的字数和排版与最终得分无关。影响得分的仅有内容正确性与完整性。</strong>


实验报告提交的地址在[这里](https://soc.ustc.edu.cn/)。



