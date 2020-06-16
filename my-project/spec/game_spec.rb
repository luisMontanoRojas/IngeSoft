require 'game.rb'

RSpec.describe "Game" do
    @@game = Game.new
    $colorRojo = '0'
    $colorAmarillo = '1'
    $colorVerde = '2'
    $colorAzul = '3'
    $colorNaranja = '4'
    $colorNegro = '5'
    $colorBlanco = '6'
    $colorCafe = '7'
    $colorCeleste = '8'
    $colorMorado = '9'
    #facil numeros
    it 'devuelve numero random de longitud 4' do
        @@game.random()
        @numeroRandom = @@game.getSecretCode()
        expect(@numeroRandom.size()).to eq(4)
     end

    it 'devuelve el intento 1 con 1234 y 1234' do
        @@game.setMode('N')
        @@game.random()
        @@game.verifyInputCode("1234")
        expect(@@game.getTry()).to eq('1')
    end
    it 'devuele modalidad colores'do
        @game = Game.new
        @game.setMode('C')
        result = @game.getMode()
        expect(result).to eq('C')
    end
    it 'devuelve false si el codigo no es valido ' do
        @game = Game.new
        result = @game.isInputCodeValid?('123')
        expect(result).to eq(false)
    end
    it 'devuelve numero random de longitud 8' do
        @game = Game.new
        @game.setDifficult(8)
        @game.random()
        @numeroRandom = @game.getSecretCode()
        expect(@numeroRandom.size()).to eq(8)
     end

    it 'devuelve el intengo 2 con el codigo 3456 y 3456' do
        @@game.random()
        @@game.verifyInputCode("3456")
        expect(@@game.getTry()).to eq('2')
    end

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

    #medio numeros
    it 'devuelve 6 la longitud del codigo cuando el nivel es medio' do
        @game = Game.new
        @game.setDifficult(6)
        @game.setSecretCode("123456")
        result = @game.getSecretCode().size()
        expect(result).to eq(6)
    end
    it "deveria devolver true al perder" do
        @game = Game.new
        @game.setMaxAttempts(10)
        result = @game.isLoser(10)
        expect(result).to eq(true)
    end
    it "deveria devolver true al perder" do
        @game = Game.new
        @game.setMaxAttempts(20)
        result = @game.isLoser(20)
        expect(result).to eq(true)
    end
    it "deveria devolver true al perder" do
        @game = Game.new
        @game.setMaxAttempts(20)
        @game.setSecretCode("123567")
        result = @game.isWinner("123456")
        expect(result).to eq(false)
    end
    it "deberia devolver false si aun no ganó" do
        @game = Game.new
        @game.setSecretCode("123567")

        result = @game.isWinner("123456")
        expect(result).to eq(false)
    end

    it 'devuelve 2 vacas' do
        @game = Game.new
        @game.setDifficult(6)
        @game.setSecretCode("123478")
        @game.verifyInputCode("123487")
        cantidadVacas = @game.getVacas()
        expect(cantidadVacas).to eq('2')
    end
    it 'devuelve 0 vacas' do
        @game = Game.new
        @game.setDifficult(6)
        @game.setSecretCode("123456")
        @game.verifyInputCode("123456")
        cantidadVacas = @game.getVacas()
        expect(cantidadVacas).to eq('0')
    end
    it 'devuelve 6 vacas' do
        @game = Game.new
        @game.setDifficult(6)
        @game.setSecretCode("123456")
        @game.verifyInputCode("654321")
        cantidadVacas = @game.getVacas()
        expect(cantidadVacas).to eq('6')
    end
    it 'devuelve 0 vacas' do
        @game = Game.new
        @game.setDifficult(6)
        @game.setSecretCode("000000")
        @game.verifyInputCode("000000")
        cantidadVacas = @game.getVacas()
        expect(cantidadVacas).to eq('0')
    end
    it 'devuelve 2 toro' do
        @game = Game.new
        @game.setDifficult(6)
        @game.setSecretCode("123456")
        @game.verifyInputCode("123400")
        cantidadToros = @game.getToros()
        expect(cantidadToros).to eq('4')
    end
    it 'devuelve 0 toro' do
        @game = Game.new
        @game.setDifficult(6)
        @game.setSecretCode("123456")
        @game.verifyInputCode("654321")
        cantidadToros = @game.getToros()
        expect(cantidadToros).to eq('0')
    end
    it 'devuelve gano con 123456 y 123456' do
        @game = Game.new
        @game.setSecretCode("123456")
        result = @game.isWinner("123456")
        expect(result).to eq(true)
    end
    it 'devuelve numero random de longitud 6' do
        @game = Game.new
        @game.setDifficult(6)
        @game.random()
        @numeroRandom = @game.getSecretCode()
        expect(@numeroRandom.size()).to eq(6)
     end
     it 'devuelve gano' do
        @game = Game.new
        @game.setDifficult(6)
        @game.setSecretCode("123456")
        @game.verifyInputCode("123456")
        result = @game.isWinner("123456")
        expect(result).to eq(true)
    end
    it 'devuelve 6 toros' do
        @game = Game.new
        @game.setDifficult(6)
        @game.setSecretCode("123456")
        @game.verifyInputCode("123456")
        cantidadToros = @game.getToros()
        expect(cantidadToros).to eq('6')
    end
    it 'devuelve 0 vaca' do
        @game = Game.new
        @game.setDifficult(6)
        @game.setSecretCode("123456")
        @game.verifyInputCode("123456")
        cantVacas = @game.getVacas()
        expect(cantVacas).to eq('0')
    end
    it 'devuelve 2 toros' do
        @game = Game.new
        @game.setDifficult(6)
        @game.setMaxAttempts(20)
        @game.setSecretCode("123456")
        @game.verifyInputCode("124300")
        cantidadToros = @game.getToros()
        expect(cantidadToros).to eq('2')
    end
    it 'devuelve 2 vacas' do
        @game = Game.new
        @game.setDifficult(6)
        @game.setMaxAttempts(20)
        @game.setSecretCode("123456")
        @game.verifyInputCode("124300")
        cantVacas = @game.getVacas()
        expect(cantVacas).to eq('2')
    end
    it 'devuelve perdio' do
        @game = Game.new
        @game.setDifficult(6)
        @game.setMaxAttempts(20)
        @game.setSecretCode("123456")
        @game.verifyInputCode("124300")
        result = @game.isLoser(20)
        expect(result).to eq(true)
    end

    #dificil numeros
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
    it 'devuelve gano con 12345678 y 12345678' do
        @game = Game.new
        @game.setSecretCode("12345678")
        result = @game.isWinner("12345678")
        expect(result).to eq(true)
    end
    it 'devuelve 2 vacas' do
        @game = Game.new
        @game.setDifficult(8)
        @game.setSecretCode("12345678")
        @game.verifyInputCode("12345687")
        cantidadVacas = @game.getVacas()
        expect(cantidadVacas).to eq('2')
    end
    it 'devuelve 6 toro' do
        @game = Game.new
        @game.setDifficult(8)
        @game.setSecretCode("12345678")
        @game.verifyInputCode("12340000")
        cantidadToros = @game.getToros()
        expect(cantidadToros).to eq('4')
    end
    it 'devuelve 8 toro' do
        @game = Game.new
        @game.setDifficult(8)
        @game.setSecretCode("12345678")
        @game.verifyInputCode("12340000")
        cantidadToros = @game.getToros()
        expect(cantidadToros).to eq('4')
    end
    it 'devuelve 0 toros y 8 vacas' do
        @game = Game.new
        @game.setDifficult(8)
        @game.setSecretCode("12345678")
        @game.verifyInputCode("87654321")
        cantidadToros = @game.getToros()
        cantVacas = @game.getVacas()
        expect(cantidadToros).to eq('0')
        expect(cantVacas).to eq('8')
    end
    it 'devuelve 6 toros y 2 vacas y perdio' do
        @game = Game.new
        @game.setDifficult(8)
        @game.setSecretCode("12345678")
        @game.verifyInputCode("12345687")
        cantidadToros = @game.getToros()
        cantVacas = @game.getVacas()
        expect(cantidadToros).to eq('6')
        expect(cantVacas).to eq('2')
        result = @game.isLoser(10)
        expect(result).to eq(true)
    end
    it "deberia devolver false si aun no ganó" do
        @game = Game.new
        @game.setSecretCode("12345687")

        result = @game.isWinner("12345678")
        expect(result).to eq(false)
    end
    
    #facil colores
    it 'devuelve el intento ganar con amarillo,rojo,amarillo,rojo y amarillo,rojo,amarillo,rojo' do
        @game = Game.new
        inputCode = $colorAmarillo + $colorRojo + $colorAmarillo + $colorRojo
        secretCode = $colorAmarillo + $colorRojo + $colorAmarillo + $colorRojo
        @game.setSecretCode(secretCode)
        @game.verifyInputCode(inputCode)
        result = @game.isWinner(inputCode)
        expect(result).to eq(true)
    end
    it 'devuelve 1 vaca con amarillo,rojo,verde,azul y amarillo,rojo,celeste,verde ' do
        @game = Game.new
        inputCode = $colorAmarillo + $colorRojo + $colorVerde + $colorAzul
        secretCode = $colorAmarillo + $colorRojo + $colorCeleste + $colorVerde
        @game.setSecretCode(secretCode)
        @game.verifyInputCode(inputCode)
        cantidadVacas = @game.getVacas()
        expect(cantidadVacas).to eq('1')
    end
    it 'devuelve 0 vaca con amarillo,rojo,verde,azul y amarillo,rojo,celeste,morado ' do
        @game = Game.new
        inputCode = $colorAmarillo + $colorRojo + $colorVerde + $colorAzul
        secretCode = $colorAmarillo + $colorRojo + $colorCeleste + $colorMorado
        @game.setSecretCode(secretCode)
        @game.verifyInputCode(inputCode)
        cantidadVacas = @game.getVacas()
        expect(cantidadVacas).to eq('0')
    end

    it 'devuelve 0 toros amarillo,rojo,verde,azul y azul,amarillo,rojo,verde ' do
        @game = Game.new
        @game.setDifficult(4)
        inputCode = $colorAmarillo + $colorRojo + $colorVerde + $colorAzul
        secretCode = $colorAzul + $colorAmarillo + $colorRojo + $colorVerde 
        @game.setSecretCode(secretCode)
        @game.verifyInputCode(inputCode)
        cantToros = @game.getToros()
        expect(cantToros).to eq('0')

    end
    it 'devuelve 4 vacas amarillo,rojo,verde,azul y azul,amarillo,rojo,verde ' do
        @game = Game.new
        @game.setDifficult(4)
        inputCode = $colorAmarillo + $colorRojo + $colorVerde + $colorAzul
        secretCode = $colorAzul + $colorAmarillo + $colorRojo + $colorVerde 
        @game.setSecretCode(secretCode)
        @game.verifyInputCode(inputCode)
        cantidadVacas = @game.getVacas()
        expect(cantidadVacas).to eq('4')

    end
    it 'devuelve que gano amarillo,rojo,verde,azul y azul,amarillo,rojo,verde ' do
        @game = Game.new
        @game.setDifficult(4)
        @game.setMaxAttempts(20)
        result = @game.isLoser(20)
        expect(result).to eq(true)
    end
    it "deberia devolver false si aun no ganó" do
        @game = Game.new
        inputCode = $colorAmarillo + $colorRojo + $colorVerde + $colorAzul
        secretCode = $colorAzul + $colorAmarillo + $colorRojo + $colorVerde 
        @game.setSecretCode(secretCode)
        result = @game.isWinner(inputCode)
        expect(result).to eq(false)
    end

    #medio colores
    it 'devuelve el intento ganar con amarillo,rojo,amarillo,rojo,verde,morado y amarillo,rojo,amarillo,rojo,verde,morad' do
        @game = Game.new
        @game.setDifficult(6)
        inputCode = $colorAmarillo + $colorRojo + $colorAmarillo + $colorRojo + $colorVerde + $colorMorado
        secretCode = $colorAmarillo + $colorRojo + $colorAmarillo + $colorRojo + $colorVerde + $colorMorado
        @game.setSecretCode(secretCode)
        @game.verifyInputCode(inputCode)
        result = @game.isWinner(inputCode)
        expect(result).to eq(true)
    end
    it 'devuelve 1 vaca con amarillo,rojo,verde,azul,naranja,morado y amarillo,rojo,celeste,verde,naranja,morado ' do
        @game = Game.new
        @game.setDifficult(6)
        inputCode = $colorAmarillo + $colorRojo + $colorVerde + $colorAzul + $colorNaranja + $colorMorado
        secretCode = $colorAmarillo + $colorRojo + $colorCeleste + $colorVerde + $colorNaranja + $colorMorado
        @game.setSecretCode(secretCode)
        @game.verifyInputCode(inputCode)
        cantidadVacas = @game.getVacas()
        expect(cantidadVacas).to eq('1')
    end
    it 'devuelve 0 toros con amarillo,rojo,verde,azul,naranja,morado y morado,amarillo,rojo,verde,azul,naranja' do
        @game = Game.new
        @game.setDifficult(6)
        inputCode = $colorAmarillo + $colorRojo + $colorVerde + $colorAzul + $colorNaranja + $colorMorado
        secretCode = $colorMorado + $colorAmarillo + $colorRojo + $colorVerde + $colorAzul + $colorNaranja 
        @game.setSecretCode(secretCode)
        @game.verifyInputCode(inputCode)
        cantToros = @game.getToros()
        expect(cantToros).to eq('0')
    end
    it "deberia devolver false si aun no ganó" do
        @game = Game.new
        @game.setDifficult(6)
        inputCode = $colorAmarillo + $colorRojo + $colorVerde + $colorAzul + $colorNaranja + $colorMorado
        secretCode = $colorMorado + $colorAmarillo + $colorRojo + $colorVerde + $colorAzul + $colorNaranja 
        @game.setSecretCode(secretCode)
        result = @game.isWinner(inputCode)
        expect(result).to eq(false)
    end
    #dificil colores

    it "deberia devolver false si aun no ganó" do
        @game = Game.new
        @game.setDifficult(8)
        inputCode = $colorAmarillo + $colorRojo + $colorVerde + $colorAzul + $colorNaranja + $colorMorado + $colorNegro + $colorBlanco
        secretCode = $colorMorado + $colorAmarillo + $colorRojo + $colorVerde + $colorAzul + $colorNaranja + $colorNegro + $colorBlanco
        @game.setSecretCode(secretCode)
        result = @game.isWinner(inputCode)
        expect(result).to eq(false)
    end
    it "deberia devolver ganó" do
        @game = Game.new
        @game.setDifficult(8)
        inputCode = $colorRojo + $colorRojo + $colorRojo + $colorRojo + $colorRojo + $colorRojo + $colorRojo + $colorRojo
        secretCode = $colorRojo + $colorRojo + $colorRojo + $colorRojo + $colorRojo + $colorRojo + $colorRojo + $colorRojo
        @game.setSecretCode(secretCode)
        result = @game.isWinner(inputCode)
        expect(result).to eq(true)
    end
    it "deberia devolver false a perdi" do
        @game = Game.new
        @game.setDifficult(8)
        inputCode = $colorRojo + $colorRojo + $colorRojo + $colorRojo + $colorRojo + $colorRojo + $colorRojo + $colorRojo
        secretCode = $colorRojo + $colorRojo + $colorRojo + $colorRojo + $colorRojo + $colorRojo + $colorRojo + $colorRojo
        @game.setSecretCode(secretCode)
        result = @game.isLoser(inputCode)
        expect(result).to eq(false)
    end
    it 'deberia devolver 11 intentos' do
        @game = Game.new
        @game.setMaxAttempts(11)
        result = @game.getMaxAttempts()
        expect(result).to eq(11)
    end
    it 'deberia convertir numeros a colores' do
        @game = Game.new
        secretCode = $colorRojo + $colorAmarillo + $colorVerde + $colorAzul + $colorNaranja + $colorNegro + $colorBlanco + $colorCafe
        @game.setDifficult(8)
        @game.setSecretCode(secretCode)
        result=@game.getCodeInColors()
        expect(result).to eq(" rojo amarillo verde azul naranja negro blanco cafe")
    end
    it 'deberia convertir numeros a colores' do
        @game = Game.new
        secretCode = $colorMorado + $colorCeleste + $colorVerde + $colorAzul + $colorNaranja + $colorNegro + $colorBlanco + $colorCafe
        @game.setDifficult(8)
        @game.setSecretCode(secretCode)
        result=@game.getCodeInColors()
        expect(result).to eq(" morado celeste verde azul naranja negro blanco cafe")
    end
end 
