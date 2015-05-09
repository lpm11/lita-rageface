Gem::Specification.new do |spec|
  spec.name          = "lita-rageface"
  spec.version       = "0.1.0"
  spec.authors       = ["lpm11"]
  spec.email         = ["lpm11r@gmail.com"]
  spec.description   = "Instant access to your favorite rage faces from Lita."
  spec.summary       = "Instant access to your favorite rage faces from Lita."
  spec.homepage      = "https://github.com/lpm11/lita-rageface"
  spec.license       = "WTFPL"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.3"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rspec", ">= 3.0.0"
end
