class Order
  attr_accessor :id
  attr_reader :meal, :employee, :customer

  def initialize(attributes)
    @id = attributes[:id]
    @meal = attributes[:meal]
    @customer = attributes[:customer]
    @employee = attributes[:employee]
    @delivered = attributes[:delivered] || false
  end

  def deliver!
    @delivered = true
  end

  def delivered?
    @delivered
  end
end