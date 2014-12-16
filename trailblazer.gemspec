# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'trailblazer/version'

Gem::Specification.new do |spec|
  spec.name          = "trailblazer"
  spec.version       = Trailblazer::VERSION
  spec.authors       = ["Nick Sutterer"]
  spec.email         = ["apotonick@gmail.com"]
  spec.description   = %q{Trailblazer is a thin layer on top of Rails. It gently enforces encapsulation, an intuitive code structure and gives you an object-oriented architecture.}
  spec.summary       = %q{A New Architecture For Rails.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "actionpack", '>= 3.0.0' # this framework works on Rails.
  spec.add_dependency "uber", ">= 0.0.10" # no builder inheritance.
  spec.add_dependency "representable", ">= 2.1.1", "<2.2.0" # Representable::apply.
  spec.add_dependency "reform", "~> 1.2.0"
  spec.add_dependency "railties", ">= 4.1.6"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  # spec.add_development_dependency "minitest-spec-rails" # TODO: can anyone make this work (test/rails).
  spec.add_development_dependency "sidekiq", "~> 3.1.0"
end
