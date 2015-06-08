class Plan < ActiveRecord::Base
  has_many :sponsor

  self.per_page = 1

  validates :name, presence: true
  validates_numericality_of :slots, greater_than: 0, presence: true
  validates_numericality_of :price, greater_than_or_equal_to: 0,
                                    presence: true
  validates_numericality_of :tickets, greater_than_or_equal_to: 0,
                                      presence: true
  validates_numericality_of :discount_coupon, greater_than_or_equal_to: 0,
                                              less_than_or_equal_to: 100,
                                              presence: true
  validates_numericality_of :discount_tickets, greater_than_or_equal_to: 0,
                                               less_than_or_equal_to: 100,
                                               presence: true
  validates :description, presence: true

  def incoming_plan_cash
    sponsor.count * self.price
  end

end
