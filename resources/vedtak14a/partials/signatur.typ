#import "tokens.typ" as t

#let signatur(malform, veilederNavn, navKontor) = {
  block(above: t.space-before-signatur, below: t.space-after-signatur)[
    #if malform == "NN" [Med vennleg helsing #linebreak()]
    #if malform == "NB" [Med vennlig hilsen #linebreak()]
    #if veilederNavn != none and veilederNavn != "" [#veilederNavn #linebreak()]
    #navKontor
  ]
}
