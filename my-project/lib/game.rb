class Game

  @try 
  @toros 

  def initialize()
    @try = 0
    @toros = 0
  end

  def getCode(num)
    @try = (@try.to_i + 1)

    return num.to_s
  end

  def getTry()
    return @try.to_s
  end
  #Toros
  def getToros()
    return @toros.to_s
  end

  def comparar(codigoRandom,codigoIngresado)
    @toros=0
    cr = codigoRandom.to_s
    ci = codigoIngresado.to_s
    for i in (0..3)
      if cr[i] == ci[i]
       @toros=@toros+1
      end
    end
  end

end
  