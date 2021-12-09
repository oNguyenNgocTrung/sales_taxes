require_relative "../../../models/categories/imported"

RSpec.describe Categories::Imported do
  describe "class methods" do
    context "self.contains?" do
      context "when item name contains `imported`" do
        let(:item_name) { "imported" }

        it "return true" do
          expect(described_class.contains?(item_name)).to eq true
        end
      end

      context "when item name doesn't contains `imported`" do
        let(:item_name) { "test" }

        it "return false" do
          expect(described_class.contains?(item_name)).to eq false
        end
      end
    end
  end
end
