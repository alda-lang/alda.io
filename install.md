---
layout: page
title: Install
subtitle: Available for Linux, macOS and Windows
permalink: /install/
---

Alda is [open source][alda-github] and available for free. You can run it from
the command line on your Mac, Windows, or Linux computer.

## Step 1: Install Java

Alda's sound engine requires Java to be installed.

To verify whether or not you have Java installed, open a terminal and run `java
-version`.

If you don't have Java installed yet, we recommend downloading and installing
the latest stable release from [AdoptOpenJDK].

<!-- install-page.js depends on this ID. -->
<h2 id="step-2-download-alda">Step 2: Download Alda</h2>

<div id="download-alda"></div>

## Step 3: Put it on your PATH

<div id="install-alda"></div>

## Try it out!

In a new terminal, run these commands to verify that you've installed Alda
correctly:

{% highlight bash %}
alda version
alda doctor
alda --help
alda play -c '(tempo! 160) trumpet: (quant 60) f12 b- > d f6 d12 f1'
{% endhighlight %}

_If you're having trouble, please don't hesitate to ask for help in the [Alda
Slack group][alda-slack]!_

## Next steps

Once you're up and running with Alda, we recommend:

* Installing a good [MIDI soundfont][install-midi-soundfont]
* Installing a [text editor plugin][editor-plugins]
* Reading the [Alda tutorial][tutorial]

<script src="{{ site.baseurl }}/assets/js/install-page.js"></script>

[AdoptOpenJDK]: https://adoptopenjdk.net/
[alda-github]: https://github.com/alda-lang/alda
[alda-slack]: https://slack.alda.io
[install-midi-soundfont]: https://github.com/alda-lang/alda/blob/master/doc/installing-a-good-soundfont.md
[editor-plugins]: https://github.com/alda-lang/alda/blob/master/doc/editor-plugins.md
[tutorial]: {{ site.baseurl }}/tutorial
