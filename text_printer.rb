# This module is responsible for all possible text in the game
module TextPrinter
    def message(prompt, arg = nil)
        {
            choose_role: "Press 1 if you wish to be CODEBREAKER\nPress 2 if you wish to be CODEMAKER.",
            role_warning: "Invalid input! Press 1 to be CODEBREAKER or 2 to be CODEMAKER.",
            guess_prompt: "Turn #{arg}, please type a 4-digit guess of digits between 1 and 6.",
            invalid_guess: "Invalid guess!",
            congratulations: "Congratulations! You cracked the code!",
            too_many_turns: "Game over! You took over 12 turns!"
        }[prompt]
    end

    def colored_code(array)
        code = ""
        array.each do |digit|
            code += "#{digit_color(digit.to_s)}"
        end
        code
    end

    def colored_clues(array)
        clues = ""
        array.each do |clue|
            clues += "#{clue_color(clue)}"
        end
        clues
    end

    def digit_color(digit)
        {
            '1' => "\e[101m  1  \e[0m ",
            '2' => "\e[43m  2  \e[0m ",
            '3' => "\e[44m  3  \e[0m ",
            '4' => "\e[45m  4  \e[0m ",
            '5' => "\e[46m  5  \e[0m ",
            '6' => "\e[41m  6  \e[0m ",
        }[digit]
    end

    def clue_color(clue)
        {
          '*' => "\e[91m\u25CF\e[0m ",
          '?' => "\e[37m\u25CB\e[0m "
        }[clue]
    end
end