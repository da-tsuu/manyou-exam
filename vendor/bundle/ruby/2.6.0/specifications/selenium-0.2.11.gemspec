# -*- encoding: utf-8 -*-
# stub: selenium 0.2.11 ruby lib

Gem::Specification.new do |s|
  s.name = "selenium".freeze
  s.version = "0.2.11"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Alexander Shvets".freeze]
  s.date = "2013-11-23"
  s.description = "Gem wrapper for selenium server.".freeze
  s.email = "alexander.shvets@gmail.com".freeze
  s.executables = ["selenium".freeze]
  s.files = ["bin/selenium".freeze]
  s.homepage = "http://github.com/shvets/selenium".freeze
  s.post_install_message = "\n      -------------------------------------------------------------------------------\n\n      Please now run:\n\n        $ selenium install\n\n      NB. This will download jars that this gem needs to run from the internet.\n      It will put them into ~/.selenium/assets.\n\n      -------------------------------------------------------------------------------\n".freeze
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Gem wrapper for selenium server.".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jar_wrapper>.freeze, [">= 0"])
      s.add_development_dependency(%q<gemspec_deps_gen>.freeze, [">= 0"])
      s.add_development_dependency(%q<gemcutter>.freeze, [">= 0"])
    else
      s.add_dependency(%q<jar_wrapper>.freeze, [">= 0"])
      s.add_dependency(%q<gemspec_deps_gen>.freeze, [">= 0"])
      s.add_dependency(%q<gemcutter>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<jar_wrapper>.freeze, [">= 0"])
    s.add_dependency(%q<gemspec_deps_gen>.freeze, [">= 0"])
    s.add_dependency(%q<gemcutter>.freeze, [">= 0"])
  end
end
