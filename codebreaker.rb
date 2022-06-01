require './text_printer'
require './game_logic'
class Codebreaker
    include TextPrinter
    include GameLogic

    def initialize
        @code = Array.new(4) {rand(1..6).to_s}
        @turn = 1
    end

    def player_turn
        puts message(:guess_prompt, @turn)
        guess = gets.chomp.split('')
        if valid_code?(guess) then
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
            puts message(:invalid_code)
            player_turn
        end
    end
end