require 'game.rb'

RSpec.describe "Game" do
    @@game = Game.new
    it 'devuelve numero random de longitud 4' do
        @@game.random()
        @numeroRandom = @@game.getSecretCode()
        expect(@numeroRandom.size()).to eq(4)
     end

    it 'devuelve el intento 1 con 1234 y 1234' do
        @@game.random()
        @@game.verifyInputCode("1234")
        expect(@@game.getTry()).to eq('1')
    end

    it 'devuelve el intengo 2 con el codigo 3456 y 3456' do
        @@game.random()
        @@game.verifyInputCode("3456")
        expect(@@game.getTry()).to eq('2')
    end
    #tests vacas
    it 'devuelve 0 vacas' do
        @game = Game.new
        cantidadVacas = @game.getVacas()
        expect(cantidadVacas).to eq('0')
    end

    it 'devuelve 2 vacas' do
        @game = Game.new
        @game.setSecretCode("1234")
        @game.verifyInputCode("4625")
        cantidadVacas = @game.getVacas()
        expect(cantidadVacas).to eq('2')
    end

    it 'devuelve 1 vaca aunque el numero se repita 2 veces en el codigo secreto' do
        @game = Game.new
        @game.setSecretCode("1231")

        @game.verifyInputCode("0100")
        cantidadVacas = @game.getVacas()
        expect(cantidadVacas).to eq('1')
    end

    it 'devuelte 0 vacas con codigos iguales' do
        @game = Game.new
        @game.setSecretCode("1234")

        @game.verifyInputCode("1234")
        cantidadVacas = @game.getVacas()
        expect(cantidadVacas).to eq('0')
    end

    it 'devuelve 0 vaca con 0000 y 3330 ' do
        @game = Game.new
        @game.setSecretCode("0000")

        @game.verifyInputCode("3330")
        cantidadVacas = @game.getVacas()
        expect(cantidadVacas).to eq('0')
    end

    it 'devuelve 3 vaca con 3330 y 0000 ' do
        @game = Game.new
        @game.setSecretCode("3330")

        @game.verifyInputCode("0000")
        cantidadVacas = @game.getVacas()
        expect(cantidadVacas).to eq('3')
    end
    it 'devuelce 4 vacas con 1234 y 4123' do
        @game = Game.new
        @game.setSecretCode("1234")

        @game.verifyInputCode("4123")
        cantidadVacas = @game.getVacas()
        expect(cantidadVacas).to eq('4')
    end

    #test Toros
    it 'devuelve 0 toros ' do
        @game = Game.new
        @game.setSecretCode("1234")

        cantToros = @game.getToros()
        expect(cantToros).to eq('0')
    end
    it 'devuelve 2 toros ' do
        @game = Game.new
        @game.setSecretCode("5692")

        @game.verifyInputCode('1690')
        cantToros = @game.getToros()
        expect(cantToros).to eq('2')
    end
    it 'devuelve 4 toros ' do
        @game = Game.new
        @game.setSecretCode("1690")

        @game.verifyInputCode('1690')
        cantToros = @game.getToros()
        expect(cantToros).to eq('4')
    end
    it 'devuelve 0 toros ' do
        @game = Game.new
        @game.setSecretCode("4321")

        @game.verifyInputCode('1234')
        cantToros = @game.getToros()
        expect(cantToros).to eq('0')
    end
    it 'devuelve 3 toros ' do
        @game = Game.new
        @game.setSecretCode("1234")

        @game.verifyInputCode('1230')
        cantToros = @game.getToros()
        expect(cantToros).to eq('3')
    end
    it 'devuelve 2 toros ' do
        @game = Game.new
        @game.setSecretCode("1034")

        @game.verifyInputCode('0534')
        cantToros = @game.getToros()
        expect(cantToros).to eq('2')
    end
    it 'devuelve 3 toros ' do
        @game = Game.new
        @game.setSecretCode("0034")

        @game.verifyInputCode('0134')
        cantToros = @game.getToros()
        expect(cantToros).to eq('3')
    end
    it 'devuelve 1 toros ' do
        @game = Game.new
        @game.setSecretCode("0030")

        @game.verifyInputCode('5134')
        cantToros = @game.getToros()
        expect(cantToros).to eq('1')
    end
    it 'devuelve 3 toros ' do
        @game = Game.new
        @game.setSecretCode("4034")

        @game.verifyInputCode('0134')
        cantToros = @game.getToros()
        expect(cantToros).to eq('2')
    end
    it 'devuelve 3 toros ' do
        @game = Game.new
        @game.setSecretCode("0010")

        @game.verifyInputCode('0000')
        cantToros = @game.getToros()
        expect(cantToros).to eq('3')
    end

    it "deberia devolver true si gano" do
        @game = Game.new
        @game.setSecretCode("1234")
        result = @game.isWinner("1234")
        expect(result).to eq(true)
    end

    it "deberia devolver false si aun no ganó" do
        @game = Game.new
        @game.setSecretCode("4567")

        result = @game.isWinner("1234")
        expect(result).to eq(false)
    end

    it "deveria devolver true al perder" do
        @game = Game.new
        result = @game.isLoser(10)
        expect(result).to eq(true)
    end

    it "deveria devolver false si no pierde" do
        @game = Game.new
        result = @game.isLoser(5)
        expect(result).to eq(false)
    end
    it 'devuelve gano con 1234 y 1234' do
        @game = Game.new
        @game.setSecretCode("1234")
        result = @game.isWinner("1234")
        expect(result).to eq(true)
    end

    it 'devuelve 4 la longitud del codigo cuando el nivel es basico' do
        @game = Game.new
        @game.setDifficult(4)
        @game.setSecretCode("1234")
        result = @game.getSecretCode().size()
        expect(result).to eq(4)
    end

    it 'devuelve 6 la longitud del codigo cuando el nivel es medio' do
        @game = Game.new
        @game.setDifficult(6)
        @game.setSecretCode("123456")
        result = @game.getSecretCode().size()
        expect(result).to eq(6)
    end

    it 'devuelve 8 la longitud del codigo cuando el nivel es dificil' do
        @game = Game.new
        @game.setDifficult(8)
        @game.setSecretCode("12345678")
        result = @game.getSecretCode().size()
        expect(result).to eq(8)
    end

    it 'devuelve 8 la longitud del codigo cuando el nivel es dificil' do
        @game = Game.new
        @game.setDifficult(8)
        expect(@game.getDifficult()).to eq(8)
    end
    
end
