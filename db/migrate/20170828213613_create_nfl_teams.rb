class CreateNflTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :nfl_teams do |t|
      t.string :fullname
      t.string :shortname
      t.time :founding_year
      t.timestamps
    end
  end
end
