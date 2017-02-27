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
def create_team(db, name, wins, losses, count)
  stars = set_stars(count)  # Set num of stars each team receives
  quality = set_quality(stars)  # Set quality of team, based on stars       

  team_creation = <<-SQL
    INSERT INTO teams (name, stars, quality, wins, losses)
    VALUES (?, ?, ?, ?, ?)
  SQL

  db.execute(team_creation, [name, stars, quality, wins, losses])
end

def set_stars(count)
  if count < 3
    5
  elsif count < 10
    4
  elsif count < 17
    3
  else
    2
  end
end

def set_quality(stars)
  
  case stars
    when 5
      mean = 94
    when 4
      mean = 84
    when 3
      mean = 74
    when 2
      mean = 64 
  end
  sd = 2

  # Set a mean based on stars, then do random sample of norm dist.
  gen = Rubystats::NormalDistribution.new(mean, sd)
  gen.rng.ceil
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

def adjust_quality(db, deltas, teams, team_id)
  # Set quality equal to quality, then add delta
  new_quality = teams[team_id - 1]['quality']
  new_quality += deltas[team_id - 1][1]

  apply_delta = <<-SQL
    UPDATE teams
    SET quality=?
    WHERE id=?
  SQL

  db.execute(apply_delta, [new_quality, team_id])
end

def play_schedule(team_id, teams, db)
  for i in team_id...teams.length
    2.times do
      result = play_game(teams[team_id - 1],teams[i])

      apply_result(result[0], result[1], db)
    end
  end 
end

def play_game(team_a, team_b)
  coeff = Random.new.rand + 1

  a_result = team_a['quality'] * coeff
  b_result = team_b['quality'] * (3 - coeff)

  if a_result > b_result
    winner = team_a
    loser = team_b
  else
    winner = team_b
    loser = team_a
  end
  [winner,loser]
end

def apply_result(winner, loser, db)
  teams = db.execute("SELECT * FROM teams")

  new_wins = teams[winner['id'] - 1]['wins']
  new_wins += 1

  new_losses = teams[loser['id'] - 1]['losses']
  new_losses += 1

  apply_win = <<-SQL
    UPDATE teams
    SET wins=?
    WHERE id=?
  SQL

  apply_loss = <<-SQL
    UPDATE teams
    SET losses=?
    WHERE id=?
  SQL

  db.execute(apply_win,[new_wins, winner['id']])
  db.execute(apply_loss, [new_losses, loser['id']])
end





#---------- GENERATE TEAMS AND QA TABLES

# Require gems
require 'sqlite3'
require 'faker'
require 'rubystats'

# Create league database
db = SQLite3::Database.new("league.db")
db.results_as_hash = true

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
  teams = db.execute("SELECT * FROM teams") 
  create_team(db, Faker::Team.name, 0, 0, teams.length)
end

teams = db.execute("SELECT * FROM teams")

# Wipe quality adjustments table (if id's exist)
db.execute("DELETE FROM quality_adjustments WHERE id>0")


# Populate quality adjustments table
teams.each do |team|
  create_delta(db, team['id'], teams.length)
end

deltas = db.execute("SELECT * FROM quality_adjustments")


#---------- SIMULATE/LOOP SEASON
teams.each do |team|
  play_schedule(team['id'], teams, db)
end











#---------- GENERATE FINAL STANDINGS








#---------- TEST: INCREMENT TEAM QUALITY = success

# teams.each do |team|
#   adjust_quality(db, deltas, teams, team['id'])
# end








