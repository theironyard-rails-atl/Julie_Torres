require './survey'
require 'minitest/autorun'

describe Survey do
  def setup
    @poll = Survey.new(:questions, :question_count)
  end



  it "isn't finished when it starts" do
    assert @poll.finished? == false
  end

####Getting an error "undefined method `delete_at'
#### From line 17 of survey.rb
  it "ends when all questions have been asked" do
    @poll.ask_question
    @poll.ask_question
    @poll.ask_question
    @poll.ask_question
    @poll.ask_question
    assert @poll.finished? == true
    assert
  end

  it "stores the answers to the questions" do


  end

  it "tracks the highest answer" do
  end

  it "tracks the lowest answer" do
  end

  it "tracks the average answer" do
  end


end
