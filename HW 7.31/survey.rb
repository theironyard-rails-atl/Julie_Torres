Questions = ["How many toes do you have on each foot?", "How many people named Oprah do you know?",
  "How many baby-daddies do you have?", "How many times have you been on Facebook today?", "What is your favorite number?"
]

class Survey
  attr_reader :question_count, :questions
  def initialize(questions, question_count)
    @question_count = 5
    @questions = questions

  end

  def finished?
    @question_count == 0
  end

  def ask_question
      @question_count -= 1
      puts @questions[0]
      @questions.delete_at(0)
      @answer = gets.chomp.to_i
  end
end

survey = Survey.new(Questions, 5)
puts survey.question_count

until survey.finished?
  survey.ask_question
end

puts "Survey finished"
