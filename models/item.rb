require_relative "../lib/taxes_calculator"
require_relative "../models/categories/book"
require_relative "../models/categories/food"
require_relative "../models/categories/medicine"
require_relative "../models/categories/imported"

class Item
  attr_accessor :name, :quantity, :unit_price

  def initialize name:, quantity:, unit_price:
    @name = name
    @quantity = quantity
    @unit_price = unit_price
  end

  def price
    ((quantity * unit_price) + taxes).round(2)
  end

  def taxes
    @taxes ||= TaxesCalculator.new(
      price: unit_price,
      is_imported: imported?,
      is_tax_exempted: tax_exempted?
    ).execute * quantity
  end

  def tax_exempted?
    book? || medicine? || food?
  end

  def book?
    Categories::Book.contains?(name)
  end

  def medicine?
    Categories::Medicine.contains?(name)
  end

  def food?
    Categories::Food.contains?(name)
  end

  def imported?
    Categories::Imported.contains?(name)
  end
end
