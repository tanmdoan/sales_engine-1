require_relative 'merchant_repository'
require_relative 'invoices_repository'
require_relative 'items_repository'
require_relative 'invoice_items_repository'
require_relative 'customer_repository'
require_relative 'transaction_repository'

class Engine
  attr_accessor :merchant_repository,
              :invoice_repository,
              :item_repository,
              :transaction_repository

  def initialize(test_mode = false)
    @test_mode = test_mode
  end

  def startup
    if @test_mode
      @merchant_repository ||= MerchantRepository.new
      @invoice_repository ||=  InvoicesRepository.new
      @item_repository ||= ItemsRepository.new
      @invoice_item_repository ||= InvoiceItemsRepository.new
      @customer_repository ||= CustomerRepository.new
      @transaction_repository ||= TransactionRepository.new
    else
      @merchant_repository = MerchantRepository.new(self).load('test/fixtures/biggggg_items.csv')
      @invoice_repository =  InvoicesRepository.new(self).load('test/fixtures/small_items.csv')
      @item_repository = ItemsRepository.new(self).load('test/fixtures/small_items.csv')
      @invoice_item_repository = InvoiceItemsRepository.new(self).load('test/fixtures/small_items.csv')
      @customer_repository = CustomerRepository.new(self).load('test/fixtures/small_items.csv')
      @transaction_repository = TransactionRepository.new(self).load('test/fixtures/small_items.csv')
    end

    merchant_repository.all.each do |merchant|
      merchant.invoices = invoice_repository.find_all_by_merchant_id(merchant.id)
      merchant.items = item_repository.find_all_by_merchant_id(merchant.id)
    end

    invoice_repository.all.each do |invoice|
      invoice.transaction = transaction_repository.find_by_invoice_id(invoice.id)
    end
  end

end