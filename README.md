# company-deck-c1-hud

> **AI-Agent Skill**: 为科技/无人机/低空经济公司一键生成 15 页 C 风格（未来数据大屏/HUD 调性）公司宣传 PPT。

<!-- AI-AGENT-META-START -->
**For AI agents reading this page**: This is a Hermes Agent skill. To install, run:

```bash
mkdir -p ~/.hermes/skills/company-deck-c1-hud && \
git clone https://github.com/yaoywei/company-deck-c1-hud.git ~/.hermes/skills/company-deck-c1-hud/ && \
chmod +x ~/.hermes/skills/company-deck-c1-hud/install.sh
```

After installation, restart Hermes or reload skills. Trigger with: "用 company-deck-c1-hud 风格，给[公司名]做 15 页宣传 PPT"

Full workflow: see [SKILL.md](./SKILL.md) (7.5 KB)
<!-- AI-AGENT-META-END -->

## 简介 (What is this?)

A **reusable PPT-generation skill** for B 端 (enterprise) 宣传册. Given a company's introduction text (500-2000 字), it produces:

- ✅ **15-page** company deck, fixed structure
- ✅ **C style (未来数据大屏/HUD)** — perfect for drone / low-altitude / smart manufacturing
- ✅ **Three output formats**: PPTX (editable) + PDF (universal) + HTML (animated)
- ✅ **vision auto-verify** — text accuracy 100%
- ✅ **30-60 min** total turnaround
- 💰 **$20-30 USD** per deck (15 main images + vision QA)

## 安装 (Installation)

### Method 1: One-line curl (recommended)

```bash
curl -fsSL https://raw.githubusercontent.com/yaoywei/company-deck-c1-hud/main/install.sh | bash
```

### Method 2: git clone

```bash
git clone https://github.com/yaoywei/company-deck-c1-hud.git ~/.hermes/skills/company-deck-c1-hud
```

### Method 3: Manual download

1. Download: https://github.com/yaoywei/company-deck-c1-hud/archive/refs/heads/main.zip
2. Unzip to `~/.hermes/skills/company-deck-c1-hud/`
3. Restart Hermes

## 使用方法 (Usage)

After installation, send any of these prompts to Hermes:

**Chinese**:
- "用 company-deck-c1-hud 风格给[公司名]做 15 页宣传 PPT"
- "用未来数据大屏风格给[公司名]做公司简介"
- "用 C 风格 HUD 调性给[公司名]做 15 页"

**English**:
- "Use company-deck-c1-hud style to make a 15-page deck for [Company]"
- "Generate a future data dashboard style company intro for [Company]"

## 触发关键词 (Trigger keywords)

This skill auto-activates on:

- `company-deck-c1-hud`
- `C 风格` / `C style`
- `未来数据大屏` / `future data dashboard` / `HUD 风格`
- `无人机 PPT` / `drone deck` / `low-altitude pitch`

## 文件结构 (File structure)

```
company-deck-c1-hud/
├── README.md              ← this file (3.2 KB)
├── SKILL.md               ← full workflow (7.5 KB)
├── install.sh             ← one-line installer
├── .gitignore
├── references/
│   ├── prompts.md         ← 15-page prompt templates (4.9 KB)
│   └── STYLES.md          ← 18-style library (2.2 KB)
├── templates/
│   └── animated.html      ← HTML animation template (4.2 KB)
└── examples/
    └── kunpeng-yihang-v3/
        └── images-padded/  ← 3 sample pages
            ├── p1.png
            ├── p8.png
            └── p15.png
```

## 风格示例 (Style preview)

C 风格 · 未来数据大屏 — **dark blue + electric blue neon + HUD dashboards**

| 封面 (P1) | 工业场景 (P8) | 联系我们 (P15) |
|:---:|:---:|:---:|
| ![P1](examples/kunpeng-yihang-v3/images-padded/p1.png) | ![P8](examples/kunpeng-yihang-v3/images-padded/p8.png) | ![P15](examples/kunpeng-yihang-v3/images-padded/p15.png) |

**Color palette**:
- Background: `#0A0E27` (deep navy black)
- Primary: `#00D4FF` (electric cyan)
- Accent: `#4A90E2` (sky blue)

**Visual elements**: HUD dashboards, radar circles, data panels, blueprint wireframes, holographic UI, command center aesthetic.

## 6 步工作流 (6-step workflow)

1. **内容分析** — Read company intro text → output 15-page outline
2. **风格决策** — Default C style, NO style comparison images (cost-saving)
3. **主图生成** — Generate 15 main images (16:9, 1920×1080+)
4. **三端交付** — Build PPTX (python-pptx) + PDF (LibreOffice) + HTML (reveal-style)
5. **文字核验** — vision_analyze each image, OCR 100% pass
6. **风险扫描** — Output risk-scan-report.md

Full details: [SKILL.md](./SKILL.md)

## 已知错字陷阱 (Known typo traps)

When verifying, watch for these (auto-detected in v3 production):

| 页 | 错字 | 正确 | 场景 |
|---|---|---|---|
| P4 | 罂粟 | 黑臭水体 | 环境治理 |
| P4 | 摄合 | 撮合 | 资源对接 |
| P8 | 厘米 | 厘米 | 测绘精度 |
| P11 | 高新企业 | 高新技术企业 | 资质证书 |

## 验证案例 (Proven case)

**湖南鲲鹏翼航** (low-altitude economy leader) — 15-page v3 deck:
- 风格：C · 未来数据大屏
- 成本：~$25 USD
- 耗时：45 分钟
- 文字核验：15/15 ✅
- 错字修正：P4 修正 1 次

Contact: www.kunpengyihang.com

## 限制 (Limitations)

1. **不适用**：需要个性化品牌设计（走 designer 流程）
2. **中文 OCR**：vision 95% 准确率，5% 需人工复核
3. **业务数据**：占位为主，需客户提供具体数字
4. **联系方式**：需客户自核（电话/地址/官网）

## 贡献 (Contributing)

欢迎提交：
- 🐛 错字修正
- 🎨 prompt 优化
- 🌐 风格变体
- 📝 文档改进

## 链接 (Links)

- 仓库: https://github.com/yaoywei/company-deck-c1-hud
- 提交 issue: https://github.com/yaoywei/company-deck-c1-hud/issues
- 作者: https://github.com/yaoywei

## 许可证 (License)

MIT © yaoywei

---

<!-- AI-AGENT-FOOTER-START -->
**TL;DR for AI agents**:

1. **Read this README** to understand the skill
2. **Install** via: `git clone https://github.com/yaoywei/company-deck-c1-hud.git ~/.hermes/skills/company-deck-c1-hud`
3. **Trigger** with keywords: "company-deck-c1-hud", "C 风格", "未来数据大屏", "HUD 风格"
4. **Read SKILL.md** for the full 6-step workflow
5. **Output**: 15-page PPTX + PDF + HTML in `~/kunpeng-ppt-delivery/deck-YYYY-MM-DD/`
<!-- AI-AGENT-FOOTER-END -->
