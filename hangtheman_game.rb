def play(word_letterincluded)
    if word_letterincluded.is_a? Integer
        # removes all words that have a length that is different from the one inputed
        word_length = word_letterincluded
        raw = File.readlines("words_temp.txt")
        iteration = 0
        while iteration < raw.length
            p raw
            while raw[iteration] != nil && raw[iteration].length != word_length+1
                raw.delete_at(iteration)            
                
            end
            iteration += 1
        end
        current_words_string = ""
        iterations = 0
        while iterations < raw.length
            current_words_string += raw[iterations]                      
            iterations += 1
        end
        File.write("words_temp.txt", current_words_string)   
        
    elsif word_letterincluded.downcase == "n" || word_letterincluded.downcase == "no"
        # Remove all words containing the selected letter
        current_words_string = ""
        iterations = 0
        current_words = remove(solver("random input that dont matter").downcase)
        while iterations < current_words.length
            current_words_string += current_words[iterations]
            iterations += 1
        end
        File.write("words_temp.txt", current_words_string)
        
    else         
        word_letterincluded = word_letterincluded.split(" ") #This is now an array containing all the positions where the letter was found. 
        # Filter out all the words containing the letters at those positions-1 to compensate for index counting.
        print word_letterincluded
        
    end
end

def remove(letter)
    iteration = 0
    raw = File.readlines("words_temp.txt")
    while iteration <= raw.length+1
        while raw[iteration] != nil && raw[iteration].chomp.include?(letter) 
            raw.delete_at(iteration)
        end
        iteration += 1
    end
    return raw
    
end


require './hangtheman_solver.rb'
require 'colorize'

def hang_the_man(position)
    i = 0
    iterations = 0    
    
    puts "\e[H\e[2J"
    current_words = File.readlines("words.txt")
    current_words_string = ""
    while iterations < current_words.length
        current_words_string += current_words[iterations].chomp 
        # current_words[iterations] = current_words[iterations].chomp
        if iterations < current_words.length
            current_words_string += "\n"
        end
        iterations += 1
    end
    File.write("words_temp.txt", current_words_string.downcase)
    puts "\e[H\e[2J"
    print "How long is the word you would like me to guess?\n \n \n \n \n"
    word_length = gets.chomp
    play(word_length.to_i)
    puts " Processing.."
    sleep 1
    puts "\e[H\e[2J"
    puts " Currently I only support the 100 most common words in the English language*"
    puts " I´m calculating the best letter to start with..\n \n \n \n \n"
    puts "* Based off EF.com"
    # Plocka bort alla ord som inte är word_length långa
    sleep 1
    puts "\e[H\e[2J"
    puts "Do the word include the letter " + solver("random input, that dont matter").upcase.yellow + "?"
    puts "(N)o or at what position in the word? If multiple positions separate them with a space"
    word_letterincluded = gets.chomp
    puts "I´m calculating the next letter.. ".green
    play(word_letterincluded)
    sleep 1
    words_left = File.readlines("words_temp.txt").length
    print words_left
    # Just for now. This value will be dynamic based on the amount of words left in the list.
    while i < words_left
        puts "\e[H\e[2J"
        sleep 2
        puts "\e[H\e[2J"
        puts "Do the word include the letter " + solver("random input, that dont matter").upcase.yellow + "?"
        puts "(N)o or at what position in the word? If multiple positions separate them with a space"
        word_letterincluded = gets.chomp
        puts "I´m calculating the next letter.. ".green
        play(word_letterincluded)
        i += 1
    end
    print File.readlines("words_temp.txt")
end


hang_the_man("random input")


# This one is useful
# puts "\e[H\e[2J" #