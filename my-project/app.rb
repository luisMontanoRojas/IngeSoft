require 'sinatra'
require './lib/numeroRandom'

get '/' do 
    numeroRandom = NumeroRandom.new()
    @numero_random = numeroRandom.random()
    erb :autogenerado
end