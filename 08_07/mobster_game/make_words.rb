require "faker"
require "yaml"

F = Faker::Lorem

words = 1000.times.map {F.word}

# three_letter = words.map { |word| word.length == 3}
# four_letter = words.map { |word| word.length == 4}
# five_letter = words.map { |word| word.length == 5}
#  puts three_letter.length
#  puts four_letter.length
#  puts five_letter.length

 File.open("words.yml", "w") do |f|
  f.write words.to_yaml
end
