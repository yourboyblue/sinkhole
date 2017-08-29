namespace :nfl_teams do
  desc 'Import Active Teams'
  task :add_active_teams => :environment do

    file = File.read("active_teams.json")
    active_teams = JSON.parse(file)["active_teams"]
    active_teams.each do |team|
      converted_time = Time.at(team["founding_year"].to_i)
      team.store("founding_year",converted_time)
    end
    NflTeam.import active_teams, validate: true
  end
end