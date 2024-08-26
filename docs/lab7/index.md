---
comments: true 
---


# <strong>实验 7：高速缓存 Cache</strong>


## <strong>实验目的</strong>

在此前的实验中，同学们已经实现了一个简单的流水线 CPU。在流水线 CPU 中，我们读取指令和访问内存都是通过直接访问内存来实现的。然而，直接访问内存的效率并不高，因为内存的访问速度远远低于 CPU 的执行速度。为了提高 CPU 的性能，我们通常会在 CPU 和内存之间加入一个高速缓存 Cache。

在本次实验中，我们将学习高速缓存 Cache 的组织结构和工作机理。
<!-- <del> 并在流水线 CPU 中添加 Cache 支持。</del> -->

!!! Note "说明"
    有兴趣的同学可以自行尝试将 Cache 插入到流水线 CPU 中。<strong>由于其难度过高，在本次实验中我们不要求大家将 Cache 接入先前实验中设计的 CPU。</strong>

## <strong>实验内容</strong>

??? Note "提示"

    本次实验中，Cache 以及主存的容量你可以自行指定，但需要自己修改框架中对应位置的参数。我们建议你在充分理解框架代码后再修改！


!!! Question "任务 1：二路组相连 Cache（5 分）"

    根据给出的直接映射 Cache 的代码，实现二路组相连 Cache，支持 LRU 替换策略，通过助教提供的读写测试。

!!! Question "任务 2：多样化的替换策略（2 分）"

    让你的 Cache 支持伪随机替换策略，FIFO 替换策略等除了 LRU 之外至少两种替换策略，通过助教提供的读写测试。

    !!! Note "注意"

        - 本次任务可以自由选择实现的替换策略，需要在上机的时候向助教说明实现原理。
        - 请在实验报告中说明你的实现方式，以及在测试中的表现，分析不同替换策略的优劣。 否则只能得到 1 分。

!!! Question "任务 3：N 路组相连 Cache（3 分）"

    实现参数化的 N 路组相连 Cache，支持 LRU 替换策略，通过助教提供的读写测试。

    !!! Note "N 路组相连 Cache 的定义"

        本次实验中的 N way 中的 N 只需要支持 2, 4, 8, 16 即可，因此这项得分包含上面的二路组相连 Cache 。 
        
        ??? tip "思考：为什么？（请确保你思考后再展开此提示框）"
    
            这是因为 N 不取 2 的幂的情况下，替换策略的实现过于复杂且严重拖累电路效率，会丧失作为 Cache 的高性能特性。



## <strong>QA</strong>

!!! Note "访存指令只考虑整字读写"

    为了降低实验难度，我们只考虑整字读写，即访存指令的地址是整字的倍数，一律不需要考虑非字对齐读写的情况。

!!! Note "模拟主存中的延迟"

    我们的代码利用封装的 Bram 模拟主存 mem，Cache 命中时间为1 cycle，按理来讲模拟 mem 命中时间应设置为 50 cycle（因为真实情况下 cache 命中时间为1ns，mem 为50-100ns），但是为了方便仿真测试，减少仿真的时间，可以将 mem 的命中时间调整为5 cycle。 如需修改，可在 `mem.v` 中修改 cnt_max 的值，即可调整 mem 的延迟。



## <strong>实验检查与提交</strong>

本次实验布置时间为 2024-05-06，持续两周。相应的 DDL 节点如下：


|       组别    |     检查 DDL        |     报告提交 DDL      |
| :----------: | :-----------------: | :-------------------: |
|    周一组    |      2024-05-20      |     2024-05-27       |
|    周三组    |      2024-05-22      |     2024-05-29       |

检查与报告延迟一周以内（含）的，至多只能得到 80% 分数；延迟一周以上、两周以内（含）的，至多只能得到 60% 分数；延迟超过两周的不得分。

!!! Warning "提醒"

    实验的 DDL 为当天晚上 21:30。助教有权利在 21:30 准时停止检查，请大家合理安排好自己的时间。能否线上检查、能否在其他时间检查请咨询本组的助教。


!!! Success "关于实验报告"

    实验报告需要大家提交 PDF 格式。我们推荐大家使用 Markdown 或者 Latex 撰写实验报告，这样可以直接导出为 PDF。大家也可以使用 Word、WPS 等进行报告撰写，最后转换为 PDF 格式。我们不推荐也不拒绝大家手写实验报告，但请将其拍照扫描成 PDF 文件后再上传。我们不接受任何因为文件格式错误而导致成绩异常的申诉请求！

    在实验报告中，你需要给出每一项任务的答案，并附上必要的说明过程（或截图）。

    <strong>特别地：实验报告的字数和排版与最终得分无关。影响得分的仅有内容正确性与完整性。</strong>


实验报告提交的地址在[这里](https://soc.ustc.edu.cn/)。