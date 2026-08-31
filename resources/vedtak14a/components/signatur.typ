#import "../theme.typ" as t
#import "../util.typ": by-malform

#let signatur(malform, veilederNavn, navKontor) = {
  block(above: t.space-before-signatur, below: t.space-after-signatur)[
    #by-malform(
      malform,
      [Med vennleg helsing #linebreak()],
      [Med vennlig hilsen #linebreak()]
    )
    #if veilederNavn != none and veilederNavn != "" [#veilederNavn #linebreak()]
    #navKontor
  ]
}
