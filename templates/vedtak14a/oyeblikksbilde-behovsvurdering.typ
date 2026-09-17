#import "/resources/vedtak14a/lib.typ": *

#let data = json("/data/vedtak14a/oyeblikksbilde-behovsvurdering.json")
#let sistOppdatert = data.at("sistOppdatert", default: none)
#let svar = if data.at("svar", default: none) != none { data.svar } else { () }

#set document(title: "Svarene dine om behov for veiledning", author: "Nav")
#show: body => oyeblikksbilde-style(body, utkast: data.at("utkast", default: false))

// Mal

#oyeblikksbilde-header(data.mottaker)

= Svarene dine om behov for veiledning

#if sistOppdatert != none {
  block(below: 6pt)[#json-key[Sist oppdatert: ] #iso_to_long_date(sistOppdatert)]

  [
    == Svar
    #for post in svar {
      list(build-list((
        field-or-none("Spørsmål:", post.at("spm", default: none)),
        field-or-none("Svar:", post.at("svar", default: none)),
        field-or-none("DialogId:", post.at("dialogId", default: none)),
      )))
    }
  ]
} else [
  *Ingen registrerte data:* Personen har ikke registrert svar om behov for veiledning.
]
