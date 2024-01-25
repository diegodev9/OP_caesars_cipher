dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"].freeze
def substrings(words, dictionary)
  result = Hash.new(0)
  dictionary.each_with_object(result) do |word, compare|
    compare[word] = words.scan(word).length if words.include?(word)
  end

  puts result
end

substrings("below", dictionary)
substrings("Howdy partner, sit down! How's it going?", dictionary)
