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
  #falta validar cantidad de digitos ( validate(@code) )
  if (@code == "")
    @code = "0000"
  end
  @@game.verifyVacas(@@numero_random, @code)
  @vacas = @@game.getVacas()
  erb :game
end

