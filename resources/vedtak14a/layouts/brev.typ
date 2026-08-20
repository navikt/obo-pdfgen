#import "brev-style.typ": style
#import "../theme.typ" as t
#import "../nav-logo.typ": nav-logo

#let base(malform, mottaker, dato, utkast, body) = {
  set document(
    title: "Vedtak § 14 a",
    author: "Nav",
    description: "Vedtak § 14 a",
  )

  show: style

  set page(
    footer: context {
      set text(size: t.style-footer.size)
      align(right)[
        Side #counter(page).display() av #counter(page).final().first()
      ]
    },
    footer-descent: t.footer-from-bottom,
    background: if utkast {
      place(
        center + horizon,
        rotate(-45deg, text(size: 150pt, weight: "bold", fill: rgb("#e2e2e2"))[UTKAST]),
      )
    },
  )

  // Header
  nav-logo

  table(
    columns: (82pt, 1fr, 11pt, 95pt),
    stroke: none,
    inset: (x: 0pt, y: t.row-inset-y),
    align: (left + top, left + top, left + top, right + top),
    table.cell(align: left + top)[Navn:],
    table.cell(colspan: 2)[#mottaker.navn],
    [#dato],
    [Fødselsnummer:],
    [#mottaker.fodselsnummer],
    table.cell(colspan: 2, align: right + top)[
      #emph[
        #if malform == "NN" [Unntatt offentlegheita]
        #if malform == "NB" [Unntatt offentligheten]
      ]
    ],
  )

  // Content
  body
}
