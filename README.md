# CUG 本科学士学位论文 LaTeX 模板

这是一个面向中国地质大学（武汉）本科学士学位论文写作的 XeLaTeX 模板。模板根据学校发布的学士学位论文写作规范及附件示例整理，提供可直接修改的 `main.tex` 示例文件和 `cugthesis.cls` 模板类文件。

本项目目标是让本科毕业论文排版尽量自动化，减少手工调整 Word 样式的成本。使用者仍应以学院、导师和教务系统当年发布的正式要求为准。

## 功能特性

- 中文封面：题目、学号、姓名、学科专业、指导教师、培养单位、日期等字段自动排版。
- 原创性声明：按附件示例生成声明页，并预留作者签名和日期位置。
- 中英文摘要：提供 `CUGabstract` 和 `CUGabstractEN` 环境，自动设置标题、正文、关键词格式。
- 目录：自动生成目录，支持 PDF 内部点击跳转。
- 图清单和表清单：提供 `\makeCUGlof`、`\makeCUGlot` 命令，可按需要保留或删除。
- 正文结构：基于 `ctexbook`，支持章、节、小节自动编号。
- 页眉页码：正文从第一章开始设置页眉和外侧页码。
- 图、表、公式：按章编号，图题置于图下，表题置于表上。
- 参考文献：使用 `biblatex-gb7714-2015` 生成 GB/T 7714 顺序编码制参考文献。
- 中文字体：默认面向 Windows + TinyTeX，使用宋体、黑体、Times New Roman，并通过模板自定义字体族启用中文伪粗体。

## 文件结构

```text
.
├── cugthesis.cls       # 模板类文件
├── main.tex            # 示例论文入口文件
├── references.bib      # BibLaTeX 参考文献数据库
├── LICENSE             # MIT License，适用于模板代码和示例源码
├── main.pdf            # 示例输出 PDF，发布时可选保留
├── 写作规范.pdf        # 学校规范材料，公开发布前请确认版权和转载许可
└── 规范附件.pdf        # 学校附件材料，公开发布前请确认版权和转载许可
```

## 环境要求

推荐环境：

- TeX 发行版：TinyTeX 或 TeX Live。
- 编译引擎：XeLaTeX。
- 参考文献后端：Biber。
- 参考文献样式包：`biblatex-gb7714-2015`。
- 操作系统：Windows 优先；macOS/Linux 可用，但需要自行调整中文字体名称。

Windows 推荐字体：

- 中文正文：SimSun（宋体）。
- 中文标题：SimHei（黑体）。
- 英文正文：Times New Roman。

如果你使用 macOS 或 Linux，请在 `cugthesis.cls` 中修改：

```tex
\setCJKfamilyfont{CUGsong}[AutoFakeBold=2.8]{SimSun}
\setCJKfamilyfont{CUGhei}[AutoFakeBold=2.8]{SimHei}
```

替换为本机可用的宋体、黑体或相近字体。

## 安装依赖

如果使用 TinyTeX，可以在 R 中安装缺失包：

```r
tinytex::tlmgr_install(c("ctex", "biblatex", "biber", "biblatex-gb7714-2015"))
```

如果使用 TeX Live 命令行，可以执行：

```bash
tlmgr install ctex biblatex biber biblatex-gb7714-2015
```

若已经完整安装 TeX Live，通常不需要额外安装。

## 编译方式

推荐使用 TinyTeX 自动编译：

```r
tinytex::latexmk("main.tex", engine = "xelatex", bib_engine = "biber")
```

命令行完整编译流程：

```bash
xelatex main.tex
biber main
xelatex main.tex
xelatex main.tex
```

第一次编译后目录、交叉引用和参考文献可能不会立即完整显示，这是 LaTeX 的正常行为。完整流程需要至少两次 XeLaTeX，并在中间运行一次 Biber。

如果从旧的 BibTeX 方案切换到 BibLaTeX 后出现异常，可先删除辅助文件：

```r
unlink(c("main.aux", "main.bbl", "main.bcf", "main.blg", "main.run.xml"))
tinytex::latexmk("main.tex", engine = "xelatex", bib_engine = "biber")
```

## 快速开始

复制或直接修改 `main.tex` 开头的论文基本信息：

```tex
\CUGstudentid{2020123456}
\CUGtitle{中国地质大学（武汉）学士学位论文模板示例}
\CUGauthor{张三}
\CUGmajor{地质学}
\CUGsupervisor{李四}{教授}
\CUGcollege{地球科学学院}
\CUGdate{二〇二六年五月}
```

如有经正式批准、备案的副导师或企业导师，取消注释并填写：

```tex
\CUGcosupervisor{王五}{高级工程师}
```

参考文献数据库在 `references.bib` 中维护。正文中使用：

```tex
文献\upcite{gbt7713}
```

或普通引用命令：

```tex
\cite{gbt7713}
```

只会输出正文中实际引用过的文献。如果需要临时显示 `.bib` 中全部条目，可在 `\makeCUGbibliography` 前添加：

```tex
\nocite{*}
```

正式论文通常不建议列出未在正文中引用的文献。

## 论文结构

`main.tex` 中默认结构如下：

```tex
\makeCUGcover
\makeCUGoriginality

\CUGfrontmatter

\begin{CUGabstract}
中文摘要内容。
\CUGkeywords{关键词一；关键词二；关键词三}
\end{CUGabstract}

\begin{CUGabstractEN}
English abstract text.
\CUGkeywordsEN{keyword one; keyword two; keyword three}
\end{CUGabstractEN}

\makeCUGtoc
\makeCUGlof
\makeCUGlot

\CUGmainmatter

\chapter{绪论}
\section{研究背景}

\begin{CUGacknowledgements}
致谢内容。
\end{CUGacknowledgements}

\makeCUGbibliography

\CUGappendix
附录内容。
```

如果论文中图表较少，可以删除或注释：

```tex
\makeCUGlof
\makeCUGlot
```

如果没有附录，可以删除：

```tex
\CUGappendix
附录内容。
```

## 已实现的格式

- A4 纸张，页边距上、下、左、右均为 `3cm`，装订线 `0cm`。
- 中文封面按照附件示例生成，字段包括题目、学号、姓名、学科专业、指导教师、培养单位、日期。
- 封面标题使用宋体 26 磅加粗，论文题目使用黑体 22 磅加粗居中。
- 封面信息栏使用宋体 16 磅加粗，学号使用 Times New Roman 16 磅加粗。
- 原创性声明另起页，声明正文宋体 14 磅，固定行距 24 磅。
- 中文摘要标题黑体 18 磅加粗居中，正文宋体 12 磅，固定行距 20 磅。
- 英文摘要标题 Times New Roman 18 磅加粗居中，正文 Times New Roman 12 磅，固定行距 20 磅。
- 目录标题黑体三号加粗居中，章目录宋体 14 磅，节和小节目录宋体 12 磅。
- 正文章标题黑体三号加粗居中，一级节标题黑体四号加粗居中，二级节标题黑体小四居左。
- 正文宋体 12 磅，英文 Times New Roman 12 磅，固定行距 20 磅，段前段后 0 磅，首行缩进两个汉字符。
- 正文页眉从第一章开始，奇数页为“中国地质大学学士学位论文”，偶数页为“作者姓名：论文题目”。
- 正文页码从第一章开始使用阿拉伯数字连续编号，页码在外侧。
- 图、表、公式按章编号，例如 `图 1.1`、`表 1.1`、`(1.1)`。
- 图题置于图下，表题置于表上，使用宋体五号居中。
- 表格示例使用 `booktabs` 三线表。
- 参考文献使用 `biblatex-gb7714-2015` 顺序编码制样式。
- 目录和引用支持 PDF 内部链接，链接隐藏边框，不影响打印样式。

## 与规范相关的说明

不同学院、不同年份对封面字段、题名页、图表编号和提交材料可能有细微差异。本模板按当前示例文件和已有沟通取舍实现，不保证覆盖所有学院的特殊要求。

以下项目建议在提交前向学院或导师确认：

- 是否必须单列“中文题名页”。当前模板默认不生成单独题名页。
- 封面是否必须使用学院提供的固定图片版式。
- 图清单和表清单是否必须保留。规范中写明“如有”，图表较少时通常可删除。
- 图表编号使用 `图 1.1` 还是附件示例中的 `图 1-1`。当前模板采用正文规范中的点号编号。
- 参考文献采用顺序编码制还是著者-出版年制。当前模板采用顺序编码制。

## 常见问题

### 参考文献位置显示 cite key，或者参考文献页为空

通常是 Biber 没有运行成功。请使用：

```r
tinytex::latexmk("main.tex", engine = "xelatex", bib_engine = "biber")
```

如果仍失败，先清理旧辅助文件：

```r
unlink(c("main.aux", "main.bbl", "main.bcf", "main.blg", "main.run.xml"))
tinytex::latexmk("main.tex", engine = "xelatex", bib_engine = "biber")
```

### 提示找不到 `biber`

安装 Biber：

```r
tinytex::tlmgr_install("biber")
```

### 提示找不到 `gb7714-2015`

安装国标参考文献样式包：

```r
tinytex::tlmgr_install("biblatex-gb7714-2015")
```

### 中文字体缺失或显示不正常

模板默认使用 Windows 字体 `SimSun`、`SimHei`。如果不是 Windows，或者系统没有这些字体，请修改 `cugthesis.cls` 中的字体定义。

### 目录或引用没有更新

LaTeX 需要多次编译才能稳定目录、引用和参考文献。请使用完整编译流程，或使用 TinyTeX 的 `latexmk` 自动处理。

### PDF 目录能否点击跳转

可以。模板加载了 `hyperref`，并使用隐藏链接样式，不显示彩色边框。

### 为什么参考文献库里有多条文献，但 PDF 只显示部分

默认只显示正文实际引用过的条目。如果需要显示全部条目，可以添加：

```tex
\nocite{*}
```

正式论文通常只列正文实际引用过的文献。

## 贡献指南

欢迎提交 issue 或 pull request。建议提交前说明：

- 使用的 TeX 发行版和版本。
- 操作系统。
- 编译命令。
- 出现问题的最小示例。
- 学院或教务处给出的具体格式依据。

涉及格式变更时，请尽量附上规范原文、截图或页码说明，避免仅凭个人视觉偏好修改模板。

## 免责声明

本模板不是学校官方模板。作者和贡献者不保证模板完全符合所有学院、所有年份、所有提交系统的要求。正式提交前，请务必按照学院通知、导师意见和学校最新规范自行核对。
