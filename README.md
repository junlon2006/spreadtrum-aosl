# spreadtrum-aosl

将声网 [AOSL](https://github.com/AgoraIO-Community/aosl)（Advanced Operating System Layer）集成到展锐(Spreadtrum) RTOS 平台的示例工程。

AOSL 是 Agora 开源的跨平台 OS 抽象层，为嵌入式/RTOS 环境提供线程、同步、网络（UDP/TCP/DNS）、IO 多路复用、内存管理、消息队列(MPQ)等 C 语言 API。

## 已支持平台

| 平台 | RTOS | 工具链 | 状态 |
|------|------|--------|------|
| Spreadtrum W117 | ThreadX (SCI) | ARMCC v5 (RVCT) | ✅ 已完成 |
| Spreadtrum 8910FF | ThreadX (SCI) | ARMCC v5 (RVCT) | ✅ 已完成 |
| Spreadtrum T117 | ThreadX (SCI) | ARMCC v5 (RVCT) | ✅ 已完成 |
| Spreadtrum W217 | ThreadX (SCI) | ARMCC v5 (RVCT) | ✅ 已完成 |
| Spreadtrum W307 | ThreadX (SCI) | ARM6 Clang | ✅ 已完成 |
| Spreadtrum W337 | ThreadX (SCI) | ARM6 Clang | ✅ 已完成 |

## 集成方式

本仓库展示了将 AOSL 作为子组件嵌入 `MS_Code` SDK 构建系统的完整流程：

1. **源码布局** — AOSL 源码置于 `MS_MMI_Main/source/mmi_app/app/aosl/` 目录
2. **HAL 适配** — 在 `platform/src/spreadtrum-xxx/` 实现平台相关的硬件抽象层
3. **构建接入** — `make/aosl/aosl.mk` 通过 `MINCPATH`、`MSRCPATH`、`SOURCES` 等变量接入 SDK 构建系统

> **⚠️ 注意：此仓库为示例工程，仅展示 AOSL 在展锐 RTOS 平台的集成方式。当前示例对应 AOSL 官方仓库 commit [`2773f3c`](https://github.com/AgoraIO-Community/aosl/commit/2773f3c9a1d39a1958085533a15ac992b308a3b2)，AOSL 代码请以[官方最新版本](https://github.com/AgoraIO-Community/aosl)为准。**

### 使用说明

将目录下所有文件拷贝到自己的工程后，**唯一需要修改的地方**：

- `aosl_hal_socket.c` 中的 `get_spreadtrun_net_id()` 函数 — 函数返回真实可用的 `net_id` 值即可，在展锐基线代码与当前实现无兼容性问题时，可直接编译使用，如编译报错，即代码基线存在兼容性问题，根据编译报错逐一修改即可。

### 在新平台集成

参考现有 `spreadtrum-w117` 的实现，为新平台创建 HAL 适配层：

1. 创建 `platform/src/<new-target>/` 目录，实现 `platform/include/hal/` 中声明的 HAL 接口
2. 创建 `platform/src/<new-target>/config/hal/aosl_hal_config.h` 配置功能开关
3. 在 `aosl.mk` 中添加新平台的源文件路径

## 测试

测试套件位于 `test/` 目录，编译为独立二进制运行在目标硬件上。测试覆盖：原子操作、线程/互斥锁、条件变量、信号量、Socket（UDP/TCP/DNS）、IO 多路复用、消息队列、时间、UUID 等。

## 相关链接

- [AOSL 开源仓库](https://github.com/AgoraIO-Community/aosl)
- [Apache 2.0 许可证](LICENSE)
