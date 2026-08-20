// Samleimport for vedtak14a-endepunktene. Gir én import-flate slik at
// templates/vedtak14a/*.typ kan gjøre `#import "/resources/vedtak14a/lib.typ": *`.

#import "layouts/brev.typ": base
#import "layouts/oyeblikkbilde.typ": oyeblikkbilde-header
#import "layouts/oyeblikkbilde-style.typ": oyeblikk-style
#import "util.typ": iso_to_long_date, json-key

#import "components/innledning.typ": innledning
#import "components/ungdomsgaranti.typ": ungdomsgaranti
#import "components/begrunnelse.typ": begrunnelse
#import "components/kilder.typ": kilder
#import "components/hjelp-skaffe.typ": hjelp-skaffe
#import "components/hjelp-beholde.typ": hjelp-beholde
#import "components/klage.typ": klage
#import "components/sporsmal.typ": sporsmal
#import "components/signatur.typ": signatur
