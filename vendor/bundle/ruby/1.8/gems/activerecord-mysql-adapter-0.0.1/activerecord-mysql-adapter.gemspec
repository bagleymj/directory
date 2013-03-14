# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'activerecord-mysql-adapter/version'

Gem::Specification.new do |gem|
  gem.name          = "activerecord-mysql-adapter"
  gem.version       = ActiverecordMysqlAdapter::VERSION
  gem.authors       = ["Andrey Deryabin"]
  gem.email         = ["deriabin@gmail.com"]
  gem.description   = 'An ActiveRecord adapter for MySQL, based on mysql gem.'
  gem.summary       = 'An ActiveRecord adapter for MySQL, based on mysql gem.'
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency('mysql', '>= 2.9.0')
  gem.add_dependency('activerecord', '>= 3.2.9')
  gem.add_dependency('activesupport', '>= 3.2.9')
end
