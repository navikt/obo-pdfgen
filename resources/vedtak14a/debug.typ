// Sett `debug-baseline` til `true` når du vil se baselinegridet.
// Skal være `false` i vanlige commits.

#import "theme.typ": grid-unit, margin-bottom, margin-top, margin-x

#let debug-baseline = false

#let baseline-overlay = layout(size => {
  let step = grid-unit
  let count = int(calc.floor(size.height / step))
  let step-label = int(calc.round(step / 1pt))
  let page-height-label = int(calc.round(size.height / 1pt))

  box(width: size.width, height: size.height, {
    for i in range(count + 1) {
      let y = i * step
      let is-margin = y == margin-top or y == (size.height - margin-bottom)
      let stroke = if is-margin { 1.2pt + blue } else { 0.8pt + red }
      place(top + left, dy: y, line(length: size.width, stroke: stroke))
      if i > 0 {
        place(top + left, dx: 2pt, dy: y - 7pt,
          text(size: 6pt, fill: red, weight: "bold")[#(i * step-label)]
        )
      }
    }

    place(top + left, dx: 2pt, dy: size.height - 7pt,
      text(size: 6pt, fill: red, weight: "bold")[#page-height-label]
    )

    place(top + left, dx: margin-x, line(angle: 90deg, length: size.height, stroke: 1.2pt + blue))
    place(top + left, dx: size.width - margin-x, line(angle: 90deg, length: size.height, stroke: 1.2pt + blue))
  })
})
