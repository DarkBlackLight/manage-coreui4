require_relative "lib/manage/coreui4/version"

Gem::Specification.new do |spec|
  spec.name        = "manage-coreui4"
  spec.version     = Manage::Coreui4::VERSION
  spec.authors     = ["Wuqi Li"]
  spec.email       = ["liwuqi2006@gmail.com"]
  spec.homepage    = "https://github.com/DarkBlackLight/manage-coreui4"
  spec.summary     = "Manage::Coreui4."
  spec.description = "Manage::Coreui4."
  spec.license     = "MIT"
  
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/DarkBlackLight/manage-coreui4"
  spec.metadata["changelog_uri"] = "https://github.com/DarkBlackLight/manage-coreui4"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.4.3"
end
