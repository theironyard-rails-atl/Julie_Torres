require 'yaml'
require 'pry'

class Business
  attr_reader :level, :name

  def initialize
    @names = (YAML.load_file("business_name.yml").to_a)
    @name = @names.sample
    @level = rand(10)
  end
end

puts Business.new.name
puts Business.new.name
