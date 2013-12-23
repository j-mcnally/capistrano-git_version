# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/git_version/version'

Gem::Specification.new do |spec|
  spec.name          = "capistrano-git_version"
  spec.version       = Capistrano::GitVersion::VERSION
  spec.authors       = ["Justin McNally"]
  spec.email         = ["justin@kohactive.com"]
  spec.description   = %q{Write the git version to the public folder on deploy}
  spec.summary       = %q{Write the git version to the public folder on deploy from git}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
