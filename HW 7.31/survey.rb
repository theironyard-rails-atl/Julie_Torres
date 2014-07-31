class Survey
  def initialize
    @question_count = 5
  end

  def finished?
    @question_count == 0
  end
end
