#import "../util.typ": by-malform, nav-lenke

#let skaffe-typer = (
  "STANDARD_INNSATS_SKAFFE_ARBEID",
  "STANDARD_INNSATS_SKAFFE_ARBEID_PROFILERING",
  "SITUASJONSBESTEMT_INNSATS_SKAFFE_ARBEID",
  "SPESIELT_TILPASSET_INNSATS_SKAFFE_ARBEID",
  "GRADERT_VARIG_TILPASSET_INNSATS_SKAFFE_ARBEID",
)
#let beholde-typer = (
  "STANDARD_INNSATS_BEHOLDE_ARBEID",
  "SITUASJONSBESTEMT_INNSATS_BEHOLDE_ARBEID",
  "SPESIELT_TILPASSET_INNSATS_BEHOLDE_ARBEID",
  "GRADERT_VARIG_TILPASSET_INNSATS_BEHOLDE_ARBEID",
)

#let hjelp(maltype, malform) = {
  if maltype in skaffe-typer {
    block(breakable: false)[
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
  if maltype in beholde-typer {
    block(breakable: false)[
      #by-malform(
        malform,
        [
          == Tenester du kan bruke

          På #nav-lenke("nav.no") kan du

          - halde oversikt over arbeidsretta aktivitetar i aktivitetsplanen på #nav-lenke("nav.no/aktivitetsplan")
        ],
        [
          == Tjenester du kan bruke

          På #nav-lenke("nav.no") kan du

          - holde oversikt over arbeidsrettede aktiviteter i aktivitetsplanen på #nav-lenke("nav.no/aktivitetsplan")
        ],
      )
    ]
  }
}
