class UpdateTeamColumnsInPlayers < ActiveRecord::Migration[5.1]
  def change
    remove_column(:players, :team)
    add_reference(:players, :nfl_teams, index: { name: "team" }, null: false)
  end
end
