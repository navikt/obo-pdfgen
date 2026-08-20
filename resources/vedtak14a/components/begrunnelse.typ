#let begrunnelse(malform, begrunnelse) = {
  if begrunnelse != none and begrunnelse != () {
    if malform == "NN" [
      == Dette er grunngjevinga vår
    ]
    if malform == "NB" [
      == Dette er begrunnelsen vår
    ]
    for (i, avsnitt) in begrunnelse.enumerate() {
      if i > 0 { parbreak() }
      avsnitt
    }
  }
}
