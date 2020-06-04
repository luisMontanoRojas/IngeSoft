class Game
  @try
  @vacas
  @toros
  @secretCode

  def initialize()
    @try = 0
    @toros = 0
    @vacas = 0
    @secretCode = 0
  end

  def random()
    @secretCode = 1000 + rand(8999)
  end

  def setSecretCode(newSecretCode)
    @secretCode = newSecretCode
  end

  def verifyInputCode(inputCode)
    @vacas = 0
    @toros = 0
    secretC = @secretCode.to_s
    inputC = inputCode.to_s
    if (inputCode != "")
      for i in 0..3
        if (secretC.include? inputC[i]) && (secretC[i] != inputC[i])
          @vacas = @vacas + 1          
        elsif (secretC[i] == inputC[i])
          @toros = @toros + 1          
        end
      end
      @try = (@try.to_i + 1)
    end
  end  

  def isLoser(try)
    if(try.to_i >= 10)
      return true
    end
    return false
  end

  def isWinner(codigoIngresado)
    if (@secretCode.to_s == codigoIngresado.to_s)
      return true
    end
    return false
  end

  def getSecretCode()
    return @secretCode.to_s
  end

  def getTry()
    return @try.to_s
  end

  def getVacas()
    return @vacas.to_s
  end

  def getToros()
    return @toros.to_s
  end
end
