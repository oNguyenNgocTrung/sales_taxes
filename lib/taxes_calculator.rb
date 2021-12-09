class TaxesCalculator
  SALES_TAX_RATE = 0.10
  IMPORT_TAX_RATE = 0.05
  NEAREST_5_CENT = 1 / 0.05

  def initialize price:, is_imported:, is_tax_exempted:
    @price = price
    @is_imported = is_imported
    @is_tax_exempted = is_tax_exempted
  end

  def execute
    tax_rate = 0
    tax_rate += IMPORT_TAX_RATE if @is_imported
    tax_rate += SALES_TAX_RATE unless @is_tax_exempted

    rounded_tax(@price * tax_rate)
  end

  private

  def rounded_tax(tax)
    (tax * NEAREST_5_CENT).ceil / NEAREST_5_CENT
  end
end
