require 'sinatra'
require './lib/game'
$codeToInput

@@game

get '/' do
  @@game = Game.new()
  @@game.random()
  @@numero_random = @@game.getSecretCode()
  @name=params{:name}
  @@game.setPlayer1(@name)
  erb :autogenerado
end

post '/inputCoding' do
  @playerName = params[:name]
  $codeToInput = params[:numberToInput].to_s
  @@numero_random = $codeToInput
  @@game.setSecretCode(@@numero_random)
  redirect '/game', 307
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
