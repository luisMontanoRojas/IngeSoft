require 'sinatra'
require './lib/game'
require './lib/player'
@@game

get '/' do
    @@game = Game.new()
    @name=params[:name].to_s
    puts(@name)
    @@game.setPlayer1(@name)
    @@game.random()
    @@numero_random = @@game.getSecretCode()
    erb :autogenerado
end

post '/game' do
  @name=params[:name2].to_s
  puts(@name)
  @@game.setPlayer2(@name)
  @inputCode = params[:code].to_s
  @@game.verifyInputCode(@inputCode)
  @try = @@game.getTry()
  @toros = @@game.getToros()
  @vacas = @@game.getVacas()
  @isWinner = @@game.isWinner(@inputCode)
  @isLoser = @@game.isLoser(@try)
  erb :game
end
