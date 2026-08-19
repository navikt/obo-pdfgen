#import "maler/standard-skaffe.typ": standard-skaffe
#import "maler/standard-beholde.typ": standard-beholde
#import "maler/situasjonsbestemt-skaffe.typ": situasjonsbestemt-skaffe
#import "maler/situasjonsbestemt-beholde.typ": situasjonsbestemt-beholde
#import "maler/spesielt-tilpasset-skaffe.typ": spesielt-tilpasset-skaffe
#import "maler/spesielt-tilpasset-beholde.typ": spesielt-tilpasset-beholde
#import "maler/gradert-varig.typ": gradert-varig
#import "maler/varig.typ": varig

#let innledning(malType, malform) = {
  if malType == "STANDARD_INNSATS_SKAFFE_ARBEID_PROFILERING" {
    standard-skaffe(malform)
  }
  if malType == "STANDARD_INNSATS_SKAFFE_ARBEID" {
    standard-skaffe(malform)
  }
  if malType == "STANDARD_INNSATS_BEHOLDE_ARBEID" {
    standard-beholde(malform)
  }
  if malType == "SITUASJONSBESTEMT_INNSATS_SKAFFE_ARBEID" {
    situasjonsbestemt-skaffe(malform)
  }
  if malType == "SITUASJONSBESTEMT_INNSATS_BEHOLDE_ARBEID" {
    situasjonsbestemt-beholde(malform)
  }
  if malType == "SPESIELT_TILPASSET_INNSATS_SKAFFE_ARBEID" {
    spesielt-tilpasset-skaffe(malform)
  }
  if malType == "SPESIELT_TILPASSET_INNSATS_BEHOLDE_ARBEID" {
    spesielt-tilpasset-beholde(malform)
  }
  if malType == "GRADERT_VARIG_TILPASSET_INNSATS_SKAFFE_ARBEID" {
    gradert-varig(malform)
  }
  if malType == "GRADERT_VARIG_TILPASSET_INNSATS_BEHOLDE_ARBEID" {
    gradert-varig(malform)
  }
  if malType == "VARIG_TILPASSET_INNSATS" {
    varig(malform)
  }

  parbreak()

  if malform == "NN" [
    Vedtaket er gjort etter lov om arbeids- og velferdsforvaltninga (Nav-lova) § 14 a.
  ]
  if malform == "NB" [
    Vedtaket er gjort etter lov om arbeids- og velferdsforvaltningen (Nav-loven) § 14 a.
  ]

  parbreak()

  if malform == "NN" [
    Dersom du har søkt om pengestøtte frå Nav får du eit eige vedtak og brev om dette.
  ]
  if malform == "NB" [
    Dersom du har søkt om pengestøtte fra Nav får du et eget vedtak og brev om dette.
  ]
}
