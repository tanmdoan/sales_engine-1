require_relative 'test_helper'
require_relative '../lib/invoice_item'


class InvoiceItemTest < Minitest::Test

  def test_revenue
    invoice_item = InvoiceItem.new(quantity: '2', unit_price: '21212')
    assert_equal BigDecimal.new('424.24'), invoice_item.revenue
  end

end
