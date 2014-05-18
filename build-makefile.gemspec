# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'build/makefile/version'

Gem::Specification.new do |spec|
	spec.name          = "build-makefile"
	spec.version       = Build::Makefile::VERSION
	spec.authors       = ["Samuel Williams"]
	spec.email         = ["samuel.williams@oriontransfer.co.nz"]
	spec.summary       = %q{Build::Makefile is a simple Makefile parser and can be used to extract dependencies from compiler generated depfiles.}
	spec.homepage      = ""
	spec.license       = "MIT"

	spec.files         = `git ls-files`.split($/)
	spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
	spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
	spec.require_paths = ["lib"]
	
	spec.add_dependency "build-files", "~> 0.1.0"
	
	spec.add_development_dependency "bundler", "~> 1.3"
	spec.add_development_dependency "minitest"
	spec.add_development_dependency "rake"
end
