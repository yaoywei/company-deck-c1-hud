#!/usr/bin/env bash
# company-deck-c1-hud 一键安装脚本
# 用法: curl -fsSL https://raw.githubusercontent.com/yaoywei/company-deck-c1-hud/main/install.sh | bash
# 作用: 把这个 skill 安装到 ~/.hermes/skills/company-deck-c1-hud/

set -e

REPO_URL="https://github.com/yaoywei/company-deck-c1-hud.git"
SKILL_NAME="company-deck-c1-hud"
SKILL_DIR="${HOME}/.hermes/skills/${SKILL_NAME}"

echo "🚀 安装 ${SKILL_NAME} skill"
echo "================================"

# 1. 检查依赖
if ! command -v git &> /dev/null; then
  echo "❌ 错误: 需要 git，请先安装 git"
  exit 1
fi

# 2. 检查是否已安装
if [ -d "${SKILL_DIR}" ]; then
  echo "⚠️  ${SKILL_NAME} 已经安装在 ${SKILL_DIR}"
  read -p "是否覆盖? [y/N] " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "❌ 取消安装"
    exit 1
  fi
  rm -rf "${SKILL_DIR}"
fi

# 3. 克隆仓库
echo "📥 克隆仓库..."
git clone --depth 1 "${REPO_URL}" "${SKILL_DIR}"

# 4. 验证 SKILL.md
if [ ! -f "${SKILL_DIR}/SKILL.md" ]; then
  echo "❌ 安装失败: SKILL.md 不存在"
  exit 1
fi

# 5. 完成
echo ""
echo "✅ 安装成功!"
echo "📁 位置: ${SKILL_DIR}"
echo ""
echo "🎯 使用方法:"
echo "   1. 重启 Hermes (或重新加载 skills)"
echo "   2. 用关键词触发: '用 ${SKILL_NAME} 风格，给[公司名]做 15 页宣传 PPT'"
echo ""
echo "📖 文档: ${SKILL_DIR}/SKILL.md"
echo "🌐 仓库: ${REPO_URL}"
echo ""
