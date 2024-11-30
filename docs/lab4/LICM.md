## Loop Detection

要进行循环相关的优化，我们首先要进行对循环的识别。循环检测基于支配树分析。我们根据支配树后序遍历所有基本块，这确保了先处理内层循环再处理外层循环。对每个基本块，检查其所有前驱，如果存在前驱被当前块支配，则找到了一个回边，这个回边的目标节点（当前块）就是循环头。

找到循环头后，我们需要查找对应的循环和子循环，对应了`LICM.cpp`中的`discover_loop_and_sub_loops`函数。创建Loop对象并使用工作表法（worklist algorithm）从回边的源节点（latch）开始向上遍历CFG，将遇到的未分配节点加入当前循环。如果遇到已属于其他循环的节点，说明发现了循环嵌套，此时需要建立正确的父子关系。整个过程通过bb_to_loop_映射维护节点归属关系，通过Loop对象的parent和sub_loops字段维护循环的层次结构。更多的内容详见代码。

![discover](./figs/discover.gif){width="400"}

## 循环不变代码外提

循环不变代码外提（**L**oop **I**nvariant **C**ode **M**otion，**LICM**）是编译器优化中的一种重要技术，它通过识别和移动循环中的不变操作来提高程序性能。当一个计算操作的结果在整个循环执行过程中保持不变时，我们就可以将这个操作移到循环之外执行，这样就能避免在每次循环迭代中重复执行相同的计算。

假设有如下代码
```cpp
for (int i = 0; i < n; i++) {
    x = y + z;
    a[i] = 6 * i + x * x;
}
```
在这段代码中，`x = y + z`和`x * x`是循环不变的，因为它们的值在整个循环执行过程中保持不变。因此，我们可以将这个操作移到循环之外执行，减少循环内的计算量。
```cpp
x = y + z;
tmp = x * x;
for (int i = 0; i < n; i++) {
    a[i] = 6 * i + tmp;
}
```
但是，聪明的你可能很快就能发现，这段代码是存在问题的。因为循环体在`n<=0`的情况下并不会被执行，但这个时候变量`x`的值却被修改了。一个好的方法是加入一个保护(guard)。

```cpp
if (n > 0) { // loop guard
    x = y + z;
    tmp = x * x;
    for (int i = 0; i < n; i++) {
        a[i] = 6 * i + tmp;
    }
}
```
以上的代码已经可以保证正确性，但是还可以被稍微地改进一下。注意到我们实际上在循环开始前做了两次比较操作，一次是在我们的guard中，一次是在循环第一次执行的判断条件中。为了避免这种情况，我们可以无条件进行一次循环迭代，然后再进行判断。实际上就是把循环改成一个do-while循环。

```cpp
if (n > 0) { // loop guard
    x = y + z;
    tmp = x * x;
    i = 0;
    do {
        a[i] = 6 * i + tmp;
        i++;
    } while (i < n);
}
```
这一过程被称之为[Loop Rotate](https://llvm.org/docs/Passes.html#passes-loop-rotate)。但我们在本次实验中不要求实现，你可以假设**所有的代码都会进入循环**。

## 代码撰写

1. 补全 `src/passes/LoopDetection.cpp` 文件，使编译器能够进行循环查找。
2. 补全 `src/passes/LICM.cpp` 文件，使编译器能够正确执行循环不变量外提。

## 本地测试

### 测试脚本

`tests/4-opt` 目录的结构如下：

```
.
├── cleanup.sh
├── eval_lab4.py
├── eval_lab4.sh            # 功能测试脚本
├── test_perf_licm.sh       # 性能测试脚本 (licm)
├── test_perf_mem2reg.sh    # 性能测试脚本 (mem2reg)
└── testcases
    ├── functional-cases    # 功能测试用例
    └── loop                # 性能测试用例
```

其中本地测评脚本 `eval_lab4.sh` 与 Lab3 一致，使用方法可以回顾 [Lab3 测试](../lab3/guidance.md#测试)，要求通过的测例目录：

- `tests/testcases_general`
- `tests/4-opt/testcases/functional-cases`

此外，为了让你能够体会 LICM 的效果，我们还提供了 3 个性能测试样例，在 `testcases/loop` 中。你可以使用脚本 `test_perf_licm.sh` 来进行性能比较，使用示例如下所示。

??? info "`test_perf_licm.sh` 使用示例"

    ```shell
    $ ./testcases/licm.sh
    [info] Start testing, using testcase dir: ./testcases/loop
    ==========./testcases/loop/loop-1.cminus==========
    ...

    ```

## 编译与运行

按照如下示例进行项目编译：

```shell
$ cd 2024ustc-jianmu-compiler
$ mkdir build
$ cd build
# 使用 cmake 生成 makefile 等文件
$ cmake ..
# 使用 make 进行编译，指定 install 以正确测试
$ sudo make install
```

现在你可以 `-licm` 使用来指定开启 LICM 优化：

- 将 `test.cminus` 编译到 IR：`cminusfc -emit-llvm -mem2reg -licm test.cminus`
- 将 `test.cminus` 编译到汇编：`cminusfc -S -mem2reg -licm test.cminus`
