#let norske-maneder = (
  "januar", "februar", "mars", "april", "mai", "juni",
  "juli", "august", "september", "oktober", "november", "desember",
)

#let iso_to_long_date(iso) = {
  if iso == none { return "" }
  let s = str(iso)
  if s == "" { return "" }
  let date-part = s.split("T").at(0, default: s)
  let parts = date-part.split("-")
  if parts.len() >= 3 {
    let aar = parts.at(0)
    let mnd = int(parts.at(1))
    let dag = int(parts.at(2))
    str(dag) + ". " + norske-maneder.at(mnd - 1) + " " + aar
  } else {
    s
  }
}

// Velger nynorsk (nn) eller bokmål (nb) innhold basert på malform.
#let by-malform(malform, nn, nb) = if malform == "NN" { nn } else { nb }

// Klikkbar nav.no-lenke som ikke brytes over linjeskift.
#let nav-lenke(sti) = box(link("https://" + sti)[#sti])

// Øyeblikksbilde-funksjoner
#let json-key(tekst) = text(weight: 550, tekst)
#let felt(nokkel, verdi) = [#json-key(nokkel) #verdi]
#let field-or-none(nokkel, verdi) = if verdi != none { felt(nokkel, verdi) } else { none }
#let date-field-or-none(nokkel, verdi) = if verdi != none { felt(nokkel, iso_to_long_date(verdi)) } else { none }
#let labeled(v, labeler) = if v != none { labeler(v) } else { none }
#let build-list(fields) = fields.filter(f => f != none).join(linebreak())
#let har(verdi) = verdi != none and verdi != ()
#let section(title, items, mapper) = {
  if har(items) {
    [=== #title]
    list(..items.map(mapper))
  }
}
#let simple-section(title, items, key) = section(title, items, item => build-list((
  field-or-none("", item.at(key, default: none)),
)))
#let qa(sporsmal, svar) = if svar != none {
  json-key(sporsmal)
  list(svar)
}
#let qa-multi(sporsmal, items, mapper) = if har(items) {
  json-key(sporsmal)
  list(..items.map(mapper))
}
