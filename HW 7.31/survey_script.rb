require './survey.rb'

survey = Survey.new(Questions, 5)

until survey.finished?
   survey.ask_question
end

if survey.finished?
  puts "Survey finished."
  puts "Your highest rating was #{survey.highest?}"
  puts "Your lowest rating was #{survey.lowest?}"
  puts "Your average rating was #{survey.mean?}"
  puts "Press Enter to exit game."
  exit
else
  survey.ask_question
end
