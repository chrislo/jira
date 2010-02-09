# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{jira}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Chris Lowis"]
  s.date = %q{2010-02-09}
  s.default_executable = %q{jira}
  s.email = %q{chris.lowis@gmail.com}
  s.executables = ["jira"]
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["jira.gemspec", "LICENSE", "README.rdoc", "bin/jira", "spec/fixtures", "spec/fixtures/issues.xml", "spec/fixtures/TST-14301.xml", "spec/jira", "spec/jira/hash_spec.rb", "spec/jira/issue_spec.rb", "spec/spec.opts", "spec/spec_helper.rb", "lib/jira", "lib/jira/cli.rb", "lib/jira/ext", "lib/jira/ext/hash.rb", "lib/jira/issue.rb", "lib/jira.rb"]
  s.homepage = %q{http://github.com/chrislo/jira}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{jira}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{A command line interface to the JIRA issue tracking system}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rest-client>, [">= 1.0.3"])
      s.add_runtime_dependency(%q<xml-simple>, [">= 1.0.12"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<fakeweb>, [">= 1.2.7"])
    else
      s.add_dependency(%q<rest-client>, [">= 1.0.3"])
      s.add_dependency(%q<xml-simple>, [">= 1.0.12"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<fakeweb>, [">= 1.2.7"])
    end
  else
    s.add_dependency(%q<rest-client>, [">= 1.0.3"])
    s.add_dependency(%q<xml-simple>, [">= 1.0.12"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<fakeweb>, [">= 1.2.7"])
  end
end
