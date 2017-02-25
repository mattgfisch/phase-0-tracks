#---------- GENERAL OUTLINE
=begin
  - Generate Teams(0) table and Quality Adjustments table
    - Apply Quality Adjustments as a test
  - Simulate/loop season
    - Add wins/losses to Teams table
  - Generate Final Standings table
    - Pull teams from Teams table in descending win order
  - Make copy of Final Standings table (Teams(1) table)
    - Apply Quality Adjustments table
  - Repeat seasons until quit
    - Drop old Teams(0) table   
=end


#---------- METHODS
def create_team(db, name, wins, losses)
  team_creation = <<-SQL
    INSERT INTO teams (name, stars, quality, wins, losses)
    VALUES (?, 5, 90, ?, ?)
  SQL

  db.execute(team_creation, [name, wins, losses])
end










#---------- GENERATE TEAMS AND QA TABLES

# Require gems
require 'sqlite3'
require 'faker'

# Create league database
db = SQLite3::Database.new("league.db")

# Create teams table and quality adjustments table if they don't exist
create_teams_table = <<-SQL
  CREATE TABLE IF NOT EXISTS teams(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    stars VARCHAR(255),
    quality INT,
    wins INT,
    losses INT
  )
SQL

create_qa_table = <<-SQL
  CREATE TABLE IF NOT EXISTS quality_adjustments(
    id INTEGER PRIMARY KEY,
    delta INT
  )
SQL

db.execute(create_teams_table)
db.execute(create_qa_table)


# Populate teams table

create_team(db, "Knicks", 10, 5)
