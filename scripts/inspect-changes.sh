#!/usr/bin/env bash
# inspect-changes.sh - 协助技术导师技能快速提取代码变动全貌
set -euo pipefail

TARGET="${1:-auto}"

# 检查当前目录是否为 git 仓库
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "ERROR: 当前目录不是 Git 仓库。" >&2
  exit 1
fi

echo "=== [1] GIT 状态速览 ==="
git status -s

echo ""
echo "=== [2] 目标变动定位 ==="
if [ "$TARGET" = "auto" ]; then
  # 自动策略：优先看是否有未提交的修改；若工作区干净，看最近 1 次提交
  UNCOMMITTED_COUNT=$(git status --porcelain | wc -l | tr -d ' ')
  if [ "$UNCOMMITTED_COUNT" -gt 0 ]; then
    echo "检测到工作区存在未提交变动 ($UNCOMMITTED_COUNT 个文件)。"
    DIFF_TARGET=""
    DIFF_MODE="uncommitted"
  else
    echo "工作区干净，定位最近 1 次提交 ($(git rev-parse --short HEAD))。"
    DIFF_TARGET="HEAD~1..HEAD"
    DIFF_MODE="commit"
    git log -1 --pretty=format:"提交信息: %h - %s (%an, %ar)%n"
  fi
else
  DIFF_TARGET="$TARGET"
  DIFF_MODE="custom ($TARGET)"
  echo "正在分析指定目标: $DIFF_TARGET"
fi

echo ""
echo "=== [3] 修改文件与增删统计 ==="
if [ "$DIFF_MODE" = "uncommitted" ]; then
  git diff --stat
  # 列出暂存区改动
  STAGED_STAT=$(git diff --cached --stat)
  if [ -n "$STAGED_STAT" ]; then
    echo "-- 已暂存改动 (Staged) --"
    echo "$STAGED_STAT"
  fi
else
  git diff --stat "$DIFF_TARGET"
fi

echo ""
echo "=== [4] 核心变动摘要与签名识别 ==="
if [ "$DIFF_MODE" = "uncommitted" ]; then
  git diff --compact-summary
else
  git diff --compact-summary "$DIFF_TARGET"
fi

echo ""
echo "=== [5] 变动函数/符号索引 (函数级指纹) ==="
if [ "$DIFF_MODE" = "uncommitted" ]; then
  git diff -p --function-context 2>/dev/null | grep -E '^@@' | sed -E 's/^@@.*@@[ ]*//' | grep -v '^$' | sort -u | head -n 30 || true
else
  git diff -p --function-context "$DIFF_TARGET" 2>/dev/null | grep -E '^@@' | sed -E 's/^@@.*@@[ ]*//' | grep -v '^$' | sort -u | head -n 30 || true
fi
