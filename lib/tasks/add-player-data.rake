namespace :players do
  desc 'Import MFL player data'
  task :add_player_data => :environment do

    # request_url = https://www77.myfantasyleague.com/2017/export?TYPE=players&DETAILS=1&SINCE=&PLAYERS=&JSON=1

    file = File.read("players.json")

    custom_keys = {
                    "team" => "team_id",
                    "draft_team" => "draft_team_id"
                  }

    custom_values = {
                    "RAM" => "LAR"
    }

    parsed = JSON.parse(file)
    players = parsed["players"]["player"]
    players.each do |player|
      converted_time = Time.at(player["birthdate"].to_i) # MFL stores birthdates as Unix time integers
      player.store( "birthdate", converted_time )

      update_keys(player, custom_keys)
      update_values(player, custom_values)

      if player["team_id"]
        team_id = Team.where({shortname: player["team_id"]}).first.try(:id)
        player.store( "team_id" , team_id )
      end

      if player["draft_team_id"]
        draft_team_id = Team.where({shortname: player["draft_team_id"]}).first.try(:id)
        player.store( "draft_team_id" , draft_team_id )
      end
    end

    Player.import players, validate: true
  end

  def update_keys(player, custom_keys)
    custom_keys.each do |mfl_key, custom_key|
      player.transform_keys! do |key| # Update any keys that differ from our column names
        if key == mfl_key
          key = custom_key
        else
          key = key
        end
      end
    end
  end

  def update_values(player, custom_values)
    custom_values.each do |mfl_value, custom_value|
      player.transform_values! do |value| # Update values that we map differently than MFL
        if value == mfl_value
          value = custom_value
        else
          value = value
        end
      end
    end
  end

end

