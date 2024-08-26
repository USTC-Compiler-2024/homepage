---
comments: true 
---

# <strong>实验 5：无冒险流水线 CPU</strong>


## <strong>实验目的</strong>

在本次实验中，我们尝试将上一次实验设计的 CPU 流水化，形成一个不考虑冒险的流水线 CPU。


## <strong>实验内容</strong>


!!! Question "任务 1：写优先的寄存器堆（3 分）"

    1. 请根据实验文档中的介绍将寄存器堆改为写优先的模式，并仿真测试正确性。

    2. <strong>在实验报告中回答</strong>，对于本次实验中的五级流水线 CPU，连续执行以下的指令序列后，<strong>若寄存器堆没有使用写优先</strong>，运行结束后 x4 与 x5 中的结果是什么？

        ```asm
        addi x1, x0, 1
        addi x2, x0, 2
        addi x3, x0, 3
        addi x1, x0, 10
        addi x2, x0, 20
        addi x3, x0, 30
        addi x0, x0, 0
        add  x4, x1, x2
        add  x5, x2, x3
        nop
        nop
        nop
        ```

    ??? Note "关于 nop"

        nop 代表什么也不做的指令，这里是为了保证充分运行。其在 RV32I 与 LA32R 中具体形式有差别，详见实验文档。


!!! Question "任务 2：无冒险流水线（7 分）"

    正确设计并例化四个段间寄存器，连线以实现无冒险流水线 CPU。最终，你需要在 FPGAOL 上上板运行，并通过我们给出的测试程序。

    ??? Note "Lab5 需要实现的指令"

        本次实验需要支持 Lab3、Lab4 中的所有指令，以及 nop 指令。nop 指令具体对应怎样的指令，请参考对应的指令集手册。

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

    !!! Warning "注意"

        为了实现流水线 CPU，你需要注意以下的内容：

        - 正确实现了段间寄存器的 flush 功能。
        - 正确将各个信号连接到段间寄存器上。特别地，commit 系列的信号需要从其产生开始，经过段间寄存器一直流水到最后。
        - `commit` 信号本身在 IF 段产生（为 1），经过段间寄存器来到 WB 段，最终连接到 CPU 的输出端口。
        - debug 端口不需要经过段间寄存器。
        - 我们预设的 PC 是始终 +4。在 EX 段发现分支错误（实际上的 PC 是 + offset）之后，需要正确<strong>清零</strong>两条 nop 指令的 commit 信号。简单起见，我们建议你将其他的控制信号也一并<strong>清空</strong>。
        - 修改仿真框架中 `configs.vh` 里的 CPU 类型（`CORE_TYPE`），将其设置为 ```PIPELINE``。


    ??? Note "LA32R 的测试汇编程序"

        下面两个测试都需要通过（上板、仿真框架都可以使用这两个测试）。

        - 测试程序 1 [在这里](./testcases/la_1.s)
        - 测试程序 2 [在这里](./testcases/la_2.s)
  

    ??? Note "RV32I 的测试汇编程序"

        下面两个测试都需要通过。

        - 测试程序 1 [在这里](./testcases/rv_1.s)
        - 测试程序 2 [在这里](./testcases/rv_2.s)



## <strong>实验检查与提交</strong>

本次实验布置时间为 2024-04-15，持续一周。相应的 DDL 节点如下：


|       组别    |     检查 DDL        |     报告提交 DDL      |
| :----------: | :-----------------: | :-------------------: |
|    周一组    |      2024-04-22      |     2024-04-29       |
|    周三组    |      2024-04-24      |     2024-05-01       |

在 DDL 之后，但在 5.6、5.8 及之前检查的，至多只能得到 90% 分数；5.6、5.8 之后检查的，至多只能得到 60% 分数。

!!! Warning "提醒"

    实验的 DDL 为当天晚上 21:30。助教有权利在 21:30 准时停止检查，请大家合理安排好自己的时间。能否线上检查、能否在其他时间检查请咨询本组的助教。


!!! Success "关于实验报告"

    实验报告需要大家提交 PDF 格式。我们推荐大家使用 Markdown 或者 Latex 撰写实验报告，这样可以直接导出为 PDF。大家也可以使用 Word、WPS 等进行报告撰写，最后转换为 PDF 格式。我们不推荐也不拒绝大家手写实验报告，但请将其拍照扫描成 PDF 文件后再上传。我们不接受任何因为文件格式错误而导致成绩异常的申诉请求！

    在实验报告中，你需要给出每一项任务的答案，并附上必要的说明过程（或截图）。

    <strong>特别地：实验报告的字数和排版与最终得分无关。影响得分的仅有内容正确性与完整性。</strong>


实验报告提交的地址在[这里](https://soc.ustc.edu.cn/)。
