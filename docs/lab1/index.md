---
comments: true 
---

# <strong>实验 1：实用汇编程序</strong>

!!! Info "交流讨论"

    请大家加入实验课 QQ 群：903670306。关于实验课的相关信息请参考[这里](../index.md#_4)。


!!! Tips "给辅修同学的建议"

    如果你先前没有修读过「数字电路实验」课程，或从来没有接触过 Verilog 硬件描述语言，请抓紧时间阅读「数字电路实验课」的 [Lab1：Verilog 代码设计](https://soc.ustc.edu.cn/Digital/lab1/intro/)、[Lab2：仿真](https://soc.ustc.edu.cn/Digital/lab2/simulation/)、[Lab3：上板运行](https://soc.ustc.edu.cn/Digital/lab3/vivado/)的相关内容。



## <strong>实验目的</strong>

在本次实验中，我们将带大家熟悉 RISC 指令集（龙芯 LA32R 指令集以及 RV32I 指令集）的部分指令及编码格式，以便后续在硬件层面上实现这些指令。

???+ Info "RISC 概述"

    精简指令集计算机（Reduced Instruction Set Computing，简称 RISC）风格的指令系统被广泛应用于移动端处理器设计中。它的指令长度固定且编码格式规整，绝大多数指令只有两个源操作数和一个目的操作数，并采用 load/store 架构，即仅有 load/store 访存指令可以访问内存，其它指令的操作对象均是处理器核内部的寄存器或指令码中的立即数。


??? Note "本学期组成原理课程中需要实现的指令"


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
    |   sll.w rd, rj, rk   |     sll rd, rs1, rs2     | GR[rd] = GR[rj] << GR[rk][4:0] </br> x[rd] = x[rs1] << x[rs2][4:0]          |         逻辑左移         | 
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
    |   ld.w rd, rj, imm   |     lw rd, offset(rs1)      |  GR[rd] = Mem[GR[rj] + imm] </br> x[rd] = sext(M[x[rs1] + sext(offset)])      |          加载字          | 
    |   st.w rd, rj, imm   |     sw sr2, offset(sr1)    | Mem[GR[rj] + imm] = GR[rd] </br> M[x[rs1] + sext(offset)] = x[rs2]      |          存储字          | 
    | jirl rd, rj, *label* |   jalr rd, offset(rs1)   |   GR[rd] = pc + 4; pc = *label*  </br> x[rd] = pc+4; pc=(x[rs1]+sext(offset))&~1; |    间接相对跳转并链接    | 
    |      b *label*       | j offset(jal x0, offset)（伪指令） | pc = *label*  </br> pc += sext(offset)       |        无条件跳转        | 
    |      bl *label*      |      jal rd, offset      |   GR[1] = pc + 4; pc = *label*  </br> x[rd] = pc+4; pc += sext(offset) | 函数（子程序）调用并链接 | 
    | beq rj, rd, *label*  |    beq rs1, rs2, offset     |   if (GR[rj] GR[rd]) pc = *label* </br> if (rs1 == rs2) pc += sext(offset)  |         相等跳转         | 
    | bne rj, rd, *label*  |    bne rs1, rs2, offset     |   if (GR[rj] GR[rd]) pc = *label* </br> if (rs1 != rs2) pc += sext(offset) |         不等跳转         | 
    | blt rj, rd, *label*  |    blt rs1, rs2, offset     | if (GR[rj] < GR[rd]) pc = *label* </br> if (rs1 < rs2) pc += sext(offset) |      有符号小于跳转      | 
    | bge rj, rd, *label*  |    bge rs1, rs2, offset     | if (GR[rj] >= GR[rd]) pc = *label* </br> if (rs1 >= rs2) pc += sext(offset)|    有符号大于等于跳转    | 
    | bltu rj, rd, *label* |    bltu rs1, rs2, offset    |   if (GR[rj] <u GR[rd]) pc = *label*  </br> if (rs1 <u rs2) pc += sext(offset)  |      无符号小于跳转      | 
    | bgeu rj, rd, *label* |    bgeu rs1, rs2, offset    |   if (GR[rj] >=u GR[rd]) pc = *label* </br> if (rs1 >=u rs2) pc += sext(offset)  |    无符号大于等于跳转    | 

你可以参考[ RV32I 指令集手册](./src/RISCV_ref.pdf)以及[ LA32R 指令集手册](./src/LA32R_ref.pdf)的相关内容进行学习。

## <strong>实验内容</strong>

在正式开始之前，请选择一款指令集，实现本次实验的相关内容。


!!! Danger "选择你的指令集！"

    <strong><font color=#FF0000>
    请选择在本学期的后续实验中，使用 RV32I 指令集还是 LA32R 指令集。
    </font></strong>

    RV32I 指令集是 RISC-V 指令集中的一个子集；LA32R 指令集是龙芯架构指令集中的一个子集。这两款指令集在实验难度上没有差异，在得分上也没有差异。二者仅在指令结构和部分硬件逻辑上有差别，因此在后面的实验中，你可以随时根据需要更换自己的指令集。<strong>不过，我们还是建议大家在一开始就确定自己使用的指令集。</strong>

    ???+ Info "选择 RV32I 指令集的好处"

        指令集较为成熟，参考教程丰富。

    
    ???+ Info "选择 LA32R 指令集的好处"

        有更为高级的仿真框架可以使用，助教提供支持。


<strong>每一名同学都需要完成下面的任务。</strong>

> 在下面的任务中，为了便于称呼，我们记 32 个通用计数器为 $\text{R}_0\sim\text{R}_{31}$。

    
!!! Question "任务 1：斐波那契数列（6 分）"

    请编写汇编程序，计算斐波那契数列的第 $N$ 项（$1\le N\le 30$）。初始时，$N$ 的值保存在 $\text{R}_2$ 中。程序执行完成后，数列的第 $N$ 项保存在 $\text{R}_3$ 中。
    
    ??? Abstract "斐波那契数列"

        斐波那契数列（Fibonacci 数列）是数学家斐波那契以研究兔子繁殖为例研究的数列，故称「兔子数列」，又称为「黄金分割数列」。数列的第 $n$ 项 $a_n$ 满足：

        $$
        a_1 = 1
        $$

        $$
        a_2 = 1
        $$
        
        $$
        a_{n} = a_{n-1} + a_{n-2}, n\ge3
        $$



!!! Question "任务 2：大整数处理（3 分）"

    请编写汇编程序，计算斐波那契数列的第 $N$ 项（$1\le N\le 80$）。初始时，$N$ 的值保存在 $\text{R}_2$ 中。程序执行完成后，数列的第 $N$ 项保存在 $\text{R}_3$ 和 $\text{R}_4$ 中，其中 $\text{R}_3$ 存储结果的高 32 位，$\text{R}_4$ 存储结果的低 32 位。


!!! Question "任务 3：导出 COE 文件（1 分）"

    完成汇编程序的编写之后，请导出指令段的 COE 文件，以供后续实验使用。

    ??? Abstract "COE 文件"

        COE 文件是 Vivado 存储器 IP 核的初始化文件。该文件可以将数据自动导入存储器中，以供其他模块单元的使用。它的一般格式如下：

        ```
        memory_initialization_radix  = 16;
        memory_initialization_vector =
        00008737
        f0070713
        000087b7
        f0478793
        ```

        其中，`memory_initialization_radix` 指示数据使用的进制，`memory_initialization_vector` 则给出了每一个存储单元保存的数据。在上面的例子里，我们有

        ```
        M[0] = 00008737
        M[1] = f0070713
        M[2] = 000087b7
        M[3] = f0478793
        ```

        对于其他存储单元，初始时将被置为 0。


## <strong>实验检查与提交</strong>

本次实验布置时间为 2024-03-18，持续一周。相应的 DDL 节点如下：


|       组别    |     检查 DDL        |     报告提交 DDL      |
| :----------: | :-----------------: | :-------------------: |
|    周一组    |      2024-03-25      |     2024-04-01       |
|    周三组    |      2024-03-27      |     2024-04-03       |

检查与报告延迟一周以内（含）的，至多只能得到 80% 分数；延迟一周以上、两周以内（含）的，至多只能得到 60% 分数；延迟超过两周的不得分。

!!! Warning "提醒"

    实验的 DDL 为当天晚上 21:30。助教有权利在 21:30 准时停止检查，请大家合理安排好自己的时间。能否线上检查、能否在其他时间检查请咨询本组的助教。


!!! Success "关于实验报告"

    实验报告需要大家提交 PDF 格式。我们推荐大家使用 Markdown 或者 Latex 撰写实验报告，这样可以直接导出为 PDF。大家也可以使用 Word、WPS 等进行报告撰写，最后转换为 PDF 格式。我们不推荐也不拒绝大家手写实验报告，但请将其拍照扫描成 PDF 文件后再上传。我们不接受任何因为文件格式错误而导致成绩异常的申诉请求！

    在实验报告中，你需要给出每一项任务的答案，并附上必要的说明过程（或截图）。

    <strong>特别地：实验报告的字数和排版与最终得分无关。影响得分的仅有内容正确性与完整性。</strong>


实验报告提交的地址在[这里](https://soc.ustc.edu.cn/)。
