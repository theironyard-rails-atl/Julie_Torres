require 'yaml'

class Inventory
  include Enumerable
  attr_accessor :widgets

  def initialize(widgets= (YAML.load_file("widgets.yml")))
    @widgets = widgets
  end

  def each
    @widgets.each { |widget| yield widget }
  end

  def get_price
    price = @widgets[:price]
    price.to_s
  end

  def <=>(other)
    self.get_price <=> other.get_price
  end

  def get_max_price
    @widgets.max_by { |widget| widget[:price] }
  end

end


inventory = Inventory.new
puts inventory.get_max_price
