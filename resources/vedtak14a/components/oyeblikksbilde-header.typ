#let oyeblikksbilde-header(mottaker) = {
  block(
    below: 48pt,
    image("/resources/vedtak14a/Nav-logo.svg", height: 16pt, alt: "Nav-logo")
  )

  block(below: 48pt)[
    #grid(
      columns: (82pt, 1fr),
      align: (left, left),
      "Navn:", mottaker.navn,
      "Fødselsnummer:", mottaker.fodselsnummer,
    )
  ]
}
