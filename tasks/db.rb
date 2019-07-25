namespace :db do
  desc "migrate"
  task :migrate do
    migrate_path = File.expand_path("#{__dir__}/../db/migrate/")
    config_path = File.expand_path("#{__dir__}/../config/database.yml")
    env = ENV['DBENV'] || 'development'
    system("sequel -e #{env} #{config_path} -m #{migrate_path}")
  end

  desc "seed"
  task :seed do
    path = File.expand_path("#{__dir__}/../db/seeds/")
    Dir.glob("#{path}/*.rb").each do |file|
      system("ruby #{file}")
    end
  end
end
