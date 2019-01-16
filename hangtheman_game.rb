class String
    def number?
        Integer(self).is_a? Integer # Is it an integer return true
    rescue ArgumentError, TypeError # The above row returns an error means it´s not an integer and return false
        false
    end
end

def play(word_letterincluded, blacklist)
    if word_letterincluded[-1].number?
        word_positions = word_letterincluded.gsub(/\s+/m, ' ').strip.split(' ')
        i = 0
        while i< word_positions.length
            word_positions[i] = word_positions[i].to_i
            i += 1
        end
        i = 0
        while i < word_positions.length
            raw = remove(solver(blacklist), word_positions[i]-1)
            current_words_string = ''
            iterations = 0
            while iterations < raw.length
                current_words_string += raw[iterations]                      
                iterations += 1
            end
            # Writes raw to file
            File.write('words_temp.txt', current_words_string)   
            i += 1
        end
        sleep 1
        
    elsif word_letterincluded.downcase == 'n' || word_letterincluded.downcase == 'no'
        # Remove all words containing the selected letter
        current_words_string = ''
        iterations = 0
        current_words = remove(solver('random input that dont matter').downcase, nil)
        while iterations < current_words.length
            current_words_string += current_words[iterations]
            iterations += 1
        end
        File.write('words_temp.txt', current_words_string)     
    end
end

def play_length(word_length)
    if word_length.is_a? Integer
        # removes all words that have a length that is different from the one inputed
        raw = File.readlines('words_temp.txt')
        iteration = 0
        while iteration < raw.length
            while raw[iteration] != nil && raw[iteration].length != word_length+1
                raw.delete_at(iteration)            
            end
            iteration += 1
        end
        # Writes raw to text file
        current_words_string = ''
        iterations = 0
        while iterations < raw.length
            current_words_string += raw[iterations]                      
            iterations += 1
        end
        File.write('words_temp.txt', current_words_string)   
    else 
        puts 'An error occured'
    end
end

def remove(letter, position)
    iteration = 0
    raw = File.readlines('words_temp.txt')
    if position == nil
        while raw[iteration] != nil
            if raw[iteration].chomp.include?(letter)
                raw.delete_at(iteration)
                iteration = -300
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
                        iteration = 0
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



def hang_the_man(input)
    i = 0
    iterations = 0   
    blacklist = [] 
    
    puts '\e[H\e[2J'
    current_words = File.readlines('words.txt')
    current_words_string = ''
    while iterations < current_words.length
        current_words_string += current_words[iterations].chomp 
        if iterations < current_words.length
            current_words_string += '\n'
        end
        iterations += 1
    end
    File.write('words_temp.txt', current_words_string.downcase)
    puts '\e[H\e[2J'
    print 'How long is the word you would like me to guess?\n \n \n \n \n'
    event.send_message 'How long is the word you would like me to guess?'
    word_length = gets.chomp
    play_length(word_length.to_i)
    puts ' Processing..'
    sleep 1
    puts '\e[H\e[2J'
    puts ' Currently I only support the 100 most common words in the English language*'
    puts ' I´m calculating the best letter to start with..\n \n \n \n \n'
    puts '* Based off EF.com'
    sleep 1
    
    words_left = File.readlines('words_temp.txt').length
    
    while words_left != 1
        puts '\e[H\e[2J'
        sleep 2
        puts '\e[H\e[2J'
        puts 'Do the word include the letter ' + solver(blacklist).upcase.yellow + '?'
        blacklist << solver(blacklist)
        puts '(N)o or at what position in the word? If multiple positions separate them with a space\n \n \n \n'
        word_letterincluded = gets.chomp
        puts 'I´m calculating the next letter.. '.green
        play(word_letterincluded, blacklist[0...-1])
        words_left = File.readlines('words_temp.txt').length
        sleep 2
    end
    print 'I guess the word you choose was ' + File.readlines('words_temp.txt')[0].to_s.chomp.upcase.green
end


# hang_the_man('random input')


