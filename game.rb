require './instructions'
require './text_printer'
require './codebreaker'
require './codemaker'
class Game
    include Instructions
    include TextPrinter

    def start
        print_instructions
        puts message(:choose_role)
        role = mode_selection
        if role == '1'
            codebreaker
        elsif role == '2'
            codemaker
        end
    end

    def codebreaker
        breaker = Codebreaker.new
        breaker.player_turn
    end

    def codemaker
        maker = Codemaker.new
        maker.request_code
    end

    def mode_selection
        input = gets.chomp
        return input if input == "1" or input == "2"
    
        puts message(:role_warning)
        mode_selection
      end
end