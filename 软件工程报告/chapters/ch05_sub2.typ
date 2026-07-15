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

#set heading(numbering: "1.1")

#show heading: it => {
  let level = it.level
  let body = it.body
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

金额\>\$500