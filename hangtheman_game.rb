class String
    def number?
        Integer(self).is_a? Integer # Is it an integer return true
    rescue ArgumentError, TypeError # The above row returns an error means it´s not an integer and return false
        false
    end
end

def play(word_letterincluded)
    if word_letterincluded.number?
        # word_positions = []
        word_positions = word_letterincluded.gsub(/\s+/m, ' ').strip.split(" ")
        i = 0
        while i< word_positions.length
            word_positions[i] = word_positions[i].to_i
            i += 1
        end
        iteration = 0
        # removes the words that do not have the letter in the inputed position
        print (word_positions[iteration])-1
        sleep 1
        while iteration < word_positions.length
            raw = remove(solver("random input that dont matter").downcase, (word_positions[iteration])-1)
            current_words_string = ""
            iterations = 0
            while iterations < raw.length
                current_words_string += raw[iterations]
                iterations += 1
            end
            File.write("words_temp.txt", current_words_string)
            iteration += 1
        end

        # Writes raw to file
    elsif word_letterincluded.downcase == "n" || word_letterincluded.downcase == "no"
        # Remove all words containing the selected letter
        current_words_string = ""
        iterations = 0
        current_words = remove(solver("random input that dont matter").downcase, nil)
        while iterations < current_words.length
            current_words_string += current_words[iterations]
            iterations += 1
        end
        File.write("words_temp.txt", current_words_string)
    end
end

def play_length(word_length)
    if word_length.is_a? Integer
        # removes all words that have a length that is different from the one inputed
        raw = File.readlines("words_temp.txt")
        iteration = 0
        while iteration < raw.length
            p raw
            while raw[iteration] != nil && raw[iteration].length != word_length+1
                raw.delete_at(iteration)
            end
            iteration += 1
        end
        # Writes raw to text file
        current_words_string = ""
        iterations = 0
        while iterations < raw.length
            current_words_string += raw[iterations]
            iterations += 1
        end
        File.write("words_temp.txt", current_words_string)
    else
        puts "An error occured"
    end
end
def remove(letter, position)
    iteration = 0
    raw = File.readlines("words_temp.txt")
    if position == nil
        while iteration <= raw.length+1
            while raw[iteration] != nil && raw[iteration].chomp.include?(letter)
                raw.delete_at(iteration)
            end
            iteration += 1
        end
        return raw
    else
        while raw[iteration] != nil && iteration < raw.length
            if raw[iteration].chomp.include?(letter) == false
                raw.delete_at(iteration)
                iteration = 0
            else
                i = 0
                while i < raw.length
                    if raw[i] != nil && raw[i][position] != letter
                        raw.delete_at(i)
                        i = 0
                    end
                    i += 1
                end
            end
            iteration += 1
        end
        return raw
    end
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
    play_length(word_length.to_i)
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
    puts "(N)o or at what position in the word? If multiple positions separate them with a space\n \n \n \n"
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
        puts "Do the word include the letter " + solver("random input, that dont matter").upcase.yellow + "?\n \n \n \n \n"
        # puts "(N)o or at what position in the word? If multiple positions separate them with a space\n \n \n \n"
        word_letterincluded = gets.chomp
        puts "I´m calculating the next letter.. ".green
        play(word_letterincluded)
        i += 1
    end
    print File.readlines("words_temp.txt")
end


hang_the_man("random input")


