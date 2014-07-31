Questions = [
  {
     question: "Why did the chicken cross the road?",
     choices: [
       "Why does anyone do anything?",
       "To get to the other side",
       "Something something something YOUR MOM",
       "Mu"
     ],
     answer: 1
  },
  {
    question: "Two is about 5, right?",
    choices: [
      "No",
      "I literally can't even ...",
      "Close enough!"
    ],
    answer: 2
  },
  {
    question: "Right?",
    choices: [ "Yeah!" ],
    answer: 0
  }
]

score, right, wrong = 0, [], []

Questions.shuffle.each do |question|
  # Print the text of the question
  puts question[:question]

  # Print each question, along with the number to select
  i = 0
  question[:choices].each do |choice|
    puts "#{i}: #{choice}"
    i += 1 # You can avoid this `i` by using `each_with_index`
  end
  print "Select an answer > "

  # Get the user's answer and convert it to an integer
  selected = gets.chomp.to_i
  expected = question[:answer]

  if selected == expected
    puts "Nailed it!"
    score += 1  # or score = score + 1
    right << question[:question]
  else
    puts "Nope, it was #{question[:choices][expected]}"
    wrong << question[:question]
  end

  puts # Blank line before the next question
end

puts "You got #{score} out of #{Questions.length}"

# Display the right / wrong answers
unless right.empty?
  puts "You got:"
  right.each { |question| puts "+ #{question}" }
end

unless wrong.empty?
  puts "You missed:"
  wrong.each { |question| puts "- #{question}" }
end
