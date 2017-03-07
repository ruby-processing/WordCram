task default: [:install_jars, :gem]

desc 'Build gem'
task :gem do
  sh 'gem build ruby_wordcram.gemspec'
end

desc 'Build gem'
task :install_jars do
  sh "cd vendors && rake"
end
