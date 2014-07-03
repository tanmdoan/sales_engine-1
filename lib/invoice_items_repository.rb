require          'csv'
require_relative 'invoice_items_entry'

class InvoiceItemsRepository

  def load(filename)
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
      @entries << EntryInvoiceItems.new(row, self)
    end
  end

  attr_reader :entries

  def initialize(entries = [])
    @entries = entries

  end

  def find_by_id(id)
    entries.select { |entry| entry.id == id }
  end

  def find_by_item_id(item_id)
    entries.detect { |entry| entry.item_id == item_id}
  end

  def find_all_by_item_id(item_id)
    entries.select { |entry| entry.item_id == item_id }
  end

  def find_by_invoice_id(invoice_id)
    entries.detect { |entry| entry.invoice_id == invoice_id}
  end

  def find_all_by_invoice_id(invoice_id)
    entries.select {|entry| entry.invoice_id == invoice_id }
  end

  def find_by_quantity(quantity)
    entries.detect { |entry| entry.quantity == quantity}
  end

  def find_all_by_quantity(quantity)
    entries.select {|entry| entry.quantity == quantity }
  end

  def find_by_unit_price(unit_price)
    entries.detect { |entry| entry.unit_price == unit_price}
  end

  def find_all_by_unit_price(unit_price)
    entries.select {|entry| entry.unit_price == unit_price }
  end

end