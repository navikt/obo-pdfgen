#import "../theme.typ" as t
#import "../util.typ": by-malform, nav-lenke

#let sporsmal(malform) = {
  block(breakable: false, above: t.space-above-heading)[
    == Har du spørsmål?

    #by-malform(
      malform,
      [
        Du finn meir informasjon på #nav-lenke("nav.no/arbeid").

        På #nav-lenke("nav.no/arbeid/dialog") kan du kontakte rettleiaren din.

        Om du ikkje finn svar på nav.no, kan du ringe oss på telefon 55 55 33 33, kvardagar 09:00–15:00.
      ],
      [
        Du finner mer informasjon på #nav-lenke("nav.no/arbeid").

        På #nav-lenke("nav.no/arbeid/dialog") kan du kontakte veilederen din.

        Hvis du ikke finner svar på nav.no, kan du ringe oss på telefon 55 55 33 33, hverdager 09:00–15:00.
      ],
    )
  ]
}
