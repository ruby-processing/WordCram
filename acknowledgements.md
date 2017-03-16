### Acknowledgements

Surely the original inspiration for WordCram, was Wordle, built by Jonathan Feinberg when at IBM. He has since released an important component namely the cue.language component that I have included in ruby_wordcram (the only alterations I have made are to update the code to take advantage of jdk8 features), this part of the code remains &copy; IBM. There are number of people who contributed to the language elements, and Jonathan credits these [here][credits], but is also probably reading his [faq][faq] if you are thinking of extending the language capabilities (I would be keen to add Welsh, which I think must be available somewhere in the wild). To read even more of Jonathans musings, achievments see his [blog][blog].

The vanilla processing version of Wordcram that I have incorporated here was created by [Dan Bernier][Dan], and currently it has only received the same treatment as cue.language code, ie the java code has been updated from java-1.5 to java-1.8 (in particular anonymous classes have become java-8 lambda). It is possible that further change will include tighter JRuby integration (but it works OK)

[jsoup][jsoup] is a Java library for working with real-world HTML. It provides a very convenient API for extracting and manipulating data, using the best of DOM, CSS, and jquery-like methods. This was pulled directly from maven central.


[credits]:http://www.wordle.net/credits

[faq]:http://www.wordle.net/faq

[blog]:http://mrfeinberg.com/

[Dan]:https://github.com/danbernier/WordCram

[jsoup]:https://jsoup.org/
