class Game
  @try
  @vacas
  @toros
  @secretCode
  @difficult
  @mode
  @maxAttempts

  def initialize()
    @maxAttempts = 10
    @try = 0
    @toros = 0
    @vacas = 0
    @secretCode = 0
    @difficult = 4
    @mode = 'N'
  end

  def getMaxAttempts()
    return @maxAttempts
  end

  def setMaxAttempts(newMaxAttempts)
    @maxAttempts = newMaxAttempts
  end

  def setMode(newMode)
    @mode = newMode
  end

  def getMode()
    return @mode
  end
  
  def random()
    if(@difficult == 4)
      @secretCode = 1000 + rand(8999)
      @secretCode = @secretCode.to_s
    end
    if(@difficult == 6)
      @secretCode = 100000 + rand(899999)
      @secretCode = @secretCode.to_s
    end
    if(@difficult == 8)
      @secretCode = 10000000 + rand(89999999)
      @secretCode = @secretCode.to_s
    end
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
      for i in 0..(@difficult-1)
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
    if(@difficult == 4)
      if(code != "") && (code.length() == 4)
        return true
      end
    end
    if(@difficult == 6)
      if(code != "") && (code.length() == 6)
        return true
      end
    end
    if(@difficult == 8)
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
    if(try.to_i >= @maxAttempts)
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
    @difficult = difficult
  end
  def getDifficult()
    return @difficult.to_i
  end

  def getCodeInColors()
    res = ""
    for i in 0..(@difficult-1) do
      if(@secretCode[i] == "0")
        res = res + " rojo"
      end
      if(@secretCode[i] == "1")
        res = res + " amarillo"
      end
      if(@secretCode[i] == "2")
        res = res + " verde"
      end
      if(@secretCode[i] == "3")
        res = res + " azul"
      end
      if(@secretCode[i] == "4")
        res = res + " naranja"
      end
      if(@secretCode[i] == "5")
        res = res + " negro"
      end
      if(@secretCode[i] == "6")
        res = res + " blanco"
      end
      if(@secretCode[i] == "7")
        res = res + " cafe"
      end
      if(@secretCode[i] == "8")
        res = res + " celeste"
      end
      if(@secretCode[i] == "9")
        res = res + " morado"
      end
    end
    return res.to_s
  end
end

