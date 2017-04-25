require "order"

describe Order do

  let(:order) { Order.new }

  describe "#creates a dish order" do

    it "sets up a new order" do
      expect(order).to be_an_instance_of(Order)
    end

    it "contains a list to store an item" do
      expect(order.items).to eq []
    end
  end

  describe "#adds a dish from the menu to the order" do

    it "can add a dish" do
      expect(order).to respond_to(:add).with(2).argument
    end

    it "fails item not on menu" do
      pending("validation should occur on the Takeaway, where the menu exists")
      expect { order.add("Pad Thai", 1) }.to raise_error "Item not on menu"
    end

    it "adds item to order" do
      item = { :name => "my lovely item", :price => 99 }
      order.add(item, 2)
      expect(order.items).to include ["my lovely item", 99, 2]
    end

    it "adds a quantity of item to order" do
      item = { :name => "my lovely item", :price => 99 }
      order.add(item, 3)
      expect(order.items[0]).to eq ["my lovely item", 99, 3]
    end
  end

  describe "#calculates a total of the order placed" do

    before(:example) do
      order.add({ :name => "my lovely item", :price => 99 }, 2)
      order.add({ :name => "yummy ting", :price => 50 }, 1)
    end

    it "returns total amount" do
      expect(order.print_total).to eq "£248"
    end
  end

  describe "prints the order contents" do

    before(:example) do
      order.add({ :name => "my lovely item", :price => 99 }, 1)
      order.add({ :name => "yummy ting", :price => 50 }, 1)
    end

    it "prints each item and cost on a new line" do
      expect(order.check).to eq "Total: £149"
    end
  end

  describe "submits the order and confimation" do

    it "sends a new text message" do
      expect(order).to respond_to(:submit)
    end
  end

end
