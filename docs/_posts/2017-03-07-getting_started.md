---
layout: post
title:  "A first Sketch"
date:   2017-03-07 07:34:13
categories: wordcram update
---

### Requirements

Requires JRubyArt-1.3.0+ (hence jruby-9.0.8.0+)

### Install the generative gem

```bash
jruby -S gem install ruby_wordcram # safe way
gem install ruby_wordcram # using rvm rbenv to use jruby instead of MRI
```

Create basic sketch

```bash
mkdir 'fred'
mkdir 'fred/data'
cp '/usr/share/fonts/TTF/FreeMono.ttf fred/data' # other fonts are available
# '/usr/share/fonts/TTF/LiberationMono-Bold.ttf' Mac and Windows paths differ
cd fred
k9 create fred 600 400
```

Edit sketch as follows:-

```ruby
# This sketch shows how to make a WordCram from any webpage.
# It uses my blog
# Minya Nouvelle font available at http://www.1001fonts.com/font_details.html?font_id=59

require 'ruby_wordcram'

def settings
  size 800, 400
end

def setup
  sketch_title 'WordCram from Web Page'
  color_mode(HSB)
  background(255)
  WordCram.new(self)
          .from_web_page('https://ruby-processing.github.io/about/')
          .with_font(create_font(data_path('MINYN___.TTF'), 1))
          .with_colorer(Colorers.two_hues_random_sats_on_white(self))
          .sized_by_weight(7, 100)
          .draw_all
end
```

### Output

<img src="/assets/wordcram.png" />

See more examples [here][examples].

Usage with propane is very similar, to be elaborated.

[examples]:https://github.com/ruby-processing/JRubyArt-examples/tree/master/external_library/gem/ruby_wordcram/