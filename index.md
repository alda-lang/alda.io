---
layout: page
title: Alda
subtitle: A music programming language for musicians
sitemap:
  priority: 0.9
---

Alda is a text-based programming language for music composition. It allows you to write and play back music using nothing but a text editor.

    piano: o3
    g8 a b > c d e f+ g | a b > c d e f+ g4
    g8 f+ e d c < b a g | f+ e d c < b a g4
    << g1/>g/>g/b/>d/g

The language's design equally favors aesthetics, flexibility and ease of use.

---

## Features

* Easy to understand, markup-like syntax.

* Perfect for musicians who don't know how to program and programmers who don't know how to music.

* Represent scores as text files and play them back with the alda command-line tool.

* Interactive REPL lets you type Alda code and hear the results in real time.

* Underlying Clojure DSL allows you to use Alda directly in your Clojure project.

* Inline Clojure code allows you to hack the Gibson and write scores programmatically.

* Create MIDI music using any of the instruments in the General MIDI Sound Set.
