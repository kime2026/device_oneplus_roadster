# OnePlus Ace 6 Ultra (roadster / 25815) ROM 硬件与安全验收规范

## 一、第一级：启动与核心硬件红线 (必须 100% 通过)
1. **Display & Touch**: 屏幕正常点亮，触控无漂移，支持 120Hz 刷新率动态切换。
2. **Cellular & Data**: 联发科 MT6993 RIL 正常加载，双卡识别，VoLTE 通话正常，5G 数据通畅。
3. **Power & Thermal**: 欧加专有快充握手成功（SuperVOOC 协议），电池温度与电流传感器上报正常，无异常发热。

## 二、第二级：外设功能验收 (必须 80% 以上可用)
1. **Wi-Fi & Bluetooth**: Wi-Fi 6/7 握手正常，蓝牙音频（LDAC/LHDC/AAC）无卡顿断连。
2. **NFC**: 芯片 THN31 驱动正常，门禁卡与公交卡模拟可用。
3. **Audio**: 双扬声器立体声正常，无爆音破音，双麦克风通话降噪生效。
4. **Biometrics (指纹)**: 屏下光学/超薄指纹能够录入并解锁。

## 三、第三级：专有算法与影像体验
1. **Camera**: AOSP 公版 CameraX 接口正常，后置主摄/超广角预览正常（原厂哈苏影调在类原生下大概率降级）。

## 四、第四级：最高安全红线 (金融与日常关键)
1. **SELinux**: 必须处于 Enforcing（强制模式），拒绝 Permissive（宽容模式）。
2. **Encryption**: 必须支持 FBE（基于文件的硬件全盘加密），拒绝明文存储。
3. **KeyMint / TEE**: 检查硬件私钥隔离状态。
   * 警示：第三方 ROM 必须解开 Bootloader，导致 Play Integrity 的 STRONG/DEVICE 降级，交易所与银行 App 需在原厂系统下运行。
