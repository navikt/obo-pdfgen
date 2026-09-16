#set document(
  title: "Vedtak § 14 a",
  author: "Nav",
)

#import "/resources/vedtak14a/debug.typ": baseline-overlay, debug-baseline
#import "/resources/vedtak14a/lib.typ": *

#let data = json("/data/vedtak14a/vedtak14a.json")
#let maltype = data.malType
#let malform = data.malform

#show: body => style( // Legger på stylingen som er definert i style.typ
  body,
  utkast: data.at("utkast", default: false),
  foreground: if debug-baseline { baseline-overlay } else { none }, // Sett `debug-baseline` til `true` i debug.typ for å se grid
)

#let nav-logo = block(
  below: 48pt,
  image("/resources/vedtak14a/Nav-logo.svg", height: 16pt, alt: "Nav-logo")
)

#let unntattOffentlig = emph(
  by-malform(
    malform,
    nn: [Unntatt offentlegheita],
    nb: [Unntatt offentligheten]
  )
)

#let mottaker-info = block(below: 48pt)[
  #grid(
    columns: (82pt, 1fr, 101pt),
    align: (left, left, right),
    "Navn:", data.mottaker.navn, data.dato,
    "Fødselsnummer:", data.mottaker.fodselsnummer, [#unntattOffentlig],
  )
]

// Brevmal

#nav-logo

#mottaker-info

#innledning(maltype, malform)

#if data.at("ungdomsgaranti", default: false) {
  ungdomsgaranti(malform)
}

#begrunnelse(malform, data.at("begrunnelse", default: ()))

#kilder(malform, maltype, data.at("kilder", default: ()))

#hjelp(maltype, malform)

#klage(malform)

#sporsmal-og-signatur(malform, data.at("veilederNavn", default: none), data.navKontor)
