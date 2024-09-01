# 在CMake构建的大型项目中如何Debug

??? Info "CMake"

    CMake 是一个开源的跨平台构建系统工具，用于管理项目的构建过程。它使用简单的文本文件（CMakeLists.txt）来定义项目的构建配置，并生成标准的构建文件（如 Makefile 或 Visual Studio 工程文件）

对于一个大型工程而言，Debug是相对困难的，我们为大家提供了两种可行的Debug方法

## logging 工具使用

### 介绍

为了方便同学们在之后的实验中 debug，为大家设计了一个 C++ 简单实用的分级日志工具。该工具将日志输出信息从低到高分成四种等级：`DEBUG`，`INFO`，`WARNING`，`ERROR`。通过设定环境变量 `LOGV` 的值，来选择输出哪些等级的日志。`LOGV` 的取值是 **0 到 3**，分别对应到上述的 4 种级别 (`0:DEBUG`,`1:INFO`,`2:WARNING`,`3:ERROR`)。此外输出中还会包含打印该日志的代码所在位置。

### 使用

项目编译好之后，可以在 `build` 目录下运行 test_logging 可执行文件，该文件的源代码在 `tests/test_logging.cpp`，用法如下：

```cpp
#include "logging.hpp"
// 引入头文件
int main(){
    LOG(DEBUG) << "This is DEBUG log item.";
    // 使用关键字 LOG，括号中填入要输出的日志等级
    // 紧接着就是<<以及日志的具体信息，就跟使用 std::cout 一样
    LOG(INFO) << "This is INFO log item";
    LOG(WARNING) << "This is WARNING log item";
    LOG(ERROR) << "This is ERROR log item";
    return 0;
}
```

接着在运行该程序的时候，设定环境变量 `LOGV=0`，那么程序就会输出级别 **大于等于 0** 日志信息：

```bash
user@user:${ProjectDir}/build$ LOGV=0 ./test_logging
[DEBUG] (test_logging.cpp:5L  main)This is DEBUG log item.
[INFO] (test_logging.cpp:6L  main)This is INFO log item
[WARNING] (test_logging.cpp:7L  main)This is WARNING log item
[ERROR] (test_logging.cpp:8L  main)This is ERROR log item
```

输出中除了包含日志级别和用户想打印的信息，在圆括号中还包含了打印该信息代码的具体位置（包括文件名称、所在行、所在函数名称），可以很方便地定位到出问题的地方。

假如我们觉得程序已经没有问题了，不想看那么多的 DEBUG 信息，那么我们就可以设定环境变量 `LOGV=1`，选择只看 **级别大于等于 1** 的日志信息：

```bash
user@user:${ProjectDir}/build$ LOGV=0 ./test_logging
[INFO] (test_logging.cpp:6L  main)This is INFO log item
[WARNING] (test_logging.cpp:7L  main)This is WARNING log item
[ERROR] (test_logging.cpp:8L  main)This is ERROR log item
```

当然 `LOGV` 值越大，日志的信息将更加简略。如果没有设定 `LOGV` 的环境变量，将默认不输出任何信息。

这里再附带一个小技巧，如果日志内容多，在终端观看体验较差，可以输入以下命令将日志输出到文件中：

```
user@user:${ProjectDir}/build$ LOGV=0 ./test_logging > log
```

然后就可以输出到文件名为 log 的文件中啦～


## 图形化的LLDB调试工具

???+ Info "依赖"

    这种调试方法实际上是使用了lldb调试工具以及VSCode `CodeLLDB`扩展

    使用以下命令安装lldb:
    (apt)

    ```shell
        sudo apt install lldb
    ```

    (brew)

    ```shell
        brew install lldb
    ```

    在VSCode安装扩展
    - CodeLLDB
        ![CodeLLDB](photos/codelldb.png)
    - CMake & CMake Tools
        ![CMakeExt](CMake.png)

LLDB是LLVM项目开发的调试器，通过设置VSCode扩展可以方便地调试大型项目。下面将以一个小型工程为例：

### 克隆需要的测试工程并构建项目

```shell
    git clone https://cscourse.ustc.edu.cn/vdir/Gitlab/compiler_staff/2024ustc-jianmu-compiler.git
    cd stl_debug
    mkdir build
    cd build
    cmake ..
    make
```

经过这一步后，在`${workspaceFolder}/build/src/`下可以找到生成的可执行文件`lab0_debug`

运行lab0_debug，你会得到类似下面的输出

```shell
jyjs@JHost stl_debug % ./build/src/lab0_debug 
Hello, from stl_debug!
MyMyI'mStudent object created
Student destructor called
Human destructor called
Human destructor called
```

