namespace :players do
  desc 'Import MFL player data'
  task :add_player_data => :environment do

    # request_url = https://www77.myfantasyleague.com/2017/export?TYPE=players&DETAILS=1&SINCE=&PLAYERS=&JSON=1

    file = File.read("players.json")

    parsed = JSON.parse(file)
    players = parsed["players"]["player"]
    players.each do |player|
      converted_time = Time.at(player["birthdate"].to_i) # MFL stores birthdates as Unix time integers
      player.store( "birthdate", converted_time )

      if player["team"]
        team_id = Team.where({shortname: player["team"]}).first.try(:id)
        player.transform_keys! do |key| # Update key name as this will reference the teams table
          if key == "team"
            key = "team_id"
          else
            key = key
          end
        end
        player.store( "team_id" , team_id )
      end

      if player["draft_team"]
        if player["draft_team"] == "RAM" # Change MFL shortteam of RAM to LAR as we store it
          player["draft_team"] = "LAR"
        end
        draft_team_id = Team.where({shortname: player["draft_team"]}).first.try(:id)
        player.transform_keys! do |key| # Update key name as this will reference the teams table
          if key == "draft_team"
            key = "draft_team_id"
          else
            key = key
          end
        end
        player.store( "draft_team_id" , draft_team_id )
      end
    end
    Player.import players, validate: true

  end
end