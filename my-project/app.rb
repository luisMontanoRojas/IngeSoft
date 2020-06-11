require 'sinatra'
require './lib/game'

$codeToInput

@@game

get '/' do
  @@game = Game.new()  
  @@game.random()
  @@numero_random = @@game.getSecretCode()
  erb :autogenerado
end

post '/inputCoding' do
  $codeToInput = params[:numberToInput].to_s
  @@numero_random = $codeToInput
  @@game.setSecretCode(@@numero_random)  
  redirect '/game', 307
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
