class Player < ApplicationRecord
  has_many :contracts
  has_many :nfl_teams
end
