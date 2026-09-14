#import "../util.typ": by-malform, nav-lenke

#let kilder(malform, malType, kilder) = {
  by-malform(
    malform,
    nn: [== Kjeldene vi har brukt i vurderinga],
    nb: [== Kildene vi har brukt i vurderingen])

  block(breakable: false)[
    #by-malform(
      malform, 
      nn: [I vurderinga vår har vi brukt opplysningar frå desse kjeldene:],
      nb: [I vurderingen vår har vi brukt opplysninger fra disse kildene:])

    #for kilde in kilder [
      - #kilde
    ]

    #if malType == "STANDARD_INNSATS_SKAFFE_ARBEID_PROFILERING" {
      by-malform(
        malform,
        nn: [I tillegg har vi sett på kva moglegheiter du har i arbeidsmarknaden, og at du har vore i jobb i minst 6 av dei siste 12 månadene.],
        nb: [I tillegg har vi sett på mulighetene dine i arbeidsmarkedet, og at du har vært i jobb i minst 6 av de siste 12 månedene.],
      )
    } else {
      by-malform(
        malform,
        nn: [I tillegg har vi sett på kva moglegheiter du har i arbeidsmarknaden.],
        nb: [I tillegg har vi sett på mulighetene dine i arbeidsmarkedet.],
      )
    }
    #by-malform(
      malform,
      nn: [Du finn nokre av opplysningane vi har om deg på #nav-lenke("nav.no/min-side").],
      nb: [Du finner noen av opplysningene vi har om deg på #nav-lenke("nav.no/min-side").]
    )
  ]
}
