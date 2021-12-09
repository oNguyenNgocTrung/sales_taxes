require_relative "../../models/item"
require_relative "../../lib/taxes_calculator"

RSpec.describe Item do
  let(:taxes_calculator) { instance_double(TaxesCalculator) }
  let(:quantity) { rand(1..10) }
  let(:unit_price) { rand(1..10) }
  let(:item) do
    Item.new(
      name: "Test",
      quantity: quantity,
      unit_price: unit_price
    )
  end
  let(:taxes) { rand(1..10) }

  before do
    allow(TaxesCalculator).to receive(:new).and_return(taxes_calculator)
    allow(taxes_calculator).to receive(:execute).and_return(taxes)
  end

  describe "#taxes" do
    it "calculate total tax" do
      expect(item.taxes).to eq taxes * quantity
    end
  end

  describe "#price" do
    it "calculate price with tax for item" do
      expect(item.price).to eq (quantity * (unit_price + taxes)).round(2)
    end
  end
end
