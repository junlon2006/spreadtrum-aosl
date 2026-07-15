# spreadtrum-aosl

将声网 [AOSL](https://github.com/AgoraIO-Community/aosl)（Advanced Operating System Layer）集成到展锐(Spreadtrum) RTOS 平台的示例工程。

AOSL 是 Agora 开源的跨平台 OS 抽象层，为嵌入式/RTOS 环境提供线程、同步、网络（UDP/TCP/DNS）、IO 多路复用、内存管理、消息队列(MPQ)等 C 语言 API。

## 已支持平台

| 平台 | SoC | RTOS | 工具链 | 状态 |
|------|-----|------|--------|------|
| Spreadtrum W117 | SC2621 / SL8522E | ThreadX (SCI) | ARMCC v5 (RVCT) | ✅ 已完成 |

> 更多平台支持开发中。

## 集成方式

本仓库展示了将 AOSL 作为子组件嵌入 `MS_Code` SDK 构建系统的完整流程：

1. **源码布局** — AOSL 源码置于 `MS_MMI_Main/source/mmi_app/app/aosl/` 目录
2. **HAL 适配** — 在 `platform/src/spreadtrum-w117/` 实现平台相关的硬件抽象层
3. **构建接入** — `make/aosl/aosl.mk` 通过 `MINCPATH`、`MSRCPATH`、`SOURCES` 等变量接入 SDK 构建系统

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
