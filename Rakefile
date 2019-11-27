require_relative 'lib/ruby_wordcram/version'

def create_manifest
  title = 'Implementation-Title: WordCram for JRubyArt and propane)'
  version = format('Implementation-Version: %s', WordCram::VERSION)
  File.open('MANIFEST.MF', 'w') do |f|
    f.puts(title)
    f.puts(version)
    f.puts('Class-Path: jsoup-1.12.1.jar')
  end
end

task default: [:init, :compile, :install]

desc 'Create Manifest'
task :init do
  create_manifest
end

desc 'Install'
task :install do
	sh './mvnw dependency:copy'
  sh 'mv target/WordCram.jar lib'
end

desc 'Gem'
task :gem do
  sh 'gem build ruby_wordcram.gemspec'
end

desc 'Compile'
task :compile do
	sh './mvnw package'
end
