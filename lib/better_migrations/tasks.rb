require File.expand_path(File.join(File.dirname(__FILE__), '..', 'better_migrations'))

namespace :db do
  namespace :migrate do
    desc 'Undo a migration (down) by selecting a specific version'
    task :undo => :environment do
      version = ENV["VERSION"] ? ENV["VERSION"].to_i : nil
      
      unless version
      	# puts "\033[0;1mCurrent Version:\033[0m \033[32m#{ActiveRecord::Migrator.current_version}\033[0m"
        applied_migrations = BetterMigrations::Migrator.applied_migrations
      	raise "-> \033[33mNo applied migrations found.\033[0m" if applied_migrations.empty?
      	puts "\033[0;1mApplied migrations:\033[0m"
      	BetterMigrations::Utils.list_migrations applied_migrations

      	print "Enter migration number to undo (x to cancel): "

      	answer = STDIN.gets.chomp
      	raise "-> \033[33mcancelled\033[0m" if answer == 'x'
      	migration_index = answer.to_i - 1
      	raise "Invalid number: #{migration_index}" unless (0..applied_migrations.length) === migration_index

      	version = applied_migrations[migration_index].version
      end
      
      raise "Specify VERSION" unless version
      ActiveRecord::Migrator.run(:down, "db/migrate/", version)
      Rake::Task["db:schema:dump"].invoke if ActiveRecord::Base.schema_format == :ruby
    end
    desc 'Do a migration (up) by selecting a specific version'
    task :do => :environment do
      version = ENV["VERSION"] ? ENV["VERSION"].to_i : nil
      
      unless version
      	# puts "\033[0;1mCurrent Version:\033[0m \033[32m#{ActiveRecord::Migrator.current_version}\033[0m"
        pending_migrations = BetterMigrations::Migrator.pending_migrations
      	raise "-> \033[33mNo pending migrations found.\033[0m" if pending_migrations.empty?
      	puts "\033[0;1mPending migrations:\033[0m"
      	BetterMigrations::Utils.list_migrations pending_migrations

      	print "Enter migration number to apply (x to cancel): "

      	answer = STDIN.gets.chomp
      	raise "-> \033[33mcancelled\033[0m" if answer == 'x'
      	migration_index = answer.to_i - 1
      	raise "Invalid number: #{migration_index}" unless (0..pending_migrations.length) === migration_index

      	version = pending_migrations[migration_index].version
      end
      
      raise "Specify VERSION" unless version
      ActiveRecord::Migrator.run(:up, "db/migrate/", version)
      Rake::Task["db:schema:dump"].invoke if ActiveRecord::Base.schema_format == :ruby
    end
  end
end