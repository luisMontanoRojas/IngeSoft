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
end
