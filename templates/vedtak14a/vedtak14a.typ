#import "/resources/vedtak14a/base.typ": base
#import "/resources/vedtak14a/partials/innledning.typ": innledning
#import "/resources/vedtak14a/partials/ungdomsgaranti.typ": ungdomsgaranti
#import "/resources/vedtak14a/partials/begrunnelse.typ": begrunnelse
#import "/resources/vedtak14a/partials/kilder.typ": kilder
#import "/resources/vedtak14a/partials/hjelp-skaffe.typ": hjelp-skaffe
#import "/resources/vedtak14a/partials/hjelp-beholde.typ": hjelp-beholde
#import "/resources/vedtak14a/partials/klage.typ": klage
#import "/resources/vedtak14a/partials/sporsmal.typ": sporsmal
#import "/resources/vedtak14a/partials/signatur.typ": signatur

#let data = json("/data/vedtak14a/vedtak14a.json")
#let malType = data.malType
#let malform = data.malform

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

#show: body => base(
  malform,
  data.mottaker,
  data.dato,
  data.at("utkast", default: false),
  body,
)

#innledning(malType, malform)

#if data.at("ungdomsgaranti", default: false) {
  ungdomsgaranti(malform)
}

#begrunnelse(malform, data.at("begrunnelse", default: ()))
#kilder(malform, malType, data.at("kilder", default: ()))

#if malType in skaffe-typer {
  hjelp-skaffe(malform)
}

#if malType in beholde-typer {
  hjelp-beholde(malform)
}

#klage(malform)
#sporsmal(malform)
#signatur(malform, data.at("veilederNavn", default: none), data.navKontor)
