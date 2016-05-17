# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "termy/version"

Gem::Specification.new do |spec|
  spec.name          = "termy"
  spec.version       = Termy::VERSION
  spec.authors       = ["bronzdoc"]
  spec.email         = ["lsagastume1990@gmail.com"]

  spec.summary       = %q{Get facts from your system}
  spec.description   = %q{Get facts from your system}
  spec.homepage      = "https://github.com/bronzdoc/termy"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "http://mygemserver.com"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "system-getifaddrs", "~> 0.2"
  spec.add_dependency "sys-uname", "~> 1.0"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.3"
  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_development_dependency "fakefs", "~> 0.8"
end
