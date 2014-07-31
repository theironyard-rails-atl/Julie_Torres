require './survey'
require 'minitest/autorun'

describe Survey do
  it "isn't finished when it starts" do
    poll = Survey.new
    assert poll.finished? == false
  end

  it "ends when all questions have been asked" do
    poll = Survey.new
    poll.ask_question
    poll.ask_question
    poll.ask_question
    poll.ask_question
    poll.ask_question
    assert poll.finished? == true
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
