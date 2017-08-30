class AddReferenceTeamToPlayers < ActiveRecord::Migration[5.1]
  def change
    remove_column(:players, :team)
    add_reference(:players, :team, null: false)
  end
end
