class Business
  attr_reader :level
  def initialize(name)
    @level = rand(5)
    @territory_of = name
  end
end
