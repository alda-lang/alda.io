---
layout: page
title: alda.lisp
subtitle: 
permalink: /docs/alda-lisp
---
# alda.lisp

Under the hood, Alda transforms input (i.e. Alda code) into Clojure code which, when evaluated, produces a map of score information, which the audio component of Alda can then use to make sound. This Clojure code is written in a [DSL](https://en.wikipedia.org/wiki/Domain-specific_language) called **alda.lisp**. See below for an example of alda.lisp code and the result of evaluating it.

## Parsing demo

You can use the `parse` task to parse Alda code into alda.lisp (`-l`/`--lisp`) and/or evaluate it to produce a map (`-m`/`--map`) of score information.

```sh
    $ alda parse --lisp -f examples/hello_world.alda
```


```clojure

    (alda.lisp/score
     (alda.lisp/part
      {:names ["piano"]}
      (alda.lisp/note
       (alda.lisp/pitch :c)
       (alda.lisp/duration (alda.lisp/note-length 8)))
      (alda.lisp/note (alda.lisp/pitch :d))
      (alda.lisp/note (alda.lisp/pitch :e))
      (alda.lisp/note (alda.lisp/pitch :f))
      (alda.lisp/note (alda.lisp/pitch :g))
      (alda.lisp/note (alda.lisp/pitch :f))
      (alda.lisp/note (alda.lisp/pitch :e))
      (alda.lisp/note (alda.lisp/pitch :d))
      (alda.lisp/note
       (alda.lisp/pitch :c)
       (alda.lisp/duration (alda.lisp/note-length 2 {:dots 1})))))
```

```sh
    $ alda parse --map -f examples/hello_world.alda
```

```json
    {
  "chord-mode": false,
  "current-instruments": [
    "piano-sTZpj"
  ],
  "events": [
    {
      "offset": 1000,
      "instrument": "piano-sTZpj",
      "volume": 1,
      "track-volume": 0.78740157480315,
      "panning": 0.5,
      "midi-note": 67,
      "pitch": 391.99543598175,
      "duration": 225,
      "voice": null
    },
    {
      "offset": 250,
      "instrument": "piano-sTZpj",
      "volume": 1,
      "track-volume": 0.78740157480315,
      "panning": 0.5,
      "midi-note": 62,
      "pitch": 293.66476791741,
      "duration": 225,
      "voice": null
    },
    {
      "offset": 750,
      "instrument": "piano-sTZpj",
      "volume": 1,
      "track-volume": 0.78740157480315,
      "panning": 0.5,
      "midi-note": 65,
      "pitch": 349.228231433,
      "duration": 225,
      "voice": null
    },
    {
      "offset": 1500,
      "instrument": "piano-sTZpj",
      "volume": 1,
      "track-volume": 0.78740157480315,
      "panning": 0.5,
      "midi-note": 64,
      "pitch": 329.62755691287,
      "duration": 225,
      "voice": null
    },
    {
      "offset": 2000,
      "instrument": "piano-sTZpj",
      "volume": 1,
      "track-volume": 0.78740157480315,
      "panning": 0.5,
      "midi-note": 60,
      "pitch": 261.6255653006,
      "duration": 1350,
      "voice": null
    },
    {
      "offset": 500,
      "instrument": "piano-sTZpj",
      "volume": 1,
      "track-volume": 0.78740157480315,
      "panning": 0.5,
      "midi-note": 64,
      "pitch": 329.62755691287,
      "duration": 225,
      "voice": null
    },
    {
      "offset": 0,
      "instrument": "piano-sTZpj",
      "volume": 1,
      "track-volume": 0.78740157480315,
      "panning": 0.5,
      "midi-note": 60,
      "pitch": 261.6255653006,
      "duration": 225,
      "voice": null
    },
    {
      "offset": 1250,
      "instrument": "piano-sTZpj",
      "volume": 1,
      "track-volume": 0.78740157480315,
      "panning": 0.5,
      "midi-note": 65,
      "pitch": 349.228231433,
      "duration": 225,
      "voice": null
    },
    {
      "offset": 1750,
      "instrument": "piano-sTZpj",
      "volume": 1,
      "track-volume": 0.78740157480315,
      "panning": 0.5,
      "midi-note": 62,
      "pitch": 293.66476791741,
      "duration": 225,
      "voice": null
    }
  ],
  "beats-tally": null,
  "instruments": {
    "piano-sTZpj": {
      "octave": 4,
      "current-offset": {
        "offset": 3500
      },
      "key-signature": {
        
      },
      "config": {
        "type": "midi",
        "patch": 1
      },
      "duration": 3,
      "min-duration": null,
      "volume": 1,
      "last-offset": {
        "offset": 2000
      },
      "id": "piano-sTZpj",
      "quantization": 0.9,
      "duration-inside-cram": null,
      "tempo": 120,
      "panning": 0.5,
      "current-marker": "start",
      "time-scaling": 1,
      "stock": "midi-acoustic-grand-piano",
      "track-volume": 0.78740157480315
    }
  },
  "markers": {
    "start": 0
  },
  "cram-level": 0,
  "global-attributes": {
    
  },
  "nicknames": {
    
  },
  "beats-tally-default": null
}    :midi-note 64,
        :pitch 329.6275569128699,
        :duration 225.0,
        :voice nil}
       {:offset 750.0,
        :instrument "piano-Id8yG",
        :volume 1.0,
        :track-volume 0.7874015748031497,
        :panning 0.5,
        :midi-note 65,
        :pitch 349.2282314330039,
        :duration 225.0,
        :voice nil}
       {:offset 1000.0,
        :instrument "piano-Id8yG",
        :volume 1.0,
        :track-volume 0.7874015748031497,
        :panning 0.5,
        :midi-note 67,
        :pitch 391.99543598174927,
        :duration 225.0,
        :voice nil}
       {:offset 1250.0,
        :instrument "piano-Id8yG",
        :volume 1.0,
        :track-volume 0.7874015748031497,
        :panning 0.5,
        :midi-note 65,
        :pitch 349.2282314330039,
        :duration 225.0,
        :voice nil}
       {:offset 1500.0,
        :instrument "piano-Id8yG",
        :volume 1.0,
        :track-volume 0.7874015748031497,
        :panning 0.5,
        :midi-note 64,
        :pitch 329.6275569128699,
        :duration 225.0,
        :voice nil}
       {:offset 1750.0,
        :instrument "piano-Id8yG",
        :volume 1.0,
        :track-volume 0.7874015748031497,
        :panning 0.5,
        :midi-note 62,
        :pitch 293.6647679174076,
        :duration 225.0,
        :voice nil}},
     :beats-tally nil,
     :instruments
     {"piano-Id8yG"
      {:octave 4,
       :current-offset {:offset 3500.0},
       :key-signature {},
       :config {:type :midi, :patch 1},
       :duration 3.0,
       :min-duration nil,
       :volume 1.0,
       :last-offset {:offset 2000.0},
       :id "piano-Id8yG",
       :quantization 0.9,
       :duration-inside-cram nil,
       :tempo 120,
       :panning 0.5,
       :current-marker :start,
       :time-scaling 1,
       :stock "midi-acoustic-grand-piano",
       :track-volume 0.7874015748031497}},
     :markers {:start 0},
     :cram-level 0,
     :global-attributes {},
     :nicknames {},
```

```sh
    $ alda parse --lisp -c 'cello: c+'
```

```clojure
    (alda.lisp/score
      (alda.lisp/part {:names ["cello"]}
        (alda.lisp/note (alda.lisp/pitch :c :sharp))))
```
