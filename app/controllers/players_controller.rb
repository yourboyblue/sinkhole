class PlayersController < ApplicationController

  def index
    positions = ["QB", "RB", "WR", "TE", "PK", "Def"]
    @printable_player = Player.includes(:team).filter_by_position(positions).pluck(:id, :name, :position, "teams.name")
  end
end
