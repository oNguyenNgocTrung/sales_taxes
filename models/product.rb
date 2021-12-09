class Product
  attr_accessor :name, :price, :type, :imported

  def initialize name, price, type, imported
    @name = name
    @price = price
    @type = type
    @imported = imported
  end
end
