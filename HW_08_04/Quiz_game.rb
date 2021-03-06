require 'yaml'

class Quiz
attr_accessor :questions, :current_question, :answer

  def initialize(questions= (YAML.load_file("quiz_questions.yml")))
    @questions = questions.shuffle
  end


  def ask_question
    @current_question = @questions.pop
    puts "#{@current_question[:question]}"
    puts "#{@current_question[:choices]}"
    puts "Input the number corresponding to your answer"
    @answer = gets.chomp.to_i
  end


  def finished?
    @questions.empty? # == 0
  end


end

class Player
attr_reader :score, :answered_right, :answered_wrong

  def initialize(quiz)
    @score = 0
    @answered_right = [ ]
    @answered_wrong = [ ]
    @quiz = quiz
  end

  def guess
    puts "You answered: #{@answer}"
    #TODO: find out why this is erroring out
    if @quiz.current_question[:answer] == @quiz.current_question[:answer]
      @score += 1
      @answered_right.push @quiz.current_question[:question]
    else
      @answered_wrong.push @quiz.current_question[:question]
    end
  end
end



quiz = Quiz.new
player = Player.new(quiz)



until quiz.finished?
  quiz.ask_question
  player.guess
end

puts "Game Over. Your score is #{player.score}"
puts "Your correct answers are #{player.answered_right}"
puts "The questions you answered incorrectly are #{player.answered_wrong}"
