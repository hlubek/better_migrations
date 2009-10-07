namespace :db do
  namespace :migrate do
    task :undo => :environment do
      version = ENV["VERSION"] ? ENV["VERSION"].to_i : nil
      
      unless version
      	puts "Current Version: #{ActiveRecord::Migrator.current_version}"
      	migrator = ActiveRecord::Migrator.new(:down, 'db/migrate')
      	applied_migrations = (migrator.migrations - migrator.pending_migrations)
      	raise "No migrations to undo" if applied_migrations.empty?
      	puts "Applied migrations:"
      	applied_migrations.each_with_index do |migration, index|
      	  puts "[#{index + 1}] #{migration.name} #{migration.version}"
      	end
      	print "Enter migration number to undo: "
      	migration_index = STDIN.gets.to_i
      	version = applied_migrations[migration_index - 1].version
      end
      
      raise "Specify VERSION" unless version
      ActiveRecord::Migrator.run(:down, "db/migrate/", version)
      Rake::Task["db:schema:dump"].invoke if ActiveRecord::Base.schema_format == :ruby
    end
  end
end