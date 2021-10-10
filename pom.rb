project 'Wordcram' do

  model_version '4.0.0'
  id 'wordcram:WordCram:2.1.1'
  packaging 'jar'

  description 'WordCram for JRubyArt, PiCrate and propane'

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

    jar 'org.processing:core:4.0.0'
    jar 'org.jsoup:jsoup:1.14.2'

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
          plugin :dependency, '3.2.0' do
            execute_goals( :id => 'default-cli',
              'artifactItems' => [ { 'groupId' =>  'org.jsoup',
                'artifactId' =>  'jsoup',
                'version' =>  '1.14.2',
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
