require './hangtheman_solver.rb'

def hang_the_man(position)
    i = 0
    
    
    puts "\e[H\e[2J"
    puts " 
    How long is the word you would like me to guess?\n \n \n \n \n"
    word_length = gets.chomp
    puts " Processing.."
    sleep 2
    puts "\e[H\e[2J"
    puts " Currently I only support the 100 most common words in the English language*"
    puts " I´m calculating the best letter to start with..\n \n \n \n \n"
    puts "* Based off EF.com"
    # Plocka bort alla ord som inte är word_length långa
    sleep 2
    puts "\e[H\e[2J"
    puts "Do the word include the letter " + solver("random input, that dont matter") + "?"
    puts "(N)o or at what position in the word? If multiple positions separate them with a space"
    word_letterincluded = gets.chomp
    if word_letterincluded == "n" || word_letterincluded == "N"
        # Remove all words containing solver - letter
    else         
        word_letterincluded = word_letterincluded.split(" ") #This is now an array containing all the positions where the letter was found. 
        # Filter out all the words containing the letters at those positions-1 to compensate for index counting.
        print word_letterincluded
        
    end
    sleep 4
    words_left = 10 # Just for now. This value will be dynamic based on the amount of words left in the list.
    while i < words_left
        puts "\e[H\e[2J"
        puts "I´m calculating the next letter.. "
        sleep 2
        puts "\e[H\e[2J"
        puts "Do the word include the letter " + solver("random input, that dont matter") + "?"
        puts "(N)o or at what position in the word? If multiple positions separate them with a space"
        word_letterincluded = gets.chomp

        if word_letterincluded == "n" || word_letterincluded == "N"
            # Remove all words containing solver - letter
        else         
            word_letterincluded = word_letterincluded.split(" ") #This is now an array containing all the positions where the letter was found. 
            # Filter out all the words containing the letters at those positions-1 to compensate for index counting.
            print word_letterincluded
            
        end

    end
end


hang_the_man("random input")


# This one is useful
# puts "\e[H\e[2J" #