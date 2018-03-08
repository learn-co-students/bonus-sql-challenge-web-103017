# Parse the CSV and seed the database here! Run 'ruby db/seed' to execute this code.
require 'require_all'
require_all 'config'
require 'csv'
require 'sqlite3'
require 'pry'

database_connection = SQLite3::Database.new('db/daily.db')


create_schema = <<-SQL
  CREATE TABLE IF NOT EXISTS daily
  (id INTEGER PRIMARY KEY,
    year INTEGER,
    occupation TEXT,
    show_date TEXT,
    category TEXT,
    name TEXT
  )
SQL

database_connection.execute(create_schema)

CSV.foreach("/Users/MaxGentle/Development/labs/sql/bonus-sql-challenge-web-103017/daily_show_guests.csv", headers: true) do |row|
    database_connection.execute("INSERT INTO daily (year, occupation, show_date, category, name) VALUES ( ?, ?, ?, ?, ? )", row.fields)
end
