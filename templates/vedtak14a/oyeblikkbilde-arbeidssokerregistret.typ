#import "partials/oyeblikk-style.typ": oyeblikk-style
#import "oyeblikkbilde-header.typ": oyeblikkbilde-header
#import "partials/helpers.typ": iso_to_long_date, json-key

#let data = json("/data/vedtak14a/oyeblikkbilde-arbeidssokerregistret.json")
#let arbeidssoekerperiodeStartet = data.at("arbeidssoekerperiodeStartet", default: none)
#let opplysninger = data.at("opplysningerOmArbeidssoeker", default: none)
#let profilering = data.at("profilering", default: none)

#let nus-label(v) = {
  if v == "INGEN_UTDANNING" { "Ingen utdanning" }
  else if v == "GRUNNSKOLE" { "Grunnskole" }
  else if v == "VIDEREGAENDE_GRUNNUTDANNING" { "Videregående grunnutdanning (1 til 2 år)" }
  else if v == "VIDEREGAENDE_FAGBREV_SVENNEBREV" { "Videregående, fagbrev eller svennebrev (3 år eller mer)" }
  else if v == "HOYERE_UTDANNING_1_TIL_4" { "Høyere utdanning (1 til 4 år)" }
  else if v == "HOYERE_UTDANNING_5_ELLER_MER" { "Høyere utdanning (5 år eller mer)" }
  else { "" }
}

#let ja-nei(v) = {
  if v == "JA" { "Ja" }
  else if v == "NEI" { "Nei" }
  else if v == "VET_IKKE" { "Vet ikke" }
  else if v == "INGEN_SVAR" { "Ikke besvart" }
  else { "" }
}

#let jobbsituasjon-label(v) = {
  if v == "MISTET_JOBBEN" { "Har mistet eller kommer til å miste jobben" }
  else if v == "HAR_SAGT_OPP" { "Har sagt opp eller kommer til å si opp" }
  else if v == "DELTIDSJOBB_VIL_MER" { "Har deltidsjobb, men vil jobbe mer" }
  else if v == "ALDRI_HATT_JOBB" { "Har aldri vært i jobb" }
  else if v == "VIL_BYTTE_JOBB" { "Har jobb, men vil bytte" }
  else if v == "JOBB_OVER_2_AAR" { "Har ikke vært i jobb de siste 2 årene" }
  else if v == "ER_PERMITTERT" { "Er permittert eller kommer til å bli permittert" }
  else if v == "USIKKER_JOBBSITUASJON" { "Er usikker på jobbsituasjonen min" }
  else if v == "AKKURAT_FULLFORT_UTDANNING" { "Har akkurat fullført utdanning, militærtjeneste eller annet" }
  else if v == "VIL_FORTSETTE_I_JOBB" { "Har jobb og ønsker å fortsette i den jobben jeg er i" }
  else { "" }
}

#let profilert-label(v) = {
  if v == "ANTATT_GODE_MULIGHETER" { "Antatt rask overgang til arbeid: Vurder om brukeren har gode muligheter til å beholde eller komme i jobb på egenhånd." }
  else if v == "ANTATT_BEHOV_FOR_VEILEDNING" { "Antatt behov for veiledning: Vurder brukerens jobbmuligheter og behov for veiledning." }
  else if v == "OPPGITT_HINDRINGER" { "Brukeren har oppgitt hindringer: Vurder brukerens jobbmuligheter og behov for veiledning." }
  else { "" }
}

#set document(title: "Det du fortalte oss da du ble registrert som arbeidssøker", author: "Nav")
#show: oyeblikk-style

#oyeblikkbilde-header(data.mottaker)

= Det du fortalte oss da du ble registrert som arbeidssøker

#if arbeidssoekerperiodeStartet != none {
  block(below: 6pt)[#json-key[Registrert: ] #iso_to_long_date(arbeidssoekerperiodeStartet)]

  if opplysninger != none {
    let sendtInnAv = opplysninger.at("sendtInnAv", default: none)
    if sendtInnAv != none {
      if sendtInnAv.at("tidspunkt", default: none) != none {
        block(below: 6pt)[#json-key[Sist oppdatert: ] #iso_to_long_date(sendtInnAv.tidspunkt)]
      }
      let utfoertAv = sendtInnAv.at("utfoertAv", default: none)
      if utfoertAv != none and utfoertAv.at("type", default: none) == "VEILEDER" {
        block(below: 6pt)[#json-key[Registrert av ident: ] #utfoertAv.id]
      }
    }

    [== Besvarelse]

    let utdanning = opplysninger.at("utdanning", default: (:))
    if utdanning.at("nus", default: none) != none {
      block(below: 6pt)[#json-key[Hva er din høyeste fullførte utdanning? ] #nus-label(utdanning.nus)]
    }
    if utdanning.at("bestaatt", default: none) != none {
      block(below: 6pt)[#json-key[Er utdanningen din bestått? ] #ja-nei(utdanning.bestaatt)]
    }
    if utdanning.at("godkjent", default: none) != none {
      block(below: 6pt)[#json-key[Er utdanningen din godkjent i Norge? ] #ja-nei(utdanning.godkjent)]
    }

    let jobbsituasjon = opplysninger.at("jobbsituasjon", default: ())
    if jobbsituasjon != none and jobbsituasjon != () {
      block(below: 6pt)[
        #json-key[Velg alternativet som stemmer best på situasjonen din? ]
        #list(..jobbsituasjon.map(j => [#jobbsituasjon-label(j.at("beskrivelse", default: ""))]))
      ]
    }

    let annet = opplysninger.at("annet", default: (:))
    if annet.at("andreForholdHindrerArbeid", default: none) != none {
      block(below: 6pt)[#json-key[Har du andre problemer med å søke eller være i jobb? ] #ja-nei(annet.andreForholdHindrerArbeid)]
    }

    let helse = opplysninger.at("helse", default: (:))
    if helse.at("helsetilstandHindrerArbeid", default: none) != none {
      block(below: 6pt)[#json-key[Har du helseproblemer som hindrer deg i å søke eller være i jobb? ] #ja-nei(helse.helsetilstandHindrerArbeid)]
    }
  } else [
    Kunne ikke hente informasjonen du fortalte oss da du ble registrert som arbeidssøker
  ]

  if profilering != none {
    [== Profilering]
    block(below: 6pt)[
      #json-key[Forslag om brukers muligheter og behov (resultat fra profilering): ]
      #profilert-label(profilering.at("profilertTil", default: ""))
    ]

    let jobbet = profilering.at("jobbetSammenhengendeSeksAvTolvSisteManeder", default: none)
    if jobbet == true or jobbet == "true" {
      block(below: 6pt)[#json-key[Brukeren har vært sammenhengende i jobb minst 6 av de siste 12 måneder: ] Ja]
    }
    if jobbet == false or jobbet == "false" {
      block(below: 6pt)[#json-key[Brukeren har vært sammenhengende i jobb minst 6 av de siste 12 måneder: ] Nei]
    }
  }
} else [
  *Ingen registrerte data:* Personen er ikke registrert i Arbeidssøkerregisteret.
]
