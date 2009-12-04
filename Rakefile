require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "jira"
    gem.summary = %Q{A command line interface to the JIRA issue tracking system}
    gem.description = %Q{A command line interface to the JIRA issue tracking system}
    gem.email = "chris.lowis@gmail.com"
    gem.homepage = "http://github.com/chrislo/jira"
    gem.authors = ["chrislo"]
    gem.add_development_dependency "rspec", ">= 1.2.9"
    gem.add_development_dependency "fakeweb", ">= 1.2.7"
    gem.add_dependency "rest-client", ">= 1.0.3"
    gem.add_dependency "xml-simple", ">= 1.0.12"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

Jeweler::GemcutterTasks.new

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "jira #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
