# OpenWrt-NetCheck

OpenWrt-NetCheck是一个专为OpenWrt路由器设计的插件，用于诊断网络或系统故障，并尝试修复或提供修复建议。

## 特点
- 网络诊断：识别并报告网络或系统故障。
- 修复建议：提供针对已识别问题的修复建议。
- 简约直观的交互：直观的界面，方便用户快速进行故障排除。

## 安装
1. 克隆 luci-app-NetCheck 仓库到本地计算机编译到固件中
```sh      
git clone https://github.com/lucikap/OpenWrt-netcheck.git package            

#在make menuconfig菜单中选中luci-app-NetCheck
LuCI  --->
    Applications  --->
        <*> luci-app-netcheck        

#开始编译
make -j1 V=sc

#单独编译此插件
make package/luci-app-netcheck/compile V=s                                 
```
2. 直接安装IPK安装包，可以适用于任何架构/机型，因为这是用脚本编写的插件。

## 使用
1. 在路由器上访问网络诊断界面。
2. 运行诊断工具以识别网络或系统故障。
3. 根据修复建议解决检测到的问题。
4. 如果遇到难以解决的问题可以将日志导出，提出lssues，并描述你的问题细节

## 贡献
欢迎贡献！如果您想为OpenWrt-NetCheck做出贡献，请遵循CONTRIBUTING.md中概述的指南。

## 许可证
OpenWrt-NetCheck使用MIT许可证授权。有关更多信息，请参阅[LICENSE](LICENSE)文件。

## 联系方式
如有任何问题或反馈意见，请随时通过[email@example.com]联系我们。

希望大家能使用OpenWrt-NetCheck成功排除故障！
