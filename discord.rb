class Object
    def is_number?
        self.to_f.to_s == self.to_s || self.to_i.to_s == self.to_s
    end
end

token = File.read("token.save")

#####################

require "discordrb"
require "date"
quotes = []
bot = Discordrb::Commands::CommandBot.new token: token, client_id: 285078420239679488, prefix: "2"
## Output something random from the list random
bot.message(contains: "") do |event|
    if event.channel.id == 456796177573347329 || event.channel.id == 456810455910973470 || event.channel.id == 456799494390939661 || event.channel.id == 456789157063163906
        puts event.message.display
        if event.message.content == "!random" || event.message.content == "output random" || event.message.content == "something random" || event.message.content == "random"
            random_string = ["Hey it´s me!", "What´s this?", "Is this random?", "This can´t be random, or is it?", "Do i need more random things to chose from?", "I don´t know what to write in here, it´s all so random", "One day I will break and I will no longer have a perpouse.", "Have I ever had a perpouse?", "Please submit more random content for me to use here", "I really don´t know what to write any more.", "Please help", "Im leaving..... BYE!", "Why am I still here?"].sample
            event.send_message random_string
        end
    end
    ## Quote command
    if event.channel.id == 456796177573347329 || event.channel.id == 456810455910973470 || event.channel.id == 456799494390939661 || event.channel.id == 456789157063163906
        string = event.message.content.split('')
        work = string[-1].is_number?
        number = 0
        number_2 = 0
        number_3 = 0
        if work == true
            number = string[-1]
            number = number.to_i
            if string[-2].is_number?
                number_2 = string[-2]
                number_2 = number_2.to_i
            end
            if string[-3].is_number?
                number_3 = string[-3]
                number_3 = number_3.to_i
            end
        end

        if event.message.content.include? "!quote add"
            ## Remove !quote add and adds current time to last part of string
            message_to_add = event.message.content
            message_to_add = message_to_add.gsub("!quote add", "")
            current_time = Time.now.strftime("%d/%m/%Y %H:%M")
                #Updated for the shifting: Is this required?
                # d = DateTime.now
                # d.strftime("%d/%m/%Y %H:%M")
                # #=> "11/06/2017 18:11"
                # d.next_month.strftime("%d/%m/%Y %H:%M")
                # #=> "11/07/2017 18:11"
            message_to_add = message_to_add + " - " + current_time
            quotes=[]
            ## Creates the quotes array
            File.open("quotes.txt").each do |line|
                quotes.push(line)
            end
            ## Adds new quote to array
            number = quotes.length + 1
            number = number.to_s
            message_to_add = number + "." + message_to_add
            quotes.push(message_to_add)
            ## writes the array to file after removing the conentent of file
            File.open("quotes.txt", "w+") do |f|
                f.puts quotes
            end
            event.send_message "New quote added " + message_to_add

        elsif event.message.content.include? "!quote random"
            File.open("quotes.txt").each do |line|
                quotes.push(line)
            end
            event.send_message quotes[rand(quotes.length)-rand(quotes.length + 1)]

        elsif number+number_2*10+number_3*100 > 0
            puts "Down here we went"
            File.open("quotes.txt").each do |line|
                quotes.push(line)
            end
            puts number+number_2*10+number_3*100-1
            event.send_message quotes[number+number_2*10+number_3*100-1]
        end
    end
end

bot.run
