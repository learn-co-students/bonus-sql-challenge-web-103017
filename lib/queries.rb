# Write methods that return SQL queries for each part of the challeng here
require_all 'config'
require_relative '../db/seed.rb'
# Who did Jon Stewart have on the Daily Show the most?

# What was the most popular profession of guest for each year Jon Stewart hosted the Daily Show?

# What profession was on the show most overall?

# How many people did Jon Stewart have on with the first name of Bill?

# What dates did Patrick Stewart appear on the show?

# Which year had the most guests?

# What was the most popular "Group" for each year Jon Stewart hosted?

#database_connection = SQLite3::Database.open('db/daily.db')

def guest_with_most_appearances
  database_connection = SQLite3::Database.open('db/daily.db')
  database_connection.execute("SELECT name, COUNT(name) FROM daily GROUP BY name ORDER BY COUNT(name) DESC LIMIT 1")
end

def most_popular_profession_by_year
  database_connection = SQLite3::Database.open('db/daily.db')
  database_connection.execute("SELECT year, occupation, MAX(num_occupation) FROM (SELECT year, occupation, COUNT(occupation) AS num_occupation FROM daily GROUP BY year, occupation) GROUP BY year")
end

def most_popular_profession
  database_connection = SQLite3::Database.open('db/daily.db')
  database_connection.execute("SELECT occupation, COUNT(occupation) FROM daily GROUP BY occupation ORDER BY COUNT(occupation) DESC LIMIT 5")
end

def number_named_bill
  database_connection = SQLite3::Database.open('db/daily.db')
  database_connection.execute("SELECT name, COUNT(name) FROM daily WHERE name LIKE 'BILL%'")
end

def stewart
  database_connection = SQLite3::Database.open('db/daily.db')
  database_connection.execute("SELECT show_date, name FROM daily WHERE name = 'Patrick Stewart'")
end

def most_guests
  database_connection = SQLite3::Database.open('db/daily.db')
  database_connection.execute("SELECT year, COUNT(year) FROM daily GROUP BY year ORDER BY COUNT(year) DESC LIMIT 1")
end

def most_popular_group_by_year
  database_connection = SQLite3::Database.open('db/daily.db')
  database_connection.execute("SELECT year, category, MAX(num_cat) FROM (SELECT year, category, COUNT(*)  AS num_cat FROM daily GROUP BY year, category) GROUP BY year")
end
