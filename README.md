# 🧭 Tech Mentor (`tech-mentor`)

> **将 AI 高速生成的代码，转化为个人持久的技术内力。**  
> An Antigravity (`agy`) / Agent Skill that decodes, dissects, and teaches AI-generated code through architectural intent, concrete code anatomy, and Socratic drills.

---

## 💡 为什么需要 Tech Mentor？(The Motivation)

进入 AI Agent 协同时代后，诸如 **Codex Plus**、**Claude Pro** 和 **Antigravity (`agy`)** 等工具将开发交付速度提升了 10 倍以上。很多独立开发者和工程师 99% 的代码都是由 AI 编写并自动化通过门禁的。

然而，这也带来了一个全新的工程痛点——**“架构认知脱节（Architectural Amnesia）”**：
- 🚀 **交付速度极快**：AI 在几分钟内完成了跨平台兼容、无框架原生 HTTP 路由、文件锁机制与复杂的生命周期管理；
- 📉 **技术掌控感落后**：开发者变成了“Prompt 输入者 + 测试通过者”，对系统的真实数据流、底层权衡（Trade-offs）和暗坑防御缺乏实感。当别人问起或遇到复杂生产边界时，大脑一片空白。

**解决方案不是开历史倒车回去手写样板代码，而是“交付流”与“吸收流”彻底解耦：**
1. **交付流（Delivery Flow）**：放手让 AI（Codex / Claude / AGY）全速冲刺，保持极致的工程生产力；
2. **吸收流（Cognitive Flow）**：阶段性完成、最新提交或关键功能落定时，唤起 **Tech Mentor**，以高级架构师与 1-on-1 私人技术导师的视角，带你吃透实现思想与每一行关键代码。

---

## 🏛️ 核心方法论：四阶递进带读法 (4-Tier Model)

Tech Mentor 严禁“口语化复述代码字面量”（如：“*第 10 行引入了 fs 模块，第 20 行定义了函数……*”），必须严格遵循四阶进阶模型：

```
[Tier 1: 架构意图与权衡] ➔ [Tier 2: 心智模型与流转图] ➔ [Tier 3: 源码解剖与真实形态] ➔ [Tier 4: 暗坑防御与苏格拉底考查]
```

| 阶段 | 核心任务 | 转化价值 |
| :--- | :--- | :--- |
| **Tier 1: 架构意图与权衡** | 揭示这段代码存在的唯一工程理由；剖析系统受限环境（跨平台/ExFAT/内存/并发）；解释为什么放弃方案 A 采用方案 B。 | 建立系统架构全局视野 |
| **Tier 2: 心智模型与流转** | 绘制精准的 **Mermaid 架构/时序/状态机图**；理清数据从入口到落盘的全生命周期。 | 建立直观的心理表征 |
| **Tier 3: 源码解剖与真实形态** | 精确定位源码文件与行号；抽出核心 15~30 行灵魂代码；逐段批注关键系统调用与语言特异性机制。 | 掌握真实落地的代码肌肉记忆 |
| **Tier 4: 暗坑防御与苏格拉底考查** | 找出哪几行看似“多余”的代码其实是在防御生产暗桩；抛出 1~2 个启发式场景题反向考查你。 | 强制主动推演，将知识固化至长期记忆 |

---

## 📦 仓库结构

```text
tech-mentor/
├── SKILL.md                 # Antigravity 技能标准定义与激活规则
├── LICENSE                  # MIT 开源协议
├── README.md                # 详细说明文档
├── scripts/
│   └── inspect-changes.sh   # 自动化 Git 变动探针与函数级指纹分析器
└── references/
    ├── methodology.md       # 四阶教学法核心理论与原则
    └── templates.md         # 提交增量 / 关键模块 / 架构复盘标准输出模板
```

---

## 🚀 安装指南 (Installation)

### 方式 1：安装到当前项目工作区（推荐）
在你的项目根目录下执行：
```bash
git clone https://github.com/rongyishuaige7/tech-mentor.git .agents/skills/tech-mentor
```

### 方式 2：全局安装（对本机所有项目生效）
安装到 Antigravity 全局技能目录：
```bash
git clone https://github.com/rongyishuaige7/tech-mentor.git ~/.gemini/config/skills/tech-mentor
```
并在 `~/.gemini/config/skills.json` 中添加声明：
```json
{
  "entries": [
    { "path": "~/.gemini/config/skills" }
  ]
}
```

---

## 🛠️ 实战使用姿势 (Usage)

在你的项目目录下，只需在终端运行 `agy`：

### 1. 增量带读刚完成的提交或改动
刚用 Codex / Claude / AGY 写完代码并提交后：
```bash
agy "带读刚才完成的提交，我想吃透它的实现思想与核心代码"
```
或指定具体 commit：
```bash
agy "深度拆解 HEAD~1 的核心实现与设计权衡"
```

### 2. 专题架构逆向课
面对项目中某个庞大或陌生的核心模块：
```bash
agy "对 launcher/llm-resolve.js 做一次专题架构带读，讲透它是如何实现单一事实源与双令牌路由的"
```

### 3. 显微镜级暗桩解惑
面对复杂的底层兼容或防御性代码：
```bash
agy "显微镜级带读 patch-openclaw.js，说明为什么 ExFAT 下硬链锁必须退化为独占创建"
```

---

## 📄 开源许可

本项目基于 [MIT License](LICENSE) 开源。欢迎 Star、Fork 并根据你的团队习惯定制专属的带读规则！
