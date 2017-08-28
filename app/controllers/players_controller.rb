class PlayersController < ApplicationController

  def index
    @printable_player = Player.pluck(:id, :name, :position, :team)
  end
end
