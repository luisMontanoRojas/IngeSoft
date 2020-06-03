class Game
  @try
  @vacas

  def initialize
    @try = 0
    @vacas = 0
  end

  def getCode(num)
    @try = (@try.to_i + 1)
    # mostrar toros(num)...
    return num.to_s
  end

  def getTry()
    return @try.to_s
  end

  def getVacas()
    return @vacas.to_s
  end

  def verifyVacas(secretCode, inputCode)
    @vacas = 0
    secret = secretCode.to_s
    input = inputCode.to_s
    for i in 0..3
      if(secret.include? input[i]) && (secret[i] != input[i])
        @vacas = @vacas + 1
      end
    end
  end
end
