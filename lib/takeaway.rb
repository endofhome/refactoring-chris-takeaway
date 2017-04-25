require "./lib/order.rb"

class Takeaway

  attr_reader :menu, :orders

  def initialize
    @orders = []
  end

  def menu
    [
        { :name => "Chicken Balti", :price => 6.50 },
        { :name => "Vegetable Biryani", :price => 6 },
        { :name => "Lamb Saag", :price => 7 },
        { :name => "Chicken Naga", :price => 7.50 },
        { :name => "Tarka Dall", :price => 3 },
        { :name => "Saag Aloo", :price => 3 },
        { :name => "Plain Naan", :price => 1.50 },
        { :name => "Pilau Rice", :price => 2 }
    ]
  end

  def create_order
    order = Order.new
    orders <<  order
    order
  end

end
