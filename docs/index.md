

# <strong>编译原理与技术</strong>



!!! Info "说明"

    本课程主页为 2024 秋季学期李诚老师班《编译原理与技术》课程主页，包含了理论课与实验课的相关信息。

<hr class="hr-my" data-content="(●′∀｀●) 我是分隔线 (●′∀｀●)">

## <strong>课程简介</strong>

本课程是计算机科学与技术专业的核心课，旨在深入探讨程序设计语言的设计和实现技术，涵盖与程序设计语言理论相关的知识，并培养学生将课程中学到的概念和技术应用于软件设计和开发的能力。内容包括编译器构建的基本原理，包括词法分析、语法分析、语义分析、中间代码生成、代码优化和目标代码生成。同时，本课程结合现代编译技术和趋势，使用 LLVM 和龙芯后端，基于自主设计的教学实验框架“建木”，设计现代化的编译器工具。

## <strong>课程信息</strong>

### <strong>上课时间与地点</strong>

    时间：1~15 周，1(6,7) 和 3(3,4)
    地点：高新校区 GT-B212
### <strong>联系方式</strong>

<strong>教师</strong>

- 主讲教师：李诚 （<chengli7@ustc.edu.cn>）

<strong>助教</strong>

  - 金泽文（<zevin@mail.ustc.edu.cn>）
  - 贺嘉（<hej148@mail.ustc.edu.cn>）
  - 李晓奇（<lxq@mail.ustc.edu.cn>）
  - 李宇哲（<lyz1810@mail.ustc.edu.cn>）
  - 周瓯翔（<zox@mail.ustc.edu.cn>）
  - 刘睿博（<liuruibo21@mail.ustc.edu.cn>）

<strong>其它</strong>

- QQ 群：726310461
<!-- - 录课视频（需校内统一身份认证）：<https://v.ustc.edu.cn/1/2024-1/capture-course/011163.02/detail> -->
<!-- - 希冀实验平台（作业及实验提交）：<http://cscourse.ustc.edu.cn/> -->
<!-- - 实验框架已公开，见参考资料[<sup>2</sup>](#textbook2) -->


## <strong>公告</strong>

- 2024-09-02：[课程平台介绍](exp_platform_intro/README.md) 已发布
- 2023-09-06：[Lab0](lab0/index.md) 已发布，Deadline：**2023 年 9 月 18 日**
<!-- - 2023-09-13：第一次作业：2.1a、2.2、2.3a、2.4h、2.7c、2.15（教材[<sup>1</sup>](#textbook)），Deadline：**2023 年 9 月 20 日**
- 2023-09-15：[Lab1](lab1/index.md) 已发布，Deadline：**2023 年 9 月 28 日**
- 2023-09-25：第二次作业：3.1a、3.2a、3.10、3.11、3.17、3.19a（教材[<sup>1</sup>](#textbook)），Deadline：**2023 年 10 月 7 日 14:00**
- 2023-10-05：[Lab2](lab2/index.md) 已发布，注意分阶段 Deadline
- 2023-10-11：第三次作业：3.27、3.37、4.3、4.5、4.9（教材[<sup>1</sup>](#textbook)），Deadline：**2023 年 10 月 18 日 16:00**
- 2023-11-01：[Lab3](lab3/index.md) 已发布，注意分阶段 Deadline
- 2023-11-01：第四次作业已发布，Deadline：**2023 年 11 月 8 日 17:25**
- 2023-11-14：第五次作业：4.13、4.15、5.5、6.5、6.6（教材[<sup>1</sup>](#textbook)），Deadline：**2023 年 11 月 21 日 09:00**
- 2023-11-27：[Lab4](lab4/index.md) 已发布，Deadline：**2023 年 12 月 18 日**
- 2023-12-08：第六次作业：7.2c、7.5、7.12、8.1e、8.2e、8.6（教材[<sup>1</sup>](#textbook)），Deadline：**2023 年 12 月 20 日 24:00**
- 2023-12-08：第七次作业：9.1、9.2、9.3、9.15af（教材[<sup>1</sup>](#textbook)），Deadline：**2024 年 1 月 3 日 24:00**
- 2024-01-14：[建木杯–编译原理创新实验](innovative-lab/index.md) 已发布 -->

## <strong>教学课件</strong>

|    日期    |                                   标题                                    |                                                                                                                 课件                                                                                                                  |
| :--------: | :-----------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| 2024-09-02 |                            编译原理和技术导论                             |                                                                              [Lecture1_Intro](ppt/Lecture1-Intro.pdf)                                                                              |
| 2024-09-04 |                                 词法分析                                  | [Lexical-analysis](ppt/Lecture2-Lexical-analysis.pdf)|
| 2024-09-11 |                         语法分析 - 上下文无关文法                         |                                                                              [Parser-part1](ppt/Lecture3-Parser-part1.pdf)                                                                              |
| 2024-09-14 |                      语法分析 - 自顶向下 - 递归下降                       |                                                                              [Parser-part2](ppt/Lecture4-Parser-part2.pdf)                                                                              |
<!-- | 2023-09-18 |                     语法分析 - 自顶向下 - LL(1) 文法                      |                                                                              [part3](https://rec.ustc.edu.cn/share/08643ef0-5564-11ee-88f3-1509f631aa4a)                                                                              |
| 2023-09-20 |           语法分析 - 自底向上 - 移进规约 & LR 分析器的简单模型            |                                       [part4](https://rec.ustc.edu.cn/share/fcba4990-5772-11ee-a14c-a36e421ab311), [part5](https://rec.ustc.edu.cn/share/08206b90-5773-11ee-a7a9-2766281e042e)                                        |
| 2023-09-25 |                语法分析 - 简单的 LR 方法 & 规范的 LR 方法                 |                                       [part6](https://rec.ustc.edu.cn/share/1a7a4df0-5b4c-11ee-8033-1da927361dcb), [part7](https://rec.ustc.edu.cn/share/322166f0-5b4c-11ee-b6aa-cb031e864251)                                        |
| 2023-09-27 |                               中间代码表示                                |                                                                              [part1](https://rec.ustc.edu.cn/share/3fba3780-64dc-11ee-b89d-3bff5ec34c27)                                                                              |
| 2023-10-07 |               语法制导翻译 - 语法制导定义 & S/L 属性的定义                |                                       [part1](https://rec.ustc.edu.cn/share/e0e4d8e0-5cdf-11ee-a097-75437996f503), [part2](https://rec.ustc.edu.cn/share/10e6d050-68c7-11ee-a697-13d9155d40a5)                                        |
| 2023-10-11 |          语法制导翻译 - 语法制导翻译方案 & L 属性定义的翻译方案           |                                       [part3](https://rec.ustc.edu.cn/share/60f07260-68c7-11ee-ac16-c97fd4666cee), [part4](https://rec.ustc.edu.cn/share/71c78a80-68c7-11ee-b670-b5952f4e628a)                                        |
| 2023-10-16 |                中间代码翻译 - 简单语句、控制流与布尔表达式                |                                       [part1](https://rec.ustc.edu.cn/share/aaa7e250-81e3-11ee-b601-cf1e5b684040), [part2](https://rec.ustc.edu.cn/share/b97993e0-81e3-11ee-b4bf-238eae90436f)                                        |
| 2023-10-18 |                    中间代码翻译 - 标号回填与布尔表达式                    |                                                                              [part3](https://rec.ustc.edu.cn/share/898d59b0-81e4-11ee-a431-a7ebbdb09b39)                                                                              |
| 2023-10-30 |                    中间代码翻译 - 标号回填与控制流语句                    |                                                                              [part4](https://rec.ustc.edu.cn/share/898d59b0-81e4-11ee-a431-a7ebbdb09b39)                                                                              |
| 2023-11-01 |               中间代码翻译 - 类型表达式 & 符号表与声明语句                |                                       [part5](https://rec.ustc.edu.cn/share/898d59b0-81e4-11ee-a431-a7ebbdb09b39), [part6](https://rec.ustc.edu.cn/share/898d59b0-81e4-11ee-a431-a7ebbdb09b39)                                        |
| 2023-11-06 |              中间代码翻译 - 数组寻址 & 运行时管理 - 存储组织              |                                       [part7](https://rec.ustc.edu.cn/share/898d59b0-81e4-11ee-a431-a7ebbdb09b39), [part1](https://rec.ustc.edu.cn/share/898d59b0-81e4-11ee-a431-a7ebbdb09b39)                                        |
| 2023-11-08 |           运行时管理 - 栈式分配 & 代码生成 - 概述与简单机器模型           |                                       [part2](https://rec.ustc.edu.cn/share/898d59b0-81e4-11ee-a431-a7ebbdb09b39), [part1](https://rec.ustc.edu.cn/share/898d59b0-81e4-11ee-a431-a7ebbdb09b39)                                        |
| 2023-11-13 |                     机器无关代码优化 - 常见的优化方式                     |                                                                              [part1](https://rec.ustc.edu.cn/share/898d59b0-81e4-11ee-a431-a7ebbdb09b39)                                                                              |
| 2023-11-15 | 机器无关代码优化 - 数据流与到达定值、可用表达式分析、数据流与活跃变量分析 | [part2](https://rec.ustc.edu.cn/share/ec735a10-8372-11ee-a33f-3f4ce56e99ac), [part3](https://rec.ustc.edu.cn/share/f7edf830-8372-11ee-a4ee-89e3b900b6a4), [part4](https://rec.ustc.edu.cn/share/49526e90-9043-11ee-b984-bfcfb1e71335) |
| 2023-11-20 | 机器无关代码优化 - 数据流与活跃变量分析、基本块内的优化 & 寄存器分配方法  | [part4](https://rec.ustc.edu.cn/share/49526e90-9043-11ee-b984-bfcfb1e71335), [part5](https://rec.ustc.edu.cn/share/6b7a21f0-9043-11ee-b553-ab6f413f1658), [part1](https://rec.ustc.edu.cn/share/05972ed0-9044-11ee-9278-b9679a1c57b3) |
| 2023-11-22 |                        静态类型检查 & 流图中的循环                        |                                       [part1](https://rec.ustc.edu.cn/share/60bbf180-9045-11ee-bc96-e388a9810d5b), [part1](https://rec.ustc.edu.cn/share/4ad00130-9045-11ee-a6b5-83f7236ec56e)                                        |
| 2023-11-27 |                      运行时刻环境 - 非局部变量的访问                      |                                                                              [part2](https://rec.ustc.edu.cn/share/bef41780-9045-11ee-8887-1ba1740d80fe)                                                                              |
| 2023-11-29 |                          面向目标机器的代码优化                           |                                                                              [part1](https://rec.ustc.edu.cn/share/d6169380-9045-11ee-8a37-87201671ab8d)                                                                              |
| 2023-12-04 |                               guest lecture                               |                                                                                                               无 slides                                                                                                               |
| 2023-12-06 |                               guest lecture                               |                                                                                                               无 slides                                                                                                               |
| 2023-12-13 |                                  复习课                                   |                                                                             [slides](https://rec.ustc.edu.cn/share/3a4ffcf0-995a-11ee-9fdc-a7ee4ffd604e)                                                                              | -->

## <strong>参考资料</strong>

### <strong>教材和参考书</strong>

- <div id='textbook'></div>[1] 陈意云、张昱，编译原理（第 3 版），高等教育出版社，2014
- <div id='textbook2'></div>[2] 李诚、徐伟，现代编译器设计与实现（实验讲义版本，高等教育出版社待出版，2023）。[教材资源及实验框架](https://ustc-compiler-principles.github.io/textbook/)
- A. V. Aho, M. S. Lam, R. Sethi, and J. D. Ullman 著，赵建华等译，编译原理，机械工业出版社，2017

### <strong>其他资料</strong>

- Stanford 课程主页：<http://web.stanford.edu/class/cs143/>
- MIT 课程主页：<http://6.035.scripts.mit.edu/fa18/>



## <strong>如何使用本文档？</strong>

### <strong>关于提示框</strong>

为了便于标识，我们在文档中提供了若干提示框。它们有着不同的形式与作用。例如：

!!! Note "一般的提示框长这样"

    里面是这样的文字。


??? Question "有的提示框默认是折叠的，需要点击才能展开"

    然后看到里面的内容。


???+ Success "有的提示框则是默认展开的"

    如果觉得碍事可以点击折叠。


!!! Example "大家可以在后续的文档中接触到它们。"

### <strong>关于搜索</strong>

你可以在右上角搜索框中输入想要查询的关键词，文档会给出对应的查询结果与跳转链接。

???+ Note "Tips"

    如果在阅读文档时发现有自己不清楚的知识点，可以先用搜索框查询其是否在先前的文档中出现过。

<!-- <hr class="hr-my" data-content="(●′∀｀●) 我是分隔线 (●′∀｀●)">


???+ Bug "评论系统"

    由于主页上的评论系统映射可能出现问题，以防万一，我们在这里进行一些补充。

    除了上面介绍的内容，本学期的实验文档我们还额外添加了评论系统。大家可以在各个界面下方找到类似的评论栏，登录自己的 GitHub 账号即可发表相应的评论。

    <strong>怎么使用？</strong>

    评论系统的输入采用 Markdown 格式。如果你之前没有用过 Markdown，可以简单地将其当做普通文本（txt）格式，直接输入文字并点击评论即可。如果你对 Markdown 语法有所了解，可以使用 **加粗**、 *斜体* 、句内的 `code block` 等特殊格式，以及相应的标题结构。

    除了留下自己的疑问，大家也可以解答其他同学的疑问。这是一个相互交流、相互合作的平台。我们鼓励合理范围内的讨论与思考~

    <strong>其他方式</strong>

    评论系统实际上是抓取了[这个仓库](https://github.com/USTC-Compiler-2024/Compiler-Comments)下讨论区的内容，所有的评论也会发布在这里。大家可以访问上面的仓库进行阅读。

    如果你没有或者无法登录 GitHub 账号也没关系。除了文档下方的评论系统，在课程群中大家也可以提出自己的问题，我们将统一进行解答。

    欢迎大家在评论系统里畅所欲言！ -->