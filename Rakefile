require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'lib/better_migrations/tasks'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the better_migrations plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the better_migrations plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'BetterMigrations'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "better_migrations"
    gemspec.summary = "Better migrations for rails"
    gemspec.description = "Better migration rake tasks for undo / doing specific migrations"
    gemspec.email = "hlubek@resoap.com"
    gemspec.homepage = "http://github.com/chlu/better_migrations"
    gemspec.authors = ["Christopher Hlubek"]
  end
rescue LoadError
  # puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end
