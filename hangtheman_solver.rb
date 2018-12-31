def solver(input)
    words = []
    File.open("words_temp.txt").each do |line|
        words.push(line)
    end
    i = 0
    while i < words.length
        words[i] = words[i].to_s.chomp.downcase
        i += 1
    end
    # print words
    if input.include? 'a'
      a = -1000000000000000000000000000000000000000000000000000000000000000000000000000000000
    else
      a = 0
    end
    if input.include? 'b'
      b = -1000000000000000000000000000000000000000000000000000000000000000000000000000000000
    else
      b = 0
    end
    if input.include? 'c'
      c = -1000000000000000000000000000000000000000000000000000000000000000000000000000000000
    else
      c = 0 
    end
    if input.include? 'd'
      d = -1000000000000000000000000000000000000000000000000000000000000000000000000000000000
    else
      d = 0 
    end
    if input.include? 'e'
      e = -1000000000000000000000000000000000000000000000000000000000000000000000000000000000
    else
      e = 0 
    end
    if input.include? 'f'
      f = -1000000000000000000000000000000000000000000000000000000000000000000000000000000000
    else
      f = 0 
    end
    if input.include? 'g'
      g = -1000000000000000000000000000000000000000000000000000000000000000000000000000000000
    else
      g = 0 
    end
    if input.include? 'h'
      h = -1000000000000000000000000000000000000000000000000000000000000000000000000000000000
    else
      h = 0 
    end
    if input.include? 'i'
      i = -1000000000000000000000000000000000000000000000000000000000000000000000000000000000
    else
      i = 0
    end
    if input.include? 'j'
      j = -1000000000000000000000000000000000000000000000000000000000000000000000000000000000
    else
      j = 0 
    end
    if input.include? 'k'
      k = -1000000000000000000000000000000000000000000000000000000000000000000000000000000000
    else
      k = 0
    end
    if input.include? 'l'
      l = -1000000000000000000000000000000000000000000000000000000000000000000000000000000000
    else
      l = 0 
    end
    if input.include? 'm'
      m = -1000000000000000000000000000000000000000000000000000000000000000000000000000000000
    else
      m = 0
    end
    if input.include? 'n'
      n = -1000000000000000000000000000000000000000000000000000000000000000000000000000000000
    else
      n = 0
    end
    if input.include? 'o'
      o = -1000000000000000000000000000000000000000000000000000000000000000000000000000000000
    else
      o = 0
    end
    if input.include? 'p'
      pp = -1000000000000000000000000000000000000000000000000000000000000000000000000000000000
    else
      pp = 0 
    end
    if input.include? 'q'
      q = -1000000000000000000000000000000000000000000000000000000000000000000000000000000000
    else
      q = 0
    end
    if input.include? 'r'
      r = -1000000000000000000000000000000000000000000000000000000000000000000000000000000000
    else
      r = 0 
    end
    if input.include? 's'
      s = -1000000000000000000000000000000000000000000000000000000000000000000000000000000000
    else
      s = 0 
    end
    if input.include? 't'
      t = -1000000000000000000000000000000000000000000000000000000000000000000000000000000000
    else
      t = 0
    end
    if input.include? 'u'
      u = -1000000000000000000000000000000000000000000000000000000000000000000000000000000000
    else
      u = 0 
    end
    if input.include? 'v'
      v = -1000000000000000000000000000000000000000000000000000000000000000000000000000000000
    else
      v = 0 
    end
    if input.include? 'w'
      w = -1000000000000000000000000000000000000000000000000000000000000000000000000000000000
    else
      w = 0 
    end
    if input.include? 'x'
      x = -1000000000000000000000000000000000000000000000000000000000000000000000000000000000
    else
      x = 0 
    end
    if input.include? 'y'
      y = -1000000000000000000000000000000000000000000000000000000000000000000000000000000000
    else
      y = 0 
    end
    if input.include? 'z'
      z = -1000000000000000000000000000000000000000000000000000000000000000000000000000000000
    else
      z = 0 
    end
    iteration = 0
    while iteration < words.length
        local_iteration = 0
        # puts local_iteration.to_s + " The local iteration just resetted. The following itteration should repeat: " + words[iteration].to_s.length.to_s + " times --> " + words[iteration]
        
        # puts iteration.to_s + " This is the total amout of iterations passed"
        while local_iteration < words[iteration].to_s.length
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
    
    # Determens what the most common letter is.
    
    while local_checker_iteration <= checker_values.length
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
        local_checker_iteration += 4
    end
    return most_common_letter
end

