require_relative "../../../models/categories/book"

RSpec.describe Categories::Book do
  describe "class methods" do
    context "self.contains?" do
      context "when item name contains `book`" do
        let(:item_name) { "book" }

        it "return true" do
          expect(described_class.contains?(item_name)).to eq true
        end
      end

      context "when item name doesn't contains `book`" do
        let(:item_name) { "test" }

        it "return false" do
          expect(described_class.contains?(item_name)).to eq false
        end
      end
    end
  end
end
