require 'numeroRandom.rb'

Rspec.describe "Random" do
    it 'devuelve numero random' do
        @numeroRandom = NumeroRandom.new
        expect(@numeroRandom.random()).to eq(64)
    end
end