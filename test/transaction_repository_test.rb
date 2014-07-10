require_relative 'test_helper'
require_relative '../lib/transaction_repository'

class TransactionRepositoryTest < Minitest::Test

  attr_reader :repository

  def setup
    @repository = TransactionRepository.load('test/fixtures/small_transaction.csv')
  end

  def test_find_by_id
    entry = repository.find_by_id(4)
    assert_equal 4, entry.id
  end

  def test_find_all_by_invoice_id
    entries = repository.find_all_by_invoice_id(12)
    assert_equal 3, entries.length
    entries.each do |entry|
      assert_equal 12, entry.invoice_id
    end
  end

  def test_find_by_invoice_id
    entry = repository.find_by_invoice_id(13)
    assert_equal 13, entry.invoice_id
  end

  def test_random
    entry = repository.random
    assert entry.respond_to?(:invoice_id)
  end
end
