# Unified AOSP Device Tree for OnePlus Ace 6 Ultra (roadster)
# 一加 Ace 6 至尊版 AOSP 类原生设备树源码工程

---

## 1. Device Specifications / 硬件设备规格

| Specification / 规格项 | Details / 详细参数 |
| :--- | :--- |
| **Marketing Name / 市场命名** | OnePlus Ace 6 Ultra / 一加 Ace 6 至尊版 |
| **Model / 设备型号** | OnePlus PMB110 (OP64D7L1) |
| **Internal Project ID / 内部工程代号** | 25815 |
| **Device Codename / 机型代号** | roadster |
| **SoC / 芯片平台** | MediaTek MT6993 (Dimensity 9500 天玑 9500, ARMv9) |
| **Board / 主板代号** | k6993v1_64 |
| **Kernel Baseline / 内核基线** | Linux 6.12 GKI (4KB Page Size / 4K 内存分页) |
| **Target Android / 目标安卓版本** | Android 17 (API Level 36) |
| **Partition Scheme / 存储分区架构** | Dynamic Partitions (super: system, system_ext, product, vendor, odm) |

---

## 2. Project Layout / 工程目录规范

device/oneplus/roadster/
  AndroidProducts.mk        - Build target registration / 编译目标注册 (aosp_roadster-userdebug)
  BoardConfig.mk            - Architecture & platform definitions / 核心架构与芯片定义
  device.mk                 - Core HAL & feature orchestration / 核心硬件抽象层与特性调度
  gms.mk                    - Privileged Google Services / 特权 Google Play 全家桶生态集成
  roadster.mk               - Product inheritance & model metadata / 产品型号继承与元数据
  system.prop               - Performance & RIL property overrides / 刷新率与基带底层属性
  vendor_manifest.xml       - VINTF hardware interface specifications / 原厂硬件接口规范清单
  proprietary-files.txt     - Proprietary HALs/blobs list / 原厂闭源驱动提取清单
  extract-files.sh          - Extraction control blueprint / 驱动自动提取控制脚本
  hardware_test_plan.md     - Multi-tier acceptance matrix / 分级硬件与安全验收规范
  README.md                 - Bilingual project documentation / 中英双语项目说明文档

---

## 3. Kernel & Modules Build Instruction / 官方内核构建指令

This device adopts OnePlus's modern Kleaf (Bazel) GKI infrastructure.
该设备采用一加官方最新的 Kleaf (Bazel) 通用内核构建体系。

To compile the standalone kernel, dtbo, and device modules:
在云端服务器的内核工作区 (kernel_platform/) 下执行以下标准命令：

./kernel_platform/oplus/build/oplus_build.sh mt6993 userdebug thin all true 2>&1 | tee build.log

---

## 4. Security & Financial Integrity Notice / 安全与金融交易特别声明

[English]
1. Architectural Bringup: This repository is intended for development, study, and bringup research.
2. Bootloader Warning: Flashing third-party builds requires unlocking the Bootloader, which breaks the Android Verified Boot (AVB) chain (green to orange), downgrades TEE KeyMint hardware attestation, and will compromise banking and cryptocurrency trading applications.
3. Daily Driver Recommendation: Keep stock ColorOS on your daily primary device for mission-critical financial transactions.

[简体中文]
1. 架构研究：本项目用于底层设备树架构研究与开源技术探索。
2. 启动链与金融安全警示：刷入第三方自制系统必须解锁 Bootloader。解锁会导致可信启动链破损（绿态变橙态），使硬件安全芯片（TEE / KeyMint）降级，直接导致手机银行、冷钱包与加密货币交易所应用报警或无法运行。
3. 主力机安全建议：在涉及重要资金管理与日常生产力用途的主力机上，建议保持官方原厂系统运行。

---
**Maintained by / 维护者:** klme2026
