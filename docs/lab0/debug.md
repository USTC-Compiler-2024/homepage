# 在CMake构建的大型项目中如何Debug

??? Info "CMake"

    CMake 是一个开源的跨平台构建系统工具，用于管理项目的构建过程。它使用简单的文本文件（CMakeLists.txt）来定义项目的构建配置，并生成标准的构建文件（如 Makefile 或 Visual Studio 工程文件）

对于一个大型工程而言，Debug是相对困难的，我们为大家提供了两种可行的Debug方法，**<font color = red>这两种调试方法并不是互斥的，我们强烈建议组合使用</font>**

## Clangd语言服务器

大家在以往写 C/C++ 工程时，肯定都使用过 Microsoft C/C++ ，但该扩展在较大的的项目中表现并不优秀。我们强烈建议大家使用 Clangd 并在 VSCode 中安装 Clangd 扩展。

在终端输入以下命令安装Clangd：
```shell
sudo apt install clangd
```
安装完成后在VSCode中搜索Clangd并安装
![Clangd](photos/Clangd.png)
    
由于 Clangd 和 Microsoft C/C++ 扩展冲突，我们建议大家在使用 Clangd 时禁用 Microsoft C/C++ 扩展。

如果正确安装了 Clangd，那么可以通过以下方式进行跳转：

- **跳转到定义**：在光标停留在某个函数或变量上时，按下`F12`键即可跳转到定义。
- **跳转到实现**：在光标停留在某个函数或变量上时，按下`Ctrl`+`F12`即可转到实现。
- **跳转到引用**：在光标停留在某个函数或变量上时，按下`Shift`+`F12`键即可转到引用。

同时，Clangd还提供了强大的代码补全功能和错误提示功能，可以帮助同学们更好地编写代码。大家可以在之后的实验中一一体验。


## 如何在CMake构建的大型项目中定位 Segmentation Fault 原因

??? Info "什么是 **ASAN** "

    ASAN（Address Sanitizer）是针对 C/C++ 的快速内存错误检测工具，在运行时检测 C/C++ 代码中的多种内存错误。

    ASAN 早先是 LLVM 中的特性，后被集成到 GCC 4.8 中，在 4.9 版本中加入了对 ARM 平台的支持。

构建 CMake 项目时，添加 ASAN 功能，即使用`cmake .. -DCMAKE_BUILD_TYPE=ASAN`替换`cmake ..`

需要注意的是，当你想关闭这个功能时需要清空 build 文件夹重新构建项目。

## 图形化的LLDB调试工具

???+ Info "依赖"

    这种调试方法实际上是使用了lldb调试工具以及VSCode `CodeLLDB`扩展。

    使用以下命令安装lldb:

    (apt)

    ```shell
        sudo apt install lldb
    ```

    (brew)

    ```shell
        brew install lldb
    ```

    在VSCode安装扩展：
    - CodeLLDB
        ![CodeLLDB](photos/codelldb.png)
    - CMake & CMake Tools
        ![CMakeExt](photos/CMake.png)

    **安装CMake扩展后会弹出窗口提示选择工具包(ToolKit)，请选择最高版本的clang**。

LLDB是LLVM项目开发的调试器，通过设置VSCode扩展可以方便地调试大型项目。下面将以一个小型工程为例：

### 克隆需要的测试工程并构建项目

```shell
git clone https://cscourse.ustc.edu.cn/vdir/Gitlab/compiler_staff/2024ustc-jianmu-compiler.git
cd 2024ustc-jianmu-compiler
git checkout lab0
mkdir build
cd build
cmake ..
make
```

或者你可以直接点击下边栏的生成：

![make](./photos/make.png)

经过这一步后，在`${workspaceFolder}/build/src/`下可以找到生成的可执行文件`lab0_debug`

运行lab0_debug，你会得到类似下面的输出：

```shell

jyjs@JHost stl_debug % ./build/src/lab0_debug -t
Hello, from stl_debug!
MyMyI'mStudent object created
Student destructor called
Human destructor called
Human destructor called
```

而阅读这个项目的源码我们可以得知，期望的输出是：

```shell

jyjs@JHost stl_debug % ./build/src/lab0_debug -t
Hello, from stl_debug!
My name is John Doe and I am 25 years old
My name is Jane Doe and I am 20 years old
I'm from MIT
Student object created
Student destructor called
Human destructor called
Human destructor called
```

我们将在下面一小节来带大家de出这个bug！

### json 文件设置及 debug 示例

`.vscode/launch.json`文件记录了调试器需要的基本信息，它是由vscode自动生成的。

??? Info "如何自动生成一个.json文件"

    点击`运行/启动调试(F5)`：

    ![F5](photos/F5.png)
    
    上方提示栏弹出，选择LLDB：

    ![LLDB](photos/LLDB.png)

    这时由于vscode的CODELLDB扩展不知道如何调试，会报错并为我们创建`.vscode/launch.json`文件。

    ![json](photos/error.png)

    ```json
    {
        // 使用 IntelliSense 了解相关属性。 
        // 悬停以查看现有属性的描述。
        // 欲了解更多信息，请访问: https://go.microsoft.com/fwlink/?linkid=830387
        "version": "0.2.0",
        "configurations": [
            {
                "type": "lldb",
                "request": "launch",
                "name": "Debug",
                "program": "${workspaceFolder}/<executable file>",
                "args": [],
                "cwd": "${workspaceFolder}"
            }
        ]
    }
    ```
    下文的json文件就是这么得到的，只不过助教做了一些注释。

```json
{
    // 使用 IntelliSense 了解相关属性。 
    // 悬停以查看现有属性的描述。
    // 欲了解更多信息，请访问: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "type": "lldb",
            "request": "launch",
            "name": "Debug",
            "program": "${workspaceFolder}/<executable file>",  //TODO: Add executable file here
            "args": [
                "<arguments>" // TODO: Add arguments here
            ],
            "cwd": "${workspaceFolder}"
        }
    ]
}
```

- version 域指定了调试器的版本信息
- configurations 域指定了配置信息，其中包括：
    -  type：任务类型 这是一个lldb任务
    -  request：需要执行的任务 launch即只有它本身
    -  name：将这个任务命名为Debug
    -  program：被调试的程序 注： *<font color=grey>${workspaceFolder} 是一个环境变量，即工程文件所在文件夹</font>*
    -  args：设置需要的参数
    -  cwd：指令执行的目录

主要修改 program & args 域即可。

---

读工程中的CMakeLists.txt文件即可得知，生成的可执行文件目录为`${workspaceFolder}/build/src/`，可执行文件名为`lab0_debug`

而main.cpp:17-20L 要求输入-t参数，因此可以做如下修改：

```json

...
    "program": "${workspaceFolder}/build/src/lab0_debug",
    "args": [
        "-t",
    ],
...

```

之后在main入口处打断点再执行即可开始调试了。

![debug](photos/debug.png)

在`h->print()`处 step in 之后，不难发现是print方法的返回值逻辑处理有误。

![bug](photos/bug.png)

将Student.cpp:16L & Human.cpp:13L 用`res = ss.str();`代替后，重新make(构建)项目并运行。

```shell
cd build; make; cd ..
./build/src/lab0_debug -t
```

输出如下：

```shell
jyjs@JHost stl_debug % cd build; make; cd ..
[ 20%] Building CXX object src/CMakeFiles/lab0_debug.dir/main.cpp.o
[ 40%] Building CXX object src/CMakeFiles/lab0_debug.dir/Human.cpp.o
[ 60%] Building CXX object src/CMakeFiles/lab0_debug.dir/Student.cpp.o
[ 80%] Building CXX object src/CMakeFiles/lab0_debug.dir/logging.cpp.o
[100%] Linking CXX executable lab0_debug
[100%] Built target lab0_debug
jyjs@JHost stl_debug % ./build/src/lab0_debug -t
Hello, from stl_debug!
My name is John Doe and I am 25 years old
My name is Jane Doe and I am 20 years old
I'm from MIT
Student object created
Student destructor called
Human destructor called
Human destructor called
```

## logging 工具使用

### 介绍

为了方便同学们在之后的实验中 debug，为大家设计了一个 C++ 简单实用的分级日志工具。该工具将日志输出信息从低到高分成四种等级：`DEBUG`，`INFO`，`WARNING`，`ERROR`。通过设定环境变量 `LOGV` 的值，来选择输出哪些等级的日志。`LOGV` 的取值是 **0 到 3**，分别对应到上述的 4 种级别 (`0:DEBUG`,`1:INFO`,`2:WARNING`,`3:ERROR`)。此外输出中还会包含打印该日志的代码所在位置。

### 使用

项目编译好之后，可以在 `build/src` 目录下运行 test_logging 可执行文件，该文件的源代码在 `src/test_logging.cpp`，用法如下：

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
user@user:${ProjectDir}/build/src$ LOGV=0 ./test_logging
[DEBUG] (test_logging.cpp:5L  main)This is DEBUG log item.
[INFO] (test_logging.cpp:6L  main)This is INFO log item
[WARNING] (test_logging.cpp:7L  main)This is WARNING log item
[ERROR] (test_logging.cpp:8L  main)This is ERROR log item
```

输出中除了包含日志级别和用户想打印的信息，在圆括号中还包含了打印该信息代码的具体位置（包括文件名称、所在行、所在函数名称），可以很方便地定位到出问题的地方。

假如我们觉得程序已经没有问题了，不想看那么多的 DEBUG 信息，那么我们就可以设定环境变量 `LOGV=1`，选择只看 **级别大于等于 1** 的日志信息：

```bash
user@user:${ProjectDir}/build/src$ LOGV=0 ./test_logging
[INFO] (test_logging.cpp:6L  main)This is INFO log item
[WARNING] (test_logging.cpp:7L  main)This is WARNING log item
[ERROR] (test_logging.cpp:8L  main)This is ERROR log item
```

当然 `LOGV` 值越大，日志的信息将更加简略。如果没有设定 `LOGV` 的环境变量，将默认不输出任何信息。

这里再附带一个小技巧，如果日志内容多，在终端观看体验较差，可以输入以下命令将日志输出到文件中：

```
user@user:${ProjectDir}/build/src$ LOGV=0 ./test_logging > log
```

然后就可以输出到文件名为 log 的文件中啦～


## 实验任务
通过调试这个工程文件，回答下面三个问题：

1. 为什么用 main.cpp:31L 替换 main.cpp:32L 会出现报错？
2. 为什么用 main.cpp:33L 替换 main.cpp:34L 会出现报错？
3. 为什么取消注释 main.cpp:38-42L 不会报错，但运行会出现段错误？



