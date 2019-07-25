require 'sequel'
require 'yaml'

class Database
  def self.url
    env = ENV['DBENV'] || 'development'
    yaml = YAML.load(File.read("#{__dir__}/../config/database.yml"))[env]
    "#{yaml['adapter']}://#{yaml['user']}:#{yaml['password']}@#{yaml['host']}:#{yaml['port']}/#{yaml['database']}"
  end

  def self.connect
    Sequel.connect(url)
  end
end
