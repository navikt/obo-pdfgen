#import "partials/oyeblikk-style.typ": oyeblikk-style
#import "oyeblikkbilde-header.typ": oyeblikkbilde-header
#import "partials/helpers.typ": iso_to_long_date, json-key

#let data = json("/data/vedtak14a/oyeblikkbilde-cv.json")
#let sistEndret = data.at("sistEndret", default: none)
#let jobbprofil = data.at("jobbprofil", default: (:))

#let felt(nokkel, verdi) = [#json-key(nokkel) #verdi]

#let fagdok-type-label(v) = {
  if v == "AUTORISASJON" { "Autorisasjon" }
  else if v == "MESTERBREV" { "Mesterbrev" }
  else if v == "SVENNEBREV_FAGBREV" { "Fagbrev/Svennebrev" }
  else { "" }
}

#let ansettelsesform-label(v) = {
  if v == "FAST" { "Fast" }
  else if v == "VIKARIAT" { "Vikariat" }
  else if v == "ENGASJEMENT" { "Engasjement" }
  else if v == "PROSJEKT" { "Prosjekt" }
  else if v == "SESONG" { "Sesong" }
  else if v == "TRAINEE" { "Trainee" }
  else if v == "LAERLING" { "Lærling" }
  else if v == "SELVSTENDIG_NAERINGSDRIVENDE" { "Selvstendig næringsdrivende" }
  else if v == "FERIEJOBB" { "Feriejobb" }
  else if v == "ANNET" { "Annet" }
  else { "" }
}

#let arbeidstid-label(v) = {
  if v == "DAGTID" { "Dagtid" }
  else if v == "KVELD" { "Kveld" }
  else if v == "NATT" { "Natt" }
  else if v == "UKEDAGER" { "Ukedager" }
  else if v == "LOERDAG" { "Lørdag" }
  else if v == "SOENDAG" { "Søndag" }
  else if v == "SKIFT" { "Skift" }
  else if v == "VAKT" { "Vakt" }
  else if v == "TURNUS" { "Turnus" }
  else { "" }
}

#let oppstart-label(v) = {
  if v == "LEDIG_NAA" { "Kan begynne nå" }
  else if v == "ETTER_TRE_MND" { "Har 3 måneders oppsigelse" }
  else if v == "ETTER_AVTALE" { "Kan begynne etter nærmere avtale" }
  else { "" }
}

#let sprak-niva-label(v) = {
  if v == "FOERSTESPRAAK" { "Førstespråk (morsmål)" }
  else if v == "VELDIG_GODT" { "Veldig godt" }
  else if v == "GODT" { "Godt" }
  else if v == "NYBEGYNNER" { "Nybegynner" }
  else if v == "IKKE_OPPGITT" { "Ikke oppgitt" }
  else { "" }
}

#let varighet-label(v) = {
  let n = v.varighet
  let e = v.tidsenhet
  let entall = n == 1
  let ord = if e == "TIME" { if entall { "time" } else { "timer" } }
    else if e == "DAG" { if entall { "dag" } else { "dager" } }
    else if e == "UKE" { if entall { "uke" } else { "uker" } }
    else if e == "MND" { if entall { "måned" } else { "måneder" } }
    else { "" }
  str(n) + " " + ord
}

#let har(verdi) = verdi != none and verdi != ()

#set document(title: "CV-en/jobbønskene dine på nav.no", author: "Nav")
#show: oyeblikk-style

#oyeblikkbilde-header(data.mottaker)

= CV-en/jobbønskene dine på nav.no

#if sistEndret != none {
  block(below: 6pt)[#json-key[Sist oppdatert: ] #iso_to_long_date(sistEndret)]

  if data.at("sammendrag", default: none) != none {
    [#json-key[Sammendrag:]#data.sammendrag]
  }

  let utdanning = data.at("utdanning", default: ())
  if har(utdanning) {
    [=== Utdanning]
    list(..utdanning.map(u => {
      let d = ()
      if u.at("tittel", default: none) != none { d.push(felt("Tittel:", u.tittel)) }
      if u.at("studiested", default: none) != none { d.push(felt("Sted:", u.studiested)) }
      if u.at("utdanningsnivaa", default: none) != none { d.push(felt("Utdanningsnivå:", u.utdanningsnivaa)) }
      if u.at("fraDato", default: none) != none { d.push(felt("Fra dato:", iso_to_long_date(u.fraDato))) }
      if u.at("tilDato", default: none) != none { d.push(felt("Til dato:", iso_to_long_date(u.tilDato))) }
      if u.at("beskrivelse", default: none) != none { d.push(felt("Beskrivelse:", u.beskrivelse)) }
      d.join(linebreak())
    }))
  }

  let arbeidserfaring = data.at("arbeidserfaring", default: ())
  if har(arbeidserfaring) {
    [=== Arbeidserfaring]
    list(..arbeidserfaring.map(a => {
      let d = ()
      if a.at("tittel", default: none) != none { d.push(felt("Tittel:", a.tittel)) }
      if a.at("arbeidsgiver", default: none) != none { d.push(felt("Arbeidsgiver:", a.arbeidsgiver)) }
      if a.at("sted", default: none) != none { d.push(felt("Sted:", a.sted)) }
      if a.at("fraDato", default: none) != none { d.push(felt("Fra dato:", iso_to_long_date(a.fraDato))) }
      if a.at("tilDato", default: none) != none { d.push(felt("Til dato:", iso_to_long_date(a.tilDato))) }
      if a.at("beskrivelse", default: none) != none { d.push(felt("Beskrivelse:", a.beskrivelse)) }
      d.join(linebreak())
    }))
  }

  let fagdokumentasjoner = data.at("fagdokumentasjoner", default: ())
  if har(fagdokumentasjoner) {
    [=== Fagdokumentasjoner]
    list(..fagdokumentasjoner.map(f => {
      let d = ()
      if f.at("tittel", default: none) != none { d.push(felt("Tittel:", f.tittel)) }
      if f.at("type", default: none) != none { d.push(felt("Type:", fagdok-type-label(f.type))) }
      d.join(linebreak())
    }))
  }

  let kompetanse = jobbprofil.at("kompetanse", default: ())
  if har(kompetanse) {
    [=== Kompetanse]
    list(..kompetanse.map(k => {
      let d = ()
      if k.at("tittel", default: none) != none { d.push(felt("Tittel:", k.tittel)) }
      d.join(linebreak())
    }))
  }

  let onsketYrke = jobbprofil.at("onsketYrke", default: ())
  if har(onsketYrke) {
    [=== Ønsket yrke]
    list(..onsketYrke.map(y => {
      let d = ()
      if y.at("tittel", default: none) != none { d.push(felt("Tittel:", y.tittel)) }
      d.join(linebreak())
    }))
  }

  let onsketArbeidssted = jobbprofil.at("onsketArbeidssted", default: ())
  if har(onsketArbeidssted) {
    [=== Ønsket arbeidssted]
    list(..onsketArbeidssted.map(s => {
      let d = ()
      if s.at("stedsnavn", default: none) != none { d.push(felt("Stedsnavn:", s.stedsnavn)) }
      d.join(linebreak())
    }))
  }

  let onsketAnsettelsesform = jobbprofil.at("onsketAnsettelsesform", default: ())
  if har(onsketAnsettelsesform) {
    [=== Ønsket ansettelsesform]
    list(..onsketAnsettelsesform.map(a => {
      let d = ()
      if a.at("tittel", default: none) != none { d.push(felt("Tittel:", ansettelsesform-label(a.tittel))) }
      d.join(linebreak())
    }))
  }

  let onsketArbeidstidsordning = jobbprofil.at("onsketArbeidstidsordning", default: ())
  if har(onsketArbeidstidsordning) {
    [=== Ønsket arbeidstidsordning]
    list(..onsketArbeidstidsordning.map(a => {
      let d = ()
      if a.at("tittel", default: none) != none { d.push(felt("Tittel:", arbeidstid-label(a.tittel))) }
      d.join(linebreak())
    }))
  }

  let onsketArbeidsdagordning = jobbprofil.at("onsketArbeidsdagordning", default: ())
  if har(onsketArbeidsdagordning) {
    [=== Ønsket arbeidsdagordning]
    list(..onsketArbeidsdagordning.map(a => {
      let d = ()
      if a.at("tittel", default: none) != none { d.push(felt("Tittel:", arbeidstid-label(a.tittel))) }
      d.join(linebreak())
    }))
  }

  let onsketArbeidsskiftordning = jobbprofil.at("onsketArbeidsskiftordning", default: ())
  if har(onsketArbeidsskiftordning) {
    [=== Ønsket arbeidsskiftordning]
    list(..onsketArbeidsskiftordning.map(a => {
      let d = ()
      if a.at("tittel", default: none) != none { d.push(felt("Tittel:", arbeidstid-label(a.tittel))) }
      d.join(linebreak())
    }))
  }

  if onsketArbeidsskiftordning != none {
    [=== Heltid eller deltid]
    let d = ()
    if type(onsketArbeidsskiftordning) == dictionary {
      if onsketArbeidsskiftordning.at("heltid", default: none) != none { d.push(felt("Heltid:", "Ja")) }
      if onsketArbeidsskiftordning.at("deltid", default: none) != none { d.push(felt("Deltid:", "Ja")) }
    }
    list(d.join(linebreak()))
  }

  let oppstart = jobbprofil.at("oppstart", default: none)
  if oppstart != none {
    [=== Oppstart]
    list([#json-key[Oppstart:] #oppstart-label(oppstart)])
  }

  let sprak = data.at("sprak", default: ())
  if har(sprak) {
    [=== Språk]
    list(..sprak.map(s => {
      let d = ()
      if s.at("sprak", default: none) != none { d.push(felt("Språk:", s.sprak)) }
      if s.at("muntligNiva", default: none) != none { d.push(felt("Muntlig:", sprak-niva-label(s.muntligNiva))) }
      if s.at("skriftligNiva", default: none) != none { d.push(felt("Skriftlig:", sprak-niva-label(s.skriftligNiva))) }
      d.join(linebreak())
    }))
  }

  let kurs = data.at("kurs", default: ())
  if har(kurs) {
    [=== Kurs]
    list(..kurs.map(k => {
      let d = ()
      if k.at("tittel", default: none) != none { d.push(felt("Tittel:", k.tittel)) }
      if k.at("arrangor", default: none) != none { d.push(felt("Arrangør:", k.arrangor)) }
      if k.at("tidspunkt", default: none) != none { d.push(felt("Fullført:", iso_to_long_date(k.tidspunkt))) }
      if k.at("varighet", default: none) != none { d.push(felt("Kurslengde:", varighet-label(k.varighet))) }
      d.join(linebreak())
    }))
  }

  let forerkort = data.at("forerkort", default: ())
  if har(forerkort) {
    [=== Førerkort]
    list(..forerkort.map(f => {
      let d = ()
      if f.at("klasse", default: none) != none { d.push(felt("Klasse:", f.klasse)) }
      d.join(linebreak())
    }))
  }

  let annenErfaring = data.at("annenErfaring", default: ())
  if har(annenErfaring) {
    [=== Annen Erfaring]
    list(..annenErfaring.map(a => {
      let d = ()
      if a.at("rolle", default: none) != none { d.push(felt("Rolle:", a.rolle)) }
      if a.at("beskrivelse", default: none) != none { d.push(felt("Beskrivelse:", a.beskrivelse)) }
      if a.at("fraDato", default: none) != none { d.push(felt("Startdato:", iso_to_long_date(a.fraDato))) }
      if a.at("tilDato", default: none) != none { d.push(felt("Sluttdato:", iso_to_long_date(a.tilDato))) }
      d.join(linebreak())
    }))
  }

  let godkjenninger = data.at("godkjenninger", default: ())
  if har(godkjenninger) {
    [=== Godkjenninger]
    list(..godkjenninger.map(g => {
      let d = ()
      if g.at("tittel", default: none) != none { d.push(felt("Tittel:", g.tittel)) }
      if g.at("utsteder", default: none) != none { d.push(felt("Utsteder:", g.utsteder)) }
      if g.at("gjennomfortDato", default: none) != none { d.push(felt("Fullført:", iso_to_long_date(g.gjennomfortDato))) }
      if g.at("utloperDato", default: none) != none { d.push(felt("Utløper:", iso_to_long_date(g.utloperDato))) }
      d.join(linebreak())
    }))
  }

  let andreGodkjenninger = data.at("andreGodkjenninger", default: ())
  if har(andreGodkjenninger) {
    [=== Andre Godkjenninger]
    list(..andreGodkjenninger.map(g => {
      let d = ()
      if g.at("tittel", default: none) != none { d.push(felt("Tittel:", g.tittel)) }
      if g.at("utsteder", default: none) != none { d.push(felt("Utsteder:", g.utsteder)) }
      if g.at("gjennomfortDato", default: none) != none { d.push(felt("Fullført:", iso_to_long_date(g.gjennomfortDato))) }
      if g.at("utloperDato", default: none) != none { d.push(felt("Utløper:", iso_to_long_date(g.utloperDato))) }
      d.join(linebreak())
    }))
  }
} else [
  *Ingen registrerte data:* Personen har ikke registrert CV/jobbønsker.
]
