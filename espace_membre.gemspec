require_relative "lib/espace_membre/version"

Gem::Specification.new do |spec|
  spec.name        = "espace_membre-ruby"
  spec.version     = EspaceMembre::VERSION
  spec.authors     = [ "Stéphane Maniaci" ]
  spec.email       = [ "stephane.maniaci@beta.gouv.fr" ]
  spec.homepage    = "https://github.com/betagouv/espace_membre-ruby"
  spec.summary     = "A collection of Ruby code around the EspaceMembre app"
  spec.description = "Write Ruby apps around the beta.gouv.fr dataset without the hassle"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 8.1.2"
end
