class Team < ApplicationRecord
  has_many :players

  def self.active_teams()
    where("final_year > ?", DateTime.current.beginning_of_year)
  end
end
