require './text_printer'
require './game_logic'
class Codemaker
    include TextPrinter
    include GameLogic
    INITIAL_GUESS = "1122".split('')
    def initialize
        @turn = 1
        @code = []
        @candidate_guesses = []
        (1..6).each { |a| (1..6).each { |b| (1..6).each { |c| (1..6).each { |d| @candidate_guesses.push("#{a}#{b}#{c}#{d}".split('')) } } } }
    end

    def request_code
        puts message(:choose_code)
        @code = gets.chomp.split('')
        if valid_code?(@code)
            break_code
        else
            message(:invalid_code)
            request_code
        end
    end

    def break_code
        guess = @turn == 1 ? INITIAL_GUESS : @candidate_guesses[rand(0..(@candidate_guesses.size-1))]
        temp_guess = guess.map(&:clone)
        puts colored_code(guess)
        clues = calculate_clues(temp_guess)
        puts colored_clues(clues)
        if game_won?(clues) then
            puts message(:machine_wins, @turn)
        elsif @turn == 12
            puts message(:too_many_turns)
        else
            @turn += 1
            #reduce candidate guesses
            temp_guess = guess.map(&:clone)
            @candidate_guesses.select! do |candidate|
                valid_candidate?(candidate, temp_guess, clues)
            end
            sleep(1)
            break_code
        end
    end

    private

    def valid_candidate?(candidate, guess, clues)
        temp_guess = guess.map(&:clone)
        candidate_clues = []
        candidate.each_with_index do |digit, index|
            if temp_guess[index] == digit
                temp_guess[index] = 'x'
                candidate_clues.push("*")
                next
            end
            if temp_guess.any?{ |x| x == digit } then
                candidate_clues.push("?")
            end
        end

        candidate_clues == clues
    end
end