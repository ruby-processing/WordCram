project 'Wordcram' do

  model_version '4.0.0'
  id 'wordcram:WordCram:2.0.6'
  packaging 'jar'

  description 'WordCram for JRubyArt and propane'

  developer 'danbernier' do
    name 'Dan Bernier'
    roles 'developer'
  end

  developer 'jdf' do
    name 'Jonathan Feinberg'
    roles 'developer'
  end

  developer 'monkstone' do
    name 'Martin Prout'
    roles 'developer'
  end

  properties( 'source.directory' => 'src',
              'polyglot.dump.pom' => 'pom.xml',
              'project.build.sourceEncoding' => 'UTF-8',
              'target.release' => '11',
              'polyglot.dump.pom' => 'pom.xml',
              'wordcram.basedir' => '${project.basedir}'
            )

    jar 'org.processing:core:3.3.7'
    jar 'org.jsoup:jsoup:1.13.1'

    overrides do
      plugin( :compiler, '3.8.1',
              'release' =>  '${target.release}' )
      plugin( :jar, '3.2.0',
        'archive' => {
          'manifestEntries' => {
            'Automatic-Module-Name' =>  'org.processing.core'
          }
          } )
          plugin :resources, '2.6'
          plugin :dependency, '2.10' do
            execute_goals( :id => 'default-cli',
              'artifactItems' => [ { 'groupId' =>  'org.jsoup',
                'artifactId' =>  'jsoup',
                'version' =>  '1.13.1',
                'type' =>  'jar',
                'outputDirectory' =>  '${wordcram.basedir}/lib' } ] )
              end
            end


            build do
              default_goal 'package'
              source_directory '${source.directory}'
              final_name 'WordCram'

              resource do
                directory 'src'
                excludes '**/*.java'
              end
            end
          end
