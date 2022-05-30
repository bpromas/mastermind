require './instructions'
require './text_printer'
class Game
    include Instructions
    include TextPrinter
    def start
        print_instructions
        puts message(:choose_role)
    end
end