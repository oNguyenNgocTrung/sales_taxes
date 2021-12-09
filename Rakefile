desc "load the input and return a sales tax receipt"
task "sales_taxes" do
  require_relative './lib/sales_taxes'
  
  ARGV.each { |a| task a.to_sym do ; end }  

  sales_taxes = SalesTaxes.new(csv_input: ARGV[1], output: ARGV[2])
  sales_taxes.execute  
end
