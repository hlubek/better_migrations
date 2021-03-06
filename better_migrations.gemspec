# Generated by jeweler
# DO NOT EDIT THIS FILE
# Instead, edit Jeweler::Tasks in Rakefile, and run `rake gemspec`
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{better_migrations}
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Christopher Hlubek"]
  s.date = %q{2009-10-07}
  s.description = %q{Better migration rake tasks for undo / doing specific migrations}
  s.email = %q{hlubek@resoap.com}
  s.extra_rdoc_files = [
    "README.textile"
  ]
  s.files = [
    ".gitignore",
     "MIT-LICENSE",
     "README.textile",
     "Rakefile",
     "VERSION",
     "better_migrations.gemspec",
     "install.rb",
     "lib/better_migrations.rb",
     "lib/better_migrations/tasks.rb",
     "rails/init.rb",
     "tasks/better_migrations.rake",
     "test/better_migrations_test.rb",
     "test/test_helper.rb",
     "uninstall.rb"
  ]
  s.homepage = %q{http://github.com/chlu/better_migrations}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.3}
  s.summary = %q{Better migrations for rails}
  s.test_files = [
    "test/better_migrations_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
