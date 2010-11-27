# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "capushka/version"

Gem::Specification.new do |s|
  s.name        = "capushka"
  s.version     = Capushka::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ivan Vanderbyl"]
  s.homepage    = "http://github.com/ivanvanderbyl/capushka"
  s.summary     = %q{Combines Babushka with Capistrano}
  s.description = %q{Combines Babushka with Capistrano}

  s.rubyforge_project = "capushka"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
