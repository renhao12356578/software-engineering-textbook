// 封面页
#align(center)[
  #v(40pt)
  #text(size: 18pt, font: ("Noto Serif CJK SC", "Source Han Serif SC", "SimSun"))[附录二]
  #v(40pt)
  #text(size: 22pt, weight: "bold", font: ("Noto Serif CJK SC", "Source Han Serif SC", "SimSun"))[×××系统]
  #v(30pt)
  #text(size: 28pt, weight: "bold", font: ("Noto Serif CJK SC", "Source Han Serif SC", "SimSun"))[软件概要设计说明书]
  #v(20pt)
  #text(size: 18pt, font: ("Noto Serif CJK SC", "Source Han Serif SC", "SimSun"))[系统结构设计]
  #v(80pt)
  #grid(
    columns: (auto, auto),
    column-gutter: 10pt,
    [#text(size: 14pt)[单位名称：]],
    [#underline("___________")],
  )
  #v(15pt)
  #grid(
    columns: (auto, auto),
    column-gutter: 10pt,
    [#text(size: 14pt)[创建日期：]],
    [#underline("___________")],
  )
]

#pagebreak()

// 修订记录
#align(center)[
  #v(30pt)
  #text(size: 18pt, weight: "bold", font: ("Noto Sans CJK SC", "Source Han Sans SC", "SimHei"))[文件修订记录]
  #v(20pt)
]

#figure(
  table(
    columns: 4,
    fill: (x, y) => if y == 0 { luma(220) } else if calc.odd(y) { luma(248) } else { none },
    stroke: 0.6pt + luma(160),
    inset: (x: 12pt, y: 6pt),
    [*版本*], [*修订人*], [*修订日期*], [*修订内容*],
    [1.0], [], [2013-05-14], [创建、编写文件初稿],
  ),
  caption: [文件修订记录],
) <tab-a2-rev>

#pagebreak()

// 目录（不进入全书目录）
#heading(outlined: false, bookmarked: false)[目录]
#outline(title: none)

#pagebreak()

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

#set heading(numbering: "1.1")
= 附录二 软件概要设计说明书模板

// 附录内部沿用模板原有编号，不再套用全书自动编号
#set heading(numbering: none)

== 1 概述

// 描述系统的总体概貌及系统建设的总体目标。

===文档约定

// 文档的描述内容是 XXXX 系统的概要设计说明书。

// 文档中涉及的各项功能来源于系统的需求分析规格说明书。

// 文档采用基于 UML 的面向对象建模方式对系统的功能进行结构设计。

// 功能的小节以需求分析规格说明书中的基本用例进行排序。

// 系统的结构设计由动态结构和静态结构组成，且静态结构通过动态结构汇总得到。

// 系统的动态结构组成：

#par(first-line-indent: 0em)[（1）每个基本用例及其子用例，对应有一张系统顺序图；]

#par(first-line-indent: 0em)[（2）用例实现的设计说明系统顺序图中的每个系统事件，进入软件系统后由哪个软件对象接收，并由哪些其他的软件对象协同工作，按照需求分析规格说明的要求返回规定的结果给使用者；]

#par(first-line-indent: 0em)[（3）每个系统事件的交互图使用 UML 的顺序图表示某一时刻软件对象的交互实例；]

#par(first-line-indent: 0em)[（4）系统顺序图中有多少个系统事件（比如，5 个），该用例实现的交互图就有多少个（5 个顺序图）；]

#par(first-line-indent: 0em)[（5）每个系统事件有明确的方法和参数定义。]

// 系统的静态结构组成：

#par(first-line-indent: 0em)[（1）系统的静态结构主要由软件类及其之间的关系表示，即类图；软件类之间的关系主要使用定向关联（表示一个软件类的方法调用另一个软件类的方法），在明确两个类之间有相互调用的情况下使用双向关联；]

#par(first-line-indent: 0em)[（2）系统结构过于复杂的情况下，通过包图的方式描述系统的宏观静态结构；包图主要使用依赖关系表示包和包之间的调用关系。]

// 文档中所有的 UML 图形均以 IBM RSA 8.0.3 版本的建模工具进行绘制。

===预期的读者和阅读建议

#figure(
  table(
    columns: (auto, auto, 1fr),
    fill: (x, y) => if y == 0 { luma(220) } else if calc.odd(y) { luma(248) } else { none },
    stroke: 0.6pt + luma(160),
    inset: (x: 8pt, y: 5pt), 
    [*编号*], [*预期读者*], [*阅读建议*],
    [1], [客户], [确认文档中给出的功能需求描述],
    [2], [开发方], [熟悉并掌握项目的各项功能要求],
  ),
  caption: [预期读者与阅读建议],
) <tab-a2-1>

===产品的范围

// 说明系统所涉及的子系统及相应的功能。

===参考文献

== 2 项目背景描述

// 说明系统建设的背景及系统建设目标，给出系统的总体架构示意图，重点突出 XX 系统平台门户和移动终端，以及其他子系统的建设要求，并给出每个部分的功能模块定义。

===运行环境

#figure(
  table(
    columns: (auto, auto, 1fr),
    fill: (x, y) => if y == 0 { luma(220) } else if calc.odd(y) { luma(248) } else { none },
    stroke: 0.6pt + luma(160),
    inset: (x: 8pt, y: 5pt), 
    [*编号*], [*名称*], [*运行环境*],
    [1], [应用服务器], [CentOS release 6.4],
    [2], [Web 服务器], [Tomcat 6.0.26],
    [3], [数据库], [Oracle 11g r2],
    [4], [数据存储], [Oracle RAC],
    [5], [并行计算平台], [Hadoop 0.20.2 / Hive 0.11.0],
    [6], [客户端], [IE8 及以上浏览器，Firefox，Google Chrome],
  ),
  caption: [运行环境],
) <tab-a2-2>

===设计和实现上的限制

#figure(
  table(
    columns: (auto, 1fr, auto),
    fill: (x, y) => if y == 0 { luma(220) } else if calc.odd(y) { luma(248) } else { none },
    stroke: 0.6pt + luma(160),
    inset: (x: 8pt, y: 5pt), 
    [*限制因素*], [*限制说明*], [*备注*],
    [必须采用的技术、工具、编程语言、数据库等], [B/S 混合结构，数据库采用 MySQL 数据库。其他无特殊限制], [无],
    [不能使用的技术、工具、编程语言、数据库等], [无特殊限制], [无],
    [企业策略、政策法规、业界标准], [必须遵守中华人民共和国的相关法律法规], [无],
    [硬件限制], [无特殊限制], [无],
    [性能限制], [无特殊限制], [无],
  ),
  caption: [设计和实现上的限制],
) <tab-a2-3>

===假定和依赖

#figure(
  table(
    columns: (auto, 1fr, auto),
    fill: (x, y) => if y == 0 { luma(220) } else if calc.odd(y) { luma(248) } else { none },
    stroke: 0.6pt + luma(160),
    inset: (x: 8pt, y: 5pt), 
    [*编号*], [*假设*], [*备注*],
    [1], [客户端操作系统 IE 8.0 以上或 Firefox 3.0 以上版本], [无],
    [2], [对现有业务、功能描述与实际情况基本相符合，对需求变更不影响系统框架大调整], [无],
  ),
  caption: [假设因素],
) <tab-a2-4>

#figure(
  table(
    columns: (auto, auto, 1fr, auto),
    fill: (x, y) => if y == 0 { luma(220) } else if calc.odd(y) { luma(248) } else { none },
    stroke: 0.6pt + luma(160),
    inset: (x: 8pt, y: 5pt), 
    [*编号*], [*依赖*], [*依赖说明*], [*备注*],
    [1], [MySQL], [业务数据存储在 MySQL 数据库中], [无],
    [2], [Tomcat], [系统 Web 发布通过 Tomcat 实现], [无],
  ),
  caption: [依赖因素],
) <tab-a2-5>

== 3 系统的技术架构说明

// 此处描述系统选择的技术基础架构，比如 EJB、Struts/Struts2、SSH 等分层架构；如果本文档涉及数据库结构设计，则须再次描述系统的数据存储架构，比如 Oracle RAC。

== 4 系统的动态结构设计说明

// 后续所有内容描述根据需求的每个用例的实现过程。

===模块名称（比如，数据采集）

====基本用例（用例编号和基本用例名称）

// 说明该基本用例对应的系统顺序图上每个系统事件的交互过程设计。

=====系统事件列表

// 下表给出该基本用例对应的系统顺序图上所有系统事件的名称和参数说明，其中用例一列说明该系统事件对应的用例名称（基本用例或是子用例）。

#figure(
  table(
    columns: (1fr, auto, 1fr),
    fill: (x, y) => if y == 0 { luma(220) } else if calc.odd(y) { luma(248) } else { none },
    stroke: 0.6pt + luma(160),
    inset: (x: 8pt, y: 5pt), 
    [*系统事件名称*], [*用例*], [*参数说明*],
    [insert_card(No., Bankid)], [取款], [1. No.: int; 2. Bankid: int; 3. Bankname: string],
    [input_pwd(pwd)], [验证密码], [1. pwd: string],
  ),
  caption: [系统事件列表示例],
) <tab-a2-6>

=====系统事件名\_1

// 此处将 RSA 对应的交互图截图粘贴，注意图的大小。

#figure(
  image("../img/fig_a2_1.png", width: 90%),
  caption: [系统事件交互图示例],
) <fig-a2-1>

// 注明：上图中的软件对象仅用于示意，实际建模时应根据用例与系统事件进行细化。

=====系统事件名\_2

=====系统事件名\_n

// 同上。


==== 4.1.2 基本用例（用例编号和基本用例名称）

// 说明该基本用例对应的系统顺序图上每个系统事件的交互过程设计。

===== 系统事件列表

// 下表给出该基本用例对应的系统顺序图上所有系统事件的名称和参数说明。

#figure(
  table(
    columns: (1fr, auto, 1fr),
    fill: (x, y) => if y == 0 { luma(220) } else if calc.odd(y) { luma(248) } else { none },
    stroke: 0.6pt + luma(160),
    inset: (x: 8pt, y: 5pt), 
    [*系统事件名称*], [*用例*], [*参数说明*],
    [], [], [],
    [], [], [],
  ),
  caption: [系统事件列表（4.1.2）],
)

===== 系统事件名\_1

// 此处将 RSA 对应的交互图截图粘贴，注意图的大小；截图命名建议采用“用例编号_系统事件名”，并与系统事件列表中的名称保持一致。

===== 系统事件名\_2

===== ……

===== 系统事件名\_n

// 同上。

== 5 系统的静态架构说明

// 此处描述根据系统动态结构获得的系统级及模块级的系统分层类图，用于描述系统的整体运行机制，以及每个模块或者用例的运行机制。

===系统级静态结构

// 此处描述系统级的静态结构，该静态结构基于所有的模块级或者用例级的静态结构；如果软件类过多，系统级静态结构通常使用 UML 的包图来描述。

=== 5.2 模块级（或用例级）静态结构

==== 模块\_1（比如，某功能模块的名称）

// 首先，建议在模块级进行系统的静态结构描述；其次，如果模块级所包含的软件类过多，则在模块级别上继续使用 UML 包图进行静态结构的描述。然后，在模块下创建第四级标题，以用例名称（基本用例）命名，并给出对应的 UML 类图。

==== 模块\_2

==== .......

==== 模块\_n
