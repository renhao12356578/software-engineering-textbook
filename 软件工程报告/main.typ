#set heading(numbering: "1.1")
#show heading: it => {
  let level = it.level
  if level == 1 {
    v(20pt)
    align(center)[#set text(font: ("Noto Sans CJK SC", "Source Han Sans SC", "SimHei"), size: 18pt, weight: "bold"); #it]
    v(15pt)
  } else if level == 2 {
    v(12pt)
    block[#set text(font: ("Noto Sans CJK SC", "Source Han Sans SC", "SimHei"), size: 14pt, weight: "bold"); #it]
    v(6pt)
  } else {
    v(8pt)
    block[#set text(font: ("Noto Sans CJK SC", "Source Han Sans SC", "SimHei"), size: 12pt, weight: "bold"); #it]
    v(4pt)
  }
}

// 软件工程模型与方法（第 2 版）
// 肖丁 傅佳鹏 编著
// 北京邮电大学出版社

// === 页面设置 ===
#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm, top: 3cm, bottom: 2.5cm),
  header: context {
    if counter(page).get().first() > 1 [
      #set text(size: 9pt, fill: gray)
      #h(1fr) 软件工程模型与方法（第 2 版） #h(1fr)
    ]
  },
  footer: context {
    if counter(page).get().first() > 1 [
      #set text(size: 9pt, fill: gray)
      #align(center)[#counter(page).display("1")]
    ]
  },
)

// === 正文样式（宋体） ===
#set text(font: ("Noto Serif CJK SC", "Source Han Serif SC", "SimSun"), size: 10.5pt)
#set par(justify: true, leading: 0.8em, first-line-indent: (amount: 2em, all: true))
// === 章节标题样式 ===
#show heading.where(level: 1): it => {
  pagebreak(weak: true)
  v(20pt)
  align(center)[
    #set text(font: ("Noto Sans CJK SC", "Source Han Sans SC", "SimHei"), size: 18pt, weight: "bold")
    #it
  ]
  v(15pt)
}

#show heading.where(level: 2): it => {
  v(12pt)
  block[
    #set text(font: ("Noto Sans CJK SC", "Source Han Sans SC", "SimHei"), size: 14pt, weight: "bold")
    #it
  ]
  v(6pt)
}

#show heading.where(level: 3): it => {
  v(8pt)
  block[
    #set text(font: ("Noto Sans CJK SC", "Source Han Sans SC", "SimHei"), size: 12pt, weight: "bold")
    #it
  ]
  v(4pt)
}

// === 目录深度：1=仅章，2=章+节，3=章+节+小节 ===
#let toc-depth = 2

// === 章节编号：1.1, 1.1.1 格式 ===
#set heading(numbering: "1.1")

// === 图表编号：图 1-1 / 表 1-1 格式（按章编号） ===
#import "imports.typ": i-figured
#show heading: i-figured.reset-counters.with(level: 1)
#show figure.where(kind: table): set figure(supplement: [表])
#show figure.where(kind: table): set figure.caption(position: top)
#show figure.caption.where(position: top): set align(center)
#show figure.where(kind: image): set figure(supplement: [图])
#show figure: i-figured.show-figure.with(level: 1, numbering: "1-1")


// === 图片默认宽度 ===
#set image(width: 80%)

// === 代码块样式 ===
#show raw.where(block: true): it => {
  set text(size: 9pt, font: ("Noto Sans Mono CJK SC", "Source Code Pro"))
  block(
    width: 100%,
    inset: 10pt,
    fill: luma(245),
    radius: 4pt,
    it,
  )
}

// === 表格样式 ===
#show table: set text(size: 10pt)

// === 列表样式 ===
#set enum(indent: 1.5em)
#set list(indent: 1.5em)

// === 封面 ===
#align(center)[
  #v(60pt)
  #text(size: 28pt, font: ("Noto Sans CJK SC", "SimHei"), weight: "bold")[软件工程模型与方法]
  #v(8pt)
  #text(size: 20pt, font: ("Noto Sans CJK SC", "SimHei"))[（第 2 版）]
  #v(15pt)
  #text(size: 14pt)[RUANJIAN GONGCHENG MOXING YU FANGFA]
  #v(50pt)
  #text(size: 14pt)[肖丁  傅佳鹏  编著]
  #v(80pt)
  #text(size: 14pt)[北京邮电大学出版社]
]

#pagebreak()

// === 目录 ===
#outline(title: [目  录], depth: toc-depth, indent: 1.5em)


// === 正文 ===
#include "chapters/ch01.typ"
#include "chapters/ch02.typ"
#include "chapters/ch03.typ"
#include "chapters/ch04.typ"
#include "chapters/ch05.typ"
#include "chapters/ch06.typ"
#include "chapters/ch07.typ"
#include "chapters/ch08.typ"
#include "chapters/ch09.typ"
#include "chapters/ch10.typ"
#include "chapters/ch11.typ"
#include "chapters/ch12.typ"
#include "chapters/appendix1.typ"
#include "chapters/appendix2.typ"
#include "chapters/appendix3.typ"
