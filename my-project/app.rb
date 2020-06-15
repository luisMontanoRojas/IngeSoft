require 'sinatra'
require './lib/game'

@@game
$mode
$difficult
$numberPlayers
$secretCode
@@namePlayer1 = ""
@@namePlayer2 = ""

get '/' do
  @@game = Game.new()
  erb :home
end

post '/setData' do
  $mode = params[:gameMode].to_s
  $difficult = params[:difficult].to_i
  $numberPlayers = params[:players].to_i
  @@game.setMode($mode)
  @@game.setDifficult($difficult)
  if ($numberPlayers == 2)
    redirect '/twoplayers', 307
  else
    redirect '/oneplayer', 307
  end
end

post '/oneplayer' do
  if ($numberPlayers == 1)
    @@game.random()
  end
  erb :oneplayer
end

post '/twoplayers' do
  erb :twoplayers
end

post '/setDataToPlay' do
  @@namePlayer2 = params[:namePlayer2].to_s
  $secretCode = getColorsCode(params[:inputNumber].to_s)
  @numberAttempts = params[:attemps].to_i
  @@game.setSecretCode($secretCode)
  @@game.setMaxAttempts(@numberAttempts)
  redirect '/oneplayer', 307
end

post '/setplayer1' do
  @@namePlayer1 = params[:namePlayer1].to_s 
  redirect '/game', 307
end

post '/game' do
  @inputCode = getColorsCode(params[:code].to_s)
  @@game.verifyInputCode(@inputCode)
  @try = @@game.getTry()
  @toros = @@game.getToros()
  @vacas = @@game.getVacas()
  @isWinner = @@game.isWinner(@inputCode)
  @isLoser = @@game.isLoser(@try)
  erb :game
end

def getColorsCode(inputNum)
  if(@@game.getMode()=='C')
      color1 = params[:color1].to_s
      color2 = params[:color2].to_s
      color3 = params[:color3].to_s
      color4 = params[:color4].to_s
      colores = color1 + color2 + color3 + color4
    if(@@game.getDifficult() ==6 || @@game.getDifficult()==8)
      color5 = params[:color5].to_s
      color6 = params[:color6].to_s
      colores = colores + color5 + color6
    end
    if(@@game.getDifficult()==8)
      color7 = params[:color7].to_s
      color8 = params[:color8].to_s
      colores = colores + color7 + color8
    end
      return colores.to_s
  elsif (@@game.getMode()=='N')
    return inputNum
  end
end

