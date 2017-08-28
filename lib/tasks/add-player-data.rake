namespace :players do
  desc 'Import MFL player data'
  task :add_player_data => :environment do

    # request_url = https://www77.myfantasyleague.com/2017/export?TYPE=players&DETAILS=1&SINCE=&PLAYERS=&JSON=1

    file = File.read("players.json")
    parsed = JSON.parse(file)
    players = parsed["players"]["player"]
    players.each do |player|
      converted_time = Time.at(player["birthdate"].to_i) # MFL stores birthdates as Unix time integers
      player.store("birthdate",converted_time)
    end
    Player.import players, validate: true

  end
end