#let hjelp-skaffe(malform) = {
  if malform == "NN" {
    block(breakable: false, above: 26pt)[
      == Tenester du kan bruke

      På #box[nav.no] kan du

      - få tips til å skrive CV og søknad og korleis du kan bu deg til jobbintervju på #box[nav.no/soker-jobb]
      - registrere CV-en din på #box[nav.no/min-cv] slik at Nav kan formidle den til aktuelle arbeidsgivarar
      - halde oversikt over jobbar du søkjer på og andre arbeidsretta aktivitetar i aktivitetsplanen på #box[nav.no/aktivitetsplan]
    ]
  }

  if malform == "NB" {
    block(breakable: false, above: 26pt)[
      == Tjenester du kan bruke

      På #box[nav.no] kan du

      - få tips til å skrive CV og søknad og hvordan du kan forberede deg til jobbintervju på #box[nav.no/soker-jobb]
      - registrere CV-en din på #box[nav.no/min-cv] slik at Nav kan formidle den til aktuelle arbeidsgivere
      - holde oversikt over jobber du søker på og andre arbeidsrettede aktiviteter i aktivitetsplanen på #box[nav.no/aktivitetsplan]
    ]
  }
}
