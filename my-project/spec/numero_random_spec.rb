require 'numeroRandom.rb'

RSpec.describe "Random" do
   it 'devuelve numero random de longitud 4' do
       @numeroRandom = NumeroRandom.new
       expect(@numeroRandom.random().size()).to eq(4)
   end
end
