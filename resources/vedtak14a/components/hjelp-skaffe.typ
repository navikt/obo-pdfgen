#import "../theme.typ" as t
#import "../util.typ": by-malform, nav-lenke

#let hjelp-skaffe(malform) = {
  block(breakable: false, above: t.space-above-heading)[
    #by-malform(
      malform,
      [
        == Tenester du kan bruke

        På #nav-lenke("nav.no") kan du

        - få tips til å skrive CV og søknad og korleis du kan bu deg til jobbintervju på #nav-lenke("nav.no/soker-jobb")
        - registrere CV-en din på #nav-lenke("nav.no/min-cv") slik at Nav kan formidle den til aktuelle arbeidsgivarar
        - halde oversikt over jobbar du søkjer på og andre arbeidsretta aktivitetar i aktivitetsplanen på #nav-lenke("nav.no/aktivitetsplan")
      ],
      [
        == Tjenester du kan bruke

        På #nav-lenke("nav.no") kan du

        - få tips til å skrive CV og søknad og hvordan du kan forberede deg til jobbintervju på #nav-lenke("nav.no/soker-jobb")
        - registrere CV-en din på #nav-lenke("nav.no/min-cv") slik at Nav kan formidle den til aktuelle arbeidsgivere
        - holde oversikt over jobber du søker på og andre arbeidsrettede aktiviteter i aktivitetsplanen på #nav-lenke("nav.no/aktivitetsplan")
      ],
    )
  ]
}
