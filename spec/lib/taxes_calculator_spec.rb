require_relative "../../lib/taxes_calculator"

RSpec.describe TaxesCalculator do
  let(:price) { 10 }
  let(:taxes_calculator) do 
    described_class.new(
      price: price,
      is_imported: is_imported,
      is_tax_exempted: is_tax_exempted
    )
  end

  subject { taxes_calculator.execute }

  describe "#execute" do
    context "when object is imported and not tax exempted" do
      let(:is_imported) { true }
      let(:is_tax_exempted) { false }

      it { is_expected.to eq 1.55 }
    end

    context "when object is imported and tax exempted" do
      let(:is_imported) { true }
      let(:is_tax_exempted) { true }

      it { is_expected.to eq 0.5 }
    end

    context "when object is not imported and tax exempted" do
      let(:is_imported) { false }
      let(:is_tax_exempted) { true }

      it { is_expected.to eq 0.0 }
    end

    context "when object is not imported and not tax exempted" do
      let(:is_imported) { false }
      let(:is_tax_exempted) { false }

      it { is_expected.to eq 1.0 }
    end
  end
end
