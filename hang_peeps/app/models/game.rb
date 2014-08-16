# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  answer     :string(255)
#  max_misses :integer
#  misses     :integer
#  guessed    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Game < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :answer, :max_misses, :misses
  validate :guessed_string_is_not_nil

  def board
    result = ""
    self.answer.split("").each do |char|
      if self.guessed && self.guessed.include?(char)
        result += char
      else
        result += "_"
      end
    end
    result
  end

  def guess(letter)
    letter.downcase!
    found = self.answer.include?(letter)

    unless self.guessed.include?(letter)
      self.guessed += letter
      self.misses += 1 unless found
    end
    self.save!

    found
  end

  def won?
    !board.include?("_")
  end

  def lost?
    self.misses >= self.max_misses
  end

  def finished?
    won? || lost?
  end

  def guessed_string_is_not_nil
    if guessed.nil?
      self.errors.add :guessed, "Guesses cannot be nil"
    end
  end
end
