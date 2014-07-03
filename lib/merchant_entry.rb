class MerchantEntry

  attr_reader :id,
              :name,
              :created_at,
              :updated_at,
              :repo

  attr_accessor :invoices, :items

  def initialize(data)
    @id         = data[:id]
    @name       = data[:name]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    # @repo       = repo
  end
end