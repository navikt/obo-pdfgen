#import "/resources/vedtak14a/lib.typ": *

#let data = json("/data/vedtak14a/oyeblikksbilde-cv.json")
#let sistEndret = data.at("sistEndret", default: none)
#let jobbprofil = if data.at("jobbprofil", default: none) != none { data.jobbprofil } else { (:) }

#let fagdok-type-label(verdi) = (
  "AUTORISASJON": "Autorisasjon",
  "MESTERBREV": "Mesterbrev",
  "SVENNEBREV_FAGBREV": "Fagbrev/Svennebrev",
).at(verdi, default: "")

#let ansettelsesform-label(verdi) = (
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
).at(verdi, default: "")

#let arbeidstid-label(verdi) = (
  "DAGTID": "Dagtid",
  "KVELD": "Kveld",
  "NATT": "Natt",
  "UKEDAGER": "Ukedager",
  "LOERDAG": "Lørdag",
  "SOENDAG": "Søndag",
  "SKIFT": "Skift",
  "VAKT": "Vakt",
  "TURNUS": "Turnus",
).at(verdi, default: "")

#let oppstart-label(verdi) = (
  "LEDIG_NAA": "Kan begynne nå",
  "ETTER_TRE_MND": "Har 3 måneders oppsigelse",
  "ETTER_AVTALE": "Kan begynne etter nærmere avtale",
).at(verdi, default: "")

#let sprak-niva-label(verdi) = (
  "FOERSTESPRAAK": "Førstespråk (morsmål)",
  "VELDIG_GODT": "Veldig godt",
  "GODT": "Godt",
  "NYBEGYNNER": "Nybegynner",
  "IKKE_OPPGITT": "Ikke oppgitt",
).at(verdi, default: "")

#let varighet-label(verdi) = {
  let antall = verdi.varighet
  let enhet = verdi.tidsenhet
  if antall == none { return "" }
  let entall = antall == 1
  let ord = if enhet == "TIME" { if entall { "time" } else { "timer" } }
    else if enhet == "DAG" { if entall { "dag" } else { "dager" } }
    else if enhet == "UKE" { if entall { "uke" } else { "uker" } }
    else if enhet == "MND" { if entall { "måned" } else { "måneder" } }
    else { "" }
  str(antall) + " " + ord
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

  section("Utdanninger", data.at("utdanning", default: ()), utdanning => build-list((
    field-or-none("Tittel:", utdanning.at("tittel", default: none)),
    field-or-none("Sted:", utdanning.at("studiested", default: none)),
    field-or-none("Utdanningsnivå:", utdanning.at("utdanningsnivaa", default: none)),
    date-field-or-none("Fra dato:", utdanning.at("fraDato", default: none)),
    date-field-or-none("Til dato:", utdanning.at("tilDato", default: none)),
    field-or-none("Beskrivelse:", utdanning.at("beskrivelse", default: none)),
  )))

  section("Fagbrev", data.at("fagdokumentasjoner", default: ()), fagbrev => build-list((
    field-or-none("Tittel:", fagbrev.at("tittel", default: none)),
    field-or-none("Type:", labeled(fagbrev.at("type", default: none), fagdok-type-label)),
  )))

  section("Arbeidsforhold", data.at("arbeidserfaring", default: ()), arbeidsforhold => build-list((
    field-or-none("Tittel:", arbeidsforhold.at("tittel", default: none)),
    field-or-none("Arbeidsgiver:", arbeidsforhold.at("arbeidsgiver", default: none)),
    field-or-none("Sted:", arbeidsforhold.at("sted", default: none)),
    date-field-or-none("Fra dato:", arbeidsforhold.at("fraDato", default: none)),
    date-field-or-none("Til dato:", arbeidsforhold.at("tilDato", default: none)),
    field-or-none("Beskrivelse:", arbeidsforhold.at("beskrivelse", default: none)),
  )))

  section("Andre erfaringer", data.at("annenErfaring", default: ()), annenErfaring => build-list((
    field-or-none("Rolle:", annenErfaring.at("rolle", default: none)),
    field-or-none("Beskrivelse:", annenErfaring.at("beskrivelse", default: none)),
    date-field-or-none("Startdato:", annenErfaring.at("fraDato", default: none)),
    date-field-or-none("Sluttdato:", annenErfaring.at("tilDato", default: none)),
  )))

  simple-section("Kompetanser", jobbprofil.at("kompetanse", default: ()), "tittel")

  section("Offentlige godkjenninger", data.at("godkjenninger", default: ()), godkjenning => build-list((
    field-or-none("Tittel:", godkjenning.at("tittel", default: none)),
    field-or-none("Utsteder:", godkjenning.at("utsteder", default: none)),
    date-field-or-none("Fullført:", godkjenning.at("gjennomfortDato", default: none)),
    date-field-or-none("Utløper:", godkjenning.at("utloperDato", default: none)),
  )))

  section("Andre godkjenninger", data.at("andreGodkjenninger", default: ()), godkjenning => build-list((
    field-or-none("Tittel:", godkjenning.at("tittel", default: none)),
    field-or-none("Utsteder:", godkjenning.at("utsteder", default: none)),
    date-field-or-none("Fullført:", godkjenning.at("gjennomfortDato", default: none)),
    date-field-or-none("Utløper:", godkjenning.at("utloperDato", default: none)),
  )))

  section("Språk", data.at("sprak", default: ()), sprak => build-list((
    field-or-none("Språk:", sprak.at("sprak", default: none)),
    field-or-none("Muntlig:", labeled(sprak.at("muntligNiva", default: none), sprak-niva-label)),
    field-or-none("Skriftlig:", labeled(sprak.at("skriftligNiva", default: none), sprak-niva-label)),
  )))

  section("Førerkort", data.at("forerkort", default: ()), forerkort => build-list((
    field-or-none("Klasse:", forerkort.at("klasse", default: none)),
  )))

  section("Kurs", data.at("kurs", default: ()), kurs => build-list((
    field-or-none("Tittel:", kurs.at("tittel", default: none)),
    field-or-none("Arrangør:", kurs.at("arrangor", default: none)),
    date-field-or-none("Fullført:", kurs.at("tidspunkt", default: none)),
    field-or-none("Kurslengde:", labeled(kurs.at("varighet", default: none), varighet-label)),
  )))

  [== Jobbønsker]

  simple-section("Ønsket yrke", jobbprofil.at("onsketYrke", default: ()), "tittel")

  simple-section("Ønsket arbeidssted", jobbprofil.at("onsketArbeidssted", default: ()), "stedsnavn")

  let heltidDeltid = jobbprofil.at("heltidDeltid", default: none)
  if type(heltidDeltid) == dictionary {
    let heltidDeltidFelter = (
      field-or-none("Heltid:", if heltidDeltid.at("heltid", default: false) == true { "Ja" } else { none }),
      field-or-none("Deltid:", if heltidDeltid.at("deltid", default: false) == true { "Ja" } else { none }),
    ).filter(felt => felt != none)
    if heltidDeltidFelter.len() > 0 {
      [=== Heltid eller deltid]
      list(..heltidDeltidFelter)
    }
  }

  for (key, title) in (// Alle tre bruker samme dictionary
    ("onsketArbeidstidsordning", "Ønsket arbeidstidsordning"),
    ("onsketArbeidsdagordning", "Ønsket arbeidsdagordning"),
    ("onsketArbeidsskiftordning", "Ønsket arbeidsskiftordning"),
  ) {
    section(title, jobbprofil.at(key, default: ()), arbeidstidsordning => build-list((
      field-or-none("", labeled(arbeidstidsordning.at("tittel", default: none), arbeidstid-label)),
    )))
  }

  section("Ønsket ansettelsesform", jobbprofil.at("onsketAnsettelsesform", default: ()), ansettelsesform => build-list((
    field-or-none("", labeled(ansettelsesform.at("tittel", default: none), ansettelsesform-label)),
  )))

  let oppstart = jobbprofil.at("oppstart", default: none)
  if oppstart != none {
    [=== Oppstart]
    list([#json-key[] #oppstart-label(oppstart)])
  }
} else [
  *Ingen registrerte data:* Personen har ikke registrert CV/jobbønsker.
]
