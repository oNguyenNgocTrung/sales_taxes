require "csv"
require_relative "../models/item"
require_relative "../lib/receipt"

class SalesTaxes
  def initialize csv_input:, output: "csv"
    @csv_input = csv_input
    @output = output
    @items = []
  end

  def execute
    import_items!
    export_receipt!
  end

  private

  def import_items!
    CSV.foreach(@csv_input, :headers => true) do |data|
			@items << Item.new(
        name: data["Product"].to_s,
        quantity: data["Quantity"].to_i,
        unit_price: data["Price"].to_f
      )
		end
  end

  def export_receipt!
    receipt = Receipt.new(@items)
    if @output == "csv"
      receipt.generate_csv
    else
      receipt.print
    end
  end
end
