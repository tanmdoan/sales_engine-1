require 'pry'
class Merchant

  attr_reader :id,
              :name,
              :created_at,
              :updated_at


  attr_accessor :invoices,
                :items

  def initialize(data)
    @id         = data[:id]
    @name       = data[:name]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    #@amount     = BigDecimal.new('0')
    @invoices   = data[:invoices]
  end

  def revenue(date = nil)
    amount = 0
    @invoices.each do |invoice|
      if date == nil || date == invoice.updated_at
        amount += invoice.revenue
      end
    end
    amount
  end

  


end