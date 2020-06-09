class Player
    
    @name
    @score

    def initialize()
        @name=" "
        @score=0
    end

    def setName(playerName)
        if (playerName != nil)
            @name=playerName.to_s
        else
            @name = " "
        end
    end

    def getName()
        return @name
    end

    def getPlayer()
        return @name.to_s+@score.to_s
    end

    def setScore()
    end

    def getScore()
        return @score
    end

end

