# require 'pry-byebug'

def caesar_cypher(str, key)

  alphabet = ("a".."z").to_a

  encoded_str_arr = str.chars.map do |char|

    # Checks if it's special char
    if !alphabet.include?(char.downcase)
      next(char)
    end

    char_index = alphabet.index(char.downcase)
    
    next_index = char_index + key
    
    # Allows negative keys
    next_abs = next_index.abs

    # binding.pry
    
    # Checks if next character is in range
    while next_abs > 25
      next_abs -= 26
    end

    # Restores sign of number
    if next_index < 0
      next_index = next_abs * -1
    elsif
      next_index = next_abs
    end

    # Restores casing of character if it was swapped
    if char != char.downcase 
      alphabet[next_index].swapcase
    else
      alphabet[next_index]
    end

  end

  encoded_str_arr.join

end

p caesar_cypher("a", 25)