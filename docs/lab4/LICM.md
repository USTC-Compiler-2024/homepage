# LICM

循环不变代码移动（**L**oop **I**nvariant **C**ode **M**otion，**LICM**）是编译器优化中的一种重要技术，它通过识别和移动循环中的不变操作来提高程序性能。当一个计算操作的结果在整个循环执行过程中保持不变时，我们就可以将这个操作移到循环之外执行，这样就能避免在每次循环迭代中重复执行相同的计算。

## Loop Detection

循环检测基于支配树分析，首先通过支配树后序遍历基本块，这确保了先处理内层循环再处理外层循环。对每个基本块，检查其所有前驱，如果存在前驱被当前块支配，则找到了一个回边，这个回边的目标节点（当前块）就是循环头。找到循环头后，创建Loop对象并使用工作表法从回边的源节点（循环尾）开始向上遍历CFG，将遇到的未分配节点加入当前循环。如果遇到已属于其他循环的节点，说明发现了循环嵌套，此时需要建立正确的父子关系。整个过程通过bb_to_loop_映射维护节点归属关系，通过Loop对象的parent和sub_loops字段维护循环的层次结构。


## 代码撰写

1. 补全 `src/passes/LoopDetection.cpp` 文件，使编译器能够进行正确的支配树分析
2. 补全 `src/passes/LICM.cpp` 文件，使编译器能够正确执行 Mem2Reg

## 本地测试

### 测试脚本

`tests/4-mem2reg` 目录的结构如下：

```
.
├── functional-cases	# 功能测试样例
├── loop-inv-hoist	# 性能测试样例
├── cleanup.sh
├── eval_lab4.sh		# lab4 评测脚本
└── test_perf.sh		# 性能比较脚本
```

其中本地测评脚本 `eval_lab4.sh` 与 Lab3 一致，使用方法可以回顾 [Lab3 测试](../lab3/guidance.md#测试)，要求通过的测例目录：

- `tests/testcases_general`
- `tests/4-LICM/functional-cases`