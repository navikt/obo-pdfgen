#import "../util.typ": by-malform

#let begrunnelse(malform, begrunnelse) = {
  if begrunnelse != none and begrunnelse != () {
    by-malform(malform,
    [== Dette er grunngjevinga vår],
    [== Dette er begrunnelsen vår]
    )
    
    for (i, avsnitt) in begrunnelse.enumerate() {
      if i > 0 { parbreak() }
      avsnitt
    }
  }
}
