# frozen_string_literal: false
if RUBY_PLATFORM == 'java'
  require 'WordCram.jar'
  module WordCram
    include_package 'wordcram'
  end
end
