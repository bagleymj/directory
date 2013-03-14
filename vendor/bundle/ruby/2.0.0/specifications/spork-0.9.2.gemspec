# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "spork"
  s.version = "0.9.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tim Harper", "Donald Parish"]
  s.date = "2012-05-18"
  s.description = "A forking Drb spec server"
  s.email = ["timcharper+spork@gmail.com"]
  s.executables = ["spork"]
  s.extra_rdoc_files = ["MIT-LICENSE", "README.rdoc"]
  s.files = ["bin/spork", "MIT-LICENSE", "README.rdoc"]
  s.homepage = "http://github.com/timcharper/spork"
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "spork"
  s.rubygems_version = "2.0.0.rc.2"
  s.summary = "spork"
end
