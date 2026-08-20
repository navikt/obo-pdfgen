#import "/resources/vedtak14a/lib.typ": *

#let data = json("/data/vedtak14a/oyeblikkbilde-behovsvurdering.json")
#let sistOppdatert = data.at("sistOppdatert", default: none)
#let svar = data.at("svar", default: ())

#set document(title: "Svarene dine om behov for veiledning", author: "Nav")
#show: oyeblikk-style

#oyeblikkbilde-header(data.mottaker)

= Svarene dine om behov for veiledning

#if sistOppdatert != none {
  block(below: 6pt)[#json-key[Sist oppdatert: ] #iso_to_long_date(sistOppdatert)]

  [
    == Svar
    #for post in svar {
      let deler = ()
      if post.at("spm", default: none) != none {
        deler.push([#json-key[Spørsmål: ] #post.spm])
      }
      if post.at("svar", default: none) != none {
        deler.push([#json-key[Svar: ] #post.svar])
      }
      if post.at("dialogId", default: none) != none {
        deler.push([#json-key[DialogId: ] #post.dialogId])
      }
      list(deler.join(linebreak()))
    }
  ]
} else [
  *Ingen registrerte data:* Personen har ikke registrert svar om behov for veiledning.
]
