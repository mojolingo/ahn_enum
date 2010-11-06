GEM_FILES = %w{
  ahn_enum.gemspec
  lib/ahn_enum.rb
  config/ahn_enum.yml
}

Gem::Specification.new do |s|
  s.name = "ahn_enum"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ben Klang"]

  s.date = Date.today.to_s
  s.description = "An Adhearsion component to provide ENUM lookups."
  s.email = "ben&alkaloid.net"

  s.files = GEM_FILES

  s.has_rdoc = false
  s.homepage = "http://adhearsion.com"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.2.0"
  s.summary = "Adhearsion component for ENUM lookups"

  s.specification_version = 2
end
