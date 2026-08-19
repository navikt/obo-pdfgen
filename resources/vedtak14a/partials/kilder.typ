#let kilder(malform, malType, kilder) = {
  block(breakable: false, above: 26pt)[
    #if malform == "NN" [
      == Kjeldene vi har brukt i vurderinga
    ]
    #if malform == "NB" [
      == Kildene vi har brukt i vurderingen
    ]

    #if malform == "NN" [
      I vurderinga vår har vi brukt opplysningar frå desse kjeldene:
    ]
    #if malform == "NB" [
      I vurderingen vår har vi brukt opplysninger fra disse kildene:
    ]
  ]

  for kilde in kilder [
    - #kilde
  ]

  [
    #if malType != "STANDARD_INNSATS_SKAFFE_ARBEID_PROFILERING" {
      if malform == "NN" [
        I tillegg har vi sett på kva moglegheiter du har i arbeidsmarknaden.
      ]
      if malform == "NB" [
        I tillegg har vi sett på mulighetene dine i arbeidsmarkedet.
      ]
    }
    #if malType == "STANDARD_INNSATS_SKAFFE_ARBEID_PROFILERING" {
      if malform == "NN" [
        I tillegg har vi sett på kva moglegheiter du har i arbeidsmarknaden, og at du har vore i jobb i minst 6 av dei siste 12 månadene.
      ]
      if malform == "NB" [
        I tillegg har vi sett på mulighetene dine i arbeidsmarkedet, og at du har vært i jobb i minst 6 av de siste 12 månedene.
      ]
    }
    #if malform == "NN" [
      Du finn nokre av opplysningane vi har om deg på #box[nav.no/min-side].
    ]
    #if malform == "NB" [
      Du finner noen av opplysningene vi har om deg på #box[nav.no/min-side].
    ]
  ]
}
