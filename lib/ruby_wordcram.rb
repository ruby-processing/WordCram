# frozen_string_literal: false
if RUBY_PLATFORM == 'java'
  require 'WordCram.jar'
  require 'jsoup-1.7.2.jar'
  require 'cue.language.jar'
  %w(Colorers WordAngler WordColorer WordCram WordFonter).each do |klass|
    java_import "wordcram.#{klass}"
  end
end
