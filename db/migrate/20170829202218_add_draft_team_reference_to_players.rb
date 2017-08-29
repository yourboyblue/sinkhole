class AddDraftTeamReferenceToPlayers < ActiveRecord::Migration[5.1]
  def change
    remove_column(:players, :draft_team)
    add_reference(:players, :draft_team, reference: :team, index: true, null: true)
  end
end
