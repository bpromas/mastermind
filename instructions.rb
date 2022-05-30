module Instructions
    def print_instructions
        puts "INSTRUCTIONS: 
This is a guessing game against the machine.
You can choose to either be the CODEBREAKER or the CODEMAKER.

The sole role of the CODEMAKER is to come up with a code for the CODEBREAKER to try to find.
If you choose to be the CODEMAKER, you will simply watch as the machine tries to discover what code you picked.

The code can only ever be 4 digits long, and the digits can only be between 1 and 6. For example, 
#{print_code([1,2,4,6])}

As the CODEBREAKER your objective is to guess the code that the machine has chosen.

For every guess, the machine will also give out up to four clues, one for each digit that is somehow 'correct'.
Those clues can either be #{clue_color('?')} or #{clue_color('*')}
#{clue_color('?')} means a digit is present in the solution, but not in the correct position
#{clue_color('*')} means a digit is present in the solution in the correct position

Continuing our example, if the solution is 

#{print_code([1,2,4,6])}

And the CODEBREAKER was to guess 

#{print_code([1,2,3,4])}

Then the clues given would be 

#{print_clues(['*', '*', '?'])} 

Meaning two digits are in their correct positions, and another digit is present but not in the correct position

Using these clues the CODEBREAKER must narrow down the possible code, and try to find it in under 12 attempts."
    end
end