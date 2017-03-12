project 'Wordcram' do

  model_version '4.0.0'
  id 'wordcram:WordCram:2.0.0'
  packaging 'jar'
  description 'WordCram for JRubyArt and propane'
  organization 'ruby-processing', 'https://ruby-processing.github.io'
  { 'danbernier' => 'Dan Bernier', 'jdf' => 'Jonathan Feinberg', 'monkstone' => 'Martin Prout' }.each do |key, value|
    developer key do
      name value
      roles 'developer'
    end
  end

  properties(
  'source.directory' => 'src',
  'wordcram.basedir' => '${project.basedir}',
  'polyglot.dump.pom' => 'pom.xml',
  'maven.compiler.source' => '1.8',
  'project.build.sourceEncoding' => 'utf-8',
  'maven.compiler.target' => '1.8'
  )

  overrides do
    plugin( :jar,
    'archive' => {
      'manifestEntries' => {
        'Built-By' =>  'monkstone'
      }
      } )
    end

    jar 'org.processing:core:3.3.0'
    jar 'org.jsoup:jsoup:1.10.2'

    build do
      default_goal 'package'
      source_directory 'source.directory'
      final_name 'WordCram'
      resource do
        directory 'src'
        includes
        excludes '**/*.java'
      end
    end

    overrides do
      plugin :resources, '2.6'
      plugin :dependency, '2.10' do
        execute_goals( id: 'default-cli',
        artifactItems: [ { groupId:  'org.jsoup',
          artifactId:  'jsoup',
          version:  '1.10.2',
          type:  'jar',
          outputDirectory: '${wordcram.basedir}/lib'
        }
      ]
      )
    end
  end
end
