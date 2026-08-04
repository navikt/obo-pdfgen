
#let data = json("/app/data/vedtak14a/vedtak.json")

#let malType = data.at("malType", default: "")
#let malform = data.at("malform", default: "NB")
#let mottaker = data.at("mottaker", default: (:))
#let dato = data.at("dato", default: "")
#let begrunnelse = data.at("begrunnelse", default: ())
#let kilder = data.at("kilder", default: ())
#let veilederNavn = data.at("veilederNavn", default: "")
#let navKontor = data.at("navKontor", default: "")
#let ungdomsgaranti = data.at("ungdomsgaranti", default: false)
#let utkast = data.at("utkast", default: false)

#let nn = malform == "NN"

#set text(font: "Source Sans 3", size: 11pt)
#set page(
  paper: "a4",
  margin: (top: 3.5cm, bottom: 2.5cm, left: 2.5cm, right: 2.5cm),
  header: [
    #grid(
      columns: (auto, 1fr, auto),
      align: (left, left, right),
      [
        // NAV logo (red N)
        #box(
          width: 40pt,
          height: 12pt,
          fill: rgb("#C30000"),
          radius: 0pt,
        )
      ],
      [
        #set text(size: 9pt)
        #grid(
          columns: (auto, 1fr, auto),
          rows: (auto, auto),
          [*Navn:*], [#h(4pt)#mottaker.at("navn", default: "")], [#dato],
          [*Fødselsnummer:*], [#h(4pt)#mottaker.at("fodselsnummer", default: "")],
          [_#if nn [Unntatt offentlegheita] else [Unntatt offentligheten]_],
        )
      ],
      [],
    )
    #line(length: 100%, stroke: 0.5pt)
  ],
  footer: [
    #line(length: 100%, stroke: 0.5pt)
    #set text(size: 9pt)
    #align(right)[Side #counter(page).display() av #counter(page).final().first()]
  ],
)

// ── Utkast watermark ──────────────────────────────────────────────────────────
#if utkast {
  place(
    center + horizon,
    rotate(-45deg,
      text(size: 80pt, fill: rgb(80%, 80%, 80%, 50%), weight: "bold")[UTKAST]
    ),
    float: false,
  )
}

// ── Innledning (malType heading + intro paragraph) ────────────────────────────
#if malType in ("STANDARD_INNSATS_SKAFFE_ARBEID", "STANDARD_INNSATS_SKAFFE_ARBEID_PROFILERING") [
  #if nn [= Du har gode moglegheiter til å kome i jobb] else [= Du har gode muligheter til å komme i jobb]
  #if nn [
    Du har rett til å få ei vurdering av jobbmoglegheitene dine og kor mykje hjelp du treng frå oss.
    Vi har kome fram til at du har gode moglegheiter til å kome i jobb på eiga hand.
  ] else [
    Du har rett til å få en vurdering av jobbmulighetene dine og hvor mye hjelp du trenger fra oss.
    Vi har kommet frem til at du har gode muligheter til å komme i jobb på egen hånd.
  ]
] else if malType == "STANDARD_INNSATS_BEHOLDE_ARBEID" [
  #if nn [= Du har gode moglegheiter for å fortsetje i jobben din] else [= Du har gode muligheter for å fortsette i jobben din]
  #if nn [
    Du har rett til å få ei vurdering av jobbmoglegheitene dine og kor mykje hjelp du treng frå oss.
    Vi har kome fram til at du har gode moglegheiter for å fortsetje i jobben din utan å få rettleiing frå oss.
  ] else [
    Du har rett til å få en vurdering av jobbmulighetene dine og hvor mye hjelp du trenger fra oss.
    Vi har kommet frem til at du har gode muligheter for å fortsette i jobben din uten å få veiledning fra oss.
  ]
] else if malType == "SITUASJONSBESTEMT_INNSATS_SKAFFE_ARBEID" [
  #if nn [= Du har rett til rettleiing for å kome i jobb] else [= Du har rett til veiledning for å komme i jobb]
  #if nn [
    Du har rett til å få ei vurdering av jobbmoglegheitene dine og kor mykje hjelp du treng frå oss.
    Vi har kome fram til at du kan få rettleiing frå oss for å kome i jobb.
  ] else [
    Du har rett til å få en vurdering av jobbmulighetene dine og hvor mye hjelp du trenger fra oss.
    Vi har kommet frem til at du kan få veiledning fra oss for å komme i jobb.
  ]
] else if malType == "SITUASJONSBESTEMT_INNSATS_BEHOLDE_ARBEID" [
  #if nn [= Du har rett til rettleiing som støtte til å fortsetje i jobben din] else [= Du har rett til veiledning som støtte til å fortsette i jobben din]
  #if nn [
    Du har rett til å få ei vurdering av jobbmoglegheitene dine og kor mykje hjelp du treng frå oss.
    Vi har kome fram til at du kan få rettleiing som støtte til å fortsetje i jobben din.
  ] else [
    Du har rett til å få en vurdering av jobbmulighetene dine og hvor mye hjelp du trenger fra oss.
    Vi har kommet frem til at du kan få veiledning som støtte til å fortsette i jobben din.
  ]
] else if malType == "SPESIELT_TILPASSET_INNSATS_SKAFFE_ARBEID" [
  #if nn [= Du har rett til meir rettleiing for å kome i jobb] else [= Du har rett til mer veiledning for å komme i jobb]
  #if nn [
    Du har rett til å få ei vurdering av jobbmoglegheitene dine og kor mykje hjelp du treng frå oss.
    Vi har kome fram til at det kan vere utfordrande for deg å kome i jobb. Derfor kan du få meir rettleiing.
  ] else [
    Du har rett til å få en vurdering av jobbmulighetene dine og hvor mye hjelp du trenger fra oss.
    Vi har kommet frem til at det kan være utfordrende for deg å komme i jobb. Derfor kan du få mer veiledning.
  ]
] else if malType == "SPESIELT_TILPASSET_INNSATS_BEHOLDE_ARBEID" [
  #if nn [= Du har rett til meir rettleiing som støtte til å fortsetje i jobben din] else [= Du har rett til mer veiledning som støtte til å fortsette i jobben din]
  #if nn [
    Du har rett til å få ei vurdering av jobbmoglegheitene dine og kor mykje hjelp du treng frå oss.
    Vi har kome fram til at det kan vere utfordrande for deg å vere i jobben din. Derfor kan du få meir rettleiing.
  ] else [
    Du har rett til å få en vurdering av jobbmulighetene dine og hvor mye hjelp du trenger fra oss.
    Vi har kommet frem til at det kan være utfordrende for deg å være i jobben din. Derfor kan du få mer veiledning.
  ]
] else if malType in ("GRADERT_VARIG_TILPASSET_INNSATS_SKAFFE_ARBEID", "GRADERT_VARIG_TILPASSET_INNSATS_BEHOLDE_ARBEID") [
  #if nn [= Du har moglegheiter til å jobbe litt eller delvis] else [= Du har mulighet til å jobbe litt eller delvis]
  #if nn [
    Du har rett til å få ei vurdering av jobbmoglegheitene dine og kor mykje hjelp du treng frå oss.
    Vi har kome fram til at moglegheitene dine til å jobbe er avgrensa, men at det er mogleg for deg å jobbe litt eller delvis.
  ] else [
    Du har rett til å få en vurdering av jobbmulighetene dine og hvor mye hjelp du trenger fra oss.
    Vi har kommet frem til at jobbmulighetene dine er begrensede, men at du har mulighet til å jobbe litt eller delvis.
  ]
] else if malType == "VARIG_TILPASSET_INNSATS" [
  #if nn [= Vi har vurdert kva jobbar det er mogleg for deg å få] else [= Vi har vurdert jobbmulighetene dine]
  #if nn [
    Du har rett til å få ei vurdering av jobbmoglegheitene dine og kor mykje hjelp du treng frå oss.
    Vi har kome fram til at du har liten moglegheit til å jobbe, også over tid. Du kan få rettleiing om vegen vidare.
  ] else [
    Du har rett til å få en vurdering av jobbmulighetene dine og hvor mye hjelp du trenger fra oss.
    Vi har kommet frem til at du har liten mulighet til å jobbe, også over tid. Du kan få veiledning om veien videre.
  ]
]

#if nn [
  Vedtaket er gjort etter lov om arbeids- og velferdsforvaltninga (Nav-lova) § 14 a.

  Dersom du har søkt om pengestøtte frå Nav får du eit eige vedtak og brev om dette.
] else [
  Vedtaket er gjort etter lov om arbeids- og velferdsforvaltningen (Nav-loven) § 14 a.

  Dersom du har søkt om pengestøtte fra Nav får du et eget vedtak og brev om dette.
]

// ── Ungdomsgaranti ────────────────────────────────────────────────────────────
#if ungdomsgaranti [
  == Du har rett til oppfølging etter ungdomsgarantien
  #if nn [
    Dette tyder at du får tilbod om ein fast kontaktperson hos Nav som vil gje deg individuelt tilpassa oppfølging så
    lenge det er naudsynt. Ungdomsgarantien gjeld inntil du fyller 30 år. Les meir om ungdomsgarantien og fast
    kontaktperson på nav.no.
  ] else [
    Dette betyr at du får tilbud om en fast kontaktperson hos Nav som vil gi deg individuell tilpasset oppfølging så
    lenge det er nødvendig. Ungdomsgarantien gjelder inntil du fyller 30 år. Les mer om ungdomsgarantien og fast
    kontaktperson på nav.no/ungdomsgarantien.
  ]
]

// ── Begrunnelse ───────────────────────────────────────────────────────────────
#if begrunnelse.len() > 0 [
  #if nn [== Dette er grunngjevinga vår] else [== Dette er begrunnelsen vår]
  #for avsnitt in begrunnelse [
    #avsnitt

  ]
]

// ── Kilder ────────────────────────────────────────────────────────────────────
#if nn [== Kjeldene vi har brukt i vurderinga] else [== Kildene vi har brukt i vurderingen]

#if nn [I vurderinga vår har vi brukt opplysningar frå desse kjeldene:] else [I vurderingen vår har vi brukt opplysninger fra disse kildene:]

#for kjelde in kilder [
  - #kjelde
]

#if malType == "STANDARD_INNSATS_SKAFFE_ARBEID_PROFILERING" [
  #if nn [
    I tillegg har vi sett på kva moglegheiter du har i arbeidsmarknaden, og at du har vore i jobb i minst
    6 av dei siste 12 månadene.
  ] else [
    I tillegg har vi sett på mulighetene dine i arbeidsmarkedet, og at du har vært i jobb i minst 6 av de
    siste 12 månedene.
  ]
] else [
  #if nn [I tillegg har vi sett på kva moglegheiter du har i arbeidsmarknaden.] else [I tillegg har vi sett på mulighetene dine i arbeidsmarkedet.]
]

#if nn [Du finn nokre av opplysningane vi har om deg på nav.no/min-side.] else [Du finner noen av opplysningene vi har om deg på nav.no/min-side.]

// ── Hjelp (tjenester) ─────────────────────────────────────────────────────────
#if malType in (
  "STANDARD_INNSATS_SKAFFE_ARBEID",
  "STANDARD_INNSATS_SKAFFE_ARBEID_PROFILERING",
  "SITUASJONSBESTEMT_INNSATS_SKAFFE_ARBEID",
  "SPESIELT_TILPASSET_INNSATS_SKAFFE_ARBEID",
  "GRADERT_VARIG_TILPASSET_INNSATS_SKAFFE_ARBEID",
) [
  #if nn [
    == Tenester du kan bruke
    På nav.no kan du

    - få tips til å skrive CV og søknad og korleis du kan bu deg til jobbintervju på nav.no/soker-jobb
    - registrere CV-en din på nav.no/min-cv slik at Nav kan formidle den til aktuelle arbeidsgivarar
    - halde oversikt over jobbar du søkjer på og andre arbeidsretta aktivitetar i aktivitetsplanen på nav.no/aktivitetsplan
  ] else [
    == Tjenester du kan bruke
    På nav.no kan du

    - få tips til å skrive CV og søknad og hvordan du kan forberede deg til jobbintervju på nav.no/soker-jobb
    - registrere CV-en din på nav.no/min-cv slik at Nav kan formidle den til aktuelle arbeidsgivere
    - holde oversikt over jobber du søker på og andre arbeidsrettede aktiviteter i aktivitetsplanen på nav.no/aktivitetsplan
  ]
] else if malType in (
  "STANDARD_INNSATS_BEHOLDE_ARBEID",
  "SITUASJONSBESTEMT_INNSATS_BEHOLDE_ARBEID",
  "SPESIELT_TILPASSET_INNSATS_BEHOLDE_ARBEID",
  "GRADERT_VARIG_TILPASSET_INNSATS_BEHOLDE_ARBEID",
) [
  #if nn [
    == Tenester du kan bruke
    På nav.no kan du

    - halde oversikt over arbeidsretta aktivitetar i aktivitetsplanen på nav.no/aktivitetsplan
  ] else [
    == Tjenester du kan bruke
    På nav.no kan du

    - holde oversikt over arbeidsrettede aktiviteter i aktivitetsplanen på nav.no/aktivitetsplan
  ]
]

// ── Klage ─────────────────────────────────────────────────────────────────────
== Du har rett til å klage

#if nn [
  Dersom du er ueinig i vurderinga, kan du klage innan tre veker frå datoen då vedtaket kom fram til deg. Du finn
  skjema og informasjon på nav.no/klage.

  Meir informasjon om retten til å klage finn du på nav.no/klagerettigheter.
] else [
  Hvis du er uenig i vurderingen, kan du klage innen tre uker fra datoen da vedtaket kom fram til deg. Du finner
  skjema og informasjon på nav.no/klage.

  Mer informasjon om retten til å klage finner du på nav.no/klagerettigheter.
]

// ── Spørsmål ──────────────────────────────────────────────────────────────────
== Har du spørsmål?

#if nn [
  Du finn meir informasjon på nav.no/arbeid.

  På nav.no/arbeid/dialog kan du kontakte rettleiaren din.

  Om du ikkje finn svar på nav.no, kan du ringe oss på telefon 55 55 33 33, kvardagar 09:00–15:00.
] else [
  Du finner mer informasjon på nav.no/arbeid.

  På nav.no/arbeid/dialog kan du kontakte veilederen din.

  Hvis du ikke finner svar på nav.no, kan du ringe oss på telefon 55 55 33 33, hverdager 09:00–15:00.
]

// ── Signatur ──────────────────────────────────────────────────────────────────
#if nn [Med vennleg helsing] else [Med vennlig hilsen]

#if veilederNavn != "" [#veilederNavn \ ]

#navKontor
