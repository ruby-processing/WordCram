# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby_wordcram/version'

Gem::Specification.new do |spec|
  spec.name = 'ruby_wordcram'
  spec.version = WordCram::VERSION
  spec.has_rdoc = true
  spec.extra_rdoc_files = %w{README.md LICENSE}
  spec.summary = %q{Updated and extended WordCram library for JRubyArt and propane}
  spec.description =<<-EOS
  WordCram library wrapped in a rubygem. Compiled and tested with JRubyArt-1.3 and processing-3.3
  EOS
  spec.licenses = %w{Apache-2.0}
  spec.authors = %w{Dan\ Bernier Jonathan\ Feinberg  Martin\ Prout}
  spec.email = 'mamba2928@yahoo.co.uk'
  spec.homepage = 'http://ruby-processing.github.io/WordCram/'
  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.files << 'lib/WordCram.jar'
  spec.files << 'lib/cue.language.jar'
  spec.files << 'lib/jsoup-1.7.2.jar'
  spec.require_paths = ['lib']
  spec.add_development_dependency 'rake', '~> 12'
end
