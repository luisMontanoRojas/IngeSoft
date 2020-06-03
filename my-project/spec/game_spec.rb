require 'game.rb'

RSpec.describe "Game" do
    it 'devuelve el codigo ingresado 1234' do
        @game = Game.new
        expect(@game.getCode(1234)).to eq('1234')
    end
    
    @@game = Game.new
    it 'devuelve el intento 1 con el codigo 1234' do
        @@game.getCode(1234)
        expect(@@game.getTry()).to eq('1')
    end

    it 'devuelve el intengo 2 con el codigo 3456' do
        @@game.getCode(3456)
        expect(@@game.getTry()).to eq('2')
    end
    it 'devuelve 0 toros ' do
        cantToros = @@game.getToros()
        expect(cantToros).to eq('0')
    end 
    it 'devuelve 2 toros ' do
        @@game.comparar(5692,1690)
        cantToros = @@game.getToros()
        expect(cantToros).to eq('2')
    end 
end