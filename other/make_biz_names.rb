require "faker"
require "yaml"

F = Faker::Company

names = 100.times.map {F.name}

# three_letter = words.map { |word| word.length == 3}
# four_letter = words.map { |word| word.length == 4}
# five_letter = words.map { |word| word.length == 5}
#  puts three_letter.length
#  puts four_letter.length
#  puts five_letter.length

 File.open("business_name.yml", "w") do |f|
  f.write names.to_yaml
end
