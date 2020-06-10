require 'sinatra'
require './lib/game'

@@game

get '/' do
    @@game = Game.new()
    @@game.random()
    @@numero_random = @@game.getSecretCode()

    @codigo = params[:codigo].to_s
    @@game.setSecretCode(@codigo)
    @@numero_teclado = @@game.getSecretCode()
    puts params[:codigo]
    #puts @codigo
    puts "@numero"
    erb :autogenerado
end

post '/game' do
  @inputCode = params[:code].to_s
  @@game.verifyInputCode(@inputCode)
  @try = @@game.getTry()
  @toros = @@game.getToros()
  @vacas = @@game.getVacas()
  @isWinner = @@game.isWinner(@inputCode)
  @isLoser = @@game.isLoser(@try)
  erb :game
end
