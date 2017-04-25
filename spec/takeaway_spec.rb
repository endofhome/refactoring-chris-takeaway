require "takeaway"

describe Takeaway do

  let(:takeaway) { described_class.new }

  describe "#dishes with prices" do

    it "checks that the takeaway menu exists" do
      expect(takeaway).to respond_to(:menu)
    end

    it "checks that the menu contains a tasty choice" do
      dish_names = takeaway.menu.map { |dish| dish[:name] }
      expect(dish_names).to include "Chicken Balti"
    end

    it "finds a value of a menu item" do
      sag_aloo = takeaway.menu.detect { |dish| dish[:name] == "Saag Aloo" }
      expect(sag_aloo[:price]).to eq 3
    end

  end

  describe "taking orders" do

    it "can create new orders" do
      expect(takeaway).to respond_to(:create_order)
    end

    it "orders are remembered" do
      takeaway.create_order
      expect(takeaway.orders[0]).to be_an_instance_of(Order)
    end

    it "an order is returned when creating one" do
      expect(takeaway.create_order).to be_an_instance_of(Order)
    end

    it "items can be added to the order" do
      order = takeaway.create_order
      dish = { :name => "Plain Naan", :price => 1.50 }
      takeaway.add_dish(order, dish, 3)

      first_item_in_order = order.items[0]
      expect(first_item_in_order[0]).to eq dish[:name]
      expect(first_item_in_order[1]).to eq dish[:price]
      expect(first_item_in_order[2]).to eq 3
    end

    it "fails item not on menu" do
      order = takeaway.create_order
      unknown_dish = { :name => "Pad Thai", :price => 1 }
      expect { takeaway.add_dish(order, unknown_dish, 13) }.to raise_error "Item not on menu"
    end

  end

end
