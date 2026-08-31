#import "../theme.typ" as t
#import "../util.typ": by-malform

#let hjelp-beholde(malform) = {
  block(breakable: false, above: t.space-above-heading)[
    #by-malform(
      malform,
      [
        == Tenester du kan bruke

        På #box[nav.no] kan du

        - halde oversikt over arbeidsretta aktivitetar i aktivitetsplanen på #box[nav.no/aktivitetsplan]
      ],
      [
        == Tjenester du kan bruke

        På #box[nav.no] kan du

        - holde oversikt over arbeidsrettede aktiviteter i aktivitetsplanen på #box[nav.no/aktivitetsplan]
      ],
    )
  ]
}
