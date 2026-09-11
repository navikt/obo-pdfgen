#import "../util.typ": by-malform, nav-lenke

#let klage(malform) = {
  block(breakable: false)[
    == Du har rett til å klage

    #by-malform(
      malform,
      nn: [
        Dersom du er ueinig i vurderinga, kan du klage innan tre veker frå datoen då vedtaket kom fram til deg. Du finn skjema og informasjon på #nav-lenke("nav.no/klage").

        Meir informasjon om retten til å klage finn du på #nav-lenke("nav.no/klagerettigheter").
      ],
      nb: [
        Hvis du er uenig i vurderingen, kan du klage innen tre uker fra datoen da vedtaket kom fram til deg. Du finner skjema og informasjon på #nav-lenke("nav.no/klage").

        Mer informasjon om retten til å klage finner du på #nav-lenke("nav.no/klagerettigheter").
      ],
    )
  ]
}
