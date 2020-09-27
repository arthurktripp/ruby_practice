puts "", "", "", "This Caesar Cypher tool will convert your text to an encoded message."
puts "When encoding, choose a key between 1 and 25."
puts "The decode key will be it's negative." , "", "What would you like to encode/decode?"
message = gets.chomp.to_s.split('')
puts "What is the key?"
key = gets.chomp.to_i

def caesar_cipher(word, shift)
    lowercase = ('a'..'z').to_a
    uppercase = ('A'..'Z').to_a
    word.map do |letter|
        if lowercase.index(letter) != nil
            num = lowercase.index(letter) + shift
                if num > 25
                    num -= 26
                end
            lowercase[num]
        elsif uppercase.index(letter) != nil
            num = uppercase.index(letter) + shift
            if num > 25
                num -= 26
            end
            uppercase[num]
        else
            letter
        end
    end
end

message_converted = caesar_cipher(message, key).join
puts "", "", "Your encoded message is:"
puts "     " + message_converted
key *= -1
puts "and the key to get back is " + key.to_s
puts ""