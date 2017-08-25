namespace :players do
  desc 'Import MFL player data'
  task :add_player_data => :environment do
    puts Dir.pwd

    file = File.read("players.json")
    parsed = JSON.parse(file)
    players = parsed["player"]
    players.each do |player|
      converted_time = Time.at(player["birthdate"].to_i)
      player.store("birthdate",converted_time)
    end
    Player.import players, validate: true

  end
end