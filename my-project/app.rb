require 'sinatra'
require './lib/numeroRandom'
require './lib/game'

get '/' do
    @@game = Game.new()
    numeroRandom = NumeroRandom.new()
    @@numero_random = numeroRandom.random()
    erb :autogenerado
end


post '/game' do
  @try = @@game.getTry()
  @code = @@game.getCode(params[:code].to_s)
  @@game.comparar(@@numero_random,@code)
  @toros = @@game.getToros()
  erb :game

end



