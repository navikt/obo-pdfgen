// Felles styling for brevmalene. Brukes med `#show: style` i malen,
// siden `#import` bare henter bindinger og ikke kjører set/show-regler.
#let style(body, utkast: false, foreground: none) = {
  set page(
    paper: "a4",
    margin: (top: 64pt, x: 64pt, bottom: 74pt),
    footer: context [
      #set align(right)
      #set text(size: 9pt)
      side #counter(page).display() av #counter(page).final().first()
    ],
    footer-descent: 16pt, // Hvor langt ned i bunnmargen skal footeren dyttes
    background: if utkast {
      place(
        center + horizon,
        rotate(-45deg, text(size: 150pt, weight: "bold", fill: rgb("#e2e2e2"))[UTKAST]),
      )
    },
    foreground: foreground,
  )
  set text(
    font: "Source Sans 3",
    fill: rgb("#000000"),
    weight: 375,
    size: 11pt,
    top-edge: 16pt
  )
  show heading.where(level: 1): it => {
    set text(size: 16pt, tracking: 0.3pt, weight: "bold") // tracking = letterspacing
    set block(below: 26pt) // 26 px under H1
    it
  }
  show heading.where(level: 2): set text(size: 13pt, tracking: 0.25pt, weight: "bold")
  show heading.where(level: 3): set text(size: 12pt, tracking: 0.2pt, weight: "bold")
  show heading.where(level: 4): set text(size: 11pt, tracking: 0.1pt, weight: "bold")
  show heading.where(level: 2).or(heading.where(level: 3)).or(heading.where(level: 4)): set block(above: 26pt, below: 6pt) // 26 px over, 6 px under H2-H4
  set par(
    leading: 0pt, // Ønsker ikke ekstra mellomrom mellom linjer i samme avsnitt, linjehøyden bestemmer
    spacing: 16pt // Mellom avsnitt i brødtekst brukes et vanlig linjeskift.
  )
  set list(indent: 8pt) // 8px innrykk i punktlister, ikke eksplisitt skrevet i retningslinjene, men vises i alle eksempler
  show list: set block(above: 0pt)

  body
}
