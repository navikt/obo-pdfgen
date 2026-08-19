#let oyeblikk-style(body) = {
  set page(
    paper: "a4",
    margin: (top: 64pt, bottom: 74pt, left: 64pt, right: 64pt),
  )
  set text(
    font: "Source Sans 3",
    weight: 400,
    size: 11pt,
  )
  set par(leading: 16pt - 11pt, spacing: 11pt)

  show heading.where(level: 1): set text(size: 16pt)
  show heading.where(level: 1): set block(above: 48pt, below: 26pt)
  show heading.where(level: 2): set text(size: 13pt)
  show heading.where(level: 2): set block(above: 26pt, below: 6pt)
  show heading.where(level: 3): set text(size: 12pt)
  show heading.where(level: 3): set block(above: 26pt, below: 6pt)

  set list(spacing: par.leading)

  set page(footer: context {
    set text(size: 9pt)
    align(right)[
      Side #counter(page).display() av #counter(page).final().first()
    ]
  })

  body
}
