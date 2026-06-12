# 风格库 (Style Library)

> 本 skill 默认走 **C 风格 · 未来数据大屏**。以下是备用风格，仅在用户明确要求时使用。

| 字母 | 风格 | 调性 | 适合场景 |
|---|---|---|---|
| A | 极简科技蓝 | 苹果 Keynote 风 | 科技/商务汇报 |
| B | 科技国潮金 | 一带一路/丝路 | 国际业务/政企 |
| **C** ⭐ | **未来数据大屏** | **HUD/指挥中心** | **无人机/数据/B 端（默认）** |
| D | Corporate Memphis | 扁平几何 | 初创/商务/营销 |
| E | Blueprint | 工程蓝图 | 制造/工程/工业 |
| F | Light Mode Clean | 极简白底 | 咨询/报告 |
| G | Dark Mode Dashboard | 多色霓虹数据 | 数据大屏/监控 |
| H | Neon Glassmorphism | 2024 SaaS 风 | 互联网产品/创业 |
| I | Technical Schematic | 专利图纸 | 技术发布/学术 |
| J | Minimalist Flat | 极简扁平 | 咨询/报告/极简 |
| K | Gradient Mesh | 渐变流体 | 创意/设计/品牌 |
| L | Chinese Ink | 中国水墨 | 传统文化/国潮 |
| M | Bold Graphic | 波普艺术 | 消费品/创意 |
| N | Elegant Serif | 优雅衬线 | 高端品牌/奢侈品 |
| O | Watercolor Soft | 水彩柔和 | 教育/文化/公益 |
| P | Morandi Journal | 莫兰迪杂志 | 文艺/期刊/生活 |
| Q | Hand-drawn Edu | 手绘教育 | 培训/SOP/教学 |
| R | Pop Laboratory | 流行实验室 | 科普/科研/实验 |

## ⚠️ 重要约束

**不要主动出 18 张风格对比图**给用户挑选。

理由：
- 每张图 1-2 美元，18 张 = $20-30
- 实际选择是 1-2 个，**绝大多数是 C 风格**（用户场景已定）
- 浪费用户金钱

**正确的做法**：
1. 默认 C 风格直接出全部 15 页
2. 用户明确说"换风格"才出对比图（限制 3-5 张）
3. 真正明确选择后再批量出

## 如何切换风格

修改 `references/prompts.md` 中的**共享底座**段落 + 每页 prompt 的色板描述即可。

例如换成 A 极简科技蓝：

```
共享底座改为:
"Minimalist Apple Keynote style. Deep blue gradient background (#001F3F).
Silver white drone. Generous white space. Single gold accent line.
Typography: SF Pro Display, ultra clean. No HUD elements."
```
