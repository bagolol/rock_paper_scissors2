require 'sinatra/base'
require './lib/game'

class Rps < Sinatra::Base
  set :views, proc { File.join(root, "views") }
  enable :sessions

  get '/' do
    session["user"] = nil
    session["game"] = nil
    erb :index
  end

  post '/game/new' do
    session["user"] = params[:name]
    @player1 = session["user"]
    opponent = params[:opponent]
    user = Player.new @player

    if opponent == 'Computer'
      session["game"] = Game.new user, Computer.new
    else
      session["game"] = Game.new user, TacticalPlayer.new
    end
    redirect '/game'
  end

  get '/game' do
    @player1_score = session["game"].score[:player1]
    @player2_score = session["game"].score[:player2]
    @player1 = session["user"]
    @player2 = session["game"].player2.name
    @player1_move = session["game"].player1.last_move
    @player2_move = session["game"].player2.last_move
    @result = session["game"].declare_winner
    erb :play
  end

  post '/game' do
    @move1 = params["move"].to_sym
    session["game"].player1.play @move1
    @move2 = session["game"].player2.play
    session["game"].score_points
    redirect '/game'
  end

  run! if app_file == $PROGRAM_NAME
end

