class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :shortname
      t.datetime :founding_year
      t.datetime :final_year
      t.references :team
      t.timestamps
    end
  end
end
