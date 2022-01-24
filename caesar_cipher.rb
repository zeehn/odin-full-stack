def caesar_cipher(string, shift)
    result = ""
    string.each_char do |char|
        char_value = char.ord
        if char.between?('a', 'z')
            result += (((char_value - 97 + shift) % 26) + 97).chr 
        elsif char.between?('A', 'Z')
            result += (((char_value - 65 + shift) % 26) + 65).chr 
        else
            result += char 
        end
    end
    puts result
end

caesar_cipher("What a string!", 5)