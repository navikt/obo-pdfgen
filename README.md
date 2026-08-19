# obo-pdfgenrs
Pdfgen som bruker Rust-versjon pdfgenrs

#### Lokal testing
Start en docker container, eg `colima start`.
Kjør `./run_development.sh`

PDF vil bli laget ved kall til `http://localhost:8081/api/v1/genpdf/<application>/<template>`
Innholdet hentes fra `/data/<application>/<template>.json`. I prod så POSTes JSON til endepunktet istedenfor

Testing av § 14 a-vedtak: http://localhost:8081/api/v1/genpdf/vedtak14a/vedtak14a


Testdata for `/templates/<application>/<template>` settes i `/data/<application>/<template>.json` 


#### Automatisk generering av PDFer
For å generere PDFer automatisk, kan du bruke `generer_pdfer_[xxx].sh`-skriptene. 
Disse vil loope gjennom målformer (bokmål og nynorsk), de definerte maltypene, og evt andre variabler og generere en PDF for hver kombinasjon.

1. Start opp en docker container, eg `colima start`.
2. Kjør `./run_development.sh`
3. Kjør et av skriptene i `data/vedtak14a/`-mappen, for eksempel `./data/vedtak14a/generer_pdfer_vedtak14a.sh`.
4. Sjekk output mappen for genererte PDFer.
