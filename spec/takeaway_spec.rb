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

  end

end
