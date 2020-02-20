---
title: Literate Programming using Entangled
subtitle: an update
author: "Johan Hidding <div><img src=\"img/escience.png\" style=\"border: none; padding: 5pt 10pt\" width=\"40%\"></div>"
bibliography: ref.bib
---

# What?

## Me

![](img/col.svg){style="border: none;"}

## Polynerd

![](img/bach_proof_2.png){style="width: 40%; border: none;"}

## This talk

- Literate Programming: Why?
- Notebooks (Jupyter) have limitations
- Example technique: layered programming
- Give Julia a swing
- Pandoc is king

# Literate Programming

## Donald Knuth

![Donald Knuth](img/knuth.jpg)

::: {.notes}
- Donald Knuth: “The Art of Computer Programming”, “Surreal Numbers”
- Inventor of literate programming
- “nobody wants to admit writing an illiterate program”
:::

## Why *Literate programming*?

![](img/chimp.jpg){style="border: none; width: 40%"}

> ... nobody wants to admit writing an illiterate program ...

## Motivation

scientific rigour
: Should extend to **software** $\to$ "Open Science"

epistemology
: Explain it to a six-year old

programming literacy
: Read other people's code

program structure
: Code transposition

::: {.notes}
- Epistemology: theory of knowledge
- When can we say we know something?
- example: relativity.
- Scientists are not trained programmers.
- Need code exposure
:::

## Books

![A sample of books using LP](img/boeken.jpg)

## Existing tools

- Noweb
- Emacs Org-mode
- KnitR
- Jupyter

<!--
## Tools and workflow

::: {.container}
:::: {.col}
- Pandoc [@Pandoc]
- Lua filters
- Entangled
::::

:::: {.col}
![](img/lp.svg)
::::
:::

# Hello, World!

## Introduction
- *Literate programming* [@Knuth1984].
- System of references: *noweb* [@Ramsey1994].

## References
- References inside code blocks: `<<...>>`

``` {.cpp file=hello_world.cc}
#include <cstdlib>
#include <iostream>

<<example-main-function>>
```

## References
- Code-blocks have names

``` {.cpp #example-main-function}
int main(int argc, char **argv) {
  <<hello-world>>
}
```

``` {.cpp #hello-world}
std::cout << "Hello, World!" << std::endl;
```

## References
* And can be appended to

``` {.cpp #hello-world}
return EXIT_SUCCESS;
```

## Tangling
* Code blocks are *tangled* into source files.

``` {.cpp file=hello_world.cc}
#include <cstdlib>
#include <iostream>

int main(int argc, char **argv) {
    std::cout << "Hello, World!" << std::endl;
    return EXIT_SUCCESS;
}
```
-->

# Demo!!!

# Entangled

## Entangled

::: {.container}
:::: {.col}
- Tangle and stitch
- Editor independent
- Language independent
- [entangled.github.io](https://entangled.github.io/)
::::
:::: {.col}
![](img/entangled.jpg){style="width:60%"}
::::
:::

