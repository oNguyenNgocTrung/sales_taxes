require_relative "../../lib/sales_taxes"
require "csv"

RSpec.describe SalesTaxes do
  let(:sales_taxes) do
    described_class.new(
      csv_input: csv_input,
      output: "csv"
    )
  end

  subject { sales_taxes.execute }

  after do
    File.delete(subject.path) if File.exists?(subject.path)
  end

  describe "#input 1" do
    let(:csv_input) { "data/input/input_1.csv" }
    let(:output_string) { "1,book,12.49,1,music CD,16.49,1,chocolate bar,0.85,,Sales Taxes: 1.50,Total: 29.83" }
    
    it 'Receives CSV input and returns values with tax details' do
      expect(CSV.read(subject.path).join(",")).to eq output_string
    end
  end

  describe "#input 2" do
    let(:csv_input) { "data/input/input_2.csv" }
    let(:output_string) { "1,imported box of chocolates,10.5,1,imported bottle of perfume,54.65,,Sales Taxes: 7.65,Total: 65.15" }
    
    it 'Receives CSV input and returns values with tax details' do
      expect(CSV.read(subject.path).join(",")).to eq output_string
    end
  end

  describe "#input 3" do
    let(:csv_input) { "data/input/input_3.csv" }
    let(:output_string) { "1,imported bottle of perfume,32.19,1,bottle of perfume,20.89,1,packet of headache pills,9.75,1,box of imported chocolates,11.85,,Sales Taxes: 6.70,Total: 74.68" }
    
    it 'Receives CSV input and returns values with tax details' do
      expect(CSV.read(subject.path).join(",")).to eq output_string
    end
  end
end
