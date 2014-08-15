require 'yaml'

class Inventory
  include Enumerable
  attr_accessor :widgets, :revenue

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

  def get_min_price
    @widgets.min_by { |widget| widget[:price] }
  end

  # def get_sold_by_dept
  #   widget = @widgets.map { |widget| widget}
  #   departments = []
  #   widget.each_with_index do |
  # 
  # end

  # def dept_total
  #   department = @widgets.map { |widget| department = widget[:department] department.value = widget[:sold]}
  #   department.map { |department| department[:sold]}
  # end

  def get_revenue
     sold = @widgets.map { |widget| widget[:sold] * widget[:price]}
     revenue = sold.reduce(:+)
     @revenue = revenue.to_f
  end

  def get_cost
    cost = @widgets.map { |widget| widget[:sold] * widget[:cost_to_make]}
    total_cost = cost.reduce(:+)
    @total_cost = total_cost.to_f
  end

  def get_profit
    @revenue - @total_cost
  end

  def get_best_selling
    sold = @widgets.sort_by { |widget| widget[:sold]}
    array = sold[0..10]
    array.map { |sold| sold[:name] }
  end
end


inventory = Inventory.new
# puts inventory.get_max_price
# puts "Revenue is #{inventory.get_revenue}."
# puts "Total cost is #{inventory.get_cost}."
# puts "Total profit is #{inventory.get_profit}."
puts inventory.get_sold_by_dept
# puts "Best selling items are: #{inventory.get_best_selling}"
