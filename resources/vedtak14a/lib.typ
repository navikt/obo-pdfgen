// Samleimport for vedtak14a-endepunktene. Gir én import-flate slik at
// templates/vedtak14a/*.typ kan gjøre `#import "/resources/vedtak14a/lib.typ": *`.

#import "components/oyeblikksbilde-header.typ": oyeblikksbilde-header
#import "util.typ": iso_to_long_date, json-key, by-malform, nav-lenke, felt, field-or-none, date-field-or-none, labeled, build-list, har, section, simple-section, qa, qa-multi
#import "vedtak-style.typ": style
#import "oyeblikksbilde-style.typ": oyeblikksbilde-style

#import "components/innledning.typ": innledning
#import "components/ungdomsgaranti.typ": ungdomsgaranti
#import "components/begrunnelse.typ": begrunnelse
#import "components/kilder.typ": kilder
#import "components/hjelp.typ": hjelp
#import "components/klage.typ": klage
#import "components/sporsmal.typ": sporsmal
#import "components/signatur.typ": signatur
