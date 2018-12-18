def solver(inoput)
    words = []
    File.open("words.txt").each do |line|
        words.push(line)
    end
    i = 0
    while i < words.length
        words[i] = words[i].to_s.chomp.downcase
        i += 1
    end
    # print words
    a = 0
    b = 0
    c = 0 
    d = 0 
    e = 0 
    f = 0 
    g = 0 
    h = 0 
    i = 0
    j = 0 
    k = 0
    l = 0 
    m = 0
    n = 0
    o = 0
    pp = 0 
    q = 0
    r = 0 
    s = 0 
    t = 0
    u = 0 
    v = 0 
    w = 0 
    x = 0 
    y = 0 
    z = 0 
    iteration = 0
    # puts words.length.to_s + " This is the amout of timmes the iteration should go on for"
    while iteration < words.length
        local_iteration = 0
        # puts local_iteration.to_s + " The local iteration just resetted. The following itteration should repeat: " + words[iteration].to_s.length.to_s + " times --> " + words[iteration]
        
        # puts iteration.to_s + " This is the total amout of iterations passed"
        while local_iteration <= words[iteration].to_s.length
            # puts "        Repeat nr." + local_iteration.to_s
            if words[iteration][local_iteration] == "a"
                a += 1
                local_iteration += 1
            elsif words[iteration][local_iteration] == "b"
                b += 1
                local_iteration += 1
            elsif words[iteration][local_iteration] == "c"
                c += 1
                local_iteration += 1
            elsif words[iteration][local_iteration] == "d"
                d += 1
                local_iteration += 1
            elsif words[iteration][local_iteration] == "e"
                e += 1
                local_iteration += 1
            elsif words[iteration][local_iteration] == "f"
                f += 1
                local_iteration += 1
            elsif words[iteration][local_iteration] == "g"
                g += 1
                local_iteration += 1
            elsif words[iteration][local_iteration] == "h"
                h += 1
                local_iteration += 1
            elsif words[iteration][local_iteration] == "i"
                i += 1
                local_iteration += 1
            elsif words[iteration][local_iteration] == "j"
                j += 1
                local_iteration += 1
            elsif words[iteration][local_iteration] == "k"
                k += 1
                local_iteration += 1
            elsif words[iteration][local_iteration] == "l"
                l += 1
                local_iteration += 1
            elsif words[iteration][local_iteration] == "m"
                m += 1
                local_iteration += 1
            elsif words[iteration][local_iteration] == "n"
                n += 1
                local_iteration += 1
            elsif words[iteration][local_iteration] == "o"
                o += 1
                local_iteration += 1
            elsif words[iteration][local_iteration] == "p"
                pp += 1
                local_iteration += 1
            elsif words[iteration][local_iteration] == "q"
                q += 1
                local_iteration += 1
            elsif words[iteration][local_iteration] == "r"
                r += 1
                local_iteration += 1
            elsif words[iteration][local_iteration] == "s"
                s += 1
                local_iteration += 1
            elsif words[iteration][local_iteration] == "t"
                t += 1
                local_iteration += 1
            elsif words[iteration][local_iteration] == "u"
                u += 1
                local_iteration += 1
            elsif words[iteration][local_iteration] == "v"
                v += 1
                local_iteration += 1
            elsif words[iteration][local_iteration] == "w"
                w += 1
                local_iteration += 1
            elsif words[iteration][local_iteration] == "x"
                x += 1
                local_iteration += 1
            elsif words[iteration][local_iteration] == "y"
                y += 1
                local_iteration += 1
            elsif words[iteration][local_iteration] == "z"
                z += 1
                local_iteration += 1
            else
                local_iteration += 1
            end
        end

        iteration += 1 
    end


    highest = 0
    most_common_letter = ""
    local_checker_iteration = 1
    checker_values = ["a", a, "b", b, "c", c, "d", d, "e", e, "f", f, "g", g, "h", h, "i", i, "j", j,"k", k, "l", l, "m", m, "n", n, "o", o, "p", pp, "q", q, "r", r, "s", s, "t", t, "u", u, "v", v, "w", w, "x", x, "y", y, "z", z]
    
    while local_checker_iteration <= (checker_values.length/2)
        value1 = checker_values[local_checker_iteration]
        
        value2 = checker_values[local_checker_iteration+2]
        
        if value1 < value2
            if value2 > highest
                highest = value2
                most_common_letter = checker_values[local_checker_iteration+1]
            end
        elsif value2 < value1
            if value1 > highest
                highest = value1
                most_common_letter = checker_values[local_checker_iteration-1]
            end
        end
        local_checker_iteration += 2
    end
    
    
    
    return most_common_letter
end



test = ["102.5", "Healty"]
solution = solver(test)
# print solution