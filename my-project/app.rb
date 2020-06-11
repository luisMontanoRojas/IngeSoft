require 'sinatra'
require './lib/game'
require './lib/player'
@@game

get '/' do
    @@game = Game.new()
    @name=params{:name}
    @@game.setPlayer1(@name)
    @@game.random()
    @@numero_random = @@game.getSecretCode()
    erb :autogenerado
end

post '/game' do
  @name1=params[:name2].to_s
  @@game.setPlayer2(@name1)
  puts("el nombre es"+@@name.to_s)
  puts "el nombre es"+params[:name2].to_s
  @inputCode = params[:code].to_s
  @@game.verifyInputCode(@inputCode)
  @try = @@game.getTry()
  @toros = @@game.getToros()
  @vacas = @@game.getVacas()
  @isWinner = @@game.isWinner(@inputCode)
  @isLoser = @@game.isLoser(@try)
  erb :game
end
