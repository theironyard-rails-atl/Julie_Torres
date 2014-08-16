#Note the plural
class GamesController < ApplicationController
  def index #display a collection of games
    user = User.find(params[:user_id])
    @games = current_user.games
  end

  def show
    id = params[:id]
    @game = current_user.games.find(id)
  end

  def update
    id = params[:id]
    @game = Game.find(id)
    letter = params[:letter]
    @game.guess(letter)

      redirect_to game_path
    # end
  end

end
