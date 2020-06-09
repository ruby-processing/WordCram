require_relative 'lib/ruby_wordcram/version'

task default: [:compile, :install, :gem]

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
