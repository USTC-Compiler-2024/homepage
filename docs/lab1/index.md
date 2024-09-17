

# Lab1 词法语法解析

本次实验需要同学们从无到有完成一个完整的 Cminusf 解析器，包括基于 **Flex** 的词法分析器和基于 Bison 的语法分析器，并将得到的语法分析树转化成抽象语法树（AST）。

## 文档

本次实验提供了若干文档，请根据实验进度和个人需要认真阅读。

- [正则表达式](./正则表达式.md)
- [Flex](./Flex.md)
- [Bison](./Bison.md)
- [词法语法解析](词法语法解析.md)
- [AST](./AST.md)
- [AST生成](AST生成.md)

## 实验内容

本次实验需要分阶段完成及验收。

### 阶段一

内容一：阅读[正则表达式](./正则表达式.md)、[Flex](./Flex.md)、[Bison](./Bison.md) 掌握基础知识，并 **回答每个文档内的思考题**，回答内容保存为 `answer.pdf`。

内容二：阅读[词法语法解析](词法语法解析.md)，完成词法分析器与语法分析器并生成语法分析树（syntax_tree）。

!!! warning "Deadline"

    **2024 年 9 月 28 日 23:59**

### 阶段二

内容一：阅读[AST](./AST.md)，掌握由语法分析树向抽象语法树的转换逻辑。

内容二：阅读[AST生成](AST生成.md)，完成抽象语法树（AST）的构建。

!!! warning "Deadline"

    **2024 年 10 月 7 日 23:59**

## 实验要求

请根据 Lab0 的内容，将[实验仓库](https://cscourse.ustc.edu.cn/vdir/Gitlab/compiler_staff/2023ustc-jianmu-compiler) fork 并 clone 到本地虚拟机中。

## 提交内容

- 在希冀平台提交你实验仓库的 url（如 `https://cscourse.ustc.edu.cn/vdir/Gitlab/xxx/2024ustc-jianmu-compiler.git`）。
- 在希冀平台提交你的 `answer.pdf` 文件。
