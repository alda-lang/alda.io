---
layout: page
title: Alda
hide_title: true
subtitle: A music programming language for musicians
sitemap:
  priority: 0.9
---

Alda is a text-based programming language for music composition. It allows you
to write and play back music using only a text editor and the command line.

```alda
piano:
  o3
  g8 a b > c d e f+ g | a b > c d e f+ g4
  g8 f+ e d c < b a g | f+ e d c < b a g4
  << g1/>g/>g/b/>d/g
```

The language's design equally favors aesthetics, flexibility and ease of use.

---

## Features

* Easy to understand, markup-like syntax.

* Designed for musicians who don't know how to program, as well as programmers
  who don't know how to music.

* A score is a text file that can be played using the `alda` command-line tool.

* [Interactive REPL][doc-repl] lets you enter Alda code and hear the results in
  real time.

* Supports [writing music programmatically][doc-programmatic] (for algorithmic
  composition, live coding, etc.)

* Create MIDI music using any of the instruments in the [General MIDI Sound
  Set][gm-sound-set].

[doc-repl]: https://github.com/alda-lang/alda/blob/master/doc/alda-repl.md
[doc-programmatic]: https://github.com/alda-lang/alda/blob/master/doc/writing-music-programmatically.md
[gm-sound-set]: http://www.midi.org/techspecs/gm1sound.php
