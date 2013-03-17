# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "guard-rspec"
  s.version = "1.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["Thibaud Guillaume-Gentil"]
  s.date = "2012-07-31"
  s.description = "Guard::RSpec automatically run your specs (much like autotest)."
  s.email = ["thibaud@thibaud.me"]
  s.homepage = "http://rubygems.org/gems/guard-rspec"
  s.require_paths = ["lib"]
  s.rubyforge_project = "guard-rspec"
  s.rubygems_version = "2.0.0.rc.2"
  s.summary = "Guard gem for RSpec"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<guard>, [">= 1.1"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.11"])
    else
      s.add_dependency(%q<guard>, [">= 1.1"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<rspec>, ["~> 2.11"])
    end
  else
    s.add_dependency(%q<guard>, [">= 1.1"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<rspec>, ["~> 2.11"])
  end
end