#import "../util.typ": by-malform, nav-lenke

#let sporsmal-og-signatur(malform, veilederNavn, navKontor) = {
  [== Har du spørsmål?]
  
  block(breakable: false)[

    #by-malform(
      malform,
      nn: [
        Du finn meir informasjon på #nav-lenke("nav.no/arbeid").

        På #nav-lenke("nav.no/arbeid/dialog") kan du kontakte rettleiaren din.

        Om du ikkje finn svar på nav.no, kan du ringe oss på telefon 55 55 33 33, kvardagar 09:00–15:00.
      ],
      nb: [
        Du finner mer informasjon på #nav-lenke("nav.no/arbeid").

        På #nav-lenke("nav.no/arbeid/dialog") kan du kontakte veilederen din.

        Hvis du ikke finner svar på nav.no, kan du ringe oss på telefon 55 55 33 33, hverdager 09:00–15:00.
      ],
    )

    block(above: 32pt, below: 40pt)[
      #by-malform(
        malform,
        nn: [Med vennleg helsing #linebreak()],
        nb: [Med vennlig hilsen #linebreak()]
      )
      #if veilederNavn != none and veilederNavn != "" [#veilederNavn #linebreak()]
      #navKontor
    ]
  ]
}
