// 封面页
#align(center)[
  #v(100pt)
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
) <tab-a1-rev>

#pagebreak()

// 目录
#outline(title: [目录])

#pagebreak()

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

= 附录一 软件概要设计说明书模板

== 1 概述

// 描述系统的总体概况及系统建设的总体目标。

=== 文档约定

// 文档的描述内容是 XXXX 系统的概要设计说明书。

// 文档的功能需求列表参照双方共同认可的报价列表内容。

// 文档采用基于 UML 建模语言的面向对象建模方式对功能需求进行描述。

// 需要描述的功能都有对应的用例编号。

// 针对某一特定角色的功能都由下面三项内容进行需求内容的详细说明：

#par(first-line-indent: 0em)[（1）用例图：一个图可以包含多个基本用例，每个基本用例也可以具有多个扩展和包含类型的子用例。]

#par(first-line-indent: 0em)[（2）用例说明：描述基本用例和子用例的详细说明。]

#par(first-line-indent: 0em)[（3）系统顺序图：只针对基本用例进行 UML 图形化描述；基本用例具有扩展和包含用例的，也只需绘制一张系统顺序图，在图上表明角色与子用例的消息交互即可。除此之外，还需明确消息的名称以及消息中包含的参数名称和数据类型（如果已经编码可参照方法调用的名称以及相应的参数名称）。]

// 文档中所有的 UML 图形均以 IBM RSA 8.0.3 版本的建模工具进行绘制。

// 性能需求以文字和列表的方式具体给出。

=== 预期的读者和阅读建议

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
) <tab-a1-1>

=== 产品的范围

// 说明系统所涉及的子系统及相应的功能。

=== 参考文献

== 2 项目背景描述

// 说明系统建设的背景及系统建设目标，给出系统的总体架构示意图，重点突出 XX 系统平台门户和移动终端，以及其他子系统的建设要求，并给出每个部分的功能模块定义。

=== 运行环境

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
) <tab-a1-2>

=== 设计和实现上的限制

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
) <tab-a1-3>

=== 假定和依赖

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
) <tab-a1-4>

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
) <tab-a1-5>

== 3 系统的技术架构说明

=== X_1 功能名称（比如，能耗数据分析）

// 说明：例如某系统"能耗数据分析"模块，注意此处是功能列表中的某一级功能，图中的用例不应少于功能列表中的内容。

=== 3.1.1 用例图

#figure(
  image("img/fig_a1_1.png", width: 80%),
  caption: [能耗数据分析模块用例图示例],
) <fig-a1-1>

// 用例的粒度问题也是需要特别关注的，比如功能列表中的第二级中的"结构分析"可以表示为该角色对应的基本用例"能耗结构分析"，其中"场所级结构分析""企业级结构分析"可以作为该基本用例的扩展子用例，或者作为该基本用例的继承子用例。

=== 3.1.2 角色定义

// 角色名称：明确给出使用该用例角色的名称定义，比如：销售。

// 角色职责：定义该角色在该用例范围内的主要职责（尽量以业务职责定义，而非系统角色职责）。

=== 3.1.3 用例：企业级结构分析

*1. 用例说明*

// 按照下面模板进行用例交互的说明，尽量以"无软件系统时"该角色如何执行该业务功能的操作次序为准，并避免使用技术词汇进行描述。

#figure(
  table(
    columns: (auto, 1fr),
    fill: (x, y) => if y == 0 { luma(220) } else if calc.odd(y) { luma(248) } else { none },
    stroke: 0.6pt + luma(160),
    inset: (x: 8pt, y: 5pt),
    [*字段*], [*内容*],
    [用例编号], [UC_C_03_01],
    [用例名称], [],
    [范围], [],
    [级别], [],
    [主要参与人], [],
    [前置条件], [],
    [后置条件], [],
    [主要成功场景], [1.\n2.\n3.],
    [扩展（或替代流程）], [],
  ),
  caption: [用例说明模板],
) <tab-a1-6>

*2. 系统顺序图*

// 使用 RSA 8.0.3 为每一个"基本用例"定义相应的角色与系统之间的事件交互图，进一步明确用例说明中每一条消息的名称和参数定义。

*3. 操作契约*

// 针对每个基本用例的系统顺序图上出现的系统事件，结合并参考领域模型的结果，给出每个系统事件为了能够得到约定的返回值，说明系统事件作用于领域模型中概念类的三种操作：对象的创建或删除、对象之间的关联建立或者删除、对象属性值的修改。

=== X_2 功能（比如，数据采集）

// 下面内容同 X_1 功能。

== 4 其他非功能需求

// 此处明确给出甲方对于应用系统各功能模块的性能指标，主要涉及响应时间、响应周期和吞吐量三项指标。

== 5 附录

=== 功能列表
