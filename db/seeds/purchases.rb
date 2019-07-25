require 'csv'
require_relative '../../lib/database'

path = File.expand_path("#{__dir__}/../fixtures/purchases.csv")
table_name = File.basename(path).split('.')[0]

db = Database.connect

db.transaction do
  CSV.foreach(path, headers: true) do |row|
    row = row.to_h
    sql = "INSERT INTO #{table_name}(#{row.keys.join(",")}) VALUES (#{row.values.map{|v|"'#{v}'"}.join(',')})"
    db.execute(sql)
  end
end
