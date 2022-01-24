def substrings(words, dictionary)
    words_hash = Hash.new(0)
    
    dictionary.each do |item|
        words.split(" ").each do |word|
            words_hash[item] += 1 if word.downcase.include?(item)
        end
    end
    return words_hash
end




dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

substrings("Howdy partner, sit down! How's it going?", dictionary)