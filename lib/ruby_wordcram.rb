# frozen_string_literal: false
if RUBY_PLATFORM == 'java'
  require 'WordCram.jar'
  require 'jsoup-1.7.2.jar'
  require 'cue.language.jar'
  wc = %w(WordAngler WordColorer WordCram WordFonter WordPlacer WordSkipReason)
  sh = %w(Colorers ImageShaper Placers Word ShapeBasedPlacer)
  WC = wc.concat(sh).freeze
  WC.each do |klass|
    java_import "wordcram.#{klass}"
  end
end
