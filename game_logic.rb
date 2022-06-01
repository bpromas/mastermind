module GameLogic
    def valid_code?(code)
        if code.size != 4 then
            return false
        end
        if code.any?{|digit| digit.to_i < 1 || digit.to_i > 6} then
            return false
        end

        return true
    end

    def game_won?(clues)
        clues.size == 4 && clues.all?{|clue| clue == "*"}
    end

    def calculate_clues(guess)
        clues = []
        @code.each_with_index do |digit, index|
            if guess[index] == digit
                guess[index] = 'x'
                clues.push("*")
                next
            end
            if guess.any?{ |x| x == digit } then
                clues.push("?")
            end
        end
        clues
    end
end