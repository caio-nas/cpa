# frozen_string_literal: true

require_relative "lib/stripe_manager/version"

Gem::Specification.new do |spec|
  spec.name = "stripe_manager"
  spec.version = StripeManager::VERSION
  spec.authors = ["Evandro A.O."]
  spec.email = ["evandroev@gmail.com"]

  spec.summary = "Stripe Manager creates a control of stripe interactions"
  spec.description = "Stripe Manager uses stripe gem to create a batter control of interactions on stripe plataform and it gives a full vision over the data " 
  spec.homepage = "http://www.squadsoft.com.br"
  spec.required_ruby_version = ">= 2.6.0"

  #spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  #spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  #spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency "stripe", "~> 8.5"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
