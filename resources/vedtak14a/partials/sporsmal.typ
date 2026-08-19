#let sporsmal(malform) = {
  block(breakable: false)[
    == Har du spørsmål?

    #if malform == "NN" [
      Du finn meir informasjon på #box[nav.no/arbeid].

      På #box[nav.no/arbeid/dialog] kan du kontakte rettleiaren din.

      Om du ikkje finn svar på nav.no, kan du ringe oss på telefon 55 55 33 33, kvardagar 09:00–15:00.
    ]
    #if malform == "NB" [
      Du finner mer informasjon på #box[nav.no/arbeid].

      På #box[nav.no/arbeid/dialog] kan du kontakte veilederen din.

      Hvis du ikke finner svar på nav.no, kan du ringe oss på telefon 55 55 33 33, hverdager 09:00–15:00.
    ]
  ]
}
