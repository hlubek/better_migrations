module BetterMigrations
  class Migrator
    def self.applied_migrations
      migrator = ActiveRecord::Migrator.new(:down, 'db/migrate')
      applied_migrations = (migrator.migrations - migrator.pending_migrations)
    end
    def self.pending_migrations
      migrator = ActiveRecord::Migrator.new(:up, 'db/migrate')
      migrator.pending_migrations
    end
  end
  class Utils
    def self.list_migrations(migrations)
      migrations.each_with_index do |migration, index|
        puts "[\033[0;1m#{index + 1}\033[0m] #{migration.name} \033[36m#{migration.version}\033[0m"
      end
    end
  end
end