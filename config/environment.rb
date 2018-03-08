require 'bundler'
require 'require_all'
Bundler.require
require 'csv'
require_all 'db'
require_all 'lib'
require 'sqlite3'

# Setup a DB connection here
database_connection = SQLite3::Database.new('db/daily.db')
