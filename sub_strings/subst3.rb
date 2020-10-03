def substrings(phrase, dict)
    found_words = {}
    dict.each do |word|
        phrase_cut = phrase.downcase
        loc = phrase_cut.index(word)
        until loc == nil do
            unless loc == nil
                found_words[word] = ( found_words[word].to_i + 1 )
                phrase_cut = phrase_cut.slice((loc + word.length)..-1)
                loc = phrase_cut.index(word)
            end
        end
    end
    puts found_words
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("Howdy partner, sit down! How's it going?", dictionary)