// Sett `debug-baseline` til `true` når du vil se baselinegridet.
// Skal være `false` i vanlige commits.

#let debug-baseline = false

// Må samsvare med sidemarger i malen som bruker overlayet.
#let margin-top = 64pt
#let margin-bottom = 74pt
#let margin-x = 64pt

#let baseline-overlay = layout(size => {
  let step = 16pt
  let count = int(calc.floor(size.height / step))
  let step-label = int(calc.round(step / 1pt))
  let page-height-label = int(calc.round(size.height / 1pt))

  box(width: size.width, height: size.height, {
    for i in range(count + 1) {
      let y = i * step
      let is-margin = y == margin-top or y == (size.height - margin-bottom)
      let stroke = if is-margin { 0.8pt + blue } else { 0.5pt + red }
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

    place(top + left, dx: margin-x, line(angle: 90deg, length: size.height, stroke: 0.8pt + blue))
    place(top + left, dx: size.width - margin-x, line(angle: 90deg, length: size.height, stroke: 0.8pt + blue))
  })
})
