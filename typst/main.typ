#import "@preview/touying:0.6.1": *
#import "@preview/zebraw:0.5.5": *

#show: zebraw-init.with(
  background-color: none,
  numbering: false,
  comment-flag: "//"
)

#import themes.university: *

#show: university-theme.with(
  aspect-ratio: "16-9",
  footer-a: [Sun Wenjie / Josiah / Mossa],
  // config-common(new-section-slide-fn: none),
  // Bioconductor
  config-colors(
    primary:   rgb("#1a81c2"),   // Bioc blue
    secondary: rgb("#87b13f"),   // Bioc green
    tertiary:  rgb("#1a81c2"),   // Reusing Bioc blue or a tint
    neutral-lightest: rgb("#ffffff"), // white (no change)
    neutral-darkest:  rgb("#000000")  // black (no change)
  ),
  config-info(
    title: [Exploring R and Rust in Bioinformatics],
    subtitle: [Online Developer Forum],
    author: [
      #pad(left: 10em)[
        #align(left)[
        Sun Wenjie,
        Mossa Merhi Reimert,
        Josiah Parry\
        Hosted by: Lluís Revilla \ (Bioconductor Community Advisory Board)
        ]
      ]
    ],
    // date: datetime.today(),
    date: [28#super[th] July 2025],
    institution: image("../images/biocondoctor_logo.svg"),
    // [
      // #box(image("biocondoctor_logo.svg", height: 1.55em), inset: -0.2em, outset: 0.5em)
      // : Bioconductor Developer Forum],
    // logo: emoji.school,
    // logo: image("feRris.png", width: 10%)
  ),
)

#show link: set text(fill: purple)
// assume it is r when inlines
#set raw(lang: "r")
#show raw: set text(font: "Fira Code", ligatures: true)
// #set heading(numbering: numbly("{1}.", default: "1.1"))

#title-slide()

// intro (Josiah)
// what is extendr(Josiah)
// why rust (high level "why" with personal opinion)(Josiah)
// extendr in CRAN (Josiah)
// how we use extendr at Esri (Josiah)
// mdl demo (you, Mossa)
// roadmap (you, Mossa)
// questions

= Thank you!
#{
  matrix-slide()[
  #set text(size: 0.8em)
    #set align(top + left)
  === About Mossa
  
  -   Maintainer & Lead Developer of extendr
  
  -   PhD Veterinary Epidemiology
  -   Postdoc \@ Københavns Universitet -- University of Copenhagen
  ][
  
  #set text(size: 0.8em)
    #set align(top + left)
  === About Josiah
  
  -   Sr. Product Engineer \@ Esri
  
  -   Spatial Statistician
  
  -   Building R packages for the R-ArcGIS Bridge
  ][
  #set text(size: 0.8em)
    #set align(top + left)
    === About Sun Wenjie
    -   Postdoc \@ Institut Curie, Paris
  
    -   Computational Biologist & Bioinformatician  
    -   Developer of tools in R, C++, and Rust
    -   Research focus: Cancer, stem cells, and data analysis
  ]
}
= What is extendr?

==

#emph[extend]ing R with Rust

-   Include Rust into R packages

-   Akin to Rcpp & cpp11

== What even is Rust?

-   Low-level language

-   Modern day equivalent to C++
-   Memory safe-er
-   Developer friendly

- No default garbage collector

#focus-slide()[
  Scientific computing with Rust is growing
]

#empty-slide()[
  #set align(center + horizon)
// #image("../images/paste-5.png){fig-align="center"}
  #image("../images/paste-5.png", height: 130%)
  // source: https://blog.rust-lang.org/2025/02/13/2024-State-Of-Rust-Survey-results/
]

== extendr is comprised of:

-   `{rextendr}` -- usethis-like R package

- #link("https://extendr.github.io/extendr/extendr_api", "extendr-api") -- the “core” Rust library
- #link("https://extendr.github.io/extendr/extendr_ffi", "extendr-ffi") -- bindings to R’s C API
- #link("https://extendr.github.io/extendr/extendr_engine", "extendr-engine") -- R engine for embedding R into Rust


== extendr packages

#slide(composer: (1fr,1fr))[
  
-   16 CRAN packages

-   Many, many more on GitHub:
][
  #image("../images/paste-3.png")
]

== 380k downloads and counting

#[
  #set align(center + horizon)
  #image("../images/paste-1.png")
]
= Why Rust?
// #sym.arrow.double Easy to make bindings

== Blazingly fast
#slide(composer: (2fr, 2.5fr))[
    #set align(center + horizon)
    #image("../images/d4a0188983b23dfa9376b322d47ae657.jpeg")
][
  #set align(horizon)
  #quote(block: true,
  [Rust Is Blazingly Fast \ (And We Won't Shut Up About It)], 
    attribution: [The entire Rust community.])
]

== The compiler is nice

#grid(
  columns: 2,
  column-gutter: 2em,
  image("../images/paste-18.png"),
  [
    #set align(bottom)
    Source: #link("programmerhumor.io",
      "https://programmerhumor.io/backend-memes/rust-3/")
  ]
)

== The compiler is nice

#[
#set align(center + horizon) 
#image("../images/paste-8.png", height: 82%)
  #link("https://medium.com/faun/why-you-should-stop-what-youre-doing-right-now-and-learn-rust-7d8ca1ff334c", [Why You Should Stop What You’re Doing Right Now and Learn Rust])
]

== Easy (enough) to refactor

#image("../images/paste-7.png")
Source: #link("https://www.reddit.com/r/rust/comments/17jeezg/so_is_rust_easy_to_refactor_or_bad_to_refactor/",[reddit poll])

== Why Rust?

#align(center + horizon)[ 
  #image("../images/paste-10.png")
]

== Quick to pickup

#align(center + horizon)[
  #image("../images/paste-6.png", height: 84%)
  A little skill goes a long way
]

== Example: single

#let code = ```rust
#[extendr]
fn gh_encode(x: f64, y: f64, length: usize) -> String {
    let coord = Coord { x, y };
    encode(coord, length).expect("Failed to encode the geohash")
}
```

#[
  #show raw: set text(size: 17pt) 
  #show raw: set align(horizon)
  #zebraw(code, highlight-lines: 1)
  #pagebreak(weak:true)
  #zebraw(code, highlight-lines: 2)
  #pagebreak(weak:true)
  #zebraw(code, highlight-lines: 3)
  #pagebreak(weak:true)
  #zebraw(code, highlight-lines: 4)
]


// ``` {.rust code-line-numbers="2|3,4|5|6|7,8|11"}
#let code = ```rust
#[extendr]
fn gh_encode(x: &[f64], y: &[f64], length: usize) -> Vec<String> {
  x
    .into_iter() 
    .zip(y.into_iter()) 
    .map(|(xi, yi)| { 
        let coord = Coord { x: xi, y: yi };
        encode(coord, length)
            .expect("Failed to encode the geohash")
    })
    .collect::<Vec<_>>()
}
```
== Example: vectorize
#[
  #show raw: set text(size: 18pt)
  #for value in ((2,3), (4,5,6,7), (8,11)) {
    // heading(depth:2)[Example: vectorize]
    pagebreak(weak:true)
    zebraw(code, highlight-lines: value)
  }
]

== Example: parallelize 

#{
  show raw: set text(size: 18pt)
  zebraw(highlight-lines: (6,7),
  ```rust
  #[extendr]
  fn gh_encode(x: &[f64], y: &[f64], length: usize) -> Vec<String> {
    x
      .into_iter()
      .zip(y.into_iter())
      .par_bridge() // convert into a parallel iterator
      .with_min_len(1024) // set minimum parallel chunk length
      .map(|(xi, yi)| {
          let coord = Coord { x: xi, y: yi };
          encode(coord, length)
              .expect("Failed to encode the geohash")
      })
      .collect::<Vec<_>>()
  }
  ```
)
}

= extendr in bioinformatics

== WebGestaltR

#slide(composer:(2fr, 1fr))[
#image("../images/paste-11.png")
][
  #set align(bottom)
  #link("https://bzhanglab.github.io/WebGestaltR/", `github/bzhanglab/WebGestaltR`)
]

== 

#slide(composer:(1fr, 1fr))[
  #image("../images/paste-12.png")
  #set align(center + bottom)
  #link("https://github.com/spang-lab/metabodecon", [`github/spang-lab/metabodecon`])
][
  #image("../images/paste-13.png")
  #set align(center + bottom)
  #link("https://github.com/spang-lab/mdrb",[`github/spang-lab/mdrb`])
]
== mspredictr

#[
  #image("../images/paste-14.png")
  
  #set align(center + bottom)

  #link("https://github.com/jeffsocal/mspredictr", [`github/jeffsocal/mspredictr`])
]

== viewmastR

#[ 
#set align(center)
#image("../images/paste-15.png", height: 80%)
#set align(bottom)
#link("https://github.com/furlan-lab/viewmastR", [`github/furlan-lab/viewmastR`])
]
= extendr across-language

== Phylo2Vec

#[
  #image("../images/paste-17.png", height: 80%)
  #link("https://phylo2vec.readthedocs.io/en/latest/README.html", 
  [`sbhattlab/phylo2vec/phylo2vec`])
]

== Exon

#[
  
#image("../images/paste-16.png", height: 80%)

#link("https://github.com/wheretrue/exon", [`github/wheretrue/exon`])
]

== and even more

-   #link("https://github.com/wenjie1991/CellBarcodeRS", [`CellBarcode`]) 

-   #link("https://github.com/mooreryan/taxozack", [`taxozack`])

-   #link("https://github.com/angelovangel/rfaster2", [`rfaster2`])

-   #link("https://github.com/jaropis/hrvhra", [`hrvhra`])

-   #link("https://github.com/BrftM/fqtkWrapper", [`fqtkWrapper`])


= Use case `extendr/mdl`

==
An example of a rust-powered R-package is `{mdl}`.

- Transforms a data-frame into a design/model matrix, that are used within `lm`/`glm`/`glmnet`/etc. 

#[
  #set text(size: 22pt)
  ```r
  > mtcars$cyl <- as.factor(mtcars$cyl)
  + head(
  +   mdl::mtrx(mpg ~ ., mtcars)
  + )
    (Intercept) cyl6 cyl8 disp  hp drat    wt  qsec vs am gear carb
  1           1    1    0  160 110 3.90 2.620 16.46  0  1    4    4
  2           1    1    0  160 110 3.90 2.875 17.02  0  1    4    4
  3           1    0    0  108  93 3.85 2.320 18.61  1  1    4    1
  4           1    1    0  258 110 3.08 3.215 19.44  1  0    3    1
  5           1    0    1  360 175 3.15 3.440 17.02  0  0    3    2
  6           1    1    0  225 105 2.76 3.460 20.22  1  0    3    1
  ```
  #pagebreak()
]
#[
  == Benchmark:
  // #set text(size: pt)
  ```r
  # A tibble: 2 × 4
    expression                    median `itr/sec` mem_alloc
    <bch:expr>                     <dbl>     <dbl>     <dbl>
  1 mdl::mtrx(mpg ~ ., mtcars)       1        10.5      1   
  2 model.matrix(mpg ~ ., mtcars)   10.8       1        4.40
  ```
  #text(size: 20pt, [scaled wrt. best performing])
]

#pause 
Overall, between 1.7#sym.times and 11#sym.times faster than R's `model.matrix`.

But there is more.. Performance is not everything.

// #pagebreak(weak:true)
==

- The rust core of `mdl` is app. 250 LOC

- Parallel processing of variables is implemented (via `rayon`)

- 100% safe code

#pause

#sym.arrow.r Any non-expert maintainer can tweak `mdl`, and if it compiles, it works.

= Roadmap
==
===  Main priority: Developers, developers, developers
- Better support on package repositories like CRAN and Bioconductor

- Improve and complete #link("https://extendr.github.io/user-guide/", [our User Guide])
- Outreach to users via presentations and workshops

=== More Rust in R's ecosystem

- Leverage existing rust crates through binding r-packages
  
- More maintainers for extendr

#focus-slide()[
  Thanks for your attention. \
  #[
    #set text(size: 15pt)
    Thanks to Lluís Revilla for organising, hosting, and guiding us.
  ]
]


#focus-slide()[
  #set align(center)
  Let's discuss!\ 
  // #line(stroke: teal)
  // #rect(fill: rgb("#87b13f"), width: 9em,)
  #rect(fill: rgb("#87b13f"), width: 9em,radius: 1.234em)
  Questions?
]

// #matrix-slide(rows: 1, [
//   #set align(left + top)
//   R side:
  
//   - Memory safe parallel processing
  
//   - Async support via `{mirai}`
  
//   - Finish webR support
  
//   - `{vctrs}` support for rust vectors
//   // - Add `{vctrs}` style support 
  
// ],[
//   #set align(left + top)
//   Rust side:
//   - "native" arrow support
  
//   - Add `nalgebra` support
//   - WASM and webr support
    
// ],)



// On-going efforts

// - WASM  and webr support

== Maintainer burden

- New version of Rust (`rustc`/`cargo`) is released every 6 weeks

This is not an issue as
- `rustup` ensures that multiple compilers can be installed on the same machine, without conflict

- How does rust handle system dependencies?

Rust packages are called crates, and not _libraries_.

- `cargo` bundles all dependencies, thus no conflict can occur

#pagebreak(weak: true)

- Rust's package repository is #link("https://crates.io/","crates.io"). Maintained by #link("https://www.rust-lang.org/governance/teams/dev-tools#team-crates-io", [crates.io team]) and the Rust Foundation#footnote[
  Separate, legal entity, that funds the infrastructure work
].
Previously, `cargo`/`crates.io` relied on an index registry hosted by GitHub. As of release 1.70.0, that is no longer the case.

- Rust guarantees *forward compatibility* of the different versions, however..
  - There are *Editions* which are opt-in breaking changes
  - There are new lints and warnings

Fear not, add Rust to your stack!

#show: appendix

== #raw("cargo geiger mdl", lang: "zsh")
#[
  #set align(horizon)
  #show raw: set text(size: 14pt)
  ```
  Metric output format: x/y
      x = unsafe code used by the build
      y = total unsafe code found in the crate
  
  Symbols:
      🔒  = No `unsafe` usage found, declares #![forbid(unsafe_code)]
      ❓  = No `unsafe` usage found, missing #![forbid(unsafe_code)]
      ☢️   = `unsafe` usage found
  
  Functions  Expressions  Impls  Traits  Methods  Dependency
  ```
  #pagebreak()
  #set align(horizon)
  ```
  0/0        0/0          2/2    0/0     0/0      ☢️  mdl 0.1.0
  55/84      1990/3033    1/1    0/0     12/12    ☢️  └── extendr-api 0.8.0
  8/8        33/33        0/0    0/0     0/0      ☢️      ├── extendr-ffi 0.8.0
  0/0        0/0          0/1    0/0     0/0      ☢️      ├── extendr-macros 0.8.0
  0/0        15/15        0/0    0/0     3/3      ☢️      │   ├── proc-macro2 1.0.86
  0/0        4/4          0/0    0/0     0/0      ☢️      │   │   └── unicode-ident 1.0.12
  0/0        0/0          0/0    0/0     0/0      ❓      │   ├── quote 1.0.37
  0/0        15/15        0/0    0/0     3/3      ☢️      │   │   └── proc-macro2 1.0.86
  0/0        88/88        3/3    0/0     2/2      ☢️      │   └── syn 2.0.77
  0/0        15/15        0/0    0/0     3/3      ☢️      │       ├── proc-macro2 1.0.86
  0/0        0/0          0/0    0/0     0/0      ❓      │       ├── quote 1.0.37
  0/0        4/4          0/0    0/0     0/0      ☢️      │       └── unicode-ident 1.0.12
  0/0        81/124       5/9    0/0     3/5      ☢️      ├── once_cell 1.21.3
  0/0        0/0          0/0    0/0     0/0      ❓      └── paste 1.0.15
  
  63/92      2211/3297    11/16  0/0     20/22
  ```
]