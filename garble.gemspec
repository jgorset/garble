# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'garble/version'

Gem::Specification.new do |spec|
  spec.name          = "garble"
  spec.version       = Garble::VERSION
  spec.authors       = ["Johannes Gorset"]
  spec.email         = ["jgorset@gmail.com"]
  spec.summary       = "Garble replaces words with synonyms"
  spec.description   = "Garble replaces words with synonyms"
  spec.homepage      = "http://github.com/jgorset/garble"
  spec.license       = "WTFPL"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "dinosaurus", "~> 0.0.11"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
