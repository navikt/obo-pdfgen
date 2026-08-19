#let hjelp-beholde(malform) = {
  if malform == "NN" {
    block(breakable: false, above: 26pt)[
      == Tenester du kan bruke

      På #box[nav.no] kan du

      - halde oversikt over arbeidsretta aktivitetar i aktivitetsplanen på #box[nav.no/aktivitetsplan]
    ]
  }

  if malform == "NB" {
    block(breakable: false, above: 26pt)[
      == Tjenester du kan bruke

      På #box[nav.no] kan du

      - holde oversikt over arbeidsrettede aktiviteter i aktivitetsplanen på #box[nav.no/aktivitetsplan]
    ]
  }
}
