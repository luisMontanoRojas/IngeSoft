require 'sinatra'
require './lib/numeroRandom'
require './lib/game'

get '/' do
    @@game = Game.new()
    numeroRandom = NumeroRandom.new()
    @numero_random = numeroRandom.random()
    erb :autogenerado
end


post '/game' do
  @try = @@game.getTry()
  @code = @@game.getCode(params[:code].to_i)
  erb :game
end
