module UnitConversion

  def price(number)
    BigDecimal.new((number.to_f/100).to_s)
  end

  def date_parse(date)
    Date.parse(date) if date != nil
  end
end
