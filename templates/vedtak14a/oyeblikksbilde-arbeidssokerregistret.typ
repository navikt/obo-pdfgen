#import "/resources/vedtak14a/lib.typ": *

#let data = json("/data/vedtak14a/oyeblikksbilde-arbeidssokerregistret.json")
#let arbeidssoekerperiodeStartet = data.at("arbeidssoekerperiodeStartet", default: none)
#let opplysninger = data.at("opplysningerOmArbeidssoeker", default: none)
#let profilering = data.at("profilering", default: none)

#let nus-label(v) = (
  "INGEN_UTDANNING": "Ingen utdanning",
  "GRUNNSKOLE": "Grunnskole",
  "VIDEREGAENDE_GRUNNUTDANNING": "Videregående grunnutdanning (1 til 2 år)",
  "VIDEREGAENDE_FAGBREV_SVENNEBREV": "Videregående, fagbrev eller svennebrev (3 år eller mer)",
  "HOYERE_UTDANNING_1_TIL_4": "Høyere utdanning (1 til 4 år)",
  "HOYERE_UTDANNING_5_ELLER_MER": "Høyere utdanning (5 år eller mer)",
).at(v, default: "")

#let ja-nei(v) = (
  "JA": "Ja",
  "NEI": "Nei",
  "VET_IKKE": "Vet ikke",
  "INGEN_SVAR": "Ikke besvart",
).at(v, default: "")

#let jobbsituasjon-label(v) = (
  "MISTET_JOBBEN": "Har mistet eller kommer til å miste jobben",
  "HAR_SAGT_OPP": "Har sagt opp eller kommer til å si opp",
  "DELTIDSJOBB_VIL_MER": "Har deltidsjobb, men vil jobbe mer",
  "ALDRI_HATT_JOBB": "Har aldri vært i jobb",
  "VIL_BYTTE_JOBB": "Har jobb, men vil bytte",
  "JOBB_OVER_2_AAR": "Har ikke vært i jobb de siste 2 årene",
  "ER_PERMITTERT": "Er permittert eller kommer til å bli permittert",
  "USIKKER_JOBBSITUASJON": "Er usikker på jobbsituasjonen min",
  "AKKURAT_FULLFORT_UTDANNING": "Har akkurat fullført utdanning, militærtjeneste eller annet",
  "VIL_FORTSETTE_I_JOBB": "Har jobb og ønsker å fortsette i den jobben jeg er i",
).at(v, default: "")

#let profilert-label(v) = (
  "ANTATT_GODE_MULIGHETER": "Antatt rask overgang til arbeid: Vurder om brukeren har gode muligheter til å beholde eller komme i jobb på egenhånd.",
  "ANTATT_BEHOV_FOR_VEILEDNING": "Antatt behov for veiledning: Vurder brukerens jobbmuligheter og behov for veiledning.",
  "OPPGITT_HINDRINGER": "Brukeren har oppgitt hindringer: Vurder brukerens jobbmuligheter og behov for veiledning.",
).at(v, default: "")

#set document(title: "Det du fortalte oss da du ble registrert som arbeidssøker", author: "Nav")
#show: body => oyeblikksbilde-style(body, utkast: data.at("utkast", default: false))

#oyeblikksbilde-header(data.mottaker)

= Det du fortalte oss da du ble registrert som arbeidssøker

#if arbeidssoekerperiodeStartet != none {
  block(below: 0pt)[#json-key[Registrert: ] #iso_to_long_date(arbeidssoekerperiodeStartet)]

  if opplysninger != none {
    let sendtInnAv = opplysninger.at("sendtInnAv", default: none)
    if sendtInnAv != none {
      if sendtInnAv.at("tidspunkt", default: none) != none {
        block(below: 0pt)[#json-key[Sist oppdatert: ] #iso_to_long_date(sendtInnAv.tidspunkt)]
      }
      let utfoertAv = sendtInnAv.at("utfoertAv", default: none)
      if utfoertAv != none and utfoertAv.at("type", default: none) == "VEILEDER" {
        block(below: 0pt)[#json-key[Registrert av ident: ] #utfoertAv.id]
      }
    }

    [== Besvarelse]

    let utdanning = opplysninger.at("utdanning", default: (:))
    qa("Hva er din høyeste fullførte utdanning?", labeled(utdanning.at("nus", default: none), nus-label))
    qa("Er utdanningen din bestått?", labeled(utdanning.at("bestaatt", default: none), ja-nei))
    qa("Er utdanningen din godkjent i Norge?", labeled(utdanning.at("godkjent", default: none), ja-nei))

    let jobbsituasjon = opplysninger.at("jobbsituasjon", default: ())
    qa-multi(
      "Velg alternativet som stemmer best på situasjonen din?",
      jobbsituasjon,
      j => [#jobbsituasjon-label(j.at("beskrivelse", default: ""))],
    )

    let annet = opplysninger.at("annet", default: (:))
    qa("Har du andre problemer med å søke eller være i jobb?", labeled(annet.at("andreForholdHindrerArbeid", default: none), ja-nei))

    let helse = opplysninger.at("helse", default: (:))
    qa("Har du helseproblemer som hindrer deg i å søke eller være i jobb?", labeled(helse.at("helsetilstandHindrerArbeid", default: none), ja-nei))
  } else [
    Kunne ikke hente informasjonen du fortalte oss da du ble registrert som arbeidssøker
  ]

  if profilering != none {
    [== Profilering]
    qa(
      "Forslag om brukers muligheter og behov (resultat fra profilering):",
      profilert-label(profilering.at("profilertTil", default: "")),
    )

    let jobbet = profilering.at("jobbetSammenhengendeSeksAvTolvSisteManeder", default: none)
    qa(
      "Brukeren har vært sammenhengende i jobb minst 6 av de siste 12 måneder:",
      if jobbet == true or jobbet == "true" { "Ja" }
      else if jobbet == false or jobbet == "false" { "Nei" }
      else { none },
    )
  }
} else [
  *Ingen registrerte data:* Personen er ikke registrert i Arbeidssøkerregisteret.
]
