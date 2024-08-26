---
comments: true 
---

# <strong>ALU</strong>

ALU 的功能是对两个操作数进行算术或逻辑运算，然后将结果输出。在上学期的数字电路实验中，我们已经实现了一个功能完善的 ALU（[点我跳转](https://soc.ustc.edu.cn/Digital/lab6/ALU/)）。当然，本次实验对于 ALU 各个运算的实现并没有要求。例如：你可以使用门级描述（例如使用减法器实现减法运算），也可以使用行为级描述（例如使用 Verilog 自带的减法运算符实现减法运算）。

下面是 ALU 的结构示意图：

<figure markdown>
![Image title](./img/ALU/ALU_struc.png){ width="400" }
<figcaption>ALU 模块示意图</figcaption>
</figure>

对应的模块端口为：

```verilog linenums="1" title="ALU"
module ALU (
    input                   [31 : 0]            alu_src0,
    input                   [31 : 0]            alu_src1,
    input                   [ 4 : 0]            alu_op,

    output      reg         [31 : 0]            alu_res
);
```

本次实验的 ALU 需要支持对于 32 比特整数的相关运算。相应的运算操作码如下：

```verilog
`define ADD                 5'B00000    
`define SUB                 5'B00010   
`define SLT                 5'B00100
`define SLTU                5'B00101
`define AND                 5'B01001
`define OR                  5'B01010
`define XOR                 5'B01011
`define SLL                 5'B01110   
`define SRL                 5'B01111    
`define SRA                 5'B10000  
`define SRC0                5'B10001
`define SRC1                5'B10010
```

其中，SRC0 的作用是让 `alu_res` 输出 `alu_src0` 的值；SRC1 的作用是让 `alu_res` 输出 `alu_src1` 的值，其余操作均对应着指令中的相应操作。`` `define`` 语句用法与 C 语言中的 `#define` 类似，可以将某特定数值定义为符号 `<name>`，在使用时则需要在符号的前面添加反引号 `` ` ``，变为 `` `<name>`` 的形式。


??? "为什么 ALU 要这么编码？"

    上面的编码规则是为了便于 LA32R 指令集的译码。自然，我们可以从 0 开始顺序编码，也可以使用独热码进行编码。对于选择 RV32I 指令集的同学，可以使用上面的编码，也可以结合 RV32I 指令集的译码规则重新设计一套 ALU 的编码。



请据此将下面的代码补充完整。

```verilog linenums="1" title="ALU"
module ALU (
    input                   [31 : 0]            alu_src0,
    input                   [31 : 0]            alu_src1,
    input                   [ 4 : 0]            alu_op,

    output      reg         [31 : 0]            alu_res
);
    always @(*) begin
        case(alu_op)
            `ADD  :
                alu_res = alu_src0 + alu_src1;
            default :
                alu_res = 32'H0;
        endcase
    end
endmodule
```



