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

    #tests vacas
    it 'devuelve 0 vacas' do
        cantidadVacas = @@game.getVacas()
        expect(cantidadVacas).to eq('0')
    end 

    it 'devuelve 2 vacas' do
        @@game.verifyVacas("1234","4625")
        cantidadVacas = @@game.getVacas()
        expect(cantidadVacas).to eq('2')
    end 

    it 'devuelve 1 vaca aunque el numero se repita 2 veces en el codigo secreto' do 
        @@game.verifyVacas("1231","0100")
        cantidadVacas = @@game.getVacas()
        expect(cantidadVacas).to eq('1')
    end

    it 'devuelte 0 vacas con codigos iguales' do
        @@game.verifyVacas("1234","1234")
        cantidadVacas = @@game.getVacas()
        expect(cantidadVacas).to eq('0')
    end

    it 'devuelve 1 vaca con 0000 y 3330 ' do
        @@game.verifyVacas(0000,3330)
        cantidadVacas = @@game.getVacas()
        expect(cantidadVacas).to eq('1')        
    end

    it 'devuelve 1 vaca con 3330 y 0000 ' do
        @@game.verifyVacas(0000,3330)
        cantidadVacas = @@game.getVacas()
        expect(cantidadVacas).to eq('1')        
    end
    it 'devuelce 4 vacas con 1234 y 4123' do 
        @@game.verifyVacas(1234,4123)
        cantidadVacas = @@game.getVacas()
        expect(cantidadVacas).to eq('4')        
    end
end
