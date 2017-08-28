class PlayersController < ApplicationController

  def index
    @player_names = Player.pluck(:name)
  end
end
