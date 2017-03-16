---
layout: post
title:  "Under the hood"
date:   2017-03-07 10:34:13
categories: wordcram update
---

### The required libraries

- cue.language (since version-2.0.0 compiled into WordCram.jar)

  Created by Jonathan Feinberg

  cue.language is a small library of Java code and resources that provides the following basic natural-language processing capabilities:

  *  Tokenizing natural language text into individual words
  *  Tokenizing natural language text into sentences
  *  Tokenizing natural language text into n-grams (sequences of 2 or more words that appear next to each other in a sentence)
  *  Counting strings
  *  Detecting which script (alphabet, writing system) is required to represent a text
  *  Guessing what language a text is in
  *  Customizable "stop word" detection for a variety of languages


- WordCram.jar

  Created by Dan Bernier
    WordCram lets you generate word clouds in Processing. It does the heavy lifting – text analysis, collision detection – for you, so you can focus on making your word clouds as beautiful, as revealing, or as silly as you like. Since version 2.0.0 the java code has been updated from java-1.5 to java-1.8, and the java code from the cue.language has aloso been
    included.


- jsoup-1.10.2.jar (since version 2.0.0)

  jsoup is a Java library for working with real-world HTML. It provides a very convenient API for extracting and manipulating data, using the best of DOM, CSS, and jquery-like methods.

### The Build

The build depends on polyglot maven (access to processing core.jar, jsoup.jar is pulled from maven central)
