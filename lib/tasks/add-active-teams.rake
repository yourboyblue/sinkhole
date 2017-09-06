namespace :teams do
  desc 'Import Active Teams'
  task :add_teams => :environment do

    file = File.read("teams.json")
    teams = JSON.parse(file)
    teams.each do |team|
      converted_time = Date.new(team["founding_year"].to_i)
      team.store("founding_year",converted_time)
      converted_time = Date.new(team["final_year"].to_i)
      team.store("final_year",converted_time)
      puts team.to_s
    end
    Team.import teams, validate: true
  end
end