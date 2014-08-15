Questions = ["How many toes do you have on each foot?", "How many people named Oprah do you know?",
  "How many baby-daddies do you have?", "How many times have you been on Facebook today?", "What is your favorite number?"
]

class Survey
  attr_reader :question_count, :questions
  def initialize(questions, question_count)
    @question_count = question_count
    @questions = questions
    @answers= [ ]

  end

  def ask_question
      @question_count -= 1
      puts @questions[0]
      @questions.delete_at(0)
      @answers << gets.chomp.to_i
  end

  def finished?
    @question_count == 0
  end

  def highest
    @answers.max
  end

  def lowest
    @answers.min
  end

  def mean
    @answers.reduce(:+) / @answers.length.to_f
  end
end
