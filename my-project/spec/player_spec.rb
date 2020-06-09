require 'player.rb'

RSpec.describe "Player" do

    it 'devuelve devolver el nombre Lucas' do
        @player = Player.new
        @player.setName('Lucas')
        expect(@player.getName()).to eq('Lucas')
    end

    it 'devuelve  blanco si no ingresa nombre' do
        @player = Player.new
        expect(@player.getName()).to eq(" ")
     end
    


end