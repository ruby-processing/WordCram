project 'Wordcram' do

  model_version '4.0.0'
  id 'wordcram:WordCram:2.0.4'
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

  properties( 'maven.compiler.target' => '1.8',
    'source.directory' => 'src',
    'maven.compiler.source' => '1.8',
    'polyglot.dump.pom' => 'pom.xml',
    'project.build.sourceEncoding' => 'utf-8',
    'wordcram.basedir' => '${project.basedir}' )

    jar 'org.processing:core:3.3.5'
    jar 'org.jsoup:jsoup:1.12.1'

    overrides do
      plugin( :jar,
        'archive' => {
          'manifestEntries' => {
            'Built-By' =>  'monkstone'
          }
          } )
          plugin :resources, '2.6'
          plugin :dependency, '2.10' do
            execute_goals( :id => 'default-cli',
              'artifactItems' => [ { 'groupId' =>  'org.jsoup',
                'artifactId' =>  'jsoup',
                'version' =>  '1.12.1',
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
                includes
                excludes '**/*.java'
              end
            end
          end
