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

#let json-key(tekst) = text(weight: 550, tekst)

// Velger nynorsk (nn) eller bokmål (nb) innhold basert på malform.
#let by-malform(malform, nn, nb) = if malform == "NN" { nn } else { nb }

// Klikkbar nav.no-lenke som ikke brytes over linjeskift.
#let nav-lenke(sti) = box(link("https://" + sti)[#sti])
