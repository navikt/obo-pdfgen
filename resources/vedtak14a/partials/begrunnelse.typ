#let begrunnelse(malform, begrunnelse) = {
  if begrunnelse != none and begrunnelse != () {
    if malform == "NN" [
      == Dette er grunngjevinga vår
    ]
    if malform == "NB" [
      == Dette er begrunnelsen vår
    ]
    for avsnitt in begrunnelse [
      #avsnitt
    ]
  }
}
