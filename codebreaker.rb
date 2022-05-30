require './text_printer'
class Codebreaker
    include TextPrinter

    def initialize
        @code = Array.new(4) {rand(1..6).to_s}
        @turn = 1
    end

    def player_turn
        puts message(:guess_prompt, @turn)
        guess = gets.chomp.split('')
        if valid_guess?(guess) then
            puts colored_code(guess)
            clues = calculate_clues(guess)
            puts colored_clues(clues)
            if game_won?(clues) then
                puts message(:congratulations)
            elsif @turn == 12
                puts message(:too_many_turns)
            else
                @turn += 1
                player_turn
            end
        else
            puts message(:invalid_guess)
            player_turn
        end
    end

    private

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

    def game_won?(clues)
        clues.size == 4 && clues.all?{|clue| clue == "*"}
    end

    def valid_guess?(guess)
        if guess.size != 4 then
            return false
        end
        if guess.any?{|digit| digit.to_i < 1 || digit.to_i > 6} then
            return false
        end

        return true
    end
end