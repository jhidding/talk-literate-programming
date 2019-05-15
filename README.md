---
title: Quick presentation with Reveal.js and Pandoc
author: Johan Hidding
---

# Reveal.js with NLeSC theme

## Prerequisites

* make
* inotifytools
* git
* Pandoc
* for the NLeSC theme: Akkurat fonts (available on NLeSC SharePoint)

## Working on your presentation

* First time, running `make` should clone `reveal.js` for you.
* Run `npm start` from the `reveal.js` directory to serve your presentation.
* Run `inotify-make.sh` script to automatically update from Markdown to HTML.
* Build themes: `npm run build -- css-themes`

## While presenting

* press `s` to show speaker notes

::: {.notes}
This is a note right here!
:::

