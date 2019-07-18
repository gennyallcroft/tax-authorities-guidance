require 'pg'

p "Setting up test database..."

connection = PG.connect(dbname: 'guidance_test')

# Clear the bookmarks table
connection.exec("TRUNCATE guidance;")
