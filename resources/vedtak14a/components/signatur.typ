#import "../util.typ": by-malform

#let signatur(malform, veilederNavn, navKontor) = {
  block(above: 32pt, below: 40pt)[
    #by-malform(
      malform,
      nn: [Med vennleg helsing #linebreak()],
      nb: [Med vennlig hilsen #linebreak()]
    )
    #if veilederNavn != none and veilederNavn != "" [#veilederNavn #linebreak()]
    #navKontor
  ]
}
