require 'bigdecimal'
class Item

  attr_reader :id,
              :name,
              :unit_price,
              :merchant_id,
              :created_at,
              :updated_at

  attr_accessor :invoice_items,
                :merchant

  def initialize(data)
    @id          = data[:id]
    @name        = data[:name]
    @unit_price  = price(data[:unit_price])
    @merchant_id = data[:merchant_id]
    @created_at  = date_parse(data[:created_at])
    @updated_at  = date_parse(data[:updated_at])
  end


  def date_parse(date)
    if date != nil
      Date.parse(date)
    else
      date
    end
  end

  def price(number)
    price = number.to_f / 100
    BigDecimal.new(price.to_s)
  end
end