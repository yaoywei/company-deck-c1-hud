---
name: company-deck-c1-hud
description: "为科技/无人机/低空经济公司一键生成 15 页 C 风格（未来数据大屏/HUD 调性）公司宣传 PPT。包含大纲、风格选择、主图生成、PPTX/PDF/HTML 三端交付、文字核验、错字修正。适用于 B 端路演、政企汇报、商务洽谈场景。"
version: 1.0.0
author: yaoywei
license: MIT
homepage: https://github.com/yaoywei/company-deck-c1-hud
metadata:
  hermes:
    tags: [PPT, drone, low-altitude, HUD, business-deck]
    category: productivity
---

# 公司宣传 PPT 一键生成工作流 (C 风格 · HUD 调性)

为科技/无人机/低空经济行业的公司**一键生成 15 页公司宣传 PPT**，采用 C 风格（未来数据大屏/HUD 调性），输出 PPTX/PDF/HTML 三端成品。

## When to Use

当用户**给出一段公司介绍文本**（500-2000 字），希望快速生成**专业级公司宣传 PPT**时使用本 skill。典型场景：

- 路演 / 展会 / 客户拜访
- 政企汇报 / 招商推介
- 内部培训 / 团队对齐
- 业务方向调整后的"新版公司简介"

不适用于：
- 个位数页数的简单提案（用 `mck-ppt-design`）
- 数据分析报告（用 `ppt-content-to-deck-image-first`）
- 个性化设计需求强烈的场景（需要 designer 介入）

## 风格定位：C · 未来数据大屏

- **主色调**：深蓝黑底 + 电光蓝霓虹 + 青色数据流
- **视觉元素**：HUD 仪表盘、雷达扫描、数字地图、线框无人机、数据面板
- **调性关键词**：指挥中心、未来感、数字化、智能调度
- **适合行业**：无人机、低空经济、智能制造、数字孪生、智慧城市

**不适用风格**：极简白底、卡通插画、传统中国风、奢侈品衬线（这些走其他 skill）

## 6 步工作流

### Step 1 · 内容分析与大纲规划

读取用户提供的公司介绍文本，输出 `outline.md`：

```markdown
# 大纲
- P1  封面：品牌名 + 一句话定位 + 视觉主图
- P2  公司简介：成立时间、定位、规模
- P3  发展历程：时间线
- P4  业务版块：核心业务 3-4 个
- P5  核心技术：技术能力 3-4 项
- P6  产品矩阵：产品系列
- P7  行业应用-1：场景 A
- P8  行业应用-2：场景 B
- P9  行业应用-3：场景 C
- P10 标杆案例：典型客户
- P11 资质荣誉：奖项、专利
- P12 团队实力：核心团队
- P13 全球布局：覆盖区域
- P14 合作模式：合作方式
- P15 联系我们：联系方式
```

**注意**：
- 页数**固定 15 页**（不多不少）
- 第 1 页封面、第 15 页联系人是**固定模板**
- 中间 13 页根据公司内容**动态调整**

### Step 2 · 风格决策（不调出对比图）

**默认走 C 风格**（未来数据大屏），不调出风格对比图。

如果用户明确要求"换风格"才出对比图：
- A 极简科技蓝：商务咨询
- B 科技国潮金：政企/一带一路
- C 未来数据大屏：无人机/数据（默认）
- D-F 卡通/插画：消费品/教育
- G-R 详见 `style-library/STYLES.md`

**⚠️ 重要约束**：不要主动出 18 张风格对比图。**默认 C 风格直接出全部主图**。

### Step 3 · 主图生成（15 张）

按以下 prompt 模板生成 15 张 16:9 主图（每张 1-2 美元）：

```
A futuristic dark-themed HUD/dashboard style slide. [PAGE_CONTENT_DESCRIPTION]
Visual elements: black background, electric blue neon lines, radar circles,
data panels, holographic UI, blueprint wireframe of drone/tech device.
Color palette: #0A0E27 (deep navy) + #00D4FF (cyan) + #4A90E2 (blue).
Typography: bold sans-serif, white text.
Style: cyberpunk command center, sci-fi data visualization, 8K detail.
Aspect ratio 16:9, no watermark, no text other than specified content.
```

**核心 prompt 元素**（每张图都包含）：
- `dark HUD dashboard style`
- `electric blue neon lines`
- `radar circles + data panels`
- `blueprint wireframe`
- 16:9, no watermark

**具体每页 prompt 模板**：见 `references/prompts.md`

### Step 4 · 三端交付

**A. PPTX**（python-pptx 制作）

```python
from pptx import Presentation
from pptx.util import Inches, Pt

prs = Presentation()
prs.slide_width = Inches(13.333)  # 16:9
prs.slide_height = Inches(7.5)

# 15 张图，每张占满全页
for i in range(1, 16):
    slide = prs.slides.add_slide(prs.slide_layouts[6])  # blank
    slide.shapes.add_picture(f"images-padded/p{i}.png",
                              0, 0,
                              width=prs.slide_width,
                              height=prs.slide_height)
prs.save("output.pptx")
```

**B. PDF**（LibreOffice 转换）

```bash
libreoffice --headless --convert-to pdf output.pptx
```

**C. HTML 动画**（reveal.js 风格）

将 15 张主图嵌入 HTML，配 CSS transition 实现翻页动画。详见 `templates/animated.html`。

### Step 5 · 文字核验（必做）

用 `vision_analyze` 逐张核验 15 张主图的文字：
- 主标题 / 副标题是否准确
- 列表要点是否有错字
- 数字 / 联系方式是否正确

**错字修正流程**：
1. vision 发现错字 → 记录 (页码, 原文, 应为)
2. 改写 prompt 重出该页
3. 重新核验直到通过

**P4 已知错字陷阱**（中文校对常见问题）：
- "罂粟" vs "黑臭水体"（环境治理）
- "摄合" vs "撮合"（资源对接）
- "厘米" vs "厘米"（测绘精度）

### Step 6 · 风险扫描

生成 `risk-scan-report.md`：

```markdown
# 风险扫描报告
- ✅ 文字准确率：15/15 (100%)
- ✅ 风格一致性：C 风格贯穿
- ✅ 三端交付：PPTX 26MB / PDF 4.6MB / HTML 34MB
- ⚠️ 联系方式需客户自核（电话/地址/官网）
- ⚠️ 业务数据为占位（具体数字由客户提供）
```

## 关键参数

| 参数 | 值 | 说明 |
|---|---|---|
| 页数 | 15 | 固定 |
| 风格 | C 未来数据大屏 | 默认 |
| 输出比例 | 16:9 | 标准宽屏 |
| 字体 | 思源黑体 / 苹方 | 中文 fallback |
| 主图分辨率 | 1920×1080+ | PPTX 全屏 |
| 总成本 | $20-30 USD | 15 张主图 + vision 核验 |
| 总耗时 | 30-60 分钟 | 含 vision 核验与修正 |

## 安装方式

**一行命令安装**：

```bash
curl -fsSL https://raw.githubusercontent.com/yaoywei/company-deck-c1-hud/main/install.sh | bash
```

**手动安装**：

```bash
git clone https://github.com/yaoywei/company-deck-c1-hud.git
cd company-deck-c1-hud
bash install.sh
```

**在 Hermes 中使用**：

```bash
# skill 自动加载到 ~/.hermes/skills/company-deck-c1-hud/
# 重启 Hermes 后用 skill 关键词触发：
"用 company-deck-c1-hud 风格，给[公司名]做 15 页宣传 PPT"
```

## 输出示例

参考 `examples/kunpeng-yihang-v3/` 目录下的完整产物：
- `鲲鹏翼航公司简介_v3.pptx` (26 MB)
- `鲲鹏翼航公司简介_v3.pdf` (4.6 MB)
- `animated.html` (34 MB)
- `outline.md` / `source.rewritten.md` / `risk-scan-report.md`

## 已知限制

1. **不适用于需要个性化设计的场景**（如品牌VI定制）——本 skill 走"通用科技风"路线
2. **中文OCR偶尔出错**（vision 核验 95% 准确率，5% 需人工复核）
3. **业务数据为占位**（具体数字需用户提供）
4. **联系方式需客户自核**（电话/地址/官网）

## 反馈与贡献

- 仓库：https://github.com/yaoywei/company-deck-c1-hud
- Issues：欢迎提交错字修正、prompt 优化、风格变体
- 许可证：MIT

---

**作者**: yaoywei
**创建日期**: 2026-06-12
**验证案例**: 鲲鹏翼航（湖南低空经济头部企业）v3 宣传册
