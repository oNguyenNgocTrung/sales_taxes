require_relative "../../../models/categories/base"

RSpec.describe Categories::Base do
  describe "class methods" do
    context "self.contains?" do
      let(:item_name) { "Test" }

      it "return false" do
        expect(described_class.contains?(item_name)).to eq false
      end
    end
  end
end
