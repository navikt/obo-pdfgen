#import "tokens.typ" as t

#let oyeblikk-style(body) = {
  set page(
    paper: "a4",
    margin: (top: t.margin-top, bottom: t.margin-bottom, left: t.margin-x, right: t.margin-x),
  )
  set text(
    font: t.font-family,
    fill: t.text-color,
    weight: t.style-body.weight,
    size: t.style-body.size,
  )
  set par(leading: t.leading-of(t.style-body), spacing: t.paragraph-spacing)
  set list(indent: 22pt, spacing: t.leading-of(t.style-body))

  show heading.where(level: 1): set text(size: t.style-h1.size, weight: t.style-h1.weight, tracking: t.style-h1.tracking)
  show heading.where(level: 1): set par(leading: t.leading-of(t.style-h1))
  show heading.where(level: 1): set block(above: t.space-above-h1, below: t.space-below-h1)

  show heading.where(level: 2): set text(size: t.style-h2.size, weight: t.style-h2.weight, tracking: t.style-h2.tracking)
  show heading.where(level: 2): set par(leading: t.leading-of(t.style-h2))
  show heading.where(level: 2): set block(above: t.space-above-heading, below: t.space-below-heading-compact)

  show heading.where(level: 3): set text(size: t.style-h3.size, weight: t.style-h3.weight, tracking: t.style-h3.tracking)
  show heading.where(level: 3): set par(leading: t.leading-of(t.style-h3))
  show heading.where(level: 3): set block(above: t.space-above-heading, below: t.space-below-heading-compact)

  show heading.where(level: 4): set text(size: t.style-h4.size, weight: t.style-h4.weight, tracking: t.style-h4.tracking)
  show heading.where(level: 4): set par(leading: t.leading-of(t.style-h4))
  show heading.where(level: 4): set block(above: t.space-above-heading, below: t.space-below-heading-compact)

  set page(footer: context {
    set text(size: t.style-footer.size)
    align(right)[
      Side #counter(page).display() av #counter(page).final().first()
    ]
  }, footer-descent: t.footer-from-bottom)

  body
}
