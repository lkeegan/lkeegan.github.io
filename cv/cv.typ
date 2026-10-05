// Build from the repository root with:
//   typst compile --root . cv/cv.typ docs/CV-Liam-Keegan.pdf

#let positions = yaml("/_data/cv.yml")
#let profile = yaml("profile.yml")
#let physics = yaml("physics.yml")
#let projects = yaml("/_data/projects.yml")
#let open-source = yaml("/_data/open-source.yml")
#let teaching = yaml("/_data/teaching.yml")

#let dark = rgb("#434343")
#let light-blue = rgb("#c9daf8")
#let light-grey = rgb("#efefef")
#let link-blue = rgb("#1155cc")

#set document(title: profile.name + " - CV", author: profile.name)
#set text(font: "Liberation Sans", size: 10.5pt, lang: "en")
#set par(leading: 0.58em, spacing: 0.58em)
// Avoid line breaks within "C++"
#show "C++": box
#show link: it => text(fill: link-blue, underline(it))
#set list(
  marker: text(size: 0.75em, baseline: -0.1em)[■],
  indent: 1.2em,
  body-indent: 1em,
  spacing: 0.58em,
)
#set enum(indent: 0.4em, body-indent: 0.9em, spacing: 0.8em)

// Converts markdown-style "[text](url)" and html "<a href="url">text</a>"
// links in a string to links.
#let md(s) = {
  s = s.replace(regex("<a href=\"([^\"]+)\">([^<]+)</a>"), m => (
    "[" + m.captures.at(1) + "](" + m.captures.at(0) + ")"
  ))
  let parts = ()
  let pos = 0
  for m in s.matches(regex("\[([^\]]+)\]\(([^)]+)\)")) {
    parts.push(s.slice(pos, m.start))
    parts.push(link(m.captures.at(1), m.captures.at(0)))
    pos = m.end
  }
  parts.push(s.slice(pos))
  parts.join()
}

// Shows a link with the url as its text, without the https:// prefix.
#let url-link(url) = box(link(url, url.replace(regex("^https?://"), "")))

#let years(s) = str(s).replace("-", " – ")

#let section-title(title) = block(
  above: 0pt,
  below: 4.5mm,
  text(size: 14pt, weight: "bold", title),
)

// Grey box with a dark line above, below and between each item.
#let boxed-list(items, inset: (x: 2mm, y: 1.8mm)) = {
  let line-stroke = 1pt + dark
  block(
    width: 100%,
    fill: light-grey,
    stroke: (top: line-stroke, bottom: line-stroke),
    spacing: 0pt,
    {
      set block(spacing: 0pt)
      items
        .map(item => block(width: 100%, inset: inset, item))
        .join(line(length: 100%, stroke: line-stroke))
    },
  )
}

#let blue-box(body) = block(
  width: 100%,
  fill: light-blue,
  inset: (x: 2mm, y: 2.2mm),
  below: 2mm,
  align(center, body),
)

#let position-entry(p) = [
  *#years(p.year): #p.position* \
  #p.organization, #p.location
  #list(..p.bullets.map(md))
]

#let skills-entry(s) = [
  *#s.category*
  #v(2.5mm)
  #list(..s.items)
]

#let vertical-divider(x, from, to) = place(
  top + left,
  dx: x,
  dy: from,
  line(angle: 90deg, length: to - from, stroke: (paint: dark, thickness: 0.6pt, dash: "dotted")),
)

// Page 1: profile, experience, education and skills

#set page(
  paper: "a4",
  margin: (top: 0mm, bottom: 9mm, left: 2.5mm, right: 2mm),
  background: {
    place(top, rect(width: 100%, height: 27.5mm, fill: dark))
    place(bottom, rect(width: 100%, height: 6.5mm, fill: dark))
    vertical-divider(53mm, 27.5mm, 290.5mm)
    vertical-divider(139.5mm, 27.5mm, 290.5mm)
  },
)

#block(height: 27.5mm, inset: (left: 7mm), below: 3.5mm, align(horizon, text(fill: white)[
  #text(size: 24pt, weight: "bold", profile.name) \
  #v(-1mm)
  #text(size: 16pt, profile.title)
]))

#grid(
  columns: (48.5mm, 83mm, 66.5mm),
  column-gutter: (4mm, 3.5mm),
  [
    #image("photo.jpg", width: 100%)
    #v(1.2mm)
    #for c in profile.contact {
      blue-box(if "url" in c { link(c.url, c.text) } else { c.text })
    }
    #v(5mm)
    #section-title[About me]
    #set text(size: 11.5pt)
    #for a in profile.about { blue-box(a) }
  ],
  [
    #section-title[Experience]
    #boxed-list(positions.filter(p => not p.at("education", default: false)).map(position-entry))
    #v(6mm)
    #section-title[Education]
    #boxed-list(positions.filter(p => p.at("education", default: false)).map(position-entry))
  ],
  [
    #section-title[Skills]
    #boxed-list(
      profile.skills.map(skills-entry)
        + (
          [
            *Languages*
            #v(2.5mm)
            #list(..profile.languages.map(l => [#l.language: #h(0.4em) _#l.level _]))
          ],
        ),
      inset: (x: 2mm, y: 3.5mm),
    )
  ],
)

// Page 2: projects, teaching, open source and physics research

#set page(
  margin: (top: 10mm, bottom: 9mm, left: 2mm, right: 2mm),
  background: {
    place(top, rect(width: 100%, height: 7mm, fill: dark, inset: (x: 1.5mm), align(
      left + horizon,
      text(size: 13pt, fill: white, profile.name + " - " + profile.title),
    )))
    place(bottom, rect(width: 100%, height: 6.5mm, fill: dark))
    vertical-divider(139.5mm, 7mm, 290.5mm)
  },
)

#set text(size: 9pt)
#set par(leading: 0.5em, spacing: 0.5em)

#let year-range(item) = if item.start_year == item.end_year {
  str(item.end_year)
} else [#item.start_year – #item.end_year]

#let tags(item) = text(fill: luma(90), item.at("tags", default: ()).join(" · "))

#let quoted-title(title) = emph["#title."]

#let project-entry(p) = [
  #link(p.url)[*#p.title*] (#year-range(p)) \
  #md(p.desc) \
  #tags(p)
]

#let intro(body) = block(below: 3mm, body)

// Shows as many words of the text as fit on one line, followed by "…".
#let one-line(text) = layout(size => {
  if measure(text).width <= size.width { return text }
  let words = text.split(" ")
  let shortened(n) = words.slice(0, n).join(" ").trim(regex("[,;:.]"), at: end) + "…"
  let (lo, hi) = (0, words.len())
  while lo < hi {
    let mid = calc.div-euclid(lo + hi + 1, 2)
    if measure(shortened(mid)).width <= size.width { lo = mid } else { hi = mid - 1 }
  }
  shortened(lo)
})

#let teaching-items(section) = section.items.map(c => [
  #link(c.link)[*#c.title*] (#c.years.map(str).join(", "))
  #block(above: 0.5em, width: 100%, one-line(c.summary))
])

#let open-source-list = [
  #open-source.sorted(key: c => -c.end_year).map(c => box[#link(c.code, c.project) (#year-range(c))]).join(", ").
]

#grid(
  columns: (135mm, 66.5mm),
  column-gutter: 4.5mm,
  [
    #section-title[Selected Software Projects]
    #boxed-list(
      projects.filter(p => p.at("cv", default: true)).sorted(key: p => -p.end_year).map(project-entry),
    )
    #v(6mm)
    #section-title[Teaching]
    #let courses = teaching.find(s => s.title == "Compact Courses")
    #intro[#md(courses.description):]
    #boxed-list(teaching-items(courses))
  ],
  [
    #section-title[Talks]
    #for (i, section) in teaching.filter(s => s.title in ("Lunch Time Python", "Talks")).enumerate() {
      if i > 0 { v(4mm) }
      intro[#md(section.description):]
      boxed-list((list(..section.items.map(c => [#link(c.link, c.title) (#c.years.map(str).join(", "))])),))
    }
    #v(6mm)
    #section-title[Open Source Contributions]
    #intro[Bug fixes and improvements contributed to:]
    #boxed-list((open-source-list,))
    #v(6mm)
    #section-title[Physics Research]
    #boxed-list((
      [
        PhD and postdoctoral research in theoretical particle physics:
        #physics.publications.len() journal publications,
        #physics.proceedings.len() conference proceedings and
        #(physics.talks.len() + physics.seminars.len()) conference talks and seminars.
        Full list on #link("https://inspirehep.net/authors/1068105")[INSPIRE].
      ],
    ))
  ],
)
