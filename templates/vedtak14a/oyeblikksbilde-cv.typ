#import "/resources/vedtak14a/lib.typ": *

#let data = json("/data/vedtak14a/oyeblikksbilde-cv.json")
#let sistEndret = data.at("sistEndret", default: none)
#let jobbprofil = data.at("jobbprofil", default: (:))

#let fagdok-type-label(v) = (
  "AUTORISASJON": "Autorisasjon",
  "MESTERBREV": "Mesterbrev",
  "SVENNEBREV_FAGBREV": "Fagbrev/Svennebrev",
).at(v, default: "")

#let ansettelsesform-label(v) = (
  "FAST": "Fast",
  "VIKARIAT": "Vikariat",
  "ENGASJEMENT": "Engasjement",
  "PROSJEKT": "Prosjekt",
  "SESONG": "Sesong",
  "TRAINEE": "Trainee",
  "LAERLING": "Lærling",
  "SELVSTENDIG_NAERINGSDRIVENDE": "Selvstendig næringsdrivende",
  "FERIEJOBB": "Feriejobb",
  "ANNET": "Annet",
).at(v, default: "")

#let arbeidstid-label(v) = (
  "DAGTID": "Dagtid",
  "KVELD": "Kveld",
  "NATT": "Natt",
  "UKEDAGER": "Ukedager",
  "LOERDAG": "Lørdag",
  "SOENDAG": "Søndag",
  "SKIFT": "Skift",
  "VAKT": "Vakt",
  "TURNUS": "Turnus",
).at(v, default: "")

#let oppstart-label(v) = (
  "LEDIG_NAA": "Kan begynne nå",
  "ETTER_TRE_MND": "Har 3 måneders oppsigelse",
  "ETTER_AVTALE": "Kan begynne etter nærmere avtale",
).at(v, default: "")

#let sprak-niva-label(v) = (
  "FOERSTESPRAAK": "Førstespråk (morsmål)",
  "VELDIG_GODT": "Veldig godt",
  "GODT": "Godt",
  "NYBEGYNNER": "Nybegynner",
  "IKKE_OPPGITT": "Ikke oppgitt",
).at(v, default: "")

#let varighet-label(v) = {
  let n = v.varighet
  let e = v.tidsenhet
  if n == none { return "" }
  let entall = n == 1
  let ord = if e == "TIME" { if entall { "time" } else { "timer" } }
    else if e == "DAG" { if entall { "dag" } else { "dager" } }
    else if e == "UKE" { if entall { "uke" } else { "uker" } }
    else if e == "MND" { if entall { "måned" } else { "måneder" } }
    else { "" }
  str(n) + " " + ord
}

#set document(title: "CV-en/jobbønskene dine på nav.no", author: "Nav")

#show: body => oyeblikksbilde-style( // Legger på stylingen som er definert i oyeblikksbilde-style.typ
  body,
  utkast: data.at("utkast", default: false)
)

// Mal

#oyeblikksbilde-header(data.mottaker)

= CV-en/jobbønskene dine på nav.no

#if sistEndret != none {
  json-key[Sist endret: ]
  iso_to_long_date(sistEndret)

  [== CV]

  if data.at("sammendrag", default: none) != none {
    [#json-key[Sammendrag: ]#data.sammendrag]
  }

  section("Utdanninger", data.at("utdanning", default: ()), u => build-list((
    field-or-none("Tittel:", u.at("tittel", default: none)),
    field-or-none("Sted:", u.at("studiested", default: none)),
    field-or-none("Utdanningsnivå:", u.at("utdanningsnivaa", default: none)),
    date-field-or-none("Fra dato:", u.at("fraDato", default: none)),
    date-field-or-none("Til dato:", u.at("tilDato", default: none)),
    field-or-none("Beskrivelse:", u.at("beskrivelse", default: none)),
  )))

  section("Fagbrev", data.at("fagdokumentasjoner", default: ()), f => build-list((
    field-or-none("Tittel:", f.at("tittel", default: none)),
    field-or-none("Type:", labeled(f.at("type", default: none), fagdok-type-label)),
  )))

  section("Arbeidsforhold", data.at("arbeidserfaring", default: ()), a => build-list((
    field-or-none("Tittel:", a.at("tittel", default: none)),
    field-or-none("Arbeidsgiver:", a.at("arbeidsgiver", default: none)),
    field-or-none("Sted:", a.at("sted", default: none)),
    date-field-or-none("Fra dato:", a.at("fraDato", default: none)),
    date-field-or-none("Til dato:", a.at("tilDato", default: none)),
    field-or-none("Beskrivelse:", a.at("beskrivelse", default: none)),
  )))

  section("Andre erfaringer", data.at("annenErfaring", default: ()), a => build-list((
    field-or-none("Rolle:", a.at("rolle", default: none)),
    field-or-none("Beskrivelse:", a.at("beskrivelse", default: none)),
    date-field-or-none("Startdato:", a.at("fraDato", default: none)),
    date-field-or-none("Sluttdato:", a.at("tilDato", default: none)),
  )))

  simple-section("Kompetanser", jobbprofil.at("kompetanse", default: ()), "tittel")

  section("Offentlige godkjenninger", data.at("godkjenninger", default: ()), g => build-list((
    field-or-none("Tittel:", g.at("tittel", default: none)),
    field-or-none("Utsteder:", g.at("utsteder", default: none)),
    date-field-or-none("Fullført:", g.at("gjennomfortDato", default: none)),
    date-field-or-none("Utløper:", g.at("utloperDato", default: none)),
  )))

  section("Andre godkjenninger", data.at("andreGodkjenninger", default: ()), g => build-list((
    field-or-none("Tittel:", g.at("tittel", default: none)),
    field-or-none("Utsteder:", g.at("utsteder", default: none)),
    date-field-or-none("Fullført:", g.at("gjennomfortDato", default: none)),
    date-field-or-none("Utløper:", g.at("utloperDato", default: none)),
  )))

  section("Språk", data.at("sprak", default: ()), s => build-list((
    field-or-none("Språk:", s.at("sprak", default: none)),
    field-or-none("Muntlig:", labeled(s.at("muntligNiva", default: none), sprak-niva-label)),
    field-or-none("Skriftlig:", labeled(s.at("skriftligNiva", default: none), sprak-niva-label)),
  )))

  section("Førerkort", data.at("forerkort", default: ()), f => build-list((
    field-or-none("Klasse:", f.at("klasse", default: none)),
  )))

  section("Kurs", data.at("kurs", default: ()), k => build-list((
    field-or-none("Tittel:", k.at("tittel", default: none)),
    field-or-none("Arrangør:", k.at("arrangor", default: none)),
    date-field-or-none("Fullført:", k.at("tidspunkt", default: none)),
    field-or-none("Kurslengde:", labeled(k.at("varighet", default: none), varighet-label)),
  )))

  [== Jobbønsker]

  simple-section("Ønsket yrke", jobbprofil.at("onsketYrke", default: ()), "tittel")

  simple-section("Ønsket arbeidssted", jobbprofil.at("onsketArbeidssted", default: ()), "stedsnavn")

  let heltidDeltid = jobbprofil.at("heltidDeltid", default: none)
  if type(heltidDeltid) == dictionary {
    let d = (
      field-or-none("Heltid:", if heltidDeltid.at("heltid", default: false) == true { "Ja" } else { none }),
      field-or-none("Deltid:", if heltidDeltid.at("deltid", default: false) == true { "Ja" } else { none }),
    ).filter(x => x != none)
    if d.len() > 0 {
      [=== Heltid eller deltid]
      list(..d)
    }
  }

  for (key, title) in (// Alle tre bruker samme dictionary
    ("onsketArbeidstidsordning", "Ønsket arbeidstidsordning"),
    ("onsketArbeidsdagordning", "Ønsket arbeidsdagordning"),
    ("onsketArbeidsskiftordning", "Ønsket arbeidsskiftordning"),
  ) {
    section(title, jobbprofil.at(key, default: ()), a => build-list((
      field-or-none("", labeled(a.at("tittel", default: none), arbeidstid-label)),
    )))
  }

  section("Ønsket ansettelsesform", jobbprofil.at("onsketAnsettelsesform", default: ()), a => build-list((
    field-or-none("", labeled(a.at("tittel", default: none), ansettelsesform-label)),
  )))

  let oppstart = jobbprofil.at("oppstart", default: none)
  if oppstart != none {
    [=== Oppstart]
    list([#json-key[] #oppstart-label(oppstart)])
  }
} else [
  *Ingen registrerte data:* Personen har ikke registrert CV/jobbønsker.
]
