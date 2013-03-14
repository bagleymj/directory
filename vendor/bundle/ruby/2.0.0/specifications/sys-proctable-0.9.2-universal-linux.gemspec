# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "sys-proctable"
  s.version = "0.9.2"
  s.platform = "universal-linux"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Daniel J. Berger"]
  s.date = "2012-10-08"
  s.description = "    The sys-proctable library provides an interface for gathering information\n    about processes on your system, i.e. the process table. Most major\n    platforms are supported and, while different platforms may return\n    different information, the external interface is identical across\n    platforms.\n"
  s.email = "djberg96@gmail.com"
  s.extra_rdoc_files = ["CHANGES", "README", "MANIFEST", "doc/top.txt"]
  s.files = ["CHANGES", "README", "MANIFEST", "doc/top.txt"]
  s.homepage = "http://www.rubyforge.org/projects/sysutils"
  s.licenses = ["Artistic 2.0"]
  s.require_paths = ["lib", "lib/linux"]
  s.rubyforge_project = "sysutils"
  s.rubygems_version = "2.0.0.rc.2"
  s.summary = "An interface for providing process table information"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<test-unit>, [">= 2.4.0"])
    else
      s.add_dependency(%q<test-unit>, [">= 2.4.0"])
    end
  else
    s.add_dependency(%q<test-unit>, [">= 2.4.0"])
  end
end
