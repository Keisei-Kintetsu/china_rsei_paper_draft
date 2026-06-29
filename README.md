# China RSEI Paper Draft

- Main draft: [latest/main.pdf](latest/main.pdf)
- Supplementary: [latest/supplementary.pdf](latest/supplementary.pdf)

## 摘要

长期、连续且跨年可比的生态环境质量记录是评估区域生态变化、生态恢复工程和城市化影响的基础。遥感生态指数（RSEI）通过整合绿度、湿度、干度和热度，为大范围生态环境质量监测提供了简洁框架；但在全国尺度构建 30 m 年度 RSEI 时，热度分量的跨传感器一致性和长期可比性仍是主要限制。本文基于 2000--2024 年中国年度无缝叶盛期 Landsat 合成产品、MODIS Terra 日间 LST、地形因子和水体掩膜，构建年度 30 m 地表温度与 RSEI 记录。我们首先利用随机森林生成 30 m LST 基线，再通过 MODIS 尺度平滑残差调整提高长期热环境背景一致性，并使用统一全局 PCA 与 P2--P98 稳健缩放构建跨年可比 RSEI。结果显示，残差调整后 LST 与 MODIS 的全国尺度 RMSE 由 2.10$^\circ$C 降至 1.41$^\circ$C，同时在典型区域保留 30 m 空间纹理。2000--2024 年全国平均 RSEI 从 0.499 增至 0.578，Theil--Sen 斜率为每十年 0.0308，显著增加面积占 74.58\%。华北-黄土高原区和东北地区改善最强，青藏高原和西北干旱区改善相对较弱。该年度 RSEI 记录为理解中国 21 世纪以来生态环境质量变化提供了连续、高分辨率和跨传感器一致的遥感证据。
