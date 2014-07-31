require 'pry'

class Survey
  attr_reader :question_count #, :next_question
  def initialize
    @question_count = 5
    @questions = ["q1", "q2", "q3", "q4", "q5"]
    #@next_question = @questions[0]

  end

  def finished?
    @question_count == 0
  end

  def ask_question
      @question_count -= 1
      puts @questions.shift(0)
      #@next_question.shift
  end
end

# survey = Survey.new
# puts survey.question_count
#
# until survey.finished?
#   survey.asks_question
# end
#
# puts "Survey finished"
