#let signatur(malform, veilederNavn, navKontor) = {
  block(above: 32pt)[
    #if malform == "NN" [
      Med vennleg helsing #linebreak()
    ]
    #if malform == "NB" [
      Med vennlig hilsen #linebreak()
    ]

    #if veilederNavn != none and veilederNavn != "" [
      #veilederNavn #linebreak()
    ]

    #navKontor
  ]
}
