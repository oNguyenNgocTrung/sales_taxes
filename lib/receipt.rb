require "csv"

class Receipt
  def initialize items
    @items = items
  end

  def generate_csv
    CSV.open("./data/output/output_#{Time.now.to_i}.csv", "w") do |csv|
      @items.each do |item|
        csv << [item.quantity, item.name, item.price]
      end
      csv << []
      csv << ["Sales Taxes: #{format_total(total_taxes)}"]
      csv << ["Total: #{format_total(total_price)}"]
    end
  end

  def print
    puts @items.map { |item| [item.quantity, item.name, item.price].join(", ") }.join("\n")
    puts "\n"
    puts "Sales Taxes: #{format_total(total_taxes)}"
    puts "Total: #{format_total(total_price)}"
  end

  private

  def total_taxes
    @items.sum(&:taxes)
  end

  def total_price
    @items.sum(&:price)
  end

  def format_total(num)
    sprintf("%.2f", num)
  end
end
