# -*- encoding: utf-8 -*-
# stub: jar_wrapper 0.1.8 ruby lib

Gem::Specification.new do |s|
  s.name = "jar_wrapper".freeze
  s.version = "0.1.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Alexander Shvets".freeze]
  s.date = "2013-11-23"
  s.description = "Wrapper for executable java jar file.".freeze
  s.email = "alexander.shvets@gmail.com".freeze
  s.homepage = "http://github.com/shvets/jar_wrapper".freeze
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Wrapper for executable java jar file (summary).".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<zip>.freeze, [">= 0"])
      s.add_development_dependency(%q<gemspec_deps_gen>.freeze, [">= 0"])
      s.add_development_dependency(%q<gemcutter>.freeze, [">= 0"])
    else
      s.add_dependency(%q<zip>.freeze, [">= 0"])
      s.add_dependency(%q<gemspec_deps_gen>.freeze, [">= 0"])
      s.add_dependency(%q<gemcutter>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<zip>.freeze, [">= 0"])
    s.add_dependency(%q<gemspec_deps_gen>.freeze, [">= 0"])
    s.add_dependency(%q<gemcutter>.freeze, [">= 0"])
  end
end
