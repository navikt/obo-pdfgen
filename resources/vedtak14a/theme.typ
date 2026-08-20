// Design tokens som speiler Aksel «Visuelle retningslinjer for brev»
// https://aksel.nav.no/god-praksis/artikler/visuelle-retningslinjer-for-brev
// Målene er oppgitt i px i retningslinjene; for A4-PDF tilsvarer 1 px = 1 pt.

// Font og farge
#let font-family = "Source Sans 3"
#let text-color = rgb("#000000")

// Baselinegrid (= linjehøyden til brødteksten)
#let grid-unit = 16pt

// Sidemarger
#let margin-top = 64pt
#let margin-bottom = 74pt
#let margin-x = 64pt

// Tekststiler: (størrelse, linjehøyde, vekt, letterspacing)
#let style-h1 = (size: 16pt, line-height: 20pt, weight: "bold", tracking: 0.3pt)
#let style-h2 = (size: 13pt, line-height: 16pt, weight: "bold", tracking: 0.25pt)
#let style-h3 = (size: 12pt, line-height: 16pt, weight: "bold", tracking: 0.2pt)
#let style-h4 = (size: 11pt, line-height: 16pt, weight: "bold", tracking: 0.1pt)
#let style-body = (size: 11pt, line-height: 16pt, weight: "regular")
#let style-footer = (size: 9pt, line-height: 16pt, weight: "regular")

// Vertikal rytme
#let space-above-h1 = 48pt          // fra person-/saksinfo til tittel
#let space-below-h1 = 26pt          // 26 px under H1
#let space-above-heading = 26pt     // 26 px mellom brødtekst og H2/H3/H4
// Aksel oppgir 6 px under H2/H3/H4. Typst-overskrifter er implisitt «sticky»,
// så avstanden under en overskrift styres av overskriftens egen below-verdi og
// kollapser IKKE mot etterfølgende avsnitts-spacing slik to avsnitt gjør. En
// bokstavelig 6 pt gir derfor tekst som klistrer seg til overskriften. For å
// bevare baselinegridet (og matche fasit, som får ~16 px fra <p>-margin) bruker
// vi én gridrad under overskrifter.
#let space-below-heading = grid-unit
// Kompakt variant for øyeblikksbilder, der overskrifter følges av datarader
// (ikke løpende tekst). Speiler margin-bottom: 6 px i oyeblikk-style.hbs.
#let space-below-heading-compact = 6pt
#let space-before-signatur = 32pt   // 32 px før signatur
#let space-after-signatur = 40pt    // 40 px etter signatur
#let paragraph-spacing = grid-unit  // «vanlig linjeskift» mellom avsnitt

// Faste elementer
#let logo-width = 54pt
#let logo-height = 16pt              // 1 linje i baselinegrid
#let space-below-logo = 48pt        // 48 px avstand under logo
#let footer-from-bottom = 26pt      // bunntekst 26 px fra bunnen av siden

// Cap-height for Source Sans 3, uttrykt i em (målt: Typst legger `leading`
// oppå fontens linjeboks, som ved leading = 0 er nøyaktig cap-height, ikke
// hele skriftstørrelsen). Verifisert konstant på tvers av størrelser:
// 7.26pt/11pt = 10.56pt/16pt = 8.58pt/13pt = 0.66.
#let cap-height-em = 0.66

// Hjelpefunksjon: linjeavstand (leading) for en gitt tekststil, slik at den
// faktiske baseline-til-baseline-avstanden treffer Aksels `line-height`.
// advance = leading + cap-height*size  =>  leading = line-height - cap-height*size
#let leading-of(s) = s.line-height - cap-height-em * s.size

// Hjelpefunksjon: vertikal innrykk (inset) som gir en tabellrad
// høyde lik baselinegridet for brødtekst.
#let row-inset-y = (grid-unit - style-body.size) / 2
