#import "../util.typ": by-malform

#let begrunnelse(malform, begrunnelse) = {
  if begrunnelse != none and begrunnelse != () {
    by-malform(malform,
    nn: [== Dette er grunngjevinga vår],
    nb: [== Dette er begrunnelsen vår],
    )
    
    begrunnelse
  }
}
