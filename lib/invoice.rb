require_relative 'repository'

class Invoice < Repository

  attr_reader :id,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at,
              :objects

  attr_accessor :transactions,
                :invoice_items,
                :items,
                :customer,
                :merchant

  def initialize(data)
    @id            = data[:id].to_i
    @customer_id   = data[:customer_id].to_i
    @merchant_id   = data[:merchant_id].to_i
    @status        = data[:status]
    @created_at    = date_parse(data[:created_at])
    @updated_at    = date_parse(data[:updated_at])
    @invoice_items = data[:invoice_items]
    @transactions  = data[:transactions]
  end

  def revenue(date = nil)
    amount = 0
    if status?
      @invoice_items.each do |invoice_item|
        amount += invoice_item.revenue
      end
    end
    amount
  end

  def date_parse(date)
    Date.parse(date) if date != nil
  end

  #   if status == 'shipped'
  #     @invoice_items.each do |invoice_items|
  #       @amount += invoice_items.revenue
  #     end
  #   end
  #   @amount
  # end

  def status?
    transactions.any? {|transaction| transaction.result == 'success'}

  end


end
