# 一加 Ace 6 至尊版（OnePlus Ace 6 Ultra）AOSP 类原生设备树

[![Android 17](https://img.shields.io/badge/Android-17%20(API%2036)-green.svg)](https://android.googlesource.com/)
[![Linux 6.12 GKI](https://img.shields.io/badge/Kernel-6.12%20GKI%20(4K)-blue.svg)](https://github.com/OnePlusOSS)
[![Platform MT6993](https://img.shields.io/badge/SoC-MediaTek%20MT6993-orange.svg)](https://www.mediatek.com/)
[![Refresh Rate](https://img.shields.io/badge/Display-165Hz%20Ultra--Fluid-red.svg)](#)
[![CoolApk](https://img.shields.io/badge/Community-%E9%85%B7%E5%AE%89%20CoolApk-brightgreen.svg)](https://www.coolapk.com/)

本项目是一加 Ace 6 至尊版（设备型号：OnePlus PMB110 / 内部项目号：25815 / 硬件代号：roadster）的标准 AOSP 类原生底层设备树仓库。

旨在为这台联发科天玑 9500 性能旗舰打造一套纯净、流畅、深度集成 Google 特权服务生态，并兼顾 165Hz 极致高刷体验的类原生 Android 系统基座。

---

## 📱 核心硬件规格与底层映射

| 规格维度 | 详细参数与底层映射 |
| :--- | :--- |
| **机型名称** | 一加 Ace 6 至尊版 (OnePlus Ace 6 Ultra) |
| **设备型号** | OnePlus PMB110（外部软硬件代号：OP64D7L1） |
| **内部工程代号** | 25815（DTS 与外设驱动绝对匹配代号） |
| **硬件代号 (Codename)** | roadster |
| **主控芯片 (SoC)** | 联发科天玑 9500（MediaTek MT6993, 全大核 ARMv9.2-A 架构） |
| **主板属性 (Board)** | k6993v1_64 |
| **屏幕规格** | 1.5K 顶级电竞直屏 / **原生支持 165Hz 超高刷新率**（动态自适应调频） |
| **内核基线** | Linux 6.12 通用内核镜像 (GKI, 严格基于 4KB Page Size 构建) |
| **目标系统版本** | Android 17 (API Level 36) |
| **存储分区架构** | Android 动态分区（super 物理卷挂载 system, system_ext, product, vendor, odm） |
| **电池与快充** | SuperVOOC 超级闪充协议芯片 / 专有电源管理总线 |
| **近场通信 (NFC)** | 独立安全芯片 THN31 |

---

## 🔍 技术溯源与开发参考来源

本设备树工程绝非空中楼阁，所有底层架构、引脚定义与系统接口均严格参照以下官方与真机物料逆向提炼而成：

1. **一加官方开源内核平台 (OnePlus OSS)**：
   * 参照仓库：OnePlusOSS/android_kernel_modules_and_devicetree_oneplus_mt6993
   * 核心分支：oneplus/mt6993_b_16.0_ace_6_ultra
   * 提炼成果：精准定位天玑 9500 主控 DTS（oplus6993_25815.dts）、屏幕超高刷覆层（mt6993-roadster-25815-display-overlay.dtsi）、触控节点（oplus_tp_25815.dtsi）以及官方 Kleaf (Bazel) 编译管线。
2. **Google 官方开源规范 (AOSP & GKI)**：
   * 严格遵循 Google GKI 2.0 规范，对齐 Linux 6.12 的 4KB 内存分页架构。
   * 采用标准 Android 17 启动头规范（Header Version 4）与 AIDL 硬件服务规范。
3. **原厂真机环境物理采样 (Physical Device Inspection)**：
   * 硬件接口规范直接采样自 OnePlus PMB110 原厂系统 /vendor/etc/vintf/manifest.xml。
   * 动态分区挂载参数与文件系统类型（EROFS）完全基于真机底层映射实测封包。

---

## 📂 源码工程结构索引

    device/oneplus/roadster/
    ├── AndroidProducts.mk        # AOSP 编译目标注册 (aosp_roadster-userdebug / aosp_roadster-user)
    ├── BoardConfig.mk            # 底层架构配置 (ARMv9, 4K Page Size, Header V4, MT6993 动态分区)
    ├── device.mk                 # 核心 HAL 包调度、动态分区配置与系统功能继承
    ├── gms.mk                    # 特权级 Google Play 服务、Pixel Launcher 与核心套件深度集成
    ├── roadster.mk               # 产品型号、一加品牌元数据与电话通信基础类继承
    ├── system.prop               # 底层显示配置 (165Hz 渲染、广色域)、MTK RIL 基带参数基线
    ├── vendor_manifest.xml       # 提取自原厂系统的 VINTF 硬件抽象接口声明清单 (AIDL 规范)
    ├── proprietary-files.txt     # 必需提取的原厂闭源动态库与固件清单 (GPU, 音频, 基带, 指纹)
    ├── extract-files.sh          # 原厂固件闭源驱动自动抽取与整理控制脚本
    ├── hardware_test_plan.md     # 四级硬件验收准则与安全防御测试规范 (含 165Hz 高刷验收)
    └── README.md                 # 项目技术白皮书与开源共建说明

---

## ⚙️ 内核与底层模块构建指南

本项目完全兼容一加官方开源的现代 Kleaf (Bazel) GKI 通用构建体系。

在云端编译服务器的内核工作空间（kernel_platform/）根目录下，执行以下官方标准指令：

    ./kernel_platform/oplus/build/oplus_build.sh mt6993 userdebug thin all true 2>&1 | tee build.log

---

## 🤝 致敬酷安社区与开源共建邀请

致敬国内最富极客精神的玩机阵地——酷安（CoolApk）社区！

联发科（MediaTek）旗舰平台的类原生 ROM 移植历来是 Android 玩机圈最具挑战性的领域。由于厂商闭源 HAL 较多，单靠个人力量难免有局限。

诚挚邀请各位酷安大佬、ROM 开发者、内核调校大神以及类原生爱好者共同参与本项目！

特别欢迎以下方向的 PR 提交与技术交流：
* 基带通信：天玑 9500 平台的联发科专有 IMS / VoLTE / VoWiFi 稳定性补丁与双卡优化；
* 影像调优：突破原厂哈苏/超光影 ISP 闭源限制的 Camera HAL 垫片（Shim）或优质 GCam 配置文件；
* 生物识别：欧加专有屏下超薄/光学指纹与 AOSP AIDL Biometrics 的通信桥接；
* 性能与温控：针对 165Hz 电竞场景的调度调优、CPU 调速器优化与触控采样响应提速。

欢迎提交 Issue 交流，或直接 Fork 本仓库发起 Pull Request！让我们一起把这台天玑性能猛兽打磨成最完美的类原生神器！

---

## 🛡️ 金融交易与日常主力机安全声明

1. 技术研究定位：本项目目前处于开源架构构建与工程移植研发阶段。
2. Bootloader 解锁风险：刷入自制 ROM 的物理前提是解锁 Bootloader。解锁将导致 Android Verified Boot (AVB) 信任链破损（绿态变橙态），硬件级安全芯片（TEE / KeyMint）自动降级，直接导致手机银行触发风险报警、拒绝生物识别甚至拒绝登录。
3. 日常主力机建议：对于存放重要资产和从事金融交易的日常主力机，强烈建议继续保持官方原厂系统运行。

---

## 👤 维护者

* 开发者：[@klme2026](https://github.com/klme2026)
* 开源主页：https://github.com/klme2026/device_oneplus_roadster
