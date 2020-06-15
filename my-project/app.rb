require 'sinatra'
require './lib/game'

$codeToInput

@@game

get '/' do
  @@game = Game.new()
  @@game.random()
  @@numero_random = @@game.getSecretCode()
  @name=params[:name]
  @@difficulty
  erb :autogenerado
end

post '/inputCoding' do
  @player1Name = params[:player1].to_s
  $codeToInput = params[:numberToInput].to_s
  @@numero_random = $codeToInput
  @@game.setPlayer1(@playerName)
  @@difficulty = params[:dificultad].to_i
  @@game.setSecretCode(@@numero_random)  
  @@game.setDifficult(@@difficulty)
  redirect '/game', 307
end

post '/game' do
  @player2Name = params[:player2].to_s
  @@game.setPlayer2(@player2Name)
  @inputCode = params[:code].to_s
  @@game.verifyInputCode(@inputCode)
  @player1 = @@game.getPlayer1()
  @try = @@game.getTry()
  @toros = @@game.getToros()
  @vacas = @@game.getVacas()
  @isWinner = @@game.isWinner(@inputCode)
  @isLoser = @@game.isLoser(@try)
  erb :game
end
