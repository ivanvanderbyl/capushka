# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "capushka/version"

Gem::Specification.new do |s|
  s.name        = "capushka"
  s.version     = Capushka::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ivan Vanderbyl"]
  s.homepage    = "http://github.com/ivanvanderbyl/capushka"
  s.summary     = %q{Combines Babushka with Capistrano to allow you to run Babushka deps inside your recipes.}
  s.description = %q{Combines Babushka with Capistrano to allow you to run Babushka deps inside your recipes.}

  s.rubyforge_project = "capushka"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency 'capistrano',       '~> 2.5.1'
  
  s.add_development_dependency 'rake',     '~> 0.8.7'
  s.add_development_dependency 'rspec',    '~> 2.0.0'
end
