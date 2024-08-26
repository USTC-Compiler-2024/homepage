---
comments: true 
---

# <strong>实验 4：完整单周期 CPU</strong>


## <strong>实验目的</strong>

在本次实验中，我们将进一步完善上一次实验设计的 CPU，为其增加分支指令和访存指令的相关功能。


## <strong>实验内容</strong>


??? Note "Lab4 额外需要实现的指令"

    本次实验需要在 Lab3 支持的指令的基础上，额外支持下面的指令（SLU 指经过 SL_UNIT 处理之后的结果）：

    |       LA32R 中指令    |     RV32I 中指令         |            指令功能                                  |           说明           |
    | :------------------: | :----------------------: | :----------------------------:                      | :----------------------: | 
    |   ld.w rd, rj, imm   |     lw rd, offset(rs1)      |  GR[rd] = Mem[GR[rj] + imm] </br> x[rd] = sext(M[x[rs1] + sext(offset)])      |          加载字          | 
    |   ld.h rd, rj, imm   |     lh rd, offset(rs1)      |  GR[rd] = SLU(Mem[GR[rj] + imm]) </br> x[rd] = SLU((M[x[rs1] + sext(offset)]))      |          加载半字          |
    |   ld.b rd, rj, imm   |     lb rd, offset(rs1)      |  GR[rd] = SLU(Mem[GR[rj] + imm]) </br> x[rd] = SLU((M[x[rs1] + sext(offset)]))      |          加载字节          |
    |   ld.hu rd, rj, imm   |     lhu rd, offset(rs1)      |  GR[rd] = SLU(Mem[GR[rj] + imm]) </br> x[rd] = SLU((M[x[rs1] + sext(offset)]))      |          无符号加载半字          |
    |   ld.bu rd, rj, imm   |     lbu rd, offset(rs1)      |  GR[rd] = SLU(Mem[GR[rj] + imm]) </br> x[rd] = SLU((M[x[rs1] + sext(offset)]))      |          无符号加载字节          |
    |   st.w rd, rj, imm   |     sw rs2, offset(rs1)    | Mem[GR[rj] + imm] = GR[rd] </br> M[x[rs1] + sext(offset)] = x[rs2]      |          存储字          | 
    |   st.h rd, rj, imm   |     sh rs2, offset(rs1)    | Mem[GR[rj] + imm] = SLU(GR[rd]) </br> M[x[rs1] + sext(offset)] = SLU(x[rs2])      |          存储半字          |
    |   st.b rd, rj, imm   |     sb rs2, offset(rs1)    | Mem[GR[rj] + imm] = SLU(GR[rd]) </br> M[x[rs1] + sext(offset)] = SLU(x[rs2])      |          存储字节          |
    | jirl rd, rj, *label* |   jalr rd, offset(rs1)   |   GR[rd] = pc + 4; pc = *label*  </br> x[rd] = pc+4; pc=(x[rs1]+sext(offset))&~1; |    间接相对跳转并链接    | 
    |      b *label*       | j offset(jal x0, offset)（伪指令） | pc = *label*  </br> pc += sext(offset)       |        无条件跳转        | 
    |      bl *label*      |      jal rd, offset      |   GR[1] = pc + 4; pc = *label*  </br> x[rd] = pc+4; pc += sext(offset) | 函数（子程序）调用并链接 | 
    | beq rj, rd, *label*  |    beq rs1, rs2, offset     |   if (GR[rj] GR[rd]) pc = *label* </br> if (rs1 == rs2) pc += sext(offset)  |         相等跳转         | 
    | bne rj, rd, *label*  |    bne rs1, rs2, offset     |   if (GR[rj] GR[rd]) pc = *label* </br> if (rs1 != rs2) pc += sext(offset) |         不等跳转         | 
    | blt rj, rd, *label*  |    blt rs1, rs2, offset     | if (GR[rj] < GR[rd]) pc = *label* </br> if (rs1 < rs2) pc += sext(offset) |      有符号小于跳转      | 
    | bge rj, rd, *label*  |    bge rs1, rs2, offset     | if (GR[rj] >= GR[rd]) pc = *label* </br> if (rs1 >= rs2) pc += sext(offset)|    有符号大于等于跳转    | 
    | bltu rj, rd, *label* |    bltu rs1, rs2, offset    |   if (GR[rj] <u GR[rd]) pc = *label*  </br> if (rs1 <u rs2) pc += sext(offset)  |      无符号小于跳转      | 
    | bgeu rj, rd, *label* |    bgeu rs1, rs2, offset    |   if (GR[rj] >=u GR[rd]) pc = *label* </br> if (rs1 >=u rs2) pc += sext(offset)  |    无符号大于等于跳转    | 


!!! Question "任务 1：访存控制单元设计（3 分）"

    请根据自己选择的指令集，设计访存控制单元 SL_UNIT，以正确处理访存指令。你可以结合仿真证明自己的设计。


!!! Question "任务 2：搭建 CPU（4 分）"

    请正确实现 CPU 的各个功能模块，并根据数据通路将其正确连接。<strong>理论上，你只需要完成 CPU 模块及其子模块的设计，而无需修改其他模块的内容。</strong>最终，你需要在 FPGAOL 上上板运行，并通过我们给出的测试程序。

    !!! Warning "提醒"

        本次实验需要用到数据存储器，因此需要修改 CPU 模块中 `commit_dmem` 系列的三个端口。

        ```verilog
        commit_dmem_we_reg  <= dmem_we;                         
        commit_dmem_wa_reg  <= dmem_wa;                         
        commit_dmem_wd_reg  <= dmem_wd;                           
        ```


    ??? Note "LA32R 的测试汇编程序"

        请确保下面的程序运行完成后，寄存器堆中的结果与 LARS 运行的结果一致。

        - 仿真框架用的测试文件[在这里](./src/la32r_sim.asm)。
        - Vivado 仿真以及上板用的测试文件[在这里](./src/la32r_online.asm)。
  

    ??? Note "RV32I 的测试汇编程序"

        下面两个测试都需要通过。

        - 测试程序 1（普通测试）[在这里](./src/rv32i_test1.asm)
        - 测试程序 2（分支与访存测试）[在这里](./src/rv32i_test2.asm)

        
        !!! Warning "RV32I 仿真"
            从本个任务开始，使用 RV32I 指令集的同学们的仿真需要在 CPU_tb 模块中例化 CPU、指令储存器 IP 核与数据储存器 IP 核。指令储存器 IP 核与数据储存器 IP 核的地址端口均为 CPU 输出端口右移两位（因为单个 IP 核的位宽是 32 位，对应四个地址），而其他使能信号、数据信号请大家根据 CPU 中的信号含义自行连接。


!!! Question "任务 3：斐波那契数列（1 分）"

    请将 Lab1 中编写的斐波那契数列程序（普通版本、大整数版本均可）导出为 COE 文件，在自己设计的 CPU 上运行。相关数据的输入、输出方式不限。


!!! Question "任务 4：思考与总结（2 分）"

    请在实验报告中回答下面的问题：

    1. 假设我们的存储器支持掩码访问，其对应接口如下：
    ```verilog linenums="1"
    module MEM (
        input       [ 0 : 0]                clk,
        input       [ 9 : 0]                a,
        output      [31 : 0]                spo,
        input       [ 0 : 0]                we,
        input       [31 : 0]                d,
        input       [ 3 : 0]                mask
    );
    ```
    其中，`mask` 为高电平有效的控制信号，`mask[0]` 控制当前正在访问的字的最低字节是否有效；`mask[3]` 控制当前正在访问的字的最高字节是否有效。例如，如果 `a = 0x4`，`we = 1`，`d = 0x12345678`，`mask=4'B0110`，则数据存储器对应的操作为
    ```
    M[0x4] <- M[0x4]
    M[0x5] <- 0x56
    M[0x6] <- 0x34
    M[0x7] <- M[0x7]
    ```
    读操作则会将 `mask` 为 0 的字节置为 0。例如，如果 `a = 0x4`，`we = 0`，`mask=4'B0110`，则读出的结果为
    ```
    {8'B0, M[0x6], M[0x5], 8'B0}
    ```
    请重新设计 SL_UNIT 单元。你可以自行添加相关模块所需要的端口。注意：本题的前提是我们假设存在这样的存储器 IP 核，你并不需要实现这个 IP 核，也不需要仿真或上板，仅阐述 SL_UNIT 单元的设计方案即可。

    2. 请指出本次实验的 CPU 中可能的关键路径。
   



## <strong>实验检查与提交</strong>

本次实验布置时间为 2024-04-08，持续一周。相应的 DDL 节点如下：


|       组别    |     检查 DDL        |     报告提交 DDL      |
| :----------: | :-----------------: | :-------------------: |
|    周一组    |      2024-04-15      |     2024-04-22       |
|    周三组    |      2024-04-17      |     2024-04-24       |

检查与报告延迟一周以内（含）的，至多只能得到 80% 分数；延迟一周以上、两周以内（含）的，至多只能得到 60% 分数；延迟超过两周的不得分。

!!! Warning "提醒"

    实验的 DDL 为当天晚上 21:30。助教有权利在 21:30 准时停止检查，请大家合理安排好自己的时间。能否线上检查、能否在其他时间检查请咨询本组的助教。


!!! Success "关于实验报告"

    实验报告需要大家提交 PDF 格式。我们推荐大家使用 Markdown 或者 Latex 撰写实验报告，这样可以直接导出为 PDF。大家也可以使用 Word、WPS 等进行报告撰写，最后转换为 PDF 格式。我们不推荐也不拒绝大家手写实验报告，但请将其拍照扫描成 PDF 文件后再上传。我们不接受任何因为文件格式错误而导致成绩异常的申诉请求！

    在实验报告中，你需要给出每一项任务的答案，并附上必要的说明过程（或截图）。

    <strong>特别地：实验报告的字数和排版与最终得分无关。影响得分的仅有内容正确性与完整性。</strong>


实验报告提交的地址在[这里](https://soc.ustc.edu.cn/)。
