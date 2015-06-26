class Plan < ActiveRecord::Base
  has_many :sponsors

  default_scope { order(updated_at: :DESC) }

  self.per_page = 5
  TICKET_PRICE = 1

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
                                               presence: true
  validates :description, presence: true

  def display_name
    name.capitalize
  end

  def incoming_cash
    sponsors.count * price
  end

  def extra_pay_total
    sum = 0
    sponsors.each do |sponsor|
      sum += sponsor.extra_pay
    end
    sum
  end

  def profit
    incoming_cash + extra_pay_total
  end

  def ticket_discounts
    discount_coupon.to_f / 100 * discount_tickets * TICKET_PRICE
  end

  def ticket_offers
    tickets * TICKET_PRICE
  end

  def cost
    sponsors.count * (ticket_offers + ticket_discounts)
  end

  def return_of_investment
    (profit - cost).to_f / cost
  end
end
