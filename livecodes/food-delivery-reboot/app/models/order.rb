class Order
  attr_accessor :id
  attr_reader :meal, :customer, :employee, :delivered
  def initialize(attributes = {})
    @id = attributes[:id]
    @meal = attributes[:meal]
    @customer = attributes[:customer]
    @employee = attributes[:employee]
    @delivered = attributes[:delivered] || false
  end
end