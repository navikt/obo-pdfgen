#import "../util.typ": by-malform

#let signatur(malform, veilederNavn, navKontor) = {
  block(above: 32pt, below: 40pt)[
    #by-malform(
      malform,
      [Med vennleg helsing #linebreak()],
      [Med vennlig hilsen #linebreak()]
    )
    #if veilederNavn != none and veilederNavn != "" [#veilederNavn #linebreak()]
    #navKontor
  ]
}
