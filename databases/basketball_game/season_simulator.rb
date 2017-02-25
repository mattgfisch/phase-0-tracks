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

def create_delta(db, team_id, num_teams) 
  true_delta = determine_delta(team_id, num_teams)

  delta_creation = <<-SQL
    INSERT INTO quality_adjustments (delta)
    VALUES (?)
  SQL

  db.execute(delta_creation, [true_delta])
end

def determine_delta(team_id, num_teams)
  delta = 0

  case team_id
    when 1
      delta = 1
    when 2
      delta = 2
    when 3
      delta = 3
    when num_teams - 2
      delta = 1
    when num_teams - 1
      delta = 3
    when num_teams
      delta = 5
    else
      random = rand(3)
      case random
        when 0
          delta = -1
        when 1
          delta = 0
        when 2
          delta = 1
      end
  end

  delta
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


# Wipe teams table (if teams exist)
db.execute("DELETE FROM teams WHERE id>0")


# Populate teams table
num_teams = 20

num_teams.times do 
  create_team(db, "Knicks", 10, 5)
end

all_teams = db.execute("SELECT * FROM teams")

# Wipe quality adjustments table (if id's exist)
db.execute("DELETE FROM quality_adjustments WHERE id>0")


# Populate quality adjustments table
all_teams.each do |team|
  create_delta(db, team[0], all_teams.length)
end



