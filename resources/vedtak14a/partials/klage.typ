#import "tokens.typ" as t

#let klage(malform) = {
  block(breakable: false, above: t.space-above-heading)[
    == Du har rett til å klage

    #if malform == "NN" [
      Dersom du er ueinig i vurderinga, kan du klage innan tre veker frå datoen då vedtaket kom fram til deg. Du finn skjema og informasjon på #box[nav.no/klage].

      Meir informasjon om retten til å klage finn du på #box[nav.no/klagerettigheter].
    ]
    #if malform == "NB" [
      Hvis du er uenig i vurderingen, kan du klage innen tre uker fra datoen da vedtaket kom fram til deg. Du finner skjema og informasjon på #box[nav.no/klage].

      Mer informasjon om retten til å klage finner du på #box[nav.no/klagerettigheter].
    ]
  ]
}
