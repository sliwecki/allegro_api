lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'allegro_api/version'

Gem::Specification.new do |spec|
  spec.name          = "allegro_api"
  spec.version       = AllegroApi::VERSION
  spec.authors       = ["Damian Śliwecki"]
  spec.email         = ["sliwecki@gmail.com"]
  spec.summary       = %q{SOUP API Client}
  spec.description   = %q{Fast integration Ruby On Rails applications with www.allegro.pl}
  spec.homepage      = "https://github.com/sliwecki/allegro_api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"

  spec.add_dependency "savon", "~> 2.0"
end
