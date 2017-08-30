class PlayersController < ApplicationController

  def index
    @printable_player = Player.includes(:team).pluck(:id, :name, :position, "teams.name")
  end
end
