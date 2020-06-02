class Game

  @try = 0

  def getCode(num)
    @try = (@try.to_i + 1)
    # toros(num)...
    return num.to_s
  end

  def getTry()
    return @try.to_s
  end
end
