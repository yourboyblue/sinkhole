class Player < ApplicationRecord
  has_many :contracts
  has_many :nfl_teams
  belongs_to :team
  belongs_to :draft_team, class_name: "Team"

  scope :filter_by_position, -> (positions) { where( position: positions ) }
end
