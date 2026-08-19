#let hjelp-beholde(malform) = {
  if malform == "NN" {
    block(breakable: false)[
      == Tenester du kan bruke

      På #box[nav.no] kan du

      - halde oversikt over arbeidsretta aktivitetar i aktivitetsplanen på #box[nav.no/aktivitetsplan]
    ]
  }

  if malform == "NB" {
    block(breakable: false)[
      == Tjenester du kan bruke

      På #box[nav.no] kan du

      - holde oversikt over arbeidsrettede aktiviteter i aktivitetsplanen på #box[nav.no/aktivitetsplan]
    ]
  }
}
