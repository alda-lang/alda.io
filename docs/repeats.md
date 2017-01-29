---
layout: page
title: Repeats
subtitle: 
permalink: /docs/repeats
---

# Repeats

[Notes](../docs/notes), [sequences](../docs/sequences) and other types of events can be **repeat**ed any number of times, by simply appending `*` and a number. Putting whitespace between the event and the `*` is optional, as is putting whitespace between the `*` and the number of repeats.

For example:

```
piano:
  # repeating single notes
  c *4 c2 *2

  # repeating a sequence containing notes and an octave change
  [c8 d e >]*3
```
