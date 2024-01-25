def caesar_cipher(word, number)
  alphabet = ('a'..'z').each.with_index(1).to_h.freeze
  word_to_number = word_to_number(word, alphabet)
  processed_word = process_word(word_to_number, number)
  puts convert_to_word(processed_word, alphabet)
end

def word_to_number(word, alphabet)
  word_to_number = []
  word_ = word.downcase.split('')
  word_.each do |letter|
    word_to_number << alphabet.fetch(letter, letter)
  end
  word_to_number
end

def process_word(arr, number)
  new_word = []
  arr.each do |n|
    new_word << (n.is_a?(Integer) ? n.to_i + number : n)
  end
  new_word
end

def convert_to_word(arr, alphabet)
  converted_word = []
  arr.each do |n|
    converted_word << (n.is_a?(Integer) ? alphabet.key(n) : n)
  end
  converted_word.join('')
end

caesar_cipher('What a string!', 3)
caesar_cipher('zkdw d vwulqj!', -3)
