class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.integer :draft_year
      t.integer :draft_round
      t.string :nfl_id
      t.integer :rotoworld_id
      t.integer :stats_id
      t.string :position
      t.integer :stats_global_id
      t.integer :espn_id
      t.integer :kffl_id
      t.integer :weight
      t.integer :mfl_id
      t.integer :fleaflicker_id
      t.datetime :birthdate
      t.string :draft_team
      t.integer :draft_pick
      t.string :name
      t.string :college
      t.integer :height
      t.integer :jersey
      t.string :twitter_username
      t.string :sportsdata_id
      t.integer :team
      t.integer :cbs_id
      t.string :fff_id

      t.timestamps
    end
  end
end
