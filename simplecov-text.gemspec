# -*- encoding: utf-8 -*-
require File.expand_path('../lib/simplecov-text/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["BJ Neilsen"]
  gem.email         = ["bj.neilsen@gmail.com"]
  gem.description   = %q{SimpleCov Text Formatter}
  gem.summary       = gem.description
  gem.homepage      = "http://www.rand9.com"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "simplecov-text"
  gem.require_paths = ["lib"]
  gem.version       = SimpleCov::Formatter::TextFormatter::VERSION
  
  gem.add_runtime_dependency      'simplecov'
  
  gem.add_development_dependency  'rspec'
  gem.add_development_dependency  'fakefs'
end
