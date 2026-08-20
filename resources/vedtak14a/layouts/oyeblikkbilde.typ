#import "../theme.typ" as t
#import "../nav-logo.typ": nav-logo

#let oyeblikkbilde-header(mottaker) = {
  nav-logo

  grid(
    columns: (100pt, 1fr),
    inset: (x: 0pt, y: t.row-inset-y),
    align: (left + top, left + top),
    [Navn:], [#mottaker.navn],
    [Fødselsnummer:], [#mottaker.fodselsnummer],
  )
}
