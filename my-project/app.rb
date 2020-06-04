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
  @numero = @@numero_random.to_s
  @@game.verifyVacas(@@numero_random, @code)
  @vacas = @@game.getVacas()
  @@game.comparar(@@numero_random,@code)
  @toros = @@game.getToros()
  @won =   @@game.won(@code,@@numero_random)
  @loss = @@game.loss(@try)

  erb :game
end
