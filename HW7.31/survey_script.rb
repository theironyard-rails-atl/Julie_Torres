require './survey.rb'

survey = Survey.new(Questions, 3)

until survey.finished?
   survey.ask_question
end

puts "Survey finished."
puts "Your highest rating was #{survey.highest}"
puts "Your lowest rating was #{survey.lowest}"
puts "Your average rating was #{survey.mean}"
exit
