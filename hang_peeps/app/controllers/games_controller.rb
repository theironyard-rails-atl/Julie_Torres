#Note the plural
class GamesController < ApplicationController
  def index #display a collection of games
    @games = Game.all
  end

  def show
    id = params[:id]
    @game = Game.find(id)
  end

  def update
    id = params[:id]
    @game = Game.find(id)
    letter = params[:letter]
    @game.guess(letter)

    # if @game.lost?
    #   redirect_to ({:action => 'index'})
    # elsif @game.won?
    #   redirect_to ({:action => 'index'})
    # else
      redirect_to game_path
    # end
  end

end
