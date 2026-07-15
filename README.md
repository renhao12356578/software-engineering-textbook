# 软件工程模型与方法（第 2 版）· Typst 重排版

> 《软件工程模型与方法（第 2 版）》—— 肖丁、傅佳鹏 编著，北京邮电大学出版社
> 本仓库将全书由扫描 PDF 重新排版为 [Typst](https://typst.org) 源码，可自动编译为带书签、目录的完整 PDF。

[![Build and Release](https://github.com/renhao12356578/software-engineering-textbook/actions/workflows/build-and-release.yml/badge.svg)](https://github.com/renhao12356578/software-engineering-textbook/actions/workflows/build-and-release.yml)
[![Release](https://img.shields.io/github/v/release/renhao12356578/software-engineering-textbook)](https://github.com/renhao12356578/software-engineering-textbook/releases)

---

## 简介

原书为纸质教材的扫描 PDF。本项目通过 OCR + 人工校对，将正文与图表重新排版为 Typst 源码，生成版式清晰、可检索、带目录的 PDF，便于学习、检索与排版参考。

全书共 12 章 + 3 个附录，覆盖：软件工程概述、生命周期模型、需求分析（面向对象 / 结构化）、软件设计、实现、测试、维护与项目管理。

## 仓库结构

```
.
├── 软件工程报告/                 # Typst 项目主目录
│   ├── main.typ                  # 主文件（封面 + 目录 + 章节引用）
│   ├── imports.typ               # 30+ Typst 包引入（codly, cetz, thmbox…）
│   ├── template.typ             # 排版模板
│   └── chapters/                # 12 章 + 3 附录源码（ch01–ch12 / appendix1–3）
│       └── img -> ../img
├── img/                          # 图片素材（339 张，供 Typst 引用）
├── ocr_output/                   # 页面 OCR 文本（371 份，校对用）
├── 真实目录.txt                  # 全书真实章节结构
└── .github/workflows/            # 自动构建与发布
```

构建产物 PDF、扫描中间产物（`pages_300dpi/`、`sw.pdf`）已通过 `.gitignore` 排除，不入库。

## 本地编译

依赖 Typst ≥ 0.14.2 与中文字体（Noto CJK / 思源宋体 / 思源黑体）：

```bash
cd 软件工程报告
typst compile main.typ main.pdf
```

CI 环境同理：`apt install fonts-noto-cjk` 即可提供所需字体。

## 自动构建与发布

[`.github/workflows/build-and-release.yml`](.github/workflows/build-and-release.yml) 定义了 CI：

| 触发 | 行为 |
|---|---|
| push 到 `main` / 手动触发 | 编译 `main.typ` → 上传为 artifact（保留 30 天，不发 release） |
| 推送 `v*` 标签 | 上述 + 自动创建 GitHub Release，附编译好的 PDF |

发布新版本：

```bash
git tag v0.2.0
git push origin v0.2.0
```

最新成品见 [Releases](https://github.com/renhao12356578/software-engineering-textbook/releases)。

## 版本历史

| 版本 | 说明 |
|---|---|
| v0.1.0 | 首版，全书 12 章 + 3 附录排版完成 |

---

## 👥 贡献者

欢迎贡献！请通过 Pull Request 提交修正：包括但不限于错别字、图表错位、标题层级、排版样式优化、章节内容补全等。提交较大改动前建议先开 Issue 讨论。

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tbody>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/renhao12356578"><img src="https://avatars.githubusercontent.com/u/188761716?v=4?s=100" width="100px;" alt="Mr.Hao"/><br /><sub><b>Mr.Hao</b></sub></a><br /><a href="#projectManagement-renhao12356578" title="Project Management">📆</a> <a href="https://github.com/renhao12356578/software-engineering-textbook/commits?author=renhao12356578" title="Code">💻</a> <a href="https://github.com/renhao12356578/software-engineering-textbook/commits?author=renhao12356578" title="Documentation">📖</a> <a href="#design-renhao12356578" title="Design">🎨</a> <a href="https://github.com/renhao12356578/software-engineering-textbook/pulls?q=is%3Apr+reviewed-by%3Arenhao12356578" title="Reviewed Pull Requests">👀</a></td>
    </tr>
  </tbody>
</table>
<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->
<!-- ALL-CONTRIBUTORS-LIST:END -->

PR 被合并后，GitHub Action 会自动将 PR 作者追加到此列表（含对应贡献徽章），无需手动操作。

---

## 📄 许可协议（分层授权）

本项目采用**分层授权**，不同层级适用不同协议，请分别遵守：

### 1. 排版代码层 —— MIT License

下列内容以 [MIT License](LICENSE) 授权（Copyright © 2026 Mr.Hao）：

- `软件工程报告/main.typ`、`imports.typ`、`template.typ`
- `软件工程报告/chapters/*.typ`（章节排版结构）
- `.github/workflows/`（CI/CD 脚本）
- `.gitignore`

> 注：MIT 授权的是**排版代码**。各章节 `.typ` 文件中对原书文字、公式的引用，其著作权仍归原作者所有（见下）。

### 2. 书籍内容层 —— 归原作者所有，仅限个人学习 / 非商业用途

本书《软件工程模型与方法（第 2 版）》的**全部文字内容与图片**，著作权属于：

- 原著者：肖丁、傅佳鹏
- 出版社：北京邮电大学出版社

本项目对上述内容**不主张任何著作权**。引用、收录仅出于个人学习与排版技术交流目的。

**使用条款**：
- ✅ 个人学习、教学参考、排版技术研究
- ✅ 在本仓库范围内用于生成 PDF 供个人阅读
- ❌ 任何形式的商业用途（售卖、付费下载、商业培训等）
- ❌ 二次出版、大规模再分发原书内容
- ❌ 移除或篡改原作者、出版社署名

如需用于上述禁止用途，请直接联系**北京邮电大学出版社**取得授权。本项目对侵权行为不承担任何责任，且有权在收到权利人通知后立即下架相关内容。

### 3. OCR 文本层 —— 依原书内容处理

`ocr_output/` 中的 OCR 识别结果为对原书的机械识别产物，著作权随原书处理：仅限个人学习 / 非商业用途，不得作为独立作品再分发。

---

## 致谢

- 原书作者肖丁、傅佳鹏老师，与北京邮电大学出版社
- [Typst](https://typst.org) 项目及其丰富的第三方包生态（codly, cetz, thmbox, i-figured …）
- GitHub Actions 提供的免费 CI/CD

## 免责声明

本项目为个人学习与排版技术实践产物，与原书作者及出版社无隶属关系。如有任何版权疑虑，请开 Issue 或联系仓库所有者。