require_relative "../../../models/categories/medicine"

RSpec.describe Categories::Medicine do
  describe "class methods" do
    context "self.contains?" do
      context "when item name contains `pills`" do
        let(:item_name) { "pills" }

        it "return true" do
          expect(described_class.contains?(item_name)).to eq true
        end
      end

      context "when item name doesn't contains `pills`" do
        let(:item_name) { "test" }

        it "return false" do
          expect(described_class.contains?(item_name)).to eq false
        end
      end
    end
  end
end
