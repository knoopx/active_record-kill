lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_record/kill/version'

Gem::Specification.new do |spec|
  spec.name = "active_record-kill"
  spec.version = ActiveRecord::Kill::VERSION
  spec.authors = ["Victor Martinez"]
  spec.email = ["knoopx@gmail.com"]
  spec.summary = %q{Kill active connections before dropping databases}
  spec.description = %q{Kill active connections before dropping databases}
  spec.homepage = "http://github.com/knoopx/active_record-kill"
  spec.license = "MIT"

  spec.files = `git ls-files -z`.split("\x0")
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "railties", "~> 4.2.0"
end
