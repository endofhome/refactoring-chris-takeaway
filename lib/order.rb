require "./lib/takeaway.rb"
require "./lib/confirmation.rb"

class Order
  attr_reader :items

  def initialize
    @items = []
    @total = total
  end

  def add(item, quantity)
    # fail "Item not on menu" unless menu.include?(item)
    "#{quantity}x #{item[:name]} added to the order."
    @items << [item[:name], item[:price], quantity]
  end

  def check
    items.each { |x| "#{x[0]} = £#{x[1]}\n" * x[2] }
    "Total: £#{total}"
  end

  def print_total
    "£#{total}"
  end

  def submit
    confirm
  end

private

  def total
    items.map { |x| x[1] * x[2] }.reduce(:+)
  end

  def confirm
    confirmation = Confirmation.new
    confirmation.message
  end

end
