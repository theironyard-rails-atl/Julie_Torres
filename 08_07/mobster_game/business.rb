class Business
  attr_reader :level, :name
  def initialize(name)
    @name = name
    @level = rand(5)
    @territory_of = name
  end
end
