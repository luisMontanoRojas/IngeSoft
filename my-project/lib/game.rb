class Game
  @try
  @vacas
  @toros
  @secretCode
  @difficulty
  def initialize()
    @try = 0
    @toros = 0
    @vacas = 0
    @secretCode = 0
    @difficulty = 4
  end

  def random()
    @secretCode = 1000 + rand(8999)
    @secretCode = @secretCode.to_s
  end

  def setSecretCode(newSecretCode)
    @secretCode = newSecretCode
  end

  def verifyInputCode(inputCode)
    @vacas = 0
    @toros = 0
    secretC = @secretCode.to_s
    inputC = inputCode.to_s
    if (isInputCodeValid?(inputC))
      for i in 0..(@difficulty-1)
        if (thereAreVacas?(inputC, i))
          @vacas = @vacas + 1          
        elsif (thereAreToros?(inputC, i))
          @toros = @toros + 1          
        end
      end
      @try = (@try.to_i + 1)
    end
  end  

  def isInputCodeValid?(code)
    if(@difficulty == 4)
      if(code != "") && (code.length() == 4)
        return true
      end
    end
    if(@difficulty == 6)
      if(code != "") && (code.length() == 6)
        return true
      end
    end
    if(@difficulty == 8)
      if(code != "") && (code.length() == 8)
        return true
      end
    end
    return false
  end

  def thereAreVacas?(inputC,pos)
    if (@secretCode.include? inputC[pos]) && (@secretCode[pos] != inputC[pos])
      return true
    else
      return false
    end
  end

  def thereAreToros?(inputC,pos)
    if (@secretCode[pos] == inputC[pos])
      return true
    else
      return false
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
  def setDifficult(difficult)
    @difficulty = difficult
  end
  def getDifficult()
    return @difficulty.to_i
  end
end
