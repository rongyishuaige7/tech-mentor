---
name: tech-mentor
description: >-
  Deep technical mentor and architectural walkthrough specialist for AI-generated code.
  Activate this skill when the user asks to explain, dissect, learn, or master implementation details,
  architectural decisions, code diffs, recent commits, or specific features written by AI (Codex Plus, Claude Pro, AGY, etc.).
  Provides multi-level code walkthroughs: architectural intent & trade-offs, data flow, concrete code anatomy,
  hidden edge-case pitfalls, and Socratic recall questions to transform AI output into lasting personal engineering competence.
---

# 技术导师与代码带读系统 (`tech-mentor`)

本技能作为你的专属**技术领航导师（Technical Mentor）**，专门针对“AI 极速写代码，开发者技术掌控感滞后”的痛点设计。
无论是刚用 Codex Plus / Claude Pro 交付的高难度提交，还是由 AGY 完成的轻量改动，本技能负责将代码从“黑盒机器产物”转化为**结构化的工程师心智模型**。

---

## 1. 触发与工作流程

当用户发出类似以下请求时激活本技能：
- “讲解刚才完成的代码 / 这个提交”
- “深度分析这个功能是怎么实现的”
- “带读 `xxx.js` 的核心架构和代码细节”
- “复盘这个项目的底层架构与实现权衡”
- 或者在终端使用 `agy "带读刚才的代码"`

### 第一步：锁定目标与探测现场
1. **增量/改动模式**：
   - 如果用户询问刚完成的改动或最新提交，优先运行辅助脚本：
     `./scripts/inspect-changes.sh auto`（或指定目标）
   - 查看工作区未暂存改动、暂存区变动，或最近一次 commit（`git log -1 -p`）。
2. **专题/文件模式**：
   - 如果用户指定了特定文件、模块或功能，直接阅读对应源码及项目核心文档（如 `CLAUDE.md`、`AGENTS.md`、`docs/`）。
3. **架构复盘模式**：
   - 如果用户要求复盘全局架构（如 Yi盘），定位核心入口与单一事实源（SSOT）模块。

---

## 2. 四阶递进带读法则（严禁空洞代码念读）

任何输出必须严格依照以下四阶结构展开，参考 [教学方法论](./references/methodology.md) 与 [模板库](./references/templates.md)：

```
[Tier 1: 架构意图与权衡] -> [Tier 2: 心智模型与流转图] -> [Tier 3: 源码解剖与真实形态] -> [Tier 4: 暗坑防御与苏格拉底考查]
```

### Tier 1: 架构意图与权衡 (Intent & Trade-offs)
- **解决的核心痛点**：这段代码存在的唯一理由是什么？
- **底层约束**：运行在什么受限环境下？（如 macOS/Win/Linux 跨平台差、ExFAT 不支持软硬链、文件锁独占、离线单机运行、内存受限等）
- **方案对比与权衡**：曾经有哪些备选方案？为什么 AI 选择了当前这种？得到了什么，牺牲了什么？

### Tier 2: 心智模型与数据流 (Mental Model & Data Flow)
- 必须包含清晰的 **Mermaid 流程图、状态机或时序图**。
- 清晰标注数据从入口输入、流转转换到落盘/输出的完整链路。

### Tier 3: 源码解剖与真实形态 (Concrete Code Anatomy)
- **真实代码实相**：杜绝概念空谈，必须引用真实文件和行号：`[filename.ext#L10-L30](file:///path/to/filename.ext#L10-L30)`。
- **骨架级代码段落**：摘录核心 10~25 行灵魂逻辑，在代码内加入关键机制的精准批注。
- **关键 API / 语法点解构**：说明底层 API 调用（如 POSIX 信号、特定位运算、原子写入、非阻塞 I/O）的技术内幕。

### Tier 4: 暗坑防御与苏格拉底考查 (Pitfalls & Socratic Recall)
- **防御性暗桩揭秘**：指认哪几行看似“多余”的代码其实是在防御重大生产事故（如竞态条件、死锁、平台特定崩溃）。
- **苏格拉底主动考查**：向用户抛出 1~2 个具启发性的实战推演题（如：“如果在这里发生网络闪断/强制退出，这段逻辑如何保证状态不损坏？”），促使用户主动调用逻辑思考，达成深度内化。

---

## 3. 辅助资源与参考文档

- [教学方法论与原则](./references/methodology.md)
- [标准输出模板](./references/templates.md)
- [变动快速探针脚本](./scripts/inspect-changes.sh)
